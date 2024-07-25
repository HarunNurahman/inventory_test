import 'package:flutter/material.dart';
import 'package:inventory_test/shared/styles.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Barang*',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: null,
                keyboardType: TextInputType.text,
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          )
        ],
      ),
    );
  }
}
