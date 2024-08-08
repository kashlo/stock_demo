import 'package:flutter/widgets.dart';

@immutable
abstract class StockPriceEvent {
  const StockPriceEvent();
}

class StockPricesRequested extends StockPriceEvent {

  final String stockName;

  const StockPricesRequested({required this.stockName});
}
