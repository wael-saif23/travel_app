import 'package:flutter/foundation.dart';

String errorHandler(String error){
  if(kDebugMode){
    return error;
  }
  else{
    return 'حدث خطأ يرجي المحاولة مجدداً';
  }
}