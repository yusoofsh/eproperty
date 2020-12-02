import 'package:eproperty/helper/logger_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObserveProvider extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object value,
  ) {
    logger.d(
      'Provider ${provider.name ?? provider.runtimeType} | Value $value',
    );
  }
}
