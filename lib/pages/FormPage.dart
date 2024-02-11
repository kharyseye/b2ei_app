import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();
  final affaireController = TextEditingController();
  final refController = TextEditingController();
  final designationController = TextEditingController();
  final quantiteController = TextEditingController();
  String selectedClientType = 'Direction';
  DateTime selectedDateTime = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose

    affaireController.dispose();
    refController.dispose();
    designationController.dispose();
    quantiteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demande de materiel"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key : _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(value:'Direction' ,child: Text("B2EI-DIRECTION")),
                      DropdownMenuItem(value:'Operation' ,child: Text("B2EI-SERVICE TECHNIQUE"))
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    value: selectedClientType,
                    onChanged: (value){
                      setState(() {
                        selectedClientType = value!;
                      });
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'Entrer la Date',
                      hintStyle: TextStyle(color: Colors.black26),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.date_range)
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    validator:
                    (e) => (e?.day ?? 0) == 1 ? 'Please not the first day': null,
                    onChanged: (DateTime? value) {
                     print(value);
                     setState(() {
                       selectedDateTime = value!;
                     });
                    },
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Affaire",
                        hintText: "Entrer le Nom de l'Affaire",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "champs incomplet";
                        }return null;
                      },
                      controller: affaireController,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Reference",
                        hintText: "Renseigner la reference",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "champs incomplet";
                        }return null;
                      },
                      controller: refController,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Designation",
                        hintText: "Entrer la designation",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "champs incomplet";
                        }return null;
                      },
                      controller: designationController,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Quantite",
                        hintText: "Entrer la quantite",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "champs incomplet";
                        }return null;
                      },
                      controller: quantiteController,
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    //style: ElevatedButton.styleFrom(
                      //primary: Color(0xC5D6F1CB),),
                    onPressed: (){
                      if (_formKey.currentState!.validate()){

                        final affaire = affaireController.text;
                        final reference = refController.text;
                        final designation = designationController.text;
                        final quantite = quantiteController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Envoie en cours..."))
                        );
                        FocusScope.of(context).requestFocus(FocusNode());
                        print("$selectedClientType,$selectedDateTime, $affaire, $reference, $designation, $quantite");
                      }

                      quantiteController.clear();
                      affaireController.clear();
                      refController.clear();
                      designationController.clear();
                      quantiteController.clear();
                      selectedClientType.trim();

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
