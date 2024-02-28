
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../employee_interface/FormPage.dart';
import '../employee_interface/HistoryPage.dart';


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
  var height, width;

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
      route: FormPage('faire une dem'), // Remplacez Route1 par le nom de votre première route
    ),
    RouteItem(
      name: 'Historique',
      route: HistoryPage('historique'), // Remplacez Route2 par le nom de votre deuxième route
    ),
    // Ajoutez d'autres routes si nécessaire
  ];


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profil2.png")
                            ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Superieur",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
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
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imgData.length,
                itemBuilder: (context, index){
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      routes[index].route,

                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
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
    );
  }
}
