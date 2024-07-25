import 'package:flutter/material.dart';
import 'package:inventory_test/shared/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back, color: blackColor),
      ),
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
          Text(
            'Edit Data',
            style: blueTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }

  Widget contentList() {
    return Expanded(
      flex: 1,
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
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
}
