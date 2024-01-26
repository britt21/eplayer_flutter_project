class AcceptGameResponse {
  AcceptGameResponse({
      this.responseCode, 
      this.message, 
      this.body,});

  AcceptGameResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  num? responseCode;
  String? message;
  Body? body;
AcceptGameResponse copyWith({  num? responseCode,
  String? message,
  Body? body,
}) => AcceptGameResponse(  responseCode: responseCode ?? this.responseCode,
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
      this.gameName, 
      this.bookedFromUserId, 
      this.bookedFromUserName, 
      this.takenByUserId, 
      this.takenByUserName, 
      this.isActive,});

  Body.fromJson(dynamic json) {
    gameName = json['gameName'];
    bookedFromUserId = json['BookedFromUserId'];
    bookedFromUserName = json['BookedFromUserName'];
    takenByUserId = json['takenByUserId'];
    takenByUserName = json['takenByUserName'];
    isActive = json['isActive'];
  }
  String? gameName;
  String? bookedFromUserId;
  String? bookedFromUserName;
  String? takenByUserId;
  String? takenByUserName;
  bool? isActive;
Body copyWith({  String? gameName,
  String? bookedFromUserId,
  String? bookedFromUserName,
  String? takenByUserId,
  String? takenByUserName,
  bool? isActive,
}) => Body(  gameName: gameName ?? this.gameName,
  bookedFromUserId: bookedFromUserId ?? this.bookedFromUserId,
  bookedFromUserName: bookedFromUserName ?? this.bookedFromUserName,
  takenByUserId: takenByUserId ?? this.takenByUserId,
  takenByUserName: takenByUserName ?? this.takenByUserName,
  isActive: isActive ?? this.isActive,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameName'] = gameName;
    map['BookedFromUserId'] = bookedFromUserId;
    map['BookedFromUserName'] = bookedFromUserName;
    map['takenByUserId'] = takenByUserId;
    map['takenByUserName'] = takenByUserName;
    map['isActive'] = isActive;
    return map;
  }

}