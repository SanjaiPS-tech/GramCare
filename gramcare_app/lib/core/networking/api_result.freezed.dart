// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResult<$T>()';
}


}

/// @nodoc
class $ApiResultCopyWith<T,$Res>  {
$ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}


/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiSuccess<T> value)?  success,TResult Function( ApiFailureResult<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiFailureResult() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiSuccess<T> value)  success,required TResult Function( ApiFailureResult<T> value)  failure,}){
final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that);case ApiFailureResult():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiSuccess<T> value)?  success,TResult? Function( ApiFailureResult<T> value)?  failure,}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiFailureResult() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( ApiFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data);case ApiFailureResult() when failure != null:
return failure(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( ApiFailure failure)  failure,}) {final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that.data);case ApiFailureResult():
return failure(_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( ApiFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data);case ApiFailureResult() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ApiSuccess<T> implements ApiResult<T> {
  const ApiSuccess({required this.data});
  

 final  T data;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSuccessCopyWith<T, ApiSuccess<T>> get copyWith => _$ApiSuccessCopyWithImpl<T, ApiSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiSuccessCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $ApiSuccessCopyWith(ApiSuccess<T> value, $Res Function(ApiSuccess<T>) _then) = _$ApiSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ApiSuccessCopyWithImpl<T,$Res>
    implements $ApiSuccessCopyWith<T, $Res> {
  _$ApiSuccessCopyWithImpl(this._self, this._then);

  final ApiSuccess<T> _self;
  final $Res Function(ApiSuccess<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ApiSuccess<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ApiFailureResult<T> implements ApiResult<T> {
  const ApiFailureResult({required this.failure});
  

 final  ApiFailure failure;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiFailureResultCopyWith<T, ApiFailureResult<T>> get copyWith => _$ApiFailureResultCopyWithImpl<T, ApiFailureResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiFailureResult<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ApiResult<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ApiFailureResultCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $ApiFailureResultCopyWith(ApiFailureResult<T> value, $Res Function(ApiFailureResult<T>) _then) = _$ApiFailureResultCopyWithImpl;
@useResult
$Res call({
 ApiFailure failure
});


$ApiFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ApiFailureResultCopyWithImpl<T,$Res>
    implements $ApiFailureResultCopyWith<T, $Res> {
  _$ApiFailureResultCopyWithImpl(this._self, this._then);

  final ApiFailureResult<T> _self;
  final $Res Function(ApiFailureResult<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ApiFailureResult<T>(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ApiFailure,
  ));
}

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiFailureCopyWith<$Res> get failure {
  
  return $ApiFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc
mixin _$ApiFailure {

 String? get message;
/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiFailureCopyWith<ApiFailure> get copyWith => _$ApiFailureCopyWithImpl<ApiFailure>(this as ApiFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiFailureCopyWith<$Res>  {
  factory $ApiFailureCopyWith(ApiFailure value, $Res Function(ApiFailure) _then) = _$ApiFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ApiFailureCopyWithImpl<$Res>
    implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._self, this._then);

  final ApiFailure _self;
  final $Res Function(ApiFailure) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message! : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiFailure].
extension ApiFailurePatterns on ApiFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerError value)?  serverError,TResult Function( NetworkError value)?  networkError,TResult Function( TimeoutError value)?  timeout,TResult Function( UnauthorizedError value)?  unauthorized,TResult Function( ForbiddenError value)?  forbidden,TResult Function( NotFoundError value)?  notFound,TResult Function( ValidationError value)?  validationError,TResult Function( ParseError value)?  parseError,TResult Function( UnknownError value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case TimeoutError() when timeout != null:
return timeout(_that);case UnauthorizedError() when unauthorized != null:
return unauthorized(_that);case ForbiddenError() when forbidden != null:
return forbidden(_that);case NotFoundError() when notFound != null:
return notFound(_that);case ValidationError() when validationError != null:
return validationError(_that);case ParseError() when parseError != null:
return parseError(_that);case UnknownError() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerError value)  serverError,required TResult Function( NetworkError value)  networkError,required TResult Function( TimeoutError value)  timeout,required TResult Function( UnauthorizedError value)  unauthorized,required TResult Function( ForbiddenError value)  forbidden,required TResult Function( NotFoundError value)  notFound,required TResult Function( ValidationError value)  validationError,required TResult Function( ParseError value)  parseError,required TResult Function( UnknownError value)  unknown,}){
final _that = this;
switch (_that) {
case ServerError():
return serverError(_that);case NetworkError():
return networkError(_that);case TimeoutError():
return timeout(_that);case UnauthorizedError():
return unauthorized(_that);case ForbiddenError():
return forbidden(_that);case NotFoundError():
return notFound(_that);case ValidationError():
return validationError(_that);case ParseError():
return parseError(_that);case UnknownError():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerError value)?  serverError,TResult? Function( NetworkError value)?  networkError,TResult? Function( TimeoutError value)?  timeout,TResult? Function( UnauthorizedError value)?  unauthorized,TResult? Function( ForbiddenError value)?  forbidden,TResult? Function( NotFoundError value)?  notFound,TResult? Function( ValidationError value)?  validationError,TResult? Function( ParseError value)?  parseError,TResult? Function( UnknownError value)?  unknown,}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case TimeoutError() when timeout != null:
return timeout(_that);case UnauthorizedError() when unauthorized != null:
return unauthorized(_that);case ForbiddenError() when forbidden != null:
return forbidden(_that);case NotFoundError() when notFound != null:
return notFound(_that);case ValidationError() when validationError != null:
return validationError(_that);case ParseError() when parseError != null:
return parseError(_that);case UnknownError() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int statusCode,  String message,  String? details)?  serverError,TResult Function( String message)?  networkError,TResult Function( String? message)?  timeout,TResult Function( String? message)?  unauthorized,TResult Function( String? message)?  forbidden,TResult Function( String? message)?  notFound,TResult Function( String message,  Map<String, List<String>>? fieldErrors)?  validationError,TResult Function( String message)?  parseError,TResult Function( String? message,  Object? error)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.statusCode,_that.message,_that.details);case NetworkError() when networkError != null:
return networkError(_that.message);case TimeoutError() when timeout != null:
return timeout(_that.message);case UnauthorizedError() when unauthorized != null:
return unauthorized(_that.message);case ForbiddenError() when forbidden != null:
return forbidden(_that.message);case NotFoundError() when notFound != null:
return notFound(_that.message);case ValidationError() when validationError != null:
return validationError(_that.message,_that.fieldErrors);case ParseError() when parseError != null:
return parseError(_that.message);case UnknownError() when unknown != null:
return unknown(_that.message,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int statusCode,  String message,  String? details)  serverError,required TResult Function( String message)  networkError,required TResult Function( String? message)  timeout,required TResult Function( String? message)  unauthorized,required TResult Function( String? message)  forbidden,required TResult Function( String? message)  notFound,required TResult Function( String message,  Map<String, List<String>>? fieldErrors)  validationError,required TResult Function( String message)  parseError,required TResult Function( String? message,  Object? error)  unknown,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError(_that.statusCode,_that.message,_that.details);case NetworkError():
return networkError(_that.message);case TimeoutError():
return timeout(_that.message);case UnauthorizedError():
return unauthorized(_that.message);case ForbiddenError():
return forbidden(_that.message);case NotFoundError():
return notFound(_that.message);case ValidationError():
return validationError(_that.message,_that.fieldErrors);case ParseError():
return parseError(_that.message);case UnknownError():
return unknown(_that.message,_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int statusCode,  String message,  String? details)?  serverError,TResult? Function( String message)?  networkError,TResult? Function( String? message)?  timeout,TResult? Function( String? message)?  unauthorized,TResult? Function( String? message)?  forbidden,TResult? Function( String? message)?  notFound,TResult? Function( String message,  Map<String, List<String>>? fieldErrors)?  validationError,TResult? Function( String message)?  parseError,TResult? Function( String? message,  Object? error)?  unknown,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.statusCode,_that.message,_that.details);case NetworkError() when networkError != null:
return networkError(_that.message);case TimeoutError() when timeout != null:
return timeout(_that.message);case UnauthorizedError() when unauthorized != null:
return unauthorized(_that.message);case ForbiddenError() when forbidden != null:
return forbidden(_that.message);case NotFoundError() when notFound != null:
return notFound(_that.message);case ValidationError() when validationError != null:
return validationError(_that.message,_that.fieldErrors);case ParseError() when parseError != null:
return parseError(_that.message);case UnknownError() when unknown != null:
return unknown(_that.message,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements ApiFailure {
  const ServerError({required this.statusCode, required this.message, this.details});
  

 final  int statusCode;
@override final  String message;
 final  String? details;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message,details);

@override
String toString() {
  return 'ApiFailure.serverError(statusCode: $statusCode, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String message, String? details
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? details = freezed,}) {
  return _then(ServerError(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NetworkError implements ApiFailure {
  const NetworkError({required this.message});
  

@override final  String message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkErrorCopyWith<NetworkError> get copyWith => _$NetworkErrorCopyWithImpl<NetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $NetworkErrorCopyWith(NetworkError value, $Res Function(NetworkError) _then) = _$NetworkErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._self, this._then);

  final NetworkError _self;
  final $Res Function(NetworkError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeoutError implements ApiFailure {
  const TimeoutError({this.message});
  

@override final  String? message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutErrorCopyWith<TimeoutError> get copyWith => _$TimeoutErrorCopyWithImpl<TimeoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.timeout(message: $message)';
}


}

/// @nodoc
abstract mixin class $TimeoutErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $TimeoutErrorCopyWith(TimeoutError value, $Res Function(TimeoutError) _then) = _$TimeoutErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$TimeoutErrorCopyWithImpl<$Res>
    implements $TimeoutErrorCopyWith<$Res> {
  _$TimeoutErrorCopyWithImpl(this._self, this._then);

  final TimeoutError _self;
  final $Res Function(TimeoutError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(TimeoutError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnauthorizedError implements ApiFailure {
  const UnauthorizedError({this.message});
  

@override final  String? message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedErrorCopyWith<UnauthorizedError> get copyWith => _$UnauthorizedErrorCopyWithImpl<UnauthorizedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $UnauthorizedErrorCopyWith(UnauthorizedError value, $Res Function(UnauthorizedError) _then) = _$UnauthorizedErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$UnauthorizedErrorCopyWithImpl<$Res>
    implements $UnauthorizedErrorCopyWith<$Res> {
  _$UnauthorizedErrorCopyWithImpl(this._self, this._then);

  final UnauthorizedError _self;
  final $Res Function(UnauthorizedError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(UnauthorizedError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ForbiddenError implements ApiFailure {
  const ForbiddenError({this.message});
  

@override final  String? message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenErrorCopyWith<ForbiddenError> get copyWith => _$ForbiddenErrorCopyWithImpl<ForbiddenError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.forbidden(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForbiddenErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $ForbiddenErrorCopyWith(ForbiddenError value, $Res Function(ForbiddenError) _then) = _$ForbiddenErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ForbiddenErrorCopyWithImpl<$Res>
    implements $ForbiddenErrorCopyWith<$Res> {
  _$ForbiddenErrorCopyWithImpl(this._self, this._then);

  final ForbiddenError _self;
  final $Res Function(ForbiddenError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ForbiddenError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NotFoundError implements ApiFailure {
  const NotFoundError({this.message});
  

@override final  String? message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundErrorCopyWith<NotFoundError> get copyWith => _$NotFoundErrorCopyWithImpl<NotFoundError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $NotFoundErrorCopyWith(NotFoundError value, $Res Function(NotFoundError) _then) = _$NotFoundErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NotFoundErrorCopyWithImpl<$Res>
    implements $NotFoundErrorCopyWith<$Res> {
  _$NotFoundErrorCopyWithImpl(this._self, this._then);

  final NotFoundError _self;
  final $Res Function(NotFoundError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NotFoundError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ValidationError implements ApiFailure {
  const ValidationError({required this.message, final  Map<String, List<String>>? fieldErrors}): _fieldErrors = fieldErrors;
  

@override final  String message;
 final  Map<String, List<String>>? _fieldErrors;
 Map<String, List<String>>? get fieldErrors {
  final value = _fieldErrors;
  if (value == null) return null;
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationErrorCopyWith<ValidationError> get copyWith => _$ValidationErrorCopyWithImpl<ValidationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationError&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'ApiFailure.validationError(message: $message, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $ValidationErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $ValidationErrorCopyWith(ValidationError value, $Res Function(ValidationError) _then) = _$ValidationErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, List<String>>? fieldErrors
});




}
/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._self, this._then);

  final ValidationError _self;
  final $Res Function(ValidationError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? fieldErrors = freezed,}) {
  return _then(ValidationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: freezed == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,
  ));
}


}

/// @nodoc


class ParseError implements ApiFailure {
  const ParseError({required this.message});
  

@override final  String message;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParseErrorCopyWith<ParseError> get copyWith => _$ParseErrorCopyWithImpl<ParseError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParseError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiFailure.parseError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ParseErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $ParseErrorCopyWith(ParseError value, $Res Function(ParseError) _then) = _$ParseErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ParseErrorCopyWithImpl<$Res>
    implements $ParseErrorCopyWith<$Res> {
  _$ParseErrorCopyWithImpl(this._self, this._then);

  final ParseError _self;
  final $Res Function(ParseError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ParseError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownError implements ApiFailure {
  const UnknownError({this.message, this.error});
  

@override final  String? message;
 final  Object? error;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownErrorCopyWith<UnknownError> get copyWith => _$UnknownErrorCopyWithImpl<UnknownError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownError&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ApiFailure.unknown(message: $message, error: $error)';
}


}

/// @nodoc
abstract mixin class $UnknownErrorCopyWith<$Res> implements $ApiFailureCopyWith<$Res> {
  factory $UnknownErrorCopyWith(UnknownError value, $Res Function(UnknownError) _then) = _$UnknownErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message, Object? error
});




}
/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res>
    implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(this._self, this._then);

  final UnknownError _self;
  final $Res Function(UnknownError) _then;

/// Create a copy of ApiFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? error = freezed,}) {
  return _then(UnknownError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
