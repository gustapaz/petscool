// ignore_for_file: avoid_print

import 'dart:async';
import 'package:test/shared/widgets/data/customer_data.dart';

Future<CustomerModel?> session({
  required String email,
  required String password,
}) async {
  CustomerModel? response;

  for (var i = 0; i < allCustomer.length; i++) {
    if (allCustomer[i].email == email && allCustomer[i].password == password) {
      response = allCustomer[i];
    }
  }

  return response;
}
