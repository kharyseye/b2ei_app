import 'package:b2ei_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../services/user_preferences.dart';

class FormPagetest extends StatefulWidget {
  final String img;

  FormPagetest(this.img);

  @override
  State<FormPagetest> createState() => _FormPageState();
}

class _FormPageState extends State<FormPagetest> {
  final UserPreferences userPref = UserPreferences();

  final _formKey = GlobalKey<FormState>();
  final affaireController = TextEditingController();
  final refController = TextEditingController();
  String selectedClientType = 'Direction';
  DateTime selectedDateTime = DateTime.now();
  List<Map<String, String>> designations = []; // Liste des paires désignation-quantité

  @override
  void dispose() {
    super.dispose();
    affaireController.dispose();
    refController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Faire une demande'/*widget.img*/)),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                          value: 'Direction', child: Text("DIRECTION")),
                      DropdownMenuItem(
                          value: 'Operation',
                          child: Text("OPERATION"))
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    value: selectedClientType,
                    onChanged: (value) {
                      setState(() {
                        selectedClientType = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                        labelText: 'Entrer la Date',
                        hintStyle: TextStyle(color: Colors.black26),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.date_range)),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onChanged: (DateTime? value) {
                      print(value);
                      setState(() {
                        selectedDateTime = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Affaire",
                        hintText: "Entrer le Nom de l'Affaire",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "champs incomplet";
                        }
                        return null;
                      },
                      controller: affaireController,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Reference",
                        hintText: "Renseigner la reference",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "champs incomplet";
                        }
                        return null;
                      },
                      controller: refController,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // Champs de désignation et quantité
                Column(
                  children: designations.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> pair = entry.value;
                    TextEditingController designationController =
                    TextEditingController(text: pair['designation']);
                    TextEditingController quantiteController =
                    TextEditingController(text: pair['quantite']);
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10, right: 10),
                            child: Material(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Designation",
                                  hintText: "Entrer la designation",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "champs incomplet";
                                  }
                                  return null;
                                },
                                controller: designationController,
                                onChanged: (value) {
                                  designations[index]['designation'] = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Material(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Quantite",
                                  hintText: "Entrer la quantite",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "champs incomplet";
                                  }
                                  return null;
                                },
                                controller: quantiteController,
                                onChanged: (value) {
                                  designations[index]['quantite'] = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              designations.removeAt(index);
                            });
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 20,),
                // Bouton pour ajouter une nouvelle ligne de désignation
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        designations.add({
                          'designation': '',
                          'quantite': '',
                        });
                      });
                    },
                    child: Text("Ajouter une ligne"),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final affaire = affaireController.text;
                        final reference = refController.text;

                        FocusScope.of(context).requestFocus(FocusNode());
                        String? userId = await userPref.getUserId();
                        String? adminId = idAdmin; // Remplacez par l'identifiant de votre administrateur

                        if (userId != null) {
                          // AJOUT DANS LA BASE DE DONNEES
                          CollectionReference demandeRef =
                          FirebaseFirestore.instance.collection("demande");

                          demandeRef.add({
                            'client': selectedClientType,
                            'date': selectedDateTime,
                            'affaire': affaire,
                            'reference': reference,
                            'designations': designations,
                            'id_user': userId,
                            'destinataire': adminId,
                            'statut': 'en Attente',
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Demande envoyée"))
                          );
                          // Ajout d'un délai avant de fermer la page
                          await Future.delayed(Duration(milliseconds: 1500));
                        }

                        // Effacer les champs après l'envoi
                        designations.clear();
                        affaireController.clear();
                        refController.clear();
                        selectedClientType.trim();
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Envoyer"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
