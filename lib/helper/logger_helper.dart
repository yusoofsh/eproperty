import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 4,
    colors: false,
    lineLength: 56,
  ),
);
