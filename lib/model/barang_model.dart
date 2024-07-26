class BarangModel {
  final int? id;
  final String? namaBarang;
  final int? kategoriId;
  final String? namaKategori;
  final int? stok;
  final String? kelompokBarang;
  final int? harga;

  const BarangModel({
    this.id,
    this.namaBarang,
    this.kategoriId,
    this.namaKategori,
    this.stok,
    this.kelompokBarang,
    this.harga,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: int.tryParse(json['id'].toString()),
      namaBarang: json['nama_barang'],
      kategoriId: int.tryParse(json['kategori_id'].toString()),
      namaKategori: json['nama_kategori'],
      stok: int.tryParse(json['stok'].toString()),
      kelompokBarang: json['kelompok_barang'],
      harga: int.tryParse(json['harga'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_barang': namaBarang,
      'kategori_id': kategoriId,
      'stok': stok,
      'kelompok_barang': kelompokBarang,
      'harga': harga,
    };
  }

  BarangModel copyWith({
    int? id,
    String? namaBarang,
    int? kategoriId,
    int? stok,
    String? kelompokBarang,
    int? harga,
  }) {
    return BarangModel(
      id: id ?? this.id,
      namaBarang: namaBarang ?? this.namaBarang,
      kategoriId: kategoriId ?? this.kategoriId,
      stok: stok ?? this.stok,
      kelompokBarang: kelompokBarang ?? this.kelompokBarang,
      harga: harga ?? this.harga,
    );
  }
}
