import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  // Substitua pelos seus dados
  final smtpServer = SmtpServer('smtp.gmail.com',
      username: 'seu-email@gmail.com',
      password: 'sua-senha');

  // Cria a mensagem de e-mail
  final message = Message()
    ..from = Address('seu-email@gmail.com', 'Seu Nome')
    ..recipients.add('destinatario@exemplo.com')
    ..subject = 'Teste de Envio de E-mail'
    ..text = 'Teste de envio de e-mail';

  try {
    // Envia o e-mail
    await send(message, smtpServer);
    print('E-mail enviado com sucesso!');
  } on MailerException catch (e) {
    // Exibe o erro caso o envio falhe
    print('Erro ao enviar o e-mail: ${e.toString()}');
  }
}
