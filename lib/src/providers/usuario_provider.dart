import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:productos/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider {

  final String _firebaseToken = 'AIzaSyCdfe3-rpbt3SpEtSw4vHOThh-E712TiKg';

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async{


    final authData ={
      'email': email,
      'password': password,
      'returnSecureToken':true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodeResp = json.decode( resp.body );

    print(decodeResp);

    if( decodeResp.containsKey('idToken')){

      _prefs.token = decodeResp['idToken'];
      return {'ok':true, 'token': decodeResp['idToken']};

    }else{

      return {'ok':false, 'mensaje': decodeResp['error']['message']};
      
    }



  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{


    final authData ={
      'email': email,
      'password': password,
      'returnSecureToken':true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodeResp = json.decode( resp.body );

    print(decodeResp);

    if( decodeResp.containsKey('idToken')){

      _prefs.token = decodeResp['idToken'];

      return {'ok':true, 'token': decodeResp['idToken']};

    }else{

      return {'ok':false, 'mensaje': decodeResp['error']['message']};
      
    }



  }
  
}