import 'package:equatable/equatable.dart';

class MessageResponseModel extends Equatable {
  final String message;
  final String status;

  const MessageResponseModel({
    required this.status,
    required this.message,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
      message: json['message'] as String,
      status: json['status'] as String,
    );
  }

  @override
  List<Object?> get props => [message, status];
}
