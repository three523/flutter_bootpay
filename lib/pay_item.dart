import 'package:flutter/material.dart';
import 'package:flutter_payment/data/item.dart';

mixin PayItem<T> on Widget {
  T get element;
  void Function(T?)? updated;
}
