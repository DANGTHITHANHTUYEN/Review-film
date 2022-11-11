import 'package:flutter/material.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // temporary list
  List list = [
    'https://gamek.mediacdn.vn/thumb_w/690/133514250583805952/2022/10/8/z-1665208986037994779196-0-0-750-1200-crop-1665208994067885604080.jpg',
    'https://filmdaily.co/wp-content/uploads/2022/06/minionsgru-04-1300x975.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text('Your Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        // Display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index],
                );
              }),
        ),
      ],
    );
  }
}
