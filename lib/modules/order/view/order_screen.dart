import 'package:flutter/material.dart';
import 'package:test/shared/widgets/data/customer_data.dart';

class OrderScreen extends StatefulWidget {
  final CustomerModel customer;

  const OrderScreen({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
