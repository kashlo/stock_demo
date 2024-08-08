import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/model/stock_data.dart';

class StockChart extends StatelessWidget {
  const StockChart({required this.stockList, super.key});

  final List<StockData> stockList;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(),
      series: <CartesianSeries>[
        LineSeries<StockData, DateTime>(
          dataSource: stockList,
          xValueMapper: (StockData data, _) => data.date,
          yValueMapper: (StockData data, _) => data.value,
        )
      ],
    );
  }
}
