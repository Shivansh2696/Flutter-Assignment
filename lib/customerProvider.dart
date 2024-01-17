import 'package:flutter/material.dart';
import 'customersPage.dart';

class CustomerProvider extends ChangeNotifier {
  List<Customer> customerList = [
    Customer(name: 'John Doe', email: 'john@example.com', age: 30),
    Customer(name: 'Jane Doe', email: 'jane@example.com', age: 25),
  ];

  void addCustomer(Customer customer) {
    customerList.add(customer);
    notifyListeners();
  }
}
