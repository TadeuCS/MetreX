class EmailModel {
  String emailRemetente;
  String senhaRemetente;
  String smtpServidor;
  int porta;
  bool usaSSL;
  String assunto;
  String texto;
  List<DestinatarioModel> destinatarios;

  EmailModel(
      {this.emailRemetente,
      this.senhaRemetente,
      this.smtpServidor,
      this.porta,
      this.usaSSL,
      this.assunto,
      this.texto,
      this.destinatarios});

  EmailModel.fromJson(Map<String, dynamic> json) {
    emailRemetente = json['emailRemetente'];
    senhaRemetente = json['senhaRemetente'];
    smtpServidor = json['smtpServidor'];
    porta = json['porta'];
    usaSSL = json['usaSSL'];
    assunto = json['assunto'];
    texto = json['texto'];
    if (json['destinatarios'] != null) {
      destinatarios = new List<DestinatarioModel>();
      json['destinatarios'].forEach((v) {
        destinatarios.add(new DestinatarioModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailRemetente'] = this.emailRemetente;
    data['senhaRemetente'] = this.senhaRemetente;
    data['smtpServidor'] = this.smtpServidor;
    data['porta'] = this.porta;
    data['usaSSL'] = this.usaSSL;
    data['assunto'] = this.assunto;
    data['texto'] = this.texto;
    if (this.destinatarios != null) {
      data['destinatarios'] =
          this.destinatarios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DestinatarioModel {
  String email;

  DestinatarioModel({this.email});

  DestinatarioModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}