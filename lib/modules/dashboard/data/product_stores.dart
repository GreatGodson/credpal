import 'package:credpal/core/framework/utils/images.dart';

class ProductStores {
  final String productTitle;
  final String price;
  final String discountPrice;
  final String? discountPercent;
  final String productIconPath;
  final String? storeIconPath;
  final bool useSvg;

  ProductStores({
    required this.productTitle,
    required this.price,
    required this.discountPrice,
    this.discountPercent,
    required this.productIconPath,
    this.storeIconPath,
    this.useSvg = true,
  });

  static final List<ProductStores> items = [
    ProductStores(
      productTitle: "Nokia G20",
      price: "₦ 39,780",
      discountPrice: "₦ 88,000",
      discountPercent: "40%",
      productIconPath: Pngs.nokia,
      useSvg: true,
    ),
    ProductStores(
      productTitle: "iPhone XS Max 4GB",
      price: "₦ 295,999",
      discountPrice: "₦ 315,000",
      productIconPath: Pngs.iphonex,
      storeIconPath: Svgs.ogabassey,
      useSvg: true,
    ),
    ProductStores(
      productTitle: "Masterchef pressure",
      price: "₦ 39,780",
      discountPrice: "₦ 88,000",
      productIconPath: Pngs.pot,
      storeIconPath: Pngs.sales,
      useSvg: false,
    ),
    ProductStores(
      productTitle: "Anker Soundcore",
      price: "₦ 39,780",
      discountPrice: "₦ 88,000",
      productIconPath: Pngs.soundBox,
      storeIconPath: Svgs.okayPhones,
      useSvg: true,
    ),
    ProductStores(
      productTitle: "Iphone 12 Pro",
      price: "₦ 490,500",
      discountPrice: "₦ 515,000",
      productIconPath: Pngs.iphone12,
      storeIconPath: Svgs.imate,
      useSvg: true,
    ),
    ProductStores(
      productTitle: "Ps4 Controller",
      price: "₦ 39,780",
      discountPrice: "₦ 88,000",
      productIconPath: Pngs.controller,
      storeIconPath: Pngs.shops,
      useSvg: false,
    ),
  ];
}
