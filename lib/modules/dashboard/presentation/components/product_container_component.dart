import 'package:credpal/core/framework/utils/colors.dart';
import 'package:credpal/modules/dashboard/presentation/components/product_circle_avatar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/framework/utils/spacings.dart';
import '../../data/product_stores.dart';

class ProductContainerComponent extends StatelessWidget {
  const ProductContainerComponent({
    super.key,
    required this.item,
  });

  final ProductStores item;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 176,
        maxHeight: 190,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Spacings.spacing6,
        horizontal: Spacings.spacing10,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Spacings.spacing12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Spacings.spacing10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // 5% opacity
            offset: Offset(0, 0), // X: 0, Y: 0
            blurRadius: Spacings.spacing10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 130),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    item.productIconPath,
                  ),
                ),
              ),
              ProductCircleAvatar(
                child: item.storeIconPath != null
                    ? item.useSvg
                        ? SvgPicture.asset(item.storeIconPath!)
                        : CircleAvatar(
                            child: Image.asset(item.storeIconPath!),
                          )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Spacings.spacing2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pay",
                              style: TextStyle(
                                fontSize: Spacings.spacing12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              item.discountPercent ?? "",
                              style: TextStyle(
                                fontSize: Spacings.spacing14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.color274FED,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.productTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: Spacings.spacing14,
                  color: AppColors.color1A1A1A,
                ),
              ),
              SizedBox(
                height: Spacings.spacing8,
              ),
              Row(
                children: [
                  Text(
                    item.price,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Spacings.spacing14,
                      color: AppColors.color274FED,
                    ),
                  ),
                  SizedBox(
                    width: Spacings.spacing14,
                  ),
                  Expanded(
                    child: Text(
                      item.discountPrice,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Spacings.spacing12,
                        color: AppColors.colorB3B3CC,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.colorB3B3CC,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
