import 'package:buserosapp/src/modelos/motorista_model.dart';
import 'package:buserosapp/src/servicios/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final _firestore = new FirestoreService();
  MotoristaModel _motoristaModel;
  @override
  void initState() { 
    _firestore.streamDatos = _firestore.getData();
    _firestore.conductor = _firestore.getData().listen((data){
      if(data.exists) {
        _motoristaModel = MotoristaModel.fromJson(data.data);
      }
    }, onError: (error){ print('Error = ${error.toString()}'); });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MotoristaModel _motorista =  ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('${_motorista.nombre}'),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.streamDatos,
          builder: (context, snapshot) {
            return Container(
              child: Text('${_motoristaModel.latitud}')
            );
          }
        )
      ),
    );
  }
}