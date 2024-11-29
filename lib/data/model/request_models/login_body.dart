class LoginBody {
  LoginBody({
    this.phoneNumber,
    this.password,
    this.registrationToken,
    this.deviceType,
  });

  LoginBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['Password'];
    registrationToken = json['RegistrationToken'];
    deviceType = json['DeviceType'];
  }

  String? phoneNumber;
  String? password;
  String? registrationToken;
  String? deviceType;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['Password'] = password;
    data['RegistrationToken'] = registrationToken;
    data['DeviceType'] = deviceType;
    return data;
  }
}
