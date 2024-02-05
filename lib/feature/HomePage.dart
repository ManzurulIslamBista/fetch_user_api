import 'package:provider/provider.dart';

import '../provider/FetchApiProvider.dart';
import 'UserList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
        backgroundColor: Color(0xFF2AB27A),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FetchApiProvider>().fetchApi();
        },
        child: Icon(Icons.refresh),
      ),
      body: UserList(),
    );
  }
}
