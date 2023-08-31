import 'package:eve/bloc/userLogic.dart';
import 'package:eve/models/user.dart';
import 'package:eve/screens/home.dart';
import 'package:eve/screens/login.dart';
import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  final User loggedInUser;

  Menu({Key? key, required this.loggedInUser}) : super(key: key);
  UserLogic usertable=UserLogic();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: Text(loggedInUser.firstName),
                accountEmail: Text(loggedInUser.email),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) {
                          return HomeWidget(loggedInUser: loggedInUser,);
                        })
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Logout'),
                  trailing: Icon(Icons.login),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) {
                          return Login();
                        })
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}