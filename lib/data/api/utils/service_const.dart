class ServiceConst {
  static const baseUrl = 'https://saqaa.al7osam.net/';

  // network unknown error codes
  static const cancel = 1;
  static const connectTimeout = 2;
  static const receiveTimeout = 3;
  static const sendTimeout = 4;
  static const noInternet = 5;

  // ** End Points

  // * Auth // todo check the end points
  static const login = 'api/auth/Login';
  static const register = 'api/auth/Register';
  static const refreshAccessToken = 'api/auth/RefreshAccessToken';
}

String? provideImagePath(String? imagePath) {
  return imagePath == null ? null : '${ServiceConst.baseUrl}$imagePath';
}
