import 'dart:convert';

MotoristaModel motoristaModelFromJson(String str) => MotoristaModel.fromJson(json.decode(str));

String motoristaModelToJson(MotoristaModel data) => json.encode(data.toJson());

class MotoristaModel {
    String nombre;
    String clave;
    double latitud;
    double longitud;

    MotoristaModel({
        this.nombre = '',
        this.clave = '',
        this.latitud = 0.0,
        this.longitud = 0.0,
    });

    factory MotoristaModel.fromJson(Map<String, dynamic> json) => MotoristaModel(
        nombre  : json["nombre"],
        clave   : json["clave"],
        latitud : json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nombre"  : nombre,
        "clave"   : clave,
        "latitud" : latitud,
        "longitud": longitud,
    };
}