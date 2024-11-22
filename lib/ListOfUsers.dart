import 'dart:async';
import 'dart:convert';
import 'package:bca_course/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listofusers extends StatefulWidget {
  const Listofusers({super.key});

  @override
  State<Listofusers> createState() => _ListofusersState();
}

class _ListofusersState extends State<Listofusers> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        print(jsonData[0]["title"]);
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        // this give th length of item
        itemCount: products.length,
        itemBuilder: (context, index) {
          // here we card the card widget
          // which is in utils folder
          return ListTile(

            title: Text(products[index].title),
            subtitle: Text(products[index].description),

          ); //ProductCard(product: products[index]);
        },
      ),
    );
  }
}
