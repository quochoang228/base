import 'package:base_ui/base_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailView extends StatelessWidget {  
  const DetailView({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailTitleView(title: title),
        Container(
          color: BaseColors.backgroundWhite,
          padding: const EdgeInsets.symmetric(vertical: BaseSpacing.spacing2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...items.entries.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: BaseSpacing.spacing15s,
                    horizontal: BaseSpacing.spacing4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          e.key,
                          style: BaseStyle.bodySmall.applyColor(BaseColors.textSubtitle),
                        ),
                      ),
                      const Gap(BaseSpacing.spacing2),
                      Expanded(
                        flex: 2,
                        child: Text(
                          e.value,
                          style: BaseStyle.labelMedium.applyColor(BaseColors.textBody),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SubDetailView extends StatelessWidget {
  const SubDetailView({
    super.key,
    required this.index,
    required this.title,
    required this.items,
  });

  final int index;
  final String title;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BaseColors.backgroundWhite,
      padding: const EdgeInsets.all(BaseSpacing.spacing4).copyWith(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index.',
            style: BaseStyle.labelMedium.applyColor(BaseColors.textLabel),
          ),
          const Gap(BaseSpacing.spacing05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: BaseStyle.labelMedium.applyColor(BaseColors.textLabel),
                ),
                const Gap(BaseSpacing.spacing3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...items.entries.map(
                      (e) => Column(
                        children: [
                          ItemSubDetailView(title: e.key, value: e.value),
                          const Gap(BaseSpacing.spacing2),
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(BaseSpacing.spacing2),
                Container(
                  color: BaseColors.borderDivider,
                  height: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailTitleView extends StatelessWidget {
  const DetailTitleView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: BaseSpacing.spacing4, vertical: BaseSpacing.spacing25),
      color: BaseColors.backgroundGray,
      child: Text(
        title,
        style: BaseStyle.headlineMedium.applyColor(BaseColors.textLabel),
      ),
    );
  }
}

class ItemSubDetailView extends StatelessWidget {
  const ItemSubDetailView({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: BaseStyle.captionMedium.applyColor(BaseColors.textSubtitle),
        ),
        const Gap(BaseSpacing.spacing1),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: BaseStyle.labelSmall.applyColor(BaseColors.textBody),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
