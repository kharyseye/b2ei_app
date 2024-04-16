import 'package:b2ei_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../services/user_preferences.dart';

class FormPage extends StatefulWidget {
  final String img;

  FormPage(this.img);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final UserPreferences userPref = UserPreferences();

  final _formKey = GlobalKey<FormState>();
  final affaireController = TextEditingController();
  final refController = TextEditingController();
  final designationController = TextEditingController();
  final quantiteController = TextEditingController();
  String selectedClientType = 'Direction';
  DateTime selectedDateTime = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    affaireController.dispose();
    refController.dispose();
    designationController.dispose();
    quantiteController.dispose();
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
                Container(
                  margin: EdgeInsets.only(bottom: 10),
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
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
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
                    ),
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
                        final designation = designationController.text;
                        final quantite = quantiteController.text;

                        FocusScope.of(context).requestFocus(FocusNode());
                        String? userId = await userPref.getUserId();
                        String? adminId =
                            idAdmin; // Remplacez par l'identifiant de votre administrateur

                        if (userId != null) {
                          // AJOUT DANS LA BASE DE DONNEES
                          CollectionReference demandeRef =
                              FirebaseFirestore.instance.collection("demande");
                          demandeRef.add({
                            'client': selectedClientType,
                            'date': selectedDateTime,
                            'affaire': affaire,
                            'reference': reference,
                            'designation': designation,
                            'quantite': quantite,
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
                        quantiteController.clear();
                        affaireController.clear();
                        refController.clear();
                        designationController.clear();
                        quantiteController.clear();
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
