import 'package:flutter/material.dart';
import 'package:flutter_payment/data/item.dart';
import 'package:flutter_payment/pay_item.dart';

class ItemWidget extends StatelessWidget with PayItem<Item> {
  final Item item;
  late final updated;

  ItemWidget({required this.item, this.updated});

  @override
  Item get element => item;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
