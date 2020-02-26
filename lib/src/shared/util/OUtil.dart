import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as IMG;
import 'package:intl/intl.dart';

class OUtil {
  static DateTime getDateByJSON(String data) {
    DateTime dtFormatada = DateFormat('MMM dd, yyyy HH:mm:ss a').parse(data);
    return dtFormatada;
  }

  static String formataDataByPattern(DateTime data, String formato) {
    if (data == null)
      return "  /  /    ";
    else
      return DateFormat(formato).format(data);
  }

  static String formataData(DateTime data) {
    if (data == null)
      return "  /  /    ";
    else
      return DateFormat('dd/MM/yyyy', 'pt_Br').format(data);
  }

  static DateTime getDataByStringDDMMYYYY(String data) {
    data = data.replaceAll('/', '').replaceAll('-', '');
    int dia = int.parse(data.substring(0, 2));
    int mes = int.parse(data.substring(2, 4));
    int ano = int.parse(data.substring(4, 8));

    return DateTime.utc(ano, mes, dia);
  }

  static DateTime getDataByString(String data) {
    return DateTime.parse(data);
  }

  static String formataDataSQL(DateTime data) {
    return DateFormat('yyyy-MM-dd').format(data);
  }

  static String formataDataHora(DateTime data) {
    return DateFormat('dd/MM/yyyy HH:mm').format(data);
  }

  static String formataMoeda(double valor) {
    valor = valor == null ? 0.00 : valor;
    final formatter = new NumberFormat("R\$ #,##0.00", "pt-br");
    return formatter.format(valor);
  }

  static bool isNumeric(String str) {
    try {
      double.parse(str);
      return true;
    } on FormatException {
      return false;
    }
  }

  static String onlyInteger(double valor) {
    return valor.toInt().toString();
  }

  static double convertToDouble(dynamic value) {
    return value == null ? 0.00 : value + 0.00;
  }

  static int mouthBetweenDates(DateTime dtIni, DateTime dtFin) {
    int dias = daysBetweenDates(dtIni, dtFin);
    int meses = dias ~/ 30;
    return meses;
  }

  static int daysBetweenDates(DateTime dtIni, DateTime dtFin) {
    Duration difference = dtFin.difference(dtIni);
    return difference.inDays;
  }

  static String formatStringOnlyDigits(String value) {
    return value.replaceAll(RegExp("[^0-9]"), "");
  }

  static String formatStringOnlyLetters(String value) {
    return value.replaceAll(RegExp("[^A-Za-z]"), "");
  }

  static bool isNumber(String value) {
    return RegExp("[^0-9]").hasMatch(value.trim());
  }

  static bool isText(String value) {
    return formatStringOnlyLetters(value).trim().isNotEmpty;
  }

  static calculaIdade(DateTime dtNascimento) {
    // print(dtNascimento);
    int agora = int.parse(
        '${DateTime.now().year}${completaComZeros(DateTime.now().month.toString(), 2)}');
    int nascimento = int.parse('${dtNascimento.year}${dtNascimento.month}');
    // print(agora);
    return (agora - nascimento).toString().substring(0, 2);
  }

  static completaComZeros(String texto, int length) {
    while (texto.length < length) {
      texto = "0" + texto;
    }
    return texto;
  }

  static String convertImageToBase64(File file) {
    return base64.encode(file.readAsBytesSync());
  }

  static Uint8List convertBase64ToImage(String base64) {
    return Base64Decoder().convert(base64);
  }

  static IMG.Image resizeImage(File file, int size) {
    // Read a jpeg image from file.
    IMG.Image image = IMG.decodeImage(file.readAsBytesSync());

    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    IMG.Image thumbnail = IMG.copyResize(image, width: size, height: size);

    // Save the thumbnail as a PNG.
    // File('out/thumbnail-test.png')
    //   ..writeAsBytesSync(encodePng(thumbnail));
    return thumbnail;
  }

  static double getDoubleByString(String text) {
    if (text == null) {
      text = "0.0";
    }
    return double.parse(text.trim());
  }

  static double getDoubleByMoney(String text){
    if(text==null){
      text="0.0";
    }
    text = text.replaceAll("R\$", "").replaceAll(".", "").replaceAll(",", ".").trim();
    return double.parse(text);
  }

  static double totalizarLista(List<double> valores) {
    return valores.reduce((value, element) => value + element);
  }
}
