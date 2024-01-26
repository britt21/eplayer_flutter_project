class BookedMatchResponse {
  BookedMatchResponse({
      this.responseCode, 
      this.message, 
      this.body,});

  BookedMatchResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  num? responseCode;
  String? message;
  Body? body;
BookedMatchResponse copyWith({  num? responseCode,
  String? message,
  Body? body,
}) => BookedMatchResponse(  responseCode: responseCode ?? this.responseCode,
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
      this.id, 
      this.isActive, 
      this.takenById, 
      this.takenByName, 
      this.bookedByID, 
      this.bookedByName, 
      this.amount, 
      this.wonById, 
      this.wonByName, 
      this.byAdmin, 
      this.lostById, 
      this.lostByName, 
      this.adminUrl, 
      this.adminName,});

  Body.fromJson(dynamic json) {
    gameName = json['gameName'];
    id = json['id'];
    isActive = json['isActive'];
    takenById = json['takenById'];
    takenByName = json['takenByName'];
    bookedByID = json['bookedByID'];
    bookedByName = json['bookedByName'];
    amount = json['amount'];
    wonById = json['wonById'];
    wonByName = json['wonByName'];
    byAdmin = json['byAdmin'];
    lostById = json['lostById'];
    lostByName = json['lostByName'];
    adminUrl = json['adminUrl'];
    adminName = json['adminName'];
  }
  String? gameName;
  String? id;
  bool? isActive;
  String? takenById;
  String? takenByName;
  String? bookedByID;
  String? bookedByName;
  num? amount;
  String? wonById;
  String? wonByName;
  String? byAdmin;
  String? lostById;
  String? lostByName;
  String? adminUrl;
  String? adminName;
Body copyWith({  String? gameName,
  String? id,
  bool? isActive,
  String? takenById,
  String? takenByName,
  String? bookedByID,
  String? bookedByName,
  num? amount,
  String? wonById,
  String? wonByName,
  String? byAdmin,
  String? lostById,
  String? lostByName,
  String? adminUrl,
  String? adminName,
}) => Body(  gameName: gameName ?? this.gameName,
  id: id ?? this.id,
  isActive: isActive ?? this.isActive,
  takenById: takenById ?? this.takenById,
  takenByName: takenByName ?? this.takenByName,
  bookedByID: bookedByID ?? this.bookedByID,
  bookedByName: bookedByName ?? this.bookedByName,
  amount: amount ?? this.amount,
  wonById: wonById ?? this.wonById,
  wonByName: wonByName ?? this.wonByName,
  byAdmin: byAdmin ?? this.byAdmin,
  lostById: lostById ?? this.lostById,
  lostByName: lostByName ?? this.lostByName,
  adminUrl: adminUrl ?? this.adminUrl,
  adminName: adminName ?? this.adminName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameName'] = gameName;
    map['id'] = id;
    map['isActive'] = isActive;
    map['takenById'] = takenById;
    map['takenByName'] = takenByName;
    map['bookedByID'] = bookedByID;
    map['bookedByName'] = bookedByName;
    map['amount'] = amount;
    map['wonById'] = wonById;
    map['wonByName'] = wonByName;
    map['byAdmin'] = byAdmin;
    map['lostById'] = lostById;
    map['lostByName'] = lostByName;
    map['adminUrl'] = adminUrl;
    map['adminName'] = adminName;
    return map;
  }

}