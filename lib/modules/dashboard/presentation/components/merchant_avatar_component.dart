import 'package:credpal/core/framework/utils/colors.dart';
import 'package:credpal/core/framework/utils/spacings.dart';
import 'package:flutter/material.dart';

class MerchantAvatarComponent extends StatelessWidget {
  const MerchantAvatarComponent({
    super.key,
    required this.isOnline,
    required this.brandColor,
    required this.iconPath,
  });

  final bool isOnline;
  final Color brandColor;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.spacing24),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            radius: Spacings.spacing30,
            backgroundColor: brandColor,
            child: Image.asset(iconPath),
          ),
          if (isOnline)
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: Spacings.spacing10,
              child: CircleAvatar(
                backgroundColor: AppColors.color24C78B,
                radius: Spacings.spacing6,
              ),
            ),
        ],
      ),
    );
  }
}
