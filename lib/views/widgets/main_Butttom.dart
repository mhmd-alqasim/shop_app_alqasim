import 'package:flutter/material.dart';

class MainButtton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MainButtton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white, // قم بتغيير اللون هنا
          ),
        ),
      ),
    );
  }
}
