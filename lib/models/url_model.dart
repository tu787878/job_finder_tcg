import 'package:flutter/foundation.dart';

class UrlModel {
  static String urlLocal = "http://localhost:8080";
  static String urlProduct = "";

  static String toUrl() {
    if (kReleaseMode) return urlProduct;
    return urlLocal;
  }
}
