import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = "View all",
    this.onpressed,
    this.showActionButton = true,
  });
  //Customize widget

  final Color? textColor;
  final String title, buttonTitle;
  final void Function()? onpressed;
  final bool showActionButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onpressed, child: Text(buttonTitle)),
      ],
    );
  }
}
