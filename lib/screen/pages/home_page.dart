import 'package:flutter/material.dart';
import 'package:inventory_test/screen/widgets/custom_button.dart';
import 'package:inventory_test/shared/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addItemButton(
        onPressed: () => Navigator.pushNamed(context, '/add-item'),
      ),
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

  Widget heading() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total items
          Text(
            '629 Data Ditampilkan',
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
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            // Bottom sheet when click on item
            onTap: () {
              showBottomSheet();
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
                  ),
                ),
                Text(
                  '[Harga]',
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

  Future<dynamic> showBottomSheet() {
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
                    itemList('Nama Barang', '-'),
                    Divider(color: grayColor),
                    itemList('Kategori', '-'),
                    Divider(color: grayColor),
                    itemList('Kelompok', '-'),
                    Divider(color: grayColor),
                    itemList('Stok', '-'),
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
                      'Rp.-,',
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
