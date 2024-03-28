import 'package:b2ei_app/constant.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: PrimaryColor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/PP.jpg")
              )
            ),
          ),
          Text("Oumar Guire",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          ),
          Text("test@b2ei-sarl.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
