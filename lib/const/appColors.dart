import 'package:flutter/material.dart';

class AppColors {
  // ألوان للوضع النهاري (Light Theme)
  static const Color lightPrimary = Color(0xFFE94560); // أحمر وردي جذاب
  static const Color lightOnPrimary = Color(
    0xFFFFFFFF,
  ); // أبيض نقي للنص على الأزرار
  static const Color lightBackground = Color(0xFFF9F7F7); // خلفية بيضاء ناعمة
  static const Color lightOnBackground = Color(0xFF16213E); // أزرق داكن للنص
  static const Color lightSurface = Color(0xFFFFFFFF); // سطح أبيض نظيف للبطاقات
  static const Color lightOnSurface = Color(
    0xFF333333,
  ); // رمادي غامق للنص على الأسطح
  static const Color lightError = Color(0xFFC0392B); // أحمر قوي للخطأ
  static const Color lightAccent = Color(0xFFFFA433); // برتقالي حيوي للتأكيد

  // ---

  // ألوان للوضع الليلي (Dark Theme)
  static const Color darkPrimary = Color(0xFFE94560); // نفس الأحمر الوردي
  static const Color darkOnPrimary = Color(0xFFFFFFFF); // أبيض للنص
  static const Color darkBackground = Color(0xFF16213E); // أزرق داكن كخلفية
  static const Color darkOnBackground = Color(0xFFF9F7F7); // أبيض ناعم للنص
  static const Color darkSurface = Color(0xFF2B3A55); // أزرق أغمق للبطاقات
  static const Color darkOnSurface = Color(
    0xFFE5E5E5,
  ); // رمادي فاتح للنص على الأسطح
  static const Color darkError = Color(0xFFE74C3C); // أحمر فاتح للخطأ
  static const Color darkAccent = Color(0xFFFFA433); // نفس البرتقالي
}
