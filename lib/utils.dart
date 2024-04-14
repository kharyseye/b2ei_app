import 'package:b2ei_app/model/Request.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

Future<void> showToast(
  BuildContext context, {
  Widget? title,
  required Widget description,
  ToastificationType? type = ToastificationType.info,
  ToastificationStyle? style = ToastificationStyle.flat,
  AlignmentGeometry? alignment,
  Color? primaryColor,
  Duration? duration = const Duration(seconds: 14),
  Color? backgroundColor,
  Color? foregroundColor = Colors.white,
  bool? blurEffect = false,
}) async {
  toastification.show(
    context: context,
    borderRadius: BorderRadius.circular(100.0),
    showProgressBar: true,
    dragToClose: true,
    type: type,
    style: style,
    title: title,
    alignment: alignment,
    description: description,
    autoCloseDuration: duration,
    backgroundColor: backgroundColor,
    applyBlurEffect: blurEffect,
    foregroundColor: foregroundColor,
    primaryColor: type == ToastificationType.info
        ? Colors.deepPurple.shade600
        : Colors.white,
  );
}

Container showLoading() {
  return Container(
    width: 25,
    height: 25,
    child: CircularProgressIndicator(
      color: Colors.white,
    ),
  );
}

// Formate une date Dart en une chaîne lisible
String formatDate(DateTime date, {String? format}) {
  format ??= 'dd/MM/yyyy HH:mm';
  initializeDateFormatting('fr_FR', null);
  DateFormat formatter = DateFormat(format, 'fr_FR');
  return formatter.format(date);
}

String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

String saluer(String name) {
  // Récupère l'heure actuelle
  DateTime maintenant = DateTime.now();
  int heure = maintenant.hour;

  // Détermine le message de salutation en fonction de l'heure
  String message;
  if (heure >= 5 && heure < 12) {
    message = "Bonjour ☀️ $name !";
  } else if (heure >= 12 && heure < 18) {
    message = "Bon après-midi 🌤️  $name";
  } else {
    message = "Bonsoir 🌙 $name !";
  }

  return message;
}

// Fonction pour obtenir l'icône correspondante au statut
IconData getIconData(Statut statut) {
  switch (statut) {
    case Statut.enAttente:
      return Icons.hourglass_empty;
    case Statut.valide:
      return Icons.check_circle;
    case Statut.refuse:
      return Icons.cancel;
    default:
      return Icons.error; // Icône par défaut si le statut n'est pas reconnu
  }
}

// Fonction pour obtenir la couleur du texte correspondant au statut
Color getStatusColor(Statut statut) {
  switch (statut) {
    case Statut.enAttente:
      return Colors.orange;
    case Statut.valide:
      return Colors.green;
    case Statut.refuse:
      return Colors.red;
    default:
      return Colors.black; // Couleur par défaut si le statut n'est pas reconnu
  }
}

//Cette formule me permet de formater l'affichage du statut
String formatStatut(Statut statut) {
  switch (statut) {
    case Statut.enAttente:
      return 'En Attente';
    case Statut.valide:
      return 'Validé';
    case Statut.refuse:
      return 'Refusé';
    default:
      return '';
  }
}
