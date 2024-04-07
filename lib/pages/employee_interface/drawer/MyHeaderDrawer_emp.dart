import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/services/user_service.dart';
import 'package:b2ei_app/utils.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer_emp extends StatefulWidget {
  const MyHeaderDrawer_emp({super.key});

  @override
  State<MyHeaderDrawer_emp> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyHeaderDrawer_emp> {
  final UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: PrimaryColor,
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: StreamBuilder(
          stream: userService.getUserInfo(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: showLoading());
            }
            if (snapshot.hasError)
              return Center(
                child: Text('${snapshot.error.toString()}'),
              );
            final user = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/avatar.png"))),
                ),
                Text(
                  capitalize('${user?.username}'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "${user?.email}",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 20,
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
