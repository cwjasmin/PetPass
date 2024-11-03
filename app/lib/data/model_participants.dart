class Mascota {
  final String id;
  final String nombre;
  final String descripcion;
  final String fotoPerfil;
  final List<String> imagenes;

  Mascota({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fotoPerfil,
    required this.imagenes,
  });

  factory Mascota.fromJson(Map<String, dynamic> json) {
    return Mascota(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fotoPerfil: json['fotoPerfil'],
      imagenes: List<String>.from(json['imagenes']),
    );
  }
}

class RedSocial {
  final String plataforma;
  final String usuario;
  final String enlace;

  RedSocial({
    required this.plataforma,
    required this.usuario,
    required this.enlace,
  });

  factory RedSocial.fromJson(Map<String, dynamic> json) {
    return RedSocial(
      plataforma: json['plataforma'],
      usuario: json['usuario'],
      enlace: json['enlace'],
    );
  }
}

class Participante {
  final String id;
  final String concursoId;
  final String duenioId;
  final Mascota mascota;
  final String videoParticipacion;
  final RedSocial redSocial;
  final DateTime fechaInscripcion;
  final String estado;
  final bool esGanador;

  Participante({
    required this.id,
    required this.concursoId,
    required this.duenioId,
    required this.mascota,
    required this.videoParticipacion,
    required this.redSocial,
    required this.fechaInscripcion,
    required this.estado,
    this.esGanador = false,
  });

  factory Participante.fromJson(Map<String, dynamic> json) {
    return Participante(
      id: json['id'],
      concursoId: json['concursoId'],
      duenioId: json['duenioId'],
      mascota: Mascota.fromJson(json['mascota']),
      videoParticipacion: json['videoParticipacion'],
      redSocial: RedSocial.fromJson(json['redSocial']),
      fechaInscripcion: DateTime.parse(json['fechaInscripcion']),
      estado: json['estado'],
      esGanador: json['esGanador'] ?? false,
    );
  }
}
