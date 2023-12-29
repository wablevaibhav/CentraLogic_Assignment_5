import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final double width;

  const CustomAppBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome To CentraLogic!',
              style: GoogleFonts.roboto(
                color: const Color.fromRGBO(12, 15, 36, 1),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Text(
              'Hi Charles!',
              style: GoogleFonts.roboto(
                color: const Color.fromRGBO(12, 15, 36, 1),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
