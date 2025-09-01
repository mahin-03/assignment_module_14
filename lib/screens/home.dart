import 'package:crud_app/screens/add_newProduct_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductItem();
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 70);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewproductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
