class Concurso {
  final String id;
  final String titulo;
  final String imagenPortada;
  final String descripcion;
  final List<String> categorias;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final int numeroParticipantes;
  final Map<String, double> premios;
  final String reglas;
  final Map<String, dynamic> propiedadesAdicionales;
  final double precio;
  final String estado;

  Concurso({
    required this.id,
    required this.titulo,
    required this.imagenPortada,
    required this.descripcion,
    required this.categorias,
    required this.fechaInicio,
    required this.fechaFin,
    required this.numeroParticipantes,
    required this.premios,
    required this.reglas,
    required this.propiedadesAdicionales,
    required this.precio,
    required this.estado,
  });

  factory Concurso.fromJson(Map<String, dynamic> json) {
    return Concurso(
      id: json['id'],
      titulo: json['titulo'],
      imagenPortada: json['imagenPortada'],
      descripcion: json['descripcion'],
      categorias: List<String>.from(json['categorias']),
      fechaInicio: DateTime.parse(json['fechaInicio']),
      fechaFin: DateTime.parse(json['fechaFin']),
      numeroParticipantes: json['numeroParticipantes'],
      premios: Map<String, double>.from(json['premios']),
      reglas: json['reglas'],
      propiedadesAdicionales: json['propiedadesAdicionales'],
      precio: json['precio'].toDouble(),
      estado: json['estado'],
    );
  }
}