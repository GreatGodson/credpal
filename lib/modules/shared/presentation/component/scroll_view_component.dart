import 'package:credpal/core/framework/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/framework/utils/spacings.dart';

class CustomScrollViewComponentWidget extends StatefulWidget {
  const CustomScrollViewComponentWidget({
    super.key,
    required this.child,
    this.appBarWrapperSize = 150,
  });

  final Widget child;
  final double appBarWrapperSize;

  @override
  State<CustomScrollViewComponentWidget> createState() =>
      _CustomScrollViewComponentWidgetState();
}

class _CustomScrollViewComponentWidgetState
    extends State<CustomScrollViewComponentWidget>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double animatedValue = 250;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      animatedValue = widget.appBarWrapperSize;
    }
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust duration as needed
    );

    _animation =
        Tween<double>(begin: widget.appBarWrapperSize, end: 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
            setState(() {
              animatedValue = _animation.value;
            });
          });
  }

  void startAnimation() {
    _controller.forward();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();

    super.dispose();
  }

  bool isKeyboardVisible = false;

  @override
  void didChangeMetrics() {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0;
    if (newValue != isKeyboardVisible) {
      isKeyboardVisible = newValue;
      if (isKeyboardVisible) {
        startAnimation();
      } else {
        reverseAnimation();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: Spacings.spacing70,
                  pinned: false,
                  backgroundColor: Color(0xffD0DAFF),
                  expandedHeight: _animation.value,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Spacings.spacing24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pay later",
                                  style: TextStyle(
                                    fontSize: Spacings.spacing28,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff1A1A1A),
                                  ),
                                ).animate().fadeIn(duration: 600.ms).slide(
                                    begin: const Offset(-0.4, 0),
                                    curve: Curves.easeOutBack),
                                Row(
                                  children: [
                                    Text(
                                      "everywhere",
                                      style: TextStyle(
                                        fontSize: Spacings.spacing28,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff1A1A1A),
                                      ),
                                    )
                                        .animate(delay: 200.ms)
                                        .fadeIn(duration: 500.ms)
                                        .slide(begin: const Offset(-0.3, 0)),
                                    SizedBox(width: Spacings.spacing8),
                                    SvgPicture.asset(Svgs.warning)
                                        .animate(delay: 300.ms)
                                        .fadeIn(duration: 500.ms)
                                        .scale(
                                            begin: Offset(0.7, 0.7),
                                            curve: Curves.easeOutBack),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Shopping limit: ₦0",
                                  style: TextStyle(
                                    fontSize: Spacings.spacing12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff1A1A1A),
                                  ),
                                )
                                    .animate(delay: 300.ms)
                                    .fadeIn(duration: 500.ms)
                                    .slide(begin: const Offset(0.2, 0)),
                                SizedBox(height: Spacings.spacing10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Spacings.spacing16,
                                    vertical: Spacings.spacing8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff274FED),
                                    borderRadius: BorderRadius.circular(
                                        Spacings.spacing4),
                                  ),
                                  child: Text(
                                    "Activate Credit",
                                    style: TextStyle(
                                      fontSize: Spacings.spacing14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                    .animate(delay: 400.ms)
                                    .fadeIn(duration: 600.ms)
                                    .scale(
                                        begin: Offset(0.8, 0.8),
                                        curve: Curves.easeOutBack),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
