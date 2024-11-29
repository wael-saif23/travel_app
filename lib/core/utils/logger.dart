import 'dart:io';

import 'package:logger/logger.dart';


final logger = Logger(
  printer: PrefixPrinter(
    PrettyPrinter(
      colors: Platform.isAndroid,
      methodCount: 1,
    ),
  ),
);