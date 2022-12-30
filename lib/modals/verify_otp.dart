class VerifyOtp {
  String? message;
  String? token;
  String? riderId;

  VerifyOtp({this.message, this.token, this.riderId});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    riderId = json['riderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['riderId'] = this.riderId;
    return data;
  }
}
