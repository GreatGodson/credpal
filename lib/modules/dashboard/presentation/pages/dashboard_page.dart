import 'dart:async';

import 'package:credpal/core/framework/utils/colors.dart';
import 'package:credpal/core/framework/utils/images.dart';
import 'package:credpal/core/framework/utils/spacings.dart';
import 'package:credpal/modules/dashboard/data/featured_merchants.dart';
import 'package:credpal/modules/dashboard/data/product_stores.dart';
import 'package:credpal/modules/shared/presentation/component/scroll_view_component.dart';
import 'package:credpal/modules/shared/presentation/component/text_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/merchant_avatar_component.dart';
import '../components/product_container_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<ProductStores> _productStores = ProductStores.items;
  final List<FeaturedMerchant> _featuredMerchants = FeaturedMerchant.items;

  late final ScrollController _scrollController;
  late final ScrollController _scrollController1;

  late final List<FeaturedMerchant> _marqueeList;
  late final List<FeaturedMerchant> _marqueeList1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController1 = ScrollController();

    _marqueeList = [
      ..._featuredMerchants.take(4),
      ..._featuredMerchants.take(4)
    ];
    _marqueeList1 = [
      ..._featuredMerchants.skip(4).take(4),
      ..._featuredMerchants.skip(4).take(4),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startMarquee();
      _startMarquee1();
    });
  }

  void _startMarquee() {
    const duration = Duration(milliseconds: 30); // smoothness
    const pixelsPerTick = 2.0;

    Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;

        if (currentScroll >= maxScrollExtent / 2) {
          // Reset silently to 0 (first half) — NO jump
          _scrollController.jumpTo(0);
        }

        _scrollController.animateTo(
          _scrollController.offset + pixelsPerTick,
          duration: duration,
          curve: Curves.linear,
        );
      }
    });
  }

  void _startMarquee1() {
    const duration = Duration(milliseconds: 30); // smoothness
    const pixelsPerTick = 2.0; // Adjust scroll speed

    Timer.periodic(duration, (timer) {
      if (_scrollController1.hasClients) {
        double currentScroll = _scrollController1.offset;
        double maxScrollExtent = _scrollController1.position.maxScrollExtent;

        // Reset silently to the end (second half) once we reach the start
        if (currentScroll <= 0) {
          _scrollController1.jumpTo(maxScrollExtent / 2);
        }

        // Scroll in reverse (right to left)
        _scrollController1.animateTo(
          _scrollController1.offset - pixelsPerTick,
          duration: duration,
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewComponentWidget(
      child: Column(
        children: [
          SizedBox(
            height: Spacings.spacing18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacings.spacing20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFieldComponent(
                    hint: "Search for products or stores",
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Svgs.search),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Spacings.spacing20,
                ),
                Container(
                  padding: EdgeInsets.all(Spacings.spacing10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Spacings.spacing10),
                    color: AppColors.colorF4F5FE,
                  ),
                  child: SvgPicture.asset(Svgs.scan),
                ),
              ],
            )
                .animate()
                .slideX(delay: 200.ms, begin: -0.2)
                .fadeIn(duration: 1.seconds),
          ),
          SizedBox(
            height: Spacings.spacing24,
          ),
          Container(
            width: double.infinity,
            color: AppColors.colorF1F3FE,
            child: Column(
              children: [
                SizedBox(
                  height: Spacings.spacing14,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _productStores.length >= 3 ? 3 : _productStores.length,
                      (index) {
                        final item = _productStores[index];
                        return ProductContainerComponent(item: item)
                            .animate()
                            .fadeIn(
                              delay: (0 * 200).ms,
                              duration: 600.ms,
                            )
                            .slideX(
                              begin: 1.0,
                              end: 0.0,
                              duration: 800.ms,
                              curve: Curves.easeOut,
                            );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Spacings.spacing26,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _productStores.length >= 3 ? 3 : _productStores.length,
                      (index) {
                        final startIndex = _productStores.length >= 3
                            ? _productStores.length - 3
                            : 0;
                        final item = _productStores[startIndex + index];

                        return ProductContainerComponent(item: item)
                            .animate()
                            .fadeIn(
                              delay: (1 * 200).ms,
                              duration: 600.ms,
                            )
                            .slideX(
                              begin: 1.0,
                              end: 0.0,
                              duration: 800.ms,
                              curve: Curves.easeOut,
                            );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Spacings.spacing18,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Spacings.spacing34,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacings.spacing20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Merchants",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: Spacings.spacing16,
                        color: AppColors.color33334D,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Spacings.spacing12,
                        color: AppColors.color274FED,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Spacings.spacing38,
              ),
              SizedBox(
                height: Spacings.spacing100, // adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: _marqueeList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = _marqueeList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Spacings.spacing16),
                      child: Column(
                        children: [
                          if (item.brandIcon == null)
                            Image.asset(item.brandImage!)
                          else
                            MerchantAvatarComponent(
                              isOnline: item.isOnline,
                              brandColor: item.brandColor,
                              iconPath: item.brandIcon!,
                            ),
                          SizedBox(height: Spacings.spacing6),
                          Text(item.title),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: Spacings.spacing30,
              ),
              SizedBox(
                height: Spacings.spacing100, // adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController1,
                  itemCount: _marqueeList1.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = _marqueeList1[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Spacings.spacing16),
                      child: Column(
                        children: [
                          if (item.brandIcon == null)
                            Image.asset(item.brandImage!)
                          else
                            MerchantAvatarComponent(
                              isOnline: item.isOnline,
                              brandColor: item.brandColor,
                              iconPath: item.brandIcon!,
                            ),
                          SizedBox(height: Spacings.spacing6),
                          Text(item.title),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: Spacings.spacing30,
              ),
              Row(
                children: List.generate(
                  _featuredMerchants.length >= 2
                      ? 2
                      : _featuredMerchants.length,
                  (index) {
                    final startIndex = _featuredMerchants.length - 2;
                    final item = _featuredMerchants[startIndex + index];

                    return Column(
                      children: [
                        if (item.brandIcon == null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: Spacings.spacing30,
                              child: Image.asset(item.brandImage!),
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 300.ms, delay: (index * 100).ms)
                              .scale(begin: Offset(0.9, 0.9))
                        else
                          MerchantAvatarComponent(
                            isOnline: item.isOnline,
                            brandColor: item.brandColor,
                            iconPath: item.brandIcon!,
                          )
                              .animate()
                              .fadeIn(duration: 300.ms, delay: (index * 100).ms)
                              .scale(begin: Offset(0.9, 0.9)),
                        SizedBox(height: Spacings.spacing6),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Spacings.spacing12,
                            color: AppColors.color1A1A1A,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: Spacings.spacing24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
