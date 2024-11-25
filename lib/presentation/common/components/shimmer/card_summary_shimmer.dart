import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CardSummaryShimmer extends StatelessWidget {
  const CardSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.geometry.medium,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppTheme.radius.small,
        boxShadow: AppTheme.boxShadows.box(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.text(width: 200),
                    AppTheme.spacing.smallY,
                    ShimmerWidget.text(width: 200, height: 10),
                  ],
                ),
              ),
              ShimmerWidget.icon(margin: AppTheme.geometry.custom(top: 12, right: 12)),
            ],
          ),
          AppTheme.spacing.mediumY,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              final isLast = index == 2;

              return Column(
                children: [
                  Container(
                    margin: AppTheme.geometry.smallY,
                    child: Table(
                      border: TableBorder(
                        verticalInside: BorderSide(
                          width: 1,
                          color: AppTheme.colors.primary,
                          style: BorderStyle.solid,
                        ),
                      ),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: <Widget>[
                            Center(child: ShimmerWidget.text()),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(2, (i) {
                                  return ShimmerWidget.box(width: 80, height: 16);
                                }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (!isLast) Divider(color: Colors.grey[300]),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
