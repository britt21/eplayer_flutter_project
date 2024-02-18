import 'dart:convert';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/accept_game/AcceptGameResponse.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/all_games/AllGamesResponse.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/booked_match/BookedMatchResponse.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/create_match/BookMatchResponse.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../helper/base_client.dart';
import '../../../helper/base_contoller.dart';
import '../../login/model/response/LoginResponse.dart';
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


class BookService extends GetxController with BaseController {
  BaseClient baseClient = BaseClient();
  final introdata = GetStorage();
  var isLoading = false.obs;



  
  Future<BookedMatchResponse> getBookedGames(String gameId) async{
  
    var response = await baseClient.get("getBookedGames/$gameId").catchError(handleError);

    var data = json.decode(response);


    var respigot = BookedMatchResponse.fromJson(data);




    print("IGOTRESPONSEHERE: ${respigot.body?.takenById}");
    print("IGOTRESPONSEHERECODE: ${respigot.responseCode}");
    print("IGOTRESPONSEHEREMSG: ${respigot.message}");
    print("IGOTRESPONSEHEREMSG: ${respigot.body?.takenByName}");
    return  respigot;


  }
  Future<AllGamesResponse> getAllGames() async{

    isLoading(true);
    var response = await baseClient.get("allgames/").catchError(handleError);

    var data = json.decode(response);


    var respigot = AllGamesResponse.fromJson(data);




    print("IGOTRESPONSEHEREMSG: ${respigot.responseCode}");
    print("IGOTRESPONSEHEREMSG: ${respigot.message}");
    print("IGOTRESPONSEHEREMSG: ${respigot.body}");
    return  respigot;


  }

  Future<BookMatchResponse> bookMatch(String userId, int amount,  String gameName, ) async {
    isLoading(true);
    var loginPayload =
    {
    };


    var response = await baseClient.post("createMatch?userId=$userId&amount=$amount&gameName=$gameName&isActive=true", loginPayload).catchError((error){
      handleError;
    });
    var data = json.decode(response);


    var respigot = BookMatchResponse.fromJson(data);




    print("IGOTRESPONSEHERE: ${respigot.body?.nickname}");
    print("IGOTRESPONSEHERECODE: ${respigot.responseCode}");
    print("IGOTRESPONSEHEREMSG: ${respigot.message}");
    print("IGOTRESPONSEHEREMSG: ${respigot.body?.gameid}");
    return  respigot;



  }


  Future<AcceptGameResponse> acceptMatch(String gameId, String takenById, String takenByName, ) async {
    isLoading(true);


    var response = await baseClient.patch("updateGameById/{gameId}?gameId=$gameId&takenById=$takenById&takenByName=$takenByName").catchError((error){
      handleError;


    });
    var data = json.decode(response);

    var respigot = AcceptGameResponse.fromJson(data);




    print("IGOTRESPONSEHERECODE: ${respigot.responseCode}");
    print("IGOTRESPONSEHEREMSG: ${respigot.message}");
    print("IGOTRESPONSEHEREMSG: ${respigot.body?.bookedFromUserId}");
    print("IGOTRESPONSEHEREMSG: ${respigot.body?.takenByUserId}");
    return  respigot;



  }





}
