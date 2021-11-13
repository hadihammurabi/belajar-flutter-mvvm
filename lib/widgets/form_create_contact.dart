import 'package:flutter/material.dart';
import 'package:phonebookapp/features/home/contact.model.dart';

class FormCreateContact extends StatelessWidget {
  FormCreateContact({Key? key, required this.onAddContact}) : super(key: key);
  void Function(Contact) onAddContact;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text('Nama'),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (String? value) {
              if (value == '' || value!.isEmpty) {
                return 'Nama wajib diisi.';
              }
            },
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              label: Text('Telepon'),
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            validator: (String? value) {
              if (value == '' || value!.isEmpty) {
                return 'Telepon wajib diisi.';
              }
            },
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onAddContact(
                    Contact(
                      name: nameController.text,
                      phone: phoneController.text,
                    ),
                  );
                  nameController.clear();
                  phoneController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
