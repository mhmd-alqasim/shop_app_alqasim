import 'package:flutter/material.dart';

Widget buildCategory(category, double W, double H, context) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => Detailcategoriesscreen(id: category.id),
      //   ),
      // );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            width: W,
            height: H,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.teal, width: 4),
              image: DecorationImage(
                image: NetworkImage('${category.image}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              category.name.length > 5
                  ? '${category.name.substring(0, 10)}..'
                  : category.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
