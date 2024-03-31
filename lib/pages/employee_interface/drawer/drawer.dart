import 'MyDrawerList_emp.dart';
import 'MyHeaderDrawer_emp.dart';
import 'package:flutter/material.dart';


class DrawerPage_emp extends StatefulWidget {
  const DrawerPage_emp({super.key});

  @override
  State<DrawerPage_emp> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage_emp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer_emp(),
              MyDrawerList_emp(),
            ],
          ),
        ),
      ),
    );
  }
}
