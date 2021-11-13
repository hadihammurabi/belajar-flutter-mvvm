import 'package:flutter/material.dart';
import 'package:phonebookapp/features/home/home.view.dart';
import 'package:phonebookapp/features/home/home.viewmodel.dart';
import 'package:phonebookapp/router.dart' as AppRouter;
import 'package:provider/provider.dart';

void main() {
  runApp(const Phonebookapp());
}

class Phonebookapp extends StatefulWidget {
  const Phonebookapp({Key? key}) : super(key: key);

  @override
  _PhonebookappState createState() => _PhonebookappState();
}

class _PhonebookappState extends State<Phonebookapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRouter.Router.init(),
        initialRoute: HomePage.name,
      ),
    );
  }
}
