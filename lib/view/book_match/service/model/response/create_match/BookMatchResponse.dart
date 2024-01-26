class BookMatchResponse {
  BookMatchResponse({
      this.responseCode, 
      this.message, 
      this.body,});

  BookMatchResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  num? responseCode;
  String? message;
  Body? body;
BookMatchResponse copyWith({  num? responseCode,
  String? message,
  Body? body,
}) => BookMatchResponse(  responseCode: responseCode ?? this.responseCode,
  message: message ?? this.message,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}

class Body {
  Body({
      this.amount, 
      this.nickname, 
      this.gameName, 
      this.isActive, 
      this.gameid, 
      this.userId,});

  Body.fromJson(dynamic json) {
    amount = json['amount'];
    nickname = json['nickname'];
    gameName = json['gameName'];
    isActive = json['isActive'];
    gameid = json['gameid'];
    userId = json['userId'];
  }
  num? amount;
  String? nickname;
  String? gameName;
  bool? isActive;
  String? gameid;
  String? userId;
Body copyWith({  num? amount,
  String? nickname,
  String? gameName,
  bool? isActive,
  String? gameid,
  String? userId,
}) => Body(  amount: amount ?? this.amount,
  nickname: nickname ?? this.nickname,
  gameName: gameName ?? this.gameName,
  isActive: isActive ?? this.isActive,
  gameid: gameid ?? this.gameid,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['nickname'] = nickname;
    map['gameName'] = gameName;
    map['isActive'] = isActive;
    map['gameid'] = gameid;
    map['userId'] = userId;
    return map;
  }

}