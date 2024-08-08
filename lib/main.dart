import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/api_client.dart';
import 'core/domain/constants.dart';
import 'feature/stock_price/data/repositories/stock_price_repository.dart';
import 'feature/stock_price/domain/bloc/bloc.dart';
import 'feature/stock_price/domain/bloc/event.dart';
import 'feature/stock_price/presentation/ui/list.dart';

setup() {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<StockPriceRepository>(StockPriceRepository(getIt<ApiClient>()));
  getIt.registerSingleton<StockPriceBloc>(StockPriceBloc(getIt<StockPriceRepository>()));
}

void main() {
  setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StockPriceBloc>(
          create: (BuildContext context) => getIt<StockPriceBloc>(),
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBM Stock Prices Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StockListScreen(),
    );
  }
}
