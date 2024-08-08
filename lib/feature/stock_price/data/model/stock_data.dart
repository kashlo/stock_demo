class StockData {

  DateTime date;
  double value;

  StockData({
    required this.date,
    required this.value});

  factory StockData.fromJson(String date, Map<String, dynamic> json) {
    return StockData(
      date: DateTime.parse(date),
      value: double.parse(json['2. high']),
    );
  }
}