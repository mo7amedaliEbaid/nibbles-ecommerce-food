import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  const CustomError({
    this.code = 'Exception',
    this.message = 'Something went wrong',
    this.plugin = 'flutter_error',
  });

  @override
  List<Object> get props => [code, message];

  @override
  String toString() => 'CustomError(code: $code, message: $message)';
}