import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/user.dart';

class PayLoadOption {
  String pg;
  String method;
  String orderName;
  double price;
  String orderId;
  User user;
  Extra? extra;
  Map<String, dynamic>? params;

  PayLoadOption({
    required this.pg,
    required this.method,
    required this.orderName,
    required this.price,
    required this.orderId,
    required this.user,
    this.extra,
    Map<String, dynamic>? params,
  });
}
