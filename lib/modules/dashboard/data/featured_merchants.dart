import 'package:credpal/core/framework/utils/colors.dart';
import 'package:credpal/core/framework/utils/images.dart';
import 'package:flutter/material.dart';

class FeaturedMerchant {
  final String? brandIcon;
  final bool isOnline;
  final String title;
  final Color brandColor;
  final String? brandImage;

  FeaturedMerchant({
    this.brandIcon,
    required this.isOnline,
    required this.title,
    required this.brandColor,
    this.brandImage,
  });

  static final List<FeaturedMerchant> items = [
    FeaturedMerchant(
      isOnline: true,
      title: "Justrite",
      brandColor: AppColors.color000065,
      brandImage: Pngs.justrite,
    ),
    FeaturedMerchant(
      brandImage: Pngs.orile,
      isOnline: true,
      title: "Orile Restaurant",
      brandColor: AppColors.color00000,
    ),
    FeaturedMerchant(
        brandIcon: Pngs.slot,
        isOnline: true,
        title: "Slot",
        brandColor: AppColors.colorED3237),
    FeaturedMerchant(
        brandIcon: Pngs.pointek,
        isOnline: true,
        title: "Pointek",
        brandColor: AppColors.color0077C9),
    FeaturedMerchant(
        brandIcon: Pngs.bassey,
        isOnline: true,
        title: "ogabassey",
        brandColor: AppColors.colorF1F3FE),
    FeaturedMerchant(
      brandIcon: Pngs.casper,
      isOnline: false,
      title: "Casper Stores",
      brandColor: AppColors.colorFE2B5E,
    ),
    FeaturedMerchant(
        brandIcon: Pngs.dream,
        isOnline: false,
        title: "Dreamworks",
        brandColor: AppColors.color3F4195),
    FeaturedMerchant(
        brandIcon: Pngs.hubmart,
        isOnline: true,
        title: "Hubmart",
        brandColor: AppColors.color00000),
    FeaturedMerchant(
      brandImage: Pngs.justUsed,
      isOnline: true,
      title: "Just Used",
      brandColor: AppColors.color13AFEE,
    ),
    FeaturedMerchant(
      brandIcon: Pngs.justTones,
      isOnline: true,
      title: "Just fones",
      brandColor: AppColors.color1A1A1A,
    ),
  ];
}
