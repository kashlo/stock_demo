import '../../../../core/data/api_client.dart';
import '../../../../core/domain/constants.dart';
import '../../domain/repository/i_stock_price_repository.dart';
import '../model/stock_data.dart';

class StockPriceRepository implements IStockPriceRepository {

  final ApiClient _apiClient;

  StockPriceRepository(this._apiClient);

  @override
  Future<List<StockData>> getMonthlyData({required stockName}) async {
    try {
      Map<String, dynamic> map = await _apiClient.makeRequest(
        path: '/query?function=TIME_SERIES_MONTHLY&symbol=$stockName&apikey=${Constants.apiKey}',
      );
      List<StockData> list = [];
      map['Monthly Time Series'].forEach((k, v) {
        list.add(StockData.fromJson(k, v));
      });
      return list;
    } catch (e, s) {
      // TODO implement FirebaseCrashlytics
      // FirebaseCrashlytics.instance.recordError(e, s);
      rethrow;
    }
  }
}