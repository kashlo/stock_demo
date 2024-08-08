import 'package:flutter/material.dart';

import '../../data/model/stock_data.dart';

@immutable
abstract class StockPriceState {
  const StockPriceState();
}

class StockPriceInitialState extends StockPriceState {
  const StockPriceInitialState();
}

class StockPriceLoadingState extends StockPriceState {
  const StockPriceLoadingState();
}

class StockPriceSuccessState extends StockPriceState {
  final List<StockData> stockList;

  const StockPriceSuccessState({required this.stockList});
}

class StockPriceErrorState extends StockPriceState {
  const StockPriceErrorState();
}

