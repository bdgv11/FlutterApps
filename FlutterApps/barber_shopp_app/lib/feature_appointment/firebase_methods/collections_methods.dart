import 'package:cloud_firestore/cloud_firestore.dart';

List<String> horas = [
  '10:00 am',
  '11:00 am',
  '12:00 md',
  '1:00 pm',
  '2:00 pm',
  '3:00 pm',
  '4:00 pm',
  '5:00 pm',
  '6:00 pm'
];

List<String> barberos = ['Barbero1', 'Barbero2'];

/*String getDates(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  String fecha = "";

  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(DateTime(startDate.year, startDate.month, startDate.day + i));
    fecha = '${days[i].day}/${days[i].month}/${days[i].year}';
    //fechasAllenar.add(fecha);
  }
  return fecha;
}*/

class CollectionMethods {
  void addHours(
      String barbero, String cliente, String fecha, String tipoServicio) {
    for (var i = 0; i < horas.length; i++) {
      for (var j = 0; j < barberos.length; j++) {
        FirebaseFirestore.instance.collection('Cita').add({
          'Barbero': barberos[j],
          'Cliente': cliente,
          'Fecha': fecha,
          'Hora': horas[i],
          'HoraDisponible': true,
          'DiaDisponible': true,
          'TipoServicio': tipoServicio
        });
      }
    }
  }
}
