import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    prefs.initPrefs();

*/

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs ;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }


  //GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';

  }

  set token(String value){
    _prefs.setString('token', value);
  }


    //GET y SET del ultimaPagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ??  'login';

  }

  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }

}