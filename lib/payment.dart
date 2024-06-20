import 'dart:io';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_payment/data/payload_option.dart';

class Payment {
  Payload payload = Payload();

  Payment() {
    _addApplicationId();
  }

  void _addApplicationId() {
    if (kIsWeb) payload.webApplicationId = dotenv.env['BOOTPAY_WEB_APIKEY'];
    if (Platform.isIOS)
      payload.iosApplicationId = dotenv.env['BOOTPAY_IOS_APIKEY'];
    if (Platform.isAndroid)
      payload.androidApplicationId = dotenv.env['BOOTPAY_AOS_APIKEY'];
  }

  void loadPayment(
      BuildContext context,
      List<Item> items,
      PayLoadOption option,
      void Function(String)? onDone,
      bool Function(String)? onConfirm,
      void Function(String)? onError) {
    setPayload(items, option);
    Bootpay().requestPayment(
        context: context,
        payload: payload,
        onDone: onDone,
        onError: onError,
        onConfirm: onConfirm);
  }

  void setPayload(List<Item> items, PayLoadOption option) {
    payload.items = items;
    payload.pg = option.pg;
    payload.method = option.method;
    payload.orderName = option.orderName;
    payload.orderId = option.orderId;
    payload.price = option.price;
    payload.user = option.user;
    payload.extra = option.extra;
  }
}
