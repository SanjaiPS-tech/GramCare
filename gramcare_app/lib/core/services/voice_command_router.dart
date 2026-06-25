import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VoiceCommandRouter {
  static void handleCommand(BuildContext context, String query) {
    final command = query.toLowerCase();

    if (command.contains('medicine') || command.contains('tablet') || command.contains('pill')) {
      context.go('/medicines');
    } else if (command.contains('prescription') || command.contains('doctor report')) {
      context.go('/prescriptions');
    } else if (command.contains('emergency') || command.contains('sos') || command.contains('help')) {
      context.go('/emergency');
    } else if (command.contains('family') || command.contains('son') || command.contains('daughter')) {
      context.go('/family');
    } else if (command.contains('record') || command.contains('history')) {
      context.go('/health-records');
    } else if (command.contains('doctor') || command.contains('consult')) {
      context.go('/telemedicine');
    } else if (command.contains('home') || command.contains('dashboard')) {
      context.go('/');
    }
  }
}
