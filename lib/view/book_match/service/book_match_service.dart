import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/request/book_match_request.dart';
import 'model/response/book_match_response.dart';

class NotificationService {
  static const String apiUrl = 'https://fcm.googleapis.com/fcm/send';

  Future<NotificationResponse> sendNotification(NotificationRequest request) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json',"Authorization" : "key=AAAAiUfuGa8:APA91bH2Uu56aAN3rFAMxDuEsbJF1mObEz3C4ubs0aJkx-PbtTdyOUKnvXF2nJ2VwaW1yQ4ggUud9uK0NQVT8c1eqEThnV0OEoqjJxuiW5XKUCmakIAlPAAoRQgu15pyRi0AB0XgemEu"},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return NotificationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send notification');
    }
  }
}
