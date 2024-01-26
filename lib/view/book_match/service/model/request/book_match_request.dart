class NotificationRequest {
  final String to;
  final Map<String, dynamic> notification;
  final Map<String, dynamic> data;

  NotificationRequest({
    required this.to,
    required this.notification,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'to': to,
      'notification': notification,
      'data': data,
    };
  }
}
