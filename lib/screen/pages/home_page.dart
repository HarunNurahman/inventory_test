import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_test/controller/global_controller.dart';
import 'package:inventory_test/model/barang_model.dart';
import 'package:inventory_test/screen/widgets/custom_button.dart';
import 'package:inventory_test/shared/shared_method.dart';
import 'package:inventory_test/shared/styles.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addItemButton(
        onPressed: () => Navigator.pushNamed(context, '/add-item'),
      ),
      appBar: appBar(context),
      body: Obx(() {
        if (globalController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (globalController.barang.isEmpty) {
          return Center(child: Text('No Data', style: blackTextStyle));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Heading
              heading(context),
              // List content
              contentList(),
            ],
          ),
        );
      }),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      // Back button
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back, color: blackColor),
      ),
      // Search button
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/search'),
          icon: Image.asset('assets/icons/ic_search.png', width: 24),
        ),
      ],
      title: Text(
        'List Stok Barang',
        style: blackTextStyle.copyWith(),
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
            '${globalController.barang.length} Data Ditampilkan',
            style: grayTextStyle.copyWith(fontSize: 12),
          ),
          // Edit button
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/edit-item'),
            child: Text(
              'Edit Data',
              style: blueTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget contentList() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: globalController.fetchBarang,
        child: ListView.separated(
          itemCount: globalController.barang.length,
          itemBuilder: (context, index) {
            BarangModel item = globalController.barang[index];
            return GestureDetector(
              // Bottom sheet when click on item
              onTap: () {
                showBottomSheet(context, item);
              },
              child: Row(
                children: [
                  // Item Information
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.namaBarang!,
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Stok: ${item.stok}',
                            style: grayTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    AppFormat().formatCurrency(item.harga!),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(color: grayColor),
        ),
      ),
    );
  }

  Widget addItemButton({VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(120, 50),
        padding: const EdgeInsets.all(8),
        backgroundColor: navyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.add, size: 32, color: whiteColor),
          const SizedBox(width: 4),
          Text(
            'Barang',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }

  Widget itemList(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: grayTextStyle,
        ),
        Text(
          value,
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        )
      ],
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context, BarangModel item) {
    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Wrap(
            children: [
              // Item image
              Image.asset('assets/images/img_empty.png'),
              // Item Information
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: grayColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    itemList('Nama Barang', item.namaBarang!),
                    Divider(color: grayColor),
                    itemList('Kategori', item.namaKategori!),
                    Divider(color: grayColor),
                    itemList('Kelompok', item.kelompokBarang!),
                    Divider(color: grayColor),
                    itemList('Stok', item.stok.toString()),
                  ],
                ),
              ),
              // Item price
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: lightGrayColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga', style: blackTextStyle),
                    Text(
                      AppFormat().formatCurrency(item.harga!),
                      style: blackTextStyle.copyWith(fontWeight: bold),
                    )
                  ],
                ),
              ),
              // Buttons
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Delete button
                    CustomDeleteButton(
                      onPressed: () {},
                    ),
                    // Edit button
                    CustomEditButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
