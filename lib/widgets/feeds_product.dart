import 'package:badges/badges.dart';
import 'package:cinemapp/models%20&%20providers/product.dart';
import 'package:flutter/material.dart';
import 'package:cinemapp/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import 'feeds_product_dialog.dart';

class FeedsProduct extends StatefulWidget {
  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: productAttribute.id,
        );
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: 170,
                          maxHeight: MediaQuery.of(context).size.height * 0.21),
                      child: Center(
                        child: Image.network(productAttribute.imageUrl),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productAttribute.description,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'UGX ${productAttribute.price}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: ${productAttribute.quantity} left',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: IconButton(
              onPressed: () async {
                return showDialog(
                  context: context,
                  builder: (ctx) => FeedsProductDialog(
                    product: productAttribute,
                  ),
                );
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ),
          Badge(
            toAnimate: true,
            animationType: BadgeAnimationType.slide,
            shape: BadgeShape.square,
            badgeColor: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(8),
            badgeContent:
                const Text('New', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
