import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CardSummaryComponent extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? refreshButton;
  final List<CardSummaryData> datas;
  final void Function()? onTapCard;

  const CardSummaryComponent({
    super.key,
    required this.title,
    this.subTitle,
    this.refreshButton,
    required this.datas,
    this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppTheme.boxShadows.box(context),
        borderRadius: AppTheme.radius.small,
      ),
      child: Material(
        borderRadius: AppTheme.radius.small,
        color: Colors.white,
        child: InkWell(
          onTap: onTapCard,
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.black12;
              }
              return null;
            },
          ),
          borderRadius: AppTheme.radius.small,
          child: Container(
            padding: AppTheme.geometry.medium,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: AppTheme.radius.small,
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
                          Text(
                            title,
                            style: AppTheme.typography.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Builder(builder: (context) {
                            if (subTitle != null) {
                              return Text(
                                'Last update: ${subTitle!}',
                                style: AppTheme.typography.labelSmall.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              );
                            }
                            return const SizedBox();
                          }),
                        ],
                      ),
                    ),
                    Builder(builder: (context) {
                      if (refreshButton != null) {
                        return refreshButton!;
                      }
                      return const SizedBox();
                    })
                  ],
                ),
                AppTheme.spacing.smallY,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    final CardSummaryData data = datas[index];

                    final bool isLast = index == datas.length - 1;

                    return Column(
                      children: [
                        Builder(builder: (context) {
                          if (data.headData != null) {
                            return InkWell(
                              onTap: data.onTapHeadData,
                              borderRadius: AppTheme.radius.exSmall,
                              child: Container(
                                padding: AppTheme.geometry.small,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.headData!,
                                      style: AppTheme.typography.bodyMedium.copyWith(
                                        // fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
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
                                  Center(
                                    child: Text(
                                      data.columnData,
                                      style: AppTheme.typography.titleMedium.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: List.generate(data.valudDatas.length, (i) {
                                        String value = data.valudDatas[i];

                                        double valueDouble = double.parse(value.split('%')[0]);
                                        bool redStatus = valueDouble < 99;

                                        return Text(
                                          value,
                                          style: AppTheme.typography.titleMedium.copyWith(
                                            fontSize: 12,
                                            color: redStatus ? Colors.red : Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        );
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
          ),
        ),
      ),
    );
  }
}

class CardSummaryData {
  final String? headData;
  final String columnData;
  final List<String> valudDatas;
  final void Function()? onTapHeadData;

  const CardSummaryData({
    this.headData,
    required this.columnData,
    required this.valudDatas,
    this.onTapHeadData,
  });
}
