import 'package:flutter/material.dart';
import 'package:inventory_test/shared/styles.dart';

class CustomDeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomDeleteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(160, 40),
        side: BorderSide(color: lightGrayColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Hapus Barang',
        style: redTextStyle.copyWith(
          fontWeight: bold,
        ),
      ),
    );
  }
}

class CustomEditButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomEditButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(160, 40),
        backgroundColor: navyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Edit Barang',
        style: whiteTextStyle.copyWith(
          fontWeight: bold,
        ),
      ),
    );
  }
}
