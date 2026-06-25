import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'secure_storage_service.dart';

/// Provides encryption/decryption utilities for sensitive local data.
class EncryptionService {
  final SecureStorageService _storage;
  static const String _encKeyAlias = 'gramcare_enc_key';

  EncryptionService(this._storage);

  /// Get or generate an encryption key stored in secure storage.
  Future<String> _getOrCreateKey() async {
    var key = await _storage.read(_encKeyAlias);
    if (key == null) {
      final random = Random.secure();
      final keyBytes = List<int>.generate(32, (_) => random.nextInt(256));
      key = base64Encode(keyBytes);
      await _storage.write(_encKeyAlias, key);
    }
    return key;
  }

  /// Simple XOR-based obfuscation for local data at rest.
  /// For production, consider using pointycastle or native platform encryption.
  Future<String> encrypt(String plaintext) async {
    final key = await _getOrCreateKey();
    final keyBytes = base64Decode(key);
    final plaintextBytes = utf8.encode(plaintext);
    final encryptedBytes = Uint8List(plaintextBytes.length);

    for (var i = 0; i < plaintextBytes.length; i++) {
      encryptedBytes[i] = plaintextBytes[i] ^ keyBytes[i % keyBytes.length];
    }

    return base64Encode(encryptedBytes);
  }

  /// Decrypt data that was encrypted with [encrypt].
  Future<String> decrypt(String ciphertext) async {
    final key = await _getOrCreateKey();
    final keyBytes = base64Decode(key);
    final ciphertextBytes = base64Decode(ciphertext);
    final decryptedBytes = Uint8List(ciphertextBytes.length);

    for (var i = 0; i < ciphertextBytes.length; i++) {
      decryptedBytes[i] = ciphertextBytes[i] ^ keyBytes[i % keyBytes.length];
    }

    return utf8.decode(decryptedBytes);
  }
}

/// Provider for EncryptionService.
final encryptionServiceProvider = Provider<EncryptionService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return EncryptionService(storage);
});
