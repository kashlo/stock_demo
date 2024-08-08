import '../../data/model/stock_data.dart';

abstract class IStockPriceRepository {
  Future<List<StockData>> getMonthlyData({required stockName});
}