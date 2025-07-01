/// Modelo de datos para retener la informacion basica necesaria de todos los modelos
class Basico {
  static const String identificadorLocal = "idLocal";
  static const String identificadorWeb = "id";

  int id;
  int idLocal;
  DateTime? creado;
  DateTime? modificado;
  DateTime? eliminado;

  Basico({
    this.id = 0,
    this.idLocal = -1,
    this.creado,
    this.modificado,
    this.eliminado,
  });

  static parseDate(origen) {
    if (origen == null || origen == "null" || origen == '') {
      return null;
    }
    try {
      return DateTime.parse(origen);
    } catch (e) {
      // print("Error al parsear fecha: $e");
      return null;
    }
  }

  static double parseDouble(origen) {
    if (origen == null) return 0.0;
    if (origen == "null") return 0.0;
    if (origen == "") return 0.0;
    if (origen.runtimeType.toString() == 'double') return origen;
    return double.parse(origen.toString());
  }

  static int parseInt(origen) {
    if (origen == null) return 0;
    if (origen == "") return 0;
    if (origen == "null") return 0;
    if (origen.runtimeType.toString() == 'int') return origen;
    return int.parse(origen.toString());
  }

  static String parseString(origen) {
    if (origen == "null") return "";
    if (origen == null) return "";
    if (origen == "") return "";
    if (origen == "null") return "";
    if (origen.runtimeType.toString() == 'string') return origen;
    return origen.toString();
  }

  static bool? parseBolean(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is bool) {
      return value;
    }
    if (value is int) {
      return value == 1;
    }
    if (value is String) {
      return value.toLowerCase() == 'true' || value == '1';
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idLocal': idLocal,
      'eliminado': eliminado?.toIso8601String(),
    };
  }

  parseJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : 0;
    idLocal = json['idLocal'] ?? -1;
    creado = json['creado'] != null ? parseDate(json['creado']) : creado;
    modificado =
        json['modificado'] != null ? parseDate(json['modificado']) : modificado;
    eliminado =
        json['eliminado'] != null ? parseDate(json['eliminado']) : eliminado;
  }
}