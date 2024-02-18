class AllGamesResponse {
  AllGamesResponse({
      this.responseCode, 
      this.message, 
      this.body,});

  AllGamesResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(Body.fromJson(v));
      });
    }
  }
  num? responseCode;
  String? message;
  List<Body>? body;
AllGamesResponse copyWith({  num? responseCode,
  String? message,
  List<Body>? body,
}) => AllGamesResponse(  responseCode: responseCode ?? this.responseCode,
  message: message ?? this.message,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Body {
  Body({
      this.gameName, 
      this.isActive, 
      this.matchType,});

  Body.fromJson(dynamic json) {
    gameName = json['gameName'];
    isActive = json['isActive'];
    if (json['matchType'] != null) {
      matchType = [];
      json['matchType'].forEach((v) {
        matchType?.add(MatchType.fromJson(v));
      });
    }
  }
  String? gameName;
  bool? isActive;
  List<MatchType>? matchType;
Body copyWith({  String? gameName,
  bool? isActive,
  List<MatchType>? matchType,
}) => Body(  gameName: gameName ?? this.gameName,
  isActive: isActive ?? this.isActive,
  matchType: matchType ?? this.matchType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameName'] = gameName;
    map['isActive'] = isActive;
    if (matchType != null) {
      map['matchType'] = matchType?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MatchType {
  MatchType({
      this.gameType, 
      this.isActive, 
      this.image,});

  MatchType.fromJson(dynamic json) {
    gameType = json['gameType'];
    isActive = json['isActive'];
    image = json['image'];
  }
  String? gameType;
  bool? isActive;
  String? image;
MatchType copyWith({  String? gameType,
  bool? isActive,
  String? image,
}) => MatchType(  gameType: gameType ?? this.gameType,
  isActive: isActive ?? this.isActive,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameType'] = gameType;
    map['isActive'] = isActive;
    map['image'] = image;
    return map;
  }

}