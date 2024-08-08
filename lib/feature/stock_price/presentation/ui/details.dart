import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/bloc.dart';
import '../../domain/bloc/state.dart';
import 'component/chart.dart';

class StockDetailsScreen extends StatelessWidget {
  const StockDetailsScreen({required this.stockName, super.key});

  final String stockName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          stockName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocConsumer<StockPriceBloc, StockPriceState>(
      listener: (context, state) {
        if (state is StockPriceErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error loading data'),
            )
          );
        }
      },
      builder: (context, state) {
        if (state is StockPriceSuccessState) {
          return StockChart(stockList: state.stockList);
        };
        if (state is StockPriceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      }
    );
  }
}
