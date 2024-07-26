import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_test/controller/global_controller.dart';
import 'package:inventory_test/model/barang_model.dart';
import 'package:inventory_test/model/kategori_model.dart';
import 'package:inventory_test/screen/widgets/custom_textform.dart';
import 'package:inventory_test/shared/styles.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kategoriBarangController = TextEditingController();
  TextEditingController kelompokBarangController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController hargaController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? _errorMessage;

  bool get isFormValid {
    return namaBarangController.text.isEmpty &&
        kategoriBarangController.text.isEmpty &&
        kelompokBarangController.text.isEmpty &&
        stokController.text.isEmpty &&
        hargaController.text.isEmpty;
  }

  @override
  void initState() {
    namaBarangController.addListener(_onTextFieldChanged);
    kategoriBarangController.addListener(_onTextFieldChanged);
    kelompokBarangController.addListener(_onTextFieldChanged);
    stokController.addListener(_onTextFieldChanged);
    hargaController.addListener(_onTextFieldChanged);
    super.initState();
  }

  void _onTextFieldChanged() {
    setState(() {});
  }

  final GlobalController globalController = Get.put(GlobalController());

  @override
  void dispose() {
    // Disposing all TextEditingController
    namaBarangController.dispose();
    kategoriBarangController.dispose();
    kelompokBarangController.dispose();
    stokController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Barang'), centerTitle: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Obx(() {
          KategoriModel kategori = globalController.kategori[0];
          return ElevatedButton(
            onPressed: isFormValid
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      final newBarang = BarangModel(
                        namaBarang: namaBarangController.text,
                        kategoriId: kategori.id,
                        kelompokBarang: kelompokBarangController.text,
                        stok: int.parse(stokController.text),
                        harga: int.parse(hargaController.text),
                      );
                      globalController.addProduct(newBarang);
                      Navigator.pop(context);
                    }
                  },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: navyColor,
            ),
            child: Text(
              'Tambah Barang',
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
