import 'package:flutter/material.dart';
import 'package:week4_streams/repository/followrepository.dart';
import 'dart:async';
import 'dart:async';
import 'dart:convert';

import 'package:week4_streams/Models/user_model.dart';
import 'package:week4_streams/service/contacts_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    dataStream();
  }

  Stream dataStream() async* {
    ContactsService contactsService = ContactsService();
    var result;
    // while (true) {
    //   contactsService.getFollowers();

    //   yield result;
    //   print(result);
    // }

    while (true) {
      await Future.delayed(Duration(milliseconds: 600)).then((value) async {
        String? url = 'https://jsonplaceholder.typicode.com/users';

        var http;
        final response = await http.get(
          Uri.parse(url),
        );

        if (response.statusCode == 200) {
          result = [json.decode(response.body)];
        } else {
          throw Exception('Failed to load post: ${response.body}');
        }
      });
      yield result;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(

// create User ListTile with circle avatar, name and email
        body: StreamBuilder(
      stream: dataStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          print('No data fetched');
        }
        if (snapshot.hasError) {
          print('Snapshot has error');
        }

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index]['name']),
                subtitle: Text(snapshot.data[index]['email']),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
