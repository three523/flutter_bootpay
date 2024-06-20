import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_payment/data/payload_option.dart';
import 'package:flutter_payment/payment.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  return runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final payment = Payment();
  final payload = Payload();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () => loadPayment(context),
              child: Text('Hello World!')),
        ),
      ),
    );
  }

  void loadPayment(BuildContext context) {
    payment.loadPayment(context, makeItemList(), makeOption(), (String data) {
      print('done $data');
    }, (String error) {
      print('error $error');
      return true;
    }, null);
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

  List<Item> makeItemList() {
    Item item1 = Item();
    item1.name = "미키 '마우스"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500;
    Item item2 = Item();
    item2.name = "키보드"; // 주문정보에 담길 상품명
    item2.qty = 1; // 해당 상품의 주문 수량
    item2.id = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격
    List<Item> itemList = [item1, item2];
    return itemList;
  }

  PayLoadOption makeOption() {
    return PayLoadOption(
        pg: '나이스페이',
        method: '네이버페이',
        orderName: '테스트 상품',
        price: 1000.0,
        orderId: DateTime.now().millisecondsSinceEpoch.toString(),
        user: makeUser());
  }

  User makeUser() {
    User user = User();
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    user.phone = "010-4033-4678";
    user.addr = '서울시 동작구 상도로 222';

    return user;
  }
}
