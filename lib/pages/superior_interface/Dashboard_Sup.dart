import 'package:b2ei_app/pages/superior_interface/drawer/DrawerPage.dart';
import 'package:b2ei_app/services/user_service.dart';
import 'package:b2ei_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../services/user_preferences.dart';

class Dashboard_Sup extends StatefulWidget {
  @override
  State<Dashboard_Sup> createState() => _DashboardState();
}

class RouteItem {
  final String name; // Nom de la route
  final Widget route; // Widget de la route

  RouteItem({required this.name, required this.route});
}

class _DashboardState extends State<Dashboard_Sup> {
  final UserService userService = UserService();

  var height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /*List imgData = [
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
      route: FormPage('faire une dem'), // Remplacez Route1 par le nom de votre première route
    ),
    RouteItem(
      name: 'Historique',
      route: HistoryPage('historique'), // Remplacez Route2 par le nom de votre deuxième route
    ),
    // Ajoutez d'autres routes si nécessaire
  ];
*/

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      body: Container(
        color: PrimaryColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
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
                            Icons.menu,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () =>
                              _scaffoldKey.currentState?.openDrawer(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.notifications_none,
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
                            return showLoading();
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: height * 0.75,
              width: width,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('demande').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Une erreur s\'est produite'),
                    );
                  }

                  final demands = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: demands.length,
                    itemBuilder: (context, index) {
                      final demand = demands[index];
                      final clientId = demand['id_user'];
                      final clientType = demand['client'];
                      final affaire = demand['affaire'];
                      final reference = demand['reference'];
                      final designation = demand['designation'];
                      final quantite = demand['quantite'];
                      final date = (demand['date'] as Timestamp).toDate();

                      // Affichez les informations de la demande dans un widget ListTile ou Card
                      return SingleChildScrollView(
                        child: Card(
                            child : ListTile(
                              title: Text('Affaire: $affaire'),
                              subtitle: Text('Client: $clientId\nDate: $date'),
                              trailing: Text('Quantité: $quantite'),
                              // Vous pouvez personnaliser davantage l'affichage ici
                            ),
                        ),
                      );
                    },
                  );
                },
              )

            ),
          ],
        ),
      ),
    );
  }
}
