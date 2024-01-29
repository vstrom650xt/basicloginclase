import 'package:http/http.dart' as http;

//https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/La%20Marina%20Alta
//https://node-comarques-rest-server-production.up.railway.app/api/comarques/Alacant 
Future<void> obtenerProvincias() async {
  
    const String obtenerProvincias = 'https://node-comarques-rest-server-production.up.railway.app/api/comarques';

  try {
    final response = await http.get(Uri.parse(obtenerProvincias));

    if (response.statusCode == 200) {
      final data = response.body;
      print('Respuesta de la API: $data');
    } else {
      print('Error en la petición: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
