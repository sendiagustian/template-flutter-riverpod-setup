import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import 'hovers/tab_bar_hover_widget.dart';

class TabBarWidget {
  static Widget basic({
    required BuildContext context,
    required void Function(int)? onTap,
    required List<String> items,
    TextStyle? styleTextItem,
    TabController? controller,
    double? height = 50,
    double? width,
    TabAlignment? tabAlignment,
    ScrollPhysics? physics,
    bool isScrollable = false,
  }) {
    return SizedBox(
      height: height,
      width: width ?? AppTheme.double.screenW(context),
      child: TabBar(
        controller: controller,
        isScrollable: isScrollable,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        dividerColor: Colors.grey[400],
        dividerHeight: 0.8,
        tabAlignment: isScrollable ? TabAlignment.start : null,
        physics: physics,
        indicatorSize: isScrollable ? TabBarIndicatorSize.label : TabBarIndicatorSize.tab,
        onTap: onTap,
        tabs: items.map((item) {
          return Tab(
            child: Text(
              item,
              style: styleTextItem ?? AppTheme.typography.labelLarge,
            ),
          );
        }).toList(),
      ),
    );
  }

  static Widget card({
    required int currentIndex,
    required List<TabItem> items,
    required void Function(int) onChange,
  }) {
    return Column(
      children: [
        Row(
          children: List.generate(
            items.length,
            (index) {
              bool isLast = index == items.length - 1;

              return GestureDetector(
                onTap: () {
                  onChange(index);
                },
                child: TabBarHoverWidget(
                  label: items[index].label,
                  isSelected: (index == currentIndex),
                  padding: AppTheme.geometry.custom(left: 18, right: 18, top: 12, bottom: 12),
                  margin: !isLast ? AppTheme.geometry.exSmallR : null,
                  decoration: BoxDecoration(
                    boxShadow: AppTheme.boxShadows.basic,
                    borderRadius: AppTheme.radius.custom(topLeft: 8, topRight: 8),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppTheme.radius.custom(bottomLeft: 8, bottomRight: 8, topRight: 8),
          ),
          child: items[currentIndex].body,
        )
      ],
    );
  }
}

class TabItem {
  final String label;
  final Widget body;

  TabItem({required this.label, required this.body});
}
