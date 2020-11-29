import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 4,
    lineLength: 56,
  ),
);
