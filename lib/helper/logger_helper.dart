import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 4,
    lineLength: 56,
  ),
);
