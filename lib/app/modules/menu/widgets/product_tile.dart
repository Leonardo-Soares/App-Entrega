import 'package:dartweek/app/core/ui/config_ui.dart';
import 'package:dartweek/app/core/ui/formatter_helper.dart';
import 'package:dartweek/app/models/product_model.dart';
import 'package:dartweek/app/modules/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTilie extends GetView<MenuController> {
  final ProductModel product;

  const ProductTilie({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'http://dartweek.academiadoflutter.com.br/images${product.image}'),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: ConfigUI.textBold,
                  ),
                  Text(
                    FormatterHelper.formatCurrency(product.price),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
