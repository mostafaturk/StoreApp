import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widget/custom_button.dart';
import 'package:storeapp/widget/custom_form_field.dart';

import '../models/product_model.dart';

class UpdateProduct extends StatefulWidget {
   UpdateProduct({Key? key}) : super(key: key);

  static String id='upadteproduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, desc, image;

  String? price;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
    ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                CustomTextField(
                  hintText: 'ProductName',
                  onChanged: (data){
                    productName=data;
                  },
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  hintText: 'Discriptions',
                  onChanged: (data){
                    desc=data;
                  },
                ),
                SizedBox(height: 10,),

                CustomTextField(
                  hintText: 'price',
                  inputType: TextInputType.number,
                  onChanged: (data){
                    price= data;
                  },
                ),
                SizedBox(height: 10,),

                CustomTextField(
                  hintText: 'Image',
                  onChanged: (data){
                    image=data;
                  },
                ),
                SizedBox(height: 50,),

                CustomButon(text: "Update",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }


}
