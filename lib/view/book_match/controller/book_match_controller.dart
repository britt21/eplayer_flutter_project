import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/book_match_response.dart';

import '../service/book_match_service.dart';
import '../service/model/request/book_match_request.dart';

class NotificationController {
  final NotificationService _notificationService = NotificationService();

  Future<NotificationResponse?> sendNotification(NotificationRequest request) async {
    try {
      final response = await _notificationService.sendNotification(request);
      print('Notification sent successfully. Message ID: ${response.messageId}');
      return response;
    } catch (e) {
      print('Failed to send notification. Error: $e');
      return null;
    }
  }
}
