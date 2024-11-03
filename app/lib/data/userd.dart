class Mascota {
  String id;
  String nombre;
  String fotoPerfil;
  String tipo;
  String raza;
  String fechaNacimiento;
  String color;
  String enfermedades;
  String alergias;
  int idChip;
  String healthCertificate;
  String vaccinattionRecords;
  String estado;

  Mascota({
    required this.id,
    required this.nombre,
    required this.fotoPerfil,
    required this.tipo,
    required this.raza,
    required this.fechaNacimiento,
    required this.color,
    required this.enfermedades,
    required this.alergias,
    required this.idChip,
    required this.healthCertificate,
    required this.vaccinattionRecords,
    this.estado = "pendiente",
  });
}

class Usuario {
  String walletAddress;
  bool isSubscriptor;
  String mode;
  Mascota mascota;

  Usuario({
    required this.walletAddress,
    this.isSubscriptor = false,
    this.mode = "user",
    required this.mascota,
  });
}