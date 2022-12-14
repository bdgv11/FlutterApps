import 'package:cloud_firestore/cloud_firestore.dart';

List<String> horas = [
  '10:00 am',
  '11:00 am',
  /*'12:00 md',
  '1:00 pm',
  '2:00 pm',
  '3:00 pm',
  '4:00 pm',
  '5:00 pm',
  '6:00 pm'*/
];

class CollectionMethods {
  void addHours(
      String barbero, String cliente, String fecha, String tipoServicio) {
    for (var i = 0; i < horas.length; i++) {
      FirebaseFirestore.instance.collection('Cita').add({
        'Barbero': barbero,
        'Cliente': cliente,
        'Fecha': fecha,
        'Hora': horas[i],
        'HoraDisponible': true,
        'TipoServicio': tipoServicio
      });
    }
  }

  //Verify if already exist info

  Future<bool> existInfo(String fecha, String barbero) async {
    var snap = await FirebaseFirestore.instance
        .collection('Cita')
        .where('Fecha', isEqualTo: fecha)
        .where('Barbero', isEqualTo: barbero)
        .get();

    if (snap.docs.isNotEmpty) {
      print("Hay info de la consulta");
      return Future.value(true);
    } else {
      print("No hay info al consultar");
      return Future.value(false);
    }
  }
}
