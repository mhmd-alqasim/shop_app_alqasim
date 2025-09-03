import 'package:flutter/material.dart';

Widget fildSearchButton(context) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => SearchScreen(),
      //   ),
      // );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
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
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.teal), // أيقونة البحث
            SizedBox(width: 10.0),
            Text(
              'Search...',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ), // نص إرشادي
            ),
          ],
        ),
      ),
    ),
  );
}
