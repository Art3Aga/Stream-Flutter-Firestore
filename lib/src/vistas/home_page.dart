import 'dart:async';

import 'package:buserosapp/src/modelos/motorista_model.dart';
import 'package:buserosapp/src/servicios/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.streamDatos,
        builder: (context, snapshot) {
          // _motoristaModel = MotoristaModel.fromJson(snapshot.data.data);
          return Container(
            child: Text('${_motoristaModel.latitud}'),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'next', arguments: _motoristaModel);
          //cancelarSubscripcion();
        },
      ),
    );
  }

  cancelarSubscripcion() {
    setState(() {
      _firestore.streamDatos = null;
    });
  }
}