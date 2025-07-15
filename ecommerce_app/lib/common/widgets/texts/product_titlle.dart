import 'package:flutter/material.dart';

class UProuctTitleText extends StatelessWidget {
  const UProuctTitleText({
    super.key,
    required this.title,
    this.smallsize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
  });
  //customize parameters

  final String title;
  final bool smallsize;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      title,
      style:
          smallsize
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
