library rolling_bottom_bar;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

class MyBottomBarItem {
  const MyBottomBarItem({
    required this.inActiveItem,
    required this.activeItem,
    this.itemLabel,
  });

  /// Selected bottom bar item
  final Widget inActiveItem;

  /// Un selected bottom bar item
  final Widget activeItem;

  /// bottom bar item label
  final String? itemLabel;
}

/// Class to generate the inactive icon on bottom bar
class BottomBarInActiveItem extends StatelessWidget {
  const BottomBarInActiveItem(this.index,
      {required this.itemWidget,
      required this.onTap,
      required this.showLabel,
      this.label,
      this.labelStyle});

  /// item index
  final int index;

  /// item widget
  final Widget itemWidget;

  /// String to indicate the label item
  final String? label;

  /// Boolean to show the item label
  final bool showLabel;

  /// Value to indicate the label Style
  final TextStyle? labelStyle;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(kCircleRadius * 2, kCircleRadius * 2),
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: AppDimensions.normalize(10),
                width: AppDimensions.normalize(10),
                child: itemWidget),
            if (label != null && showLabel) ...[
              const SizedBox(height: 5.0),
              Text(
                label!,
                style: labelStyle ??
                    TextStyle(
                      color: Colors.grey[700],
                      fontSize: 1,
                    ),
              ),
            ],
          ],
        ),
        onTap: () => onTap(index),
      ),
    );
  }
}

/// margin
const double kMargin = 0;

/// bottom bar height
const double kHeight = 62.0;

/// notch circle circle radius
const double kCircleRadius = 30.0;

/// margin between notch and circle
const double kCircleMargin = 4.0;

const double kTopRadius = 4.0;

/// top margin
const double kTopMargin = 1.0;

/// notch radius
const double kBottomRadius = 2.0;

/// bottom bar item size
const double kIconSize = 24.0;

/// Pi value
const double kPi = 3.1415926535897932;

class BottomBarActiveItem extends StatelessWidget {
  const BottomBarActiveItem(
    this.index, {
    required this.itemWidget,
    required this.onTap,
    required this.scrollPosition,
  });

  /// item index
  final int index;

  /// item
  final Widget itemWidget;

  /// Double value to indicate the item position
  final double scrollPosition;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final icon = itemWidget;
    return InkWell(
      child: SizedBox.fromSize(
        size: const Size(kIconSize, kIconSize),
        child: Opacity(
            opacity: kPi * 2 * (scrollPosition % 1) == 0 ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(left: AppDimensions.normalize(1)),
              child: icon,
            )),
      ),
      onTap: () => onTap(index),
    );
  }
}

/// Class to generate the NotchBottomBar
class MyAnimatedNotchBottomBar extends StatefulWidget {
  /// Controller for animation
  final PageController pageController;

  /// List of items of bottom bar
  final List<MyBottomBarItem> bottomBarItems;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  /// Color of bottom bar
  final Color color;

  /// Boolean to show shadow
  final bool showShadow;

  /// Boolean to show bottom text
  final bool showLabel;

  /// TextStyle to show bottom text
  final TextStyle? itemLabelStyle;

  ///Boolean to show blur effect
  final bool showBlurBottomBar;

  ///Opacity
  final double blurOpacity;

  /// Filter X
  final double blurFilterX;

  /// Filter Y
  final double blurFilterY;

  /// Color of bottom bar
  final Color notchColor;

  const MyAnimatedNotchBottomBar(
      {Key? key,
      required this.pageController,
      required this.bottomBarItems,
      required this.onTap,
      this.color = Colors.white,
      this.itemLabelStyle,
      this.showShadow = true,
      this.showLabel = true,
      this.showBlurBottomBar = false,
      this.blurOpacity = 0.5,
      this.blurFilterX = 5.0,
      this.blurFilterY = 10.0,
      this.notchColor = Colors.white})
      : super(key: key);

  @override
  _MyAnimatedNotchBottomBarState createState() =>
      _MyAnimatedNotchBottomBarState();
}

class _MyAnimatedNotchBottomBarState extends State<MyAnimatedNotchBottomBar> {
  late double _screenWidth;
  int maxCount = 5;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    /// throws exception if list length is more then 5
    if (widget.bottomBarItems.length > 5) {
      throw Exception(' Bottom bar item length should not be more than 5');
    }
    if (widget.pageController.initialPage > widget.bottomBarItems.length - 1) {
      throw Exception(
          ' Initial page index cannot be higher than bottom bar items length');
    }

    final size = MediaQuery.of(context).size;
    final width = size.width;
    const height = kHeight;

    return widget.bottomBarItems.length > maxCount
        ? Container()
        : AnimatedBuilder(
            animation: widget.pageController,
            builder: (BuildContext _, Widget? child) {
              ///to set any initial page
              double scrollPosition =
                  widget.pageController.initialPage.toDouble();
              int currentIndex = widget.pageController.initialPage;

              if (widget.pageController.hasClients) {
                scrollPosition = widget.pageController.page!;
                currentIndex = (widget.pageController.page! + 0.5).toInt();
              }

              return ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: widget.showBlurBottomBar
                              ? widget.blurFilterX
                              : 0.0,
                          sigmaY: widget.showBlurBottomBar
                              ? widget.blurFilterY
                              : 0.0,
                        ),
                        child: Opacity(
                          opacity:
                              widget.showBlurBottomBar ? widget.blurOpacity : 1,
                          child: CustomPaint(
                            size: Size(width, height),
                            painter: BottomBarPainter(
                              position:
                                  _itemPosByScrollPosition(scrollPosition),
                              color: AppColors.antiqueRuby, //widget.color,
                              showShadow: widget.showShadow,
                              notchColor:
                                  AppColors.deepTeal, //widget.notchColor
                            ),
                          ),
                        ),
                      ),
                      for (var i = 0;
                          i < widget.bottomBarItems.length;
                          i++) ...[
                        if (i == currentIndex)
                          Positioned(
                            bottom: 47,
                            left: kCircleRadius -
                                9 +
                                _itemPosByScrollPosition(scrollPosition),
                            child: BottomBarActiveItem(
                              i,
                              itemWidget: widget.bottomBarItems[i].activeItem,
                              scrollPosition: scrollPosition,
                              onTap: widget.onTap,
                            ),
                          ),
                        if (i != currentIndex)
                          Positioned(
                            top: kMargin + (kHeight - kCircleRadius * 2.25) / 2,
                            left: kCircleMargin + _itemPosByIndex(i),
                            child: BottomBarInActiveItem(i,
                                itemWidget:
                                    widget.bottomBarItems[i].inActiveItem,
                                label: widget.bottomBarItems[i].itemLabel,
                                onTap: widget.onTap,
                                showLabel: widget.showLabel,
                                labelStyle: widget.itemLabelStyle),
                          ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
  }

  double _firstItemPosition() {
    return (_screenWidth - 100 * 2) * 0.1;
  }

  double _lastItemPosition() {
    return _screenWidth -
        (_screenWidth - kMargin * 2) * 0.1 -
        (kCircleRadius + kCircleMargin) * 2;
  }

  double _itemDistance() {
    return (_lastItemPosition() - _firstItemPosition()) /
        (widget.bottomBarItems.length - 1.2);
  }

  double _itemPosByScrollPosition(double scrollPosition) {
    return _firstItemPosition() + _itemDistance() * scrollPosition;
  }

  double _itemPosByIndex(int index) {
    return _firstItemPosition() + _itemDistance() * index;
  }
}

class BottomBarPainter extends CustomPainter {
  BottomBarPainter(
      {required this.position,
      required this.color,
      required this.showShadow,
      required this.notchColor})
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true,
        _shadowColor = Colors.transparent,
        _notchPaint = Paint()
          ..color = notchColor
          ..isAntiAlias = true;

  /// position
  final double position;

  /// Color for the bottom bar
  final Color color;

  /// Paint value to custom painter
  final Paint _paint;

  /// Shadow Color
  final Color _shadowColor;

  /// Boolean to show shadow
  final bool showShadow;

  /// Paint Value of notch
  final Paint _notchPaint;

  /// Color for the notch
  final Color notchColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBar(canvas, size);
    _drawFloatingCircle(canvas);
  }

  @override
  bool shouldRepaint(BottomBarPainter oldDelegate) {
    return position != oldDelegate.position || color != oldDelegate.color;
  }

  /// draw bottom bar
  void _drawBar(Canvas canvas, Size size) {
    const left = 0.0;
    final right = size.width - kMargin;
    const top = kMargin;
    const bottom = top + kHeight;

    final path = Path()
      ..moveTo(50.0 + kTopRadius, top)
      ..lineTo(position - kTopRadius, top)
      ..relativeArcToPoint(
        const Offset(kTopRadius, kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ..relativeArcToPoint(
        const Offset((kCircleRadius + kCircleMargin) * 2, 0.0),
        radius: const Radius.circular(kCircleRadius + kCircleMargin),
        clockwise: false,
      )
      ..relativeArcToPoint(
        const Offset(kTopRadius, -kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ..lineTo(right - kTopRadius, top)
      ..relativeArcToPoint(
        const Offset(kTopRadius, kTopRadius),
        radius: const Radius.circular(kTopRadius),
      )
      ..lineTo(right, bottom - kBottomRadius)
      ..relativeArcToPoint(
        const Offset(-kBottomRadius, kBottomRadius),
        radius: const Radius.circular(kBottomRadius),
      )
      ..lineTo(left + kBottomRadius, bottom)
      ..relativeArcToPoint(
        const Offset(-kBottomRadius, -kBottomRadius),
        radius: const Radius.circular(kBottomRadius),
      )
      ..lineTo(left, top + kTopRadius)
      ..relativeArcToPoint(
        const Offset(kTopRadius, -kTopRadius),
        radius: const Radius.circular(kTopRadius),
      );
    if (this.showShadow) {
      canvas..drawShadow(path, _shadowColor, 5.0, true);
    }
    canvas.drawPath(path, _paint);
  }

  /// Function used to draw the circular indicator
  void _drawFloatingCircle(Canvas canvas) {
    final path = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(
            position + kCircleMargin + kCircleRadius,
            kMargin + kCircleMargin,
          ),
          radius: kCircleRadius,
        ),
        0,
        kPi * 2,
      );
    if (this.showShadow) {
      canvas..drawShadow(path, _shadowColor, 5.0, true);
    }
    canvas.drawPath(path, _notchPaint);
  }
}
