import 'package:alqasim_market/views/pages/search_page.dart';
import 'package:flutter/material.dart';

Widget fildSearchButton(context) {
  final themecolor = Theme.of(context).colorScheme;
  return GestureDetector(
    onTap: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => SearchPage()));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: themecolor.secondary),
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.search, color: themecolor.primary), // أيقونة البحث
            SizedBox(width: 10.0),
            Text(
              'Search...',
              style: TextStyle(
                color: themecolor.primary,
                fontWeight: FontWeight.bold,
              ), // نص إرشادي
            ),
          ],
        ),
      ),
    ),
  );
}
