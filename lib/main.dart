import 'package:api_demo_rj/userModel.dart';
import 'package:flutter/material.dart';

import 'services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<UserModel> _users;

  @override
  void initState() {
    setState(() {
      GetApiData().getData().then((users) {
        _users = users;
        //
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> userss = _users;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hello Api'),
        ),
        // body: DropdownButtonFormField(
        //   items: _users.map((String item) {
        //     return DropdownMenuItem(
        //       child: Text(item),
        //       value: item,
        //     );
        //   }).toList(),
          body: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              UserModel userss = _users[index];
              return ListTile(
                title: Text(userss.name),
                subtitle: Text(userss.username + userss.email,),
              );
            },
          )
        );
  }
}
