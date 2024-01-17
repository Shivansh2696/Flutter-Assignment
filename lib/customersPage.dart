import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<Customer> customers = [
    Customer(name: 'John Doe', email: 'john.doe@example.com', age: 25),
    Customer(name: 'Jane Smith', email: 'jane.smith@example.com', age: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        actions: [
          // Show different actions based on the selected tab
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              _showAddUserDialog(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(customers[index].name),
              subtitle: Text('${customers[index].email} - ${customers[index].age} years old'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _editCustomer(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteCustomer(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _editCustomer(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController(text: customers[index].name);
        TextEditingController emailController = TextEditingController(text: customers[index].email);
        TextEditingController ageController = TextEditingController(text: customers[index].age.toString());

        return AlertDialog(
          title: const Text('Edit Customer'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  customers[index].name = nameController.text;
                  customers[index].email = emailController.text;
                  customers[index].age = int.parse(ageController.text);
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteCustomer(int index) {
    setState(() {
      customers.removeAt(index);
    });
  }

  Future<void> _showAddUserDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  customers.add(
                    Customer(
                      name: nameController.text,
                      email: emailController.text,
                      age: int.tryParse(ageController.text) ?? 0,
                    ),
                  );
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}


class Customer {
  String name;
  String email;
  int age;

  Customer({required this.name, required this.email, required this.age});
}