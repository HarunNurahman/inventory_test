import 'package:flutter/material.dart';
import 'package:inventory_test/screen/widgets/custom_button.dart';
import 'package:inventory_test/shared/styles.dart';

class EditItemPage extends StatelessWidget {
  const EditItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: deleteAll(),
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Heading
            heading(),
            // List content
            contentList(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/ic_search.png', width: 24),
        ),
      ],
      title: Text(
        'List Stok Barang',
        style: blackTextStyle.copyWith(),
      ),
    );
  }

  Widget heading() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '629 Data Ditampilkan',
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      // Checkbox
                      Checkbox(value: false, onChanged: (value) {}),
                      // Item information
                      Column(
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
                            '[Stok]',
                            style: grayTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '[Harga]',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(color: grayColor),
      ),
    );
  }

  Widget deleteAll() {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: whiteColor),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          const SizedBox(width: 12),
          Text(
            'Pilih Semua',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          const Spacer(),
          CustomDeleteButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
