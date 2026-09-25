import 'package:flutter/material.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({super.key, this.size = 100});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.camera_alt,
      size: size,
      color: Colors.white,
    );
  }
}

class DemoFooter extends StatelessWidget {
  const DemoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Center(
        child: Text(
          'ITP107 - De Matta & Malana',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9DA1A6),
            fontSize: 12,
            letterSpacing: .4,
          ),
        ),
      ),
    );
  }
}