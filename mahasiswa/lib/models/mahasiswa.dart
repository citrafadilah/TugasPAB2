class Mahasiswa {
  String npm;
  String nama;
  String visi;

  Mahasiswa({required this.npm, required this.nama, required this.visi});

  Map<String, dynamic> toJson() {
    return {
      'npm': npm,
      'nama': nama,
      'visi': visi,
    };
  }
}
