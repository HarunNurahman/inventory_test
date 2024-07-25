import 'package:flutter/material.dart';
import 'package:inventory_test/screen/widgets/custom_textform.dart';
import 'package:inventory_test/shared/styles.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Barang'), centerTitle: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: navyColor,
          ),
          child: Text(
            'Tambah Barang',
            style: whiteTextStyle.copyWith(fontWeight: medium),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CustomTextForm(
            labelText: 'Nama Barang',
            hintText: 'Masukkan Nama Barang',
          ),
          CustomTextForm(
            labelText: 'Kategori Barang',
            hintText: 'Masukkan Kategori Barang',
          ),
          CustomTextForm(
            labelText: 'Kelompok Barang',
            hintText: 'Masukkan Kelompok Barang',
          ),
          CustomTextForm(
            labelText: 'Stok',
            hintText: 'Masukkan Stok',
          ),
          CustomTextForm(
            labelText: 'Harga',
            hintText: 'Masukkan Harga',
          ),
        ],
      ),
    );
  }
}
