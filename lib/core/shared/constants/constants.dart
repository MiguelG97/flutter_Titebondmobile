import 'package:mobile/core/shared/models/product_Chips.dart';

class Constants {
  Constants._();

  static List<String> onboardingPictures = [
    "assets/images/carpinterTB.jpg",
    "assets/images/carpintersTB.jpg",
    "assets/images/carpinterTB.jpg"
  ];
  static List<String> onboardingTitles = [
    "Search for Matches",
    "Identify the Right One",
    "Pay with Confidence"
  ];
  static List<String> onboardingSubtitles = [
    "Search and filter products from the best glue wood supplier to find the matching one for your business.",
    "Evaluate product capabilities through our digital platform",
    "Pay for your order via secure payment methods, including flexible payment terms."
  ];

  static double spaceBtwItems = 30;
  static double spaceBtwSections = 50;

  static List<Product_Chip> productCategories = [
    Product_Chip(text: "All products", isActivate: true),
    Product_Chip(text: "Original", isActivate: false),
    Product_Chip(text: "Premium", isActivate: false),
    Product_Chip(text: "Ultimate", isActivate: false),
  ];
}
