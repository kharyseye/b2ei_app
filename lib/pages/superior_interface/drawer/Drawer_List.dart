import 'package:b2ei_app/pages/authentication/RegisterPage.dart';
import 'package:b2ei_app/pages/superior_interface/Dashboard_Sup.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.dashbord;
  @override
  Widget build(BuildContext context) {
    // var container;
    // if (currentPage == DrawerSections.dashbord) {
    //   container = Dashboard_Sup();
    // } else if (currentPage == DrawerSections.addUser) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => RegisterPage(),
    //       ));
    // } else if (currentPage == DrawerSections.notification) {
    //   container = Dashboard_Sup();
    // } else if (currentPage == DrawerSections.request) {
    //   container = Dashboard_Sup();
    // } else if (currentPage == DrawerSections.setting) {
    //   container = Dashboard_Sup();
    // }

    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Dashbord", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashbord ? true : false),
          menuItem(
              2,
              "Gestion des utilisateurs",
              Icons.person_add_alt_1_outlined,
              currentPage == DrawerSections.addUser ? true : false),
          menuItem(3, "Notification", Icons.notifications_active_outlined,
              currentPage == DrawerSections.notification ? true : false),
          menuItem(4, "Demandes", Icons.list_alt,
              currentPage == DrawerSections.request ? true : false),
          menuItem(5, "paramettre", Icons.settings_applications,
              currentPage == DrawerSections.setting ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashbord;
            } else if (id == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => RegisterPage(),
                ),
              );
            } else if (id == 3) {
              currentPage = DrawerSections.notification;
            } else if (id == 4) {
              currentPage = DrawerSections.request;
            } else if (id == 5) {
              currentPage = DrawerSections.setting;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: PrimaryColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { dashbord, addUser, notification, request, setting, exit }
