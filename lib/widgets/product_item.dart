import 'package:crud_app/screens/update_Product_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/models/product.dart';
import 'package:http/http.dart';

import '../urls.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.refreshProductList,
  });

  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteInProgress = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(
          widget.product.image,
          errorBuilder: (_, __, ___) {
            return Icon(Icons.error_outline);
          },
        ),
      ),
      title: Text(widget.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${widget.product.code}'),
          Row(
            spacing: 10,
            children: [
              Text('Quantity: ${widget.product.quantity}'),
              Text('Unit price: ${widget.product.unitPrice}'),
            ],
          ),
        ],
      ),
      trailing: Visibility(
        visible: _deleteInProgress == false,
        replacement: CircularProgressIndicator(),
        child: PopupMenuButton<ProductOptions>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: ProductOptions.update,
                child: Text('Update'),
              ),
              PopupMenuItem(
                value: ProductOptions.delete,
                child: Text('Delete'),
              ),
            ];
          },
          onSelected: (ProductOptions selectedOptions) {
            if (selectedOptions == ProductOptions.update) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => UpdateproductScreen(product: widget.product),
                ),
              );
            } else {
              _deleteProduct();
            }
          },
        ),
      ),
    );
  }

  Future<void> _deleteProduct() async {
    _deleteInProgress = true;
    setState(() {});

    Uri uri = Uri.parse(Urls.deleteProductUrls(widget.product.id));
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      widget.refreshProductList();
    }

    _deleteInProgress = false;
    setState(() {});
  }
}

enum ProductOptions { update, delete }
