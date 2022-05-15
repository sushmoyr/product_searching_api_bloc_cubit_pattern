import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/cubit/product_search_cubit/product_search_cubit.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/repository/remository.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/service/product_search_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductSearchCubit(
            SearchRepository(
              ProductSearchService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();

  void _search() {
    String term = controller.text;
    context.read<ProductSearchCubit>().searchProducts(term);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<ProductSearchCubit, ProductSearchState>(
        builder: (context, state) {
          if (state is ProductSearchLoading) {
            debugPrint('loading search');
          } else if (state is ProductSearchLoaded) {
            debugPrint('Search loaded');

            var products = state.products;
            debugPrint('Total: ${products.length}');
            for (var product in products) {
              debugPrint('${product.id}: ${product.productName}');
            }
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'search',
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _search,
        tooltip: 'Search',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
