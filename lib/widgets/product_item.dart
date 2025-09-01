import 'package:crud_app/screens/update_Product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Product name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: 32874715'),
          Row(
            spacing: 10,
            children: [Text('Quantity: 5'), Text('Unit price: 500')],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOptions>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: ProductOptions.update, child: Text('Update')),
            PopupMenuItem(value: ProductOptions.delete, child: Text('Delete')),
          ];
        },
        onSelected: (ProductOptions selectedOptions) {
          if (selectedOptions == ProductOptions.update) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateproductScreen()),
            );
          } else {
            print('delete');
          }
        },
      ),
    );
  }
}

enum ProductOptions { update, delete }
