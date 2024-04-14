import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// Fonction pour envoyer un e-mail
void sendCredentialsEmail(
    String email, String username, String password) async {
  final smtpServer = gmail('mamekharyseye380@gmail.com', 'Mamekhady123');
  final message = Message()
    ..from = Address(email, username)
    ..recipients.add(email)
    ..subject = 'Vos identifiants d\'inscription'
    ..html =
        '<h3>Bienvenue $username,</h3>\n<p>Vos identifiants sont :</p>\n<p><b>Email:</b> $email</p>\n<p><b>Mot de passe:</b> $password</p>';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } catch (e) {
    print('Error while sending email: $e');
  }
}
