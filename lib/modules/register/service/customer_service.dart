// ignore_for_file: avoid_print

import 'dart:async';
import 'package:test/shared/widgets/data/customer_data.dart';

Future<bool> createCustomer({
  required String email,
  required String password,
  required String name,
  required String cpf,
  required String phone,
}) async {
  var response = false;

  for (var i = 0; i < allCustomer.length; i++) {
    if (allCustomer[i].email == email) {
      return response;
    }
  }

  allCustomer.add(
    CustomerModel(
      email: email,
      password: password,
      name: name,
      cpf: cpf,
      phone: phone,
    ),
  );

  response = true;

  return response;
}
