class KategoriModel {
  final int? id;
  final String? namaKategori;

  KategoriModel({this.id, this.namaKategori});

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: int.tryParse(json['id'].toString()),
      namaKategori: json['nama_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kategori': namaKategori,
    };
  }

  KategoriModel copyWith({
    int? id,
    String? namaKategori,
  }) {
    return KategoriModel(
      id: id ?? this.id,
      namaKategori: namaKategori ?? this.namaKategori,
    );
  }
}
