import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

bool isNumber( String s ){

  if(s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;

}

void warningMessage(BuildContext context,String title,  String mensaje ){

  showDialog(
    context: context,
    builder: ( context ){

      return AlertDialog(
        title: Text(title),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );

    }
  );
}