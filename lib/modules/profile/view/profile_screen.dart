import 'package:flutter/material.dart';
import 'package:test/shared/widgets/data/customer_data.dart';

class ProfileScreen extends StatefulWidget {
  final CustomerModel customer;

  const ProfileScreen({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
