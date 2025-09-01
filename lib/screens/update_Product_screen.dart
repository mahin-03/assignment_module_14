import 'package:flutter/material.dart';

class UpdateproductScreen extends StatefulWidget {
  const UpdateproductScreen({super.key});

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
                FilledButton(onPressed: () {}, child: Text('Update')),
              ],
            ),
          ),
        ),
      ),
    );
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
