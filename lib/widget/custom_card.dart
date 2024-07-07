import 'package:flutter/material.dart';
import 'package:storeapp/screens/update_product.dart';

import '../models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,required this.product}) : super(key: key);

   ProductModel product;

   @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProduct.id,arguments:product );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(.2),
                      offset: Offset(10, 10)
                  )
                ]
            ),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0,10),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$''${product.price.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.favorite,color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child:Image.network(
              product.image,
              height: 100,
               width: 100,
            ), ),
        ],
      ),
    );
  }
}
