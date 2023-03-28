import 'package:flutter/material.dart';
import 'package:product/model/product.dart';
import 'package:product/services/load_data.dart';

final Future<List<Product>> productsFuture = get_products();

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
  }

  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            // build your widget tree using the products list
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(products[index].title),
                    subtitle: Column(
                      children: [
                        Text(
                          products[index].description,
                          maxLines: 4,
                        ),
                        Text(
                          "Price: ${products[index].price}\$",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    leading: Image.network(products[index].image),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading products'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
