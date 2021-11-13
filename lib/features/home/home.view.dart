import 'package:flutter/material.dart';
import 'package:phonebookapp/features/home/home.viewmodel.dart';
import 'package:phonebookapp/features/home/contact.model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).fetchAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Phonebook App'),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    model.showAddContactForm(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
          body: FutureBuilder(
            future: model.contacts,
            builder: (
              context,
              AsyncSnapshot<List<Contact>> result,
            ) {
              List<Contact> contactsFromFuture = result.data ?? [];
              return ListView.builder(
                itemCount: contactsFromFuture.length,
                itemBuilder: (context, i) {
                  Contact contact = contactsFromFuture[i];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
