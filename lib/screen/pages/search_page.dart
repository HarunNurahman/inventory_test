import 'package:flutter/material.dart';
import 'package:inventory_test/shared/styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: null,
          decoration: InputDecoration(
            hintText: 'Cari data...',
            hintStyle: grayTextStyle,
            filled: true,
            fillColor: lightGrayColor,
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Heading
            heading(context),
            // List content
            contentList(),
          ],
        ),
      ),
    );
  }

  Widget heading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total items
          Text(
            '10 Data Cocok',
            style: grayTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget contentList() {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Item Information
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[Nama Barang]',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '[kategori_id]',
                        style: grayTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '[kelompok_barang]',
                        style: grayTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '[Stok]',
                    style: grayTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '[Harga]',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(color: grayColor),
      ),
    );
  }
}
