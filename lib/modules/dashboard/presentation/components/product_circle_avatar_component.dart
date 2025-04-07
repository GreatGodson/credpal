import 'package:credpal/core/framework/utils/colors.dart';
import 'package:credpal/core/framework/utils/spacings.dart';
import 'package:flutter/material.dart';

class ProductCircleAvatar extends StatelessWidget {
  const ProductCircleAvatar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // 5% opacity
            offset: Offset(0, 0), // X: 0, Y: 0
            blurRadius: Spacings.spacing10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.colorffff,
        radius: Spacings.spacing26,
        child: child,
      ),
    );
  }
}
