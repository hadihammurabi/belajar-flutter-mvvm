import 'package:flutter/material.dart';
import 'package:phonebookapp/features/home/contact.model.dart';
import 'package:phonebookapp/services/contact.dart';
import 'package:phonebookapp/widgets/form_create_contact.dart';

class HomeViewModel extends ChangeNotifier {
  final contactService = ContactService();
  Future<List<Contact>> _contacts = Future.value([]);

  Future<List<Contact>> get contacts => _contacts;
  void fetchAllContacts() {
    _contacts = contactService.getAll();
    notifyListeners();
  }

  onAddContact(BuildContext context, Contact contact) async {
    await contactService.add(contact);
    fetchAllContacts();
    Navigator.of(context, rootNavigator: true).pop();
  }

  showAddContactForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Data Kontak'),
        content: FormCreateContact(onAddContact: (Contact contact) {
          onAddContact(context, contact);
        }),
      ),
    );
  }
}
