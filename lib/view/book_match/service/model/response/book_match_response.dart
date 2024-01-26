class NotificationResponse {
  final int messageId;

  NotificationResponse({required this.messageId});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      messageId: json['message_id'],
    );
  }
}
