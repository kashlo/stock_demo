import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/stock_data.dart';
import '../repository/i_stock_price_repository.dart';
import 'event.dart';
import 'state.dart';

class StockPriceBloc extends Bloc<StockPriceEvent, StockPriceState> {
  final IStockPriceRepository _stockPriceRepository;
  
  StockPriceBloc(this._stockPriceRepository) : super(const StockPriceInitialState()) {
    on<StockPricesRequested>(_mapRecognitionRequestedToState);
  }

  Future<void> _mapRecognitionRequestedToState(StockPricesRequested event, Emitter<StockPriceState> emit) async {
    emit(const StockPriceLoadingState());
    // try {
      List<StockData> list = await _stockPriceRepository.getMonthlyData(stockName: event.stockName);
      emit(StockPriceSuccessState(stockList: list));
    // } catch (e, s) {
    //   emit(const StockPriceErrorState());
    // }
  }
}
