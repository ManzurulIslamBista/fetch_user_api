import 'package:fetch_api/model/Users.dart';
import 'package:fetch_api/provider/FetchApiProvider.dart';
import 'package:fetch_api/feature/SingleUserView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  get userDetails => null;


  @override
  Widget build(BuildContext context) {
    List<Users> usersDetails = context.watch<FetchApiProvider>().usersList;
    return   SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: Column(
          children: <Widget>[
            if (usersDetails == null) const Center(
              child: CircularProgressIndicator(),
            )  else ...usersDetails.map((user) => Column(
              children: [
                SingleUserView(userDetails: user),
                const SizedBox(height: 10,),
                Container(
                  height: 1,
                  color: const Color(0xFFcccccc),
                ),
                const SizedBox(height: 10,),
                // SizedBox inside the loop
              ],
            )),
          ],
        ),
      ),
    );
  }
}