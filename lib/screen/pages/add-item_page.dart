import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_test/controller/global_controller.dart';
import 'package:inventory_test/model/barang_model.dart';
import 'package:inventory_test/model/kategori_model.dart';
import 'package:inventory_test/screen/widgets/custom_textform.dart';
import 'package:inventory_test/shared/styles.dart';

class AddItemPage extends StatelessWidget {
  final BarangModel? barang;
  final GlobalController globalController = Get.put(GlobalController());
  AddItemPage({super.key, this.barang});


  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kategoriBarangController = TextEditingController();
  TextEditingController kelompokBarangController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController hargaController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? _errorMessage;

  // bool get isFormValid {
  @override
  Widget build(BuildContext context) {
    final BarangModel? barang =
        ModalRoute.of(context)!.settings.arguments as BarangModel?;

    if (barang != null) {
      namaBarangController.text = barang.namaBarang!;
      kategoriBarangController.text = barang.namaKategori!;
      kelompokBarangController.text = barang.kelompokBarang!;
      stokController.text = barang.stok.toString();
      hargaController.text = barang.harga.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(barang == null ? 'Tambah Barang' : 'Edit Barang'),
        centerTitle: false,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Obx(() {
          KategoriModel kategori = globalController.kategori[0];
          return ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                BarangModel newBarang = BarangModel(
                  namaBarang: namaBarangController.text,
                  kategoriId: kategori.id,
                  kelompokBarang: kelompokBarangController.text,
                  stok: int.parse(stokController.text),
                  harga: int.parse(hargaController.text),
                );
                if (barang == null) {
                  globalController.addProduct(newBarang);
                } else {
                  globalController.updateProduct(newBarang);
                }
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: navyColor,
            ),
            child: Text(
              barang == null ? 'Tambah Barang' : 'Edit Barang',
              style: whiteTextStyle.copyWith(fontWeight: medium),
            ),
          );
        }),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CustomTextForm(
              controller: namaBarangController,
              labelText: 'Nama Barang',
              hintText: 'Masukkan Nama Barang',
              errorMessage: _errorMessage,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama Barang Belum Diisi';
                }
                return null;
              },
            ),
            Obx(() {
              if (globalController.kategori.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return DropdownButtonFormField<String>(
                value: kategoriBarangController.text.isEmpty
                    ? null
                    : kategoriBarangController.text,
                hint: Text('Pilih Kategori Barang'),
                items: globalController.kategori.map((KategoriModel kategori) {
                  return DropdownMenuItem<String>(
                    value: kategori.namaKategori,
                    child: Text(kategori.namaKategori!),
                  );
                }).toList(),
                onChanged: (newValue) {
                  kategoriBarangController.text = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori Barang Belum Dipilih';
                  }
                  return null;
                },
              );
            }),
            // CustomTextForm(
            //   controller: kategoriBarangController,
            //   labelText: 'Kategori Barang',
            //   hintText: 'Masukkan Kategori Barang',
            //   errorMessage: _errorMessage,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Kategori Barang Belum Diisi';
            //     }
            //     return null;
            //   },
            // ),
            const SizedBox(height: 16),
            CustomTextForm(
              controller: kelompokBarangController,
              labelText: 'Kelompok Barang',
              hintText: 'Masukkan Kelompok Barang',
              errorMessage: _errorMessage,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kelompok Barang Belum Diisi';
                }
                return null;
              },
            ),
            CustomTextForm(
              controller: stokController,
              labelText: 'Stok',
              hintText: 'Masukkan Stok',
              keyboardType: TextInputType.number,
              errorMessage: _errorMessage,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Stok Barang Belum Diisi';
                }
                return null;
              },
            ),
            CustomTextForm(
              controller: hargaController,
              labelText: 'Harga',
              hintText: 'Masukkan Harga',
              keyboardType: TextInputType.number,
              errorMessage: _errorMessage,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Harga Barang Belum Diisi';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
