class RegisterResponse {
  RegisterResponse({
      this.responseCode, 
      this.message, 
      this.body,});

  RegisterResponse.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    body = json['body'];
  }
  num? responseCode;
  String? message;
  dynamic body;
RegisterResponse copyWith({  num? responseCode,
  String? message,
  dynamic body,
}) => RegisterResponse(  responseCode: responseCode ?? this.responseCode,
  message: message ?? this.message,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    map['body'] = body;
    return map;
  }

}