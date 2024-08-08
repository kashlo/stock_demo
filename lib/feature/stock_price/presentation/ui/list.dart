import 'package:flutter/material.dart';

import '../../../../core/domain/constants.dart';
import '../../domain/bloc/bloc.dart';
import '../../domain/bloc/event.dart';
import 'details.dart';

class StockListScreen extends StatelessWidget {
  const StockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildListItem(context, 'AAPL'),
          buildListItem(context, 'GOOGL'),
          buildListItem(context, 'AMZN'),
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, String name) {
    return ListTile(
      title: Text(name),
      onTap: () => openDetailsScreen(context, name),
    );
  }

  void openDetailsScreen(BuildContext context, String name) {
    getIt<StockPriceBloc>().add(StockPricesRequested(stockName: name));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StockDetailsScreen(stockName: name)),
    );
  }
}
