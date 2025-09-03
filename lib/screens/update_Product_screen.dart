import 'dart:convert';

import 'package:crud_app/models/product.dart';
import 'package:crud_app/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateproductScreen extends StatefulWidget {
  const UpdateproductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateproductScreen> createState() => _UpdateproductScreenState();
}

class _UpdateproductScreenState extends State<UpdateproductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _quantityTEController.text = widget.product.quantity.toString();
    _unitPriceTEController.text = widget.product.unitPrice.toString();
    _imageUrlTEController.text = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    labelText: 'Product name',
                  ),
                ),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product code',
                    labelText: 'Product code',
                  ),
                ),
                TextFormField(
                  controller: _quantityTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                ),
                TextFormField(
                  controller: _unitPriceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Unit price',
                    labelText: 'Unit price',
                  ),
                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: InputDecoration(
                    hintText: 'Image Url',
                    labelText: 'Image Url',
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(onPressed: _updateProduct, child: Text('Update')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate() == false){
      return;
    }

    Uri uri = Uri.parse(Urls.updateProductUrls(widget.product.id));
    int totalPrice =
        int.parse(_unitPriceTEController.text) *
            int.parse(_quantityTEController.text);
    Map<String, dynamic> requestedBody = {
      "ProductName": _nameTEController.text,
      "ProductCode": int.parse(_codeTEController.text),
      "Img": _imageUrlTEController.text,
      "Qty": int.parse(_quantityTEController.text),
      "UnitPrice": int.parse(_unitPriceTEController.text),
      "TotalPrice": totalPrice,
    };
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestedBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status' == 'success']) {
        _clearTextFields();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Product created successfully')));
      } else {
        String errorMessage = decodedJson['data'];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
  }

  void _clearTextFields() {
    _nameTEController.clear();
    _unitPriceTEController.clear();
    _codeTEController.clear();
    _quantityTEController.clear();
    _imageUrlTEController.clear();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _imageUrlTEController.dispose();
    super.dispose();
  }
}
