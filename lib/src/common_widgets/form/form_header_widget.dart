// form_header_widget
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleTextStyle, // Added this line
  }) : super(key: key);

  // Variables -- Declared in Constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  final TextStyle? titleTextStyle; // Added this line

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: titleTextStyle ?? Theme.of(context).textTheme.headline1),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
