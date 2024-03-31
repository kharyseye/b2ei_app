import 'package:b2ei_app/pages/employee_interface/drawer/drawer.dart';
import 'package:b2ei_app/services/user_service.dart';
import 'package:b2ei_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../services/user_preferences.dart';
import '../superior_interface/drawer/DrawerPage.dart';
import 'FormPage.dart';
import 'HistoryPage.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class RouteItem {
  final String name; // Nom de la route
  final Widget route; // Widget de la route

  RouteItem({required this.name, required this.route});
}

class _DashboardState extends State<Dashboard> {
  final UserService userService = UserService();

  var height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List imgData = [
    "assets/images/papeterie.png",
    "assets/images/historique.png",
    "assets/images/pdf.png",
    "assets/images/parametre.png",
  ];

  List Titles = [
    "Faire une Demande",
    "Historique",
    "PDF",
    "Parametre",
  ];
  List<RouteItem> routes = [
    RouteItem(
      name: 'Faire une demande',
      route: FormPage(
          'faire une demande'), // Remplacez Route1 par le nom de votre première route
    ),
    RouteItem(
      name: 'Historique',
      route: HistoryPage(
          'historique'), // Remplacez Route2 par le nom de votre deuxième route
    ),
    // Ajoutez d'autres routes si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage_emp(),
      backgroundColor: PrimaryColor,
      body: Container(
        color: PrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: height * 0.25,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 45,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () =>
                                  _scaffoldKey.currentState?.openDrawer(),
                            ),
                            InkWell(
                              onTap: () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  UserPreferences().logout(context);
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: StreamBuilder(
                            stream: userService.getUserInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(child: showLoading());
                              }
                              if (snapshot.hasError)
                                return Center(
                                  child: Text('${snapshot.error.toString()}'),
                                );
                              final user = snapshot.data;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${saluer(capitalize(user?.username ?? ''))}',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                height: height * 0.75,
                width: width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imgData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => routes[index].route,
                            ));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              imgData[index],
                              width: 100,
                            ),
                            Text(
                              Titles[index],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
