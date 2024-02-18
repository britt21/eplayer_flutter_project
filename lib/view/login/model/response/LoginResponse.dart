class LoginResponse {

  int? responseCode;
  String? message;
  Body? body;

  LoginResponse({
      required this.responseCode,
     required this.message,
     required this.body,});

  LoginResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

LoginResponse copyWith({  int? responseCode,
  String? message,
  Body? body,
}) => LoginResponse(  responseCode: responseCode ?? this.responseCode,
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
      this.id, 
      this.profilePicture, 
      this.nickName, 
      this.email, 
      this.wallet,});

  Body.fromJson(dynamic json) {
    id = json['Id'];
    profilePicture = json['profilePicture'];
    nickName = json['nickName'];
    email = json['email'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
  }
  String? id;
  String? profilePicture;
  String? nickName;
  String? email;
  Wallet? wallet;
Body copyWith({  String? id,
  String? profilePicture,
  String? nickName,
  String? email,
  Wallet? wallet,
}) => Body(  id: id ?? this.id,
  profilePicture: profilePicture ?? this.profilePicture,
  nickName: nickName ?? this.nickName,
  email: email ?? this.email,
  wallet: wallet ?? this.wallet,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['profilePicture'] = profilePicture;
    map['nickName'] = nickName;
    map['email'] = email;
    if (wallet != null) {
      map['wallet'] = wallet?.toJson();
    }
    return map;
  }

}

class Wallet {
  Wallet({
      this.balance,});

  Wallet.fromJson(dynamic json) {
    balance = json['balance'];
  }
  num? balance;
Wallet copyWith({  num? balance,
}) => Wallet(  balance: balance ?? this.balance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    return map;
  }

}