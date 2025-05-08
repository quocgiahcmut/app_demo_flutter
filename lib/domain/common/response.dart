import 'package:equatable/equatable.dart';

class Response<T> extends Equatable {
  final bool isSuccess;
  final int statusCode;
  final String message;
  final T? data;

  const Response({
    required this.isSuccess,
    required this.statusCode,
    this.message = '',
    this.data
  });

  @override
  List<Object?> get props => [isSuccess, statusCode, message, data];
}