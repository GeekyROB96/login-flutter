import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      // Use null-aware operator to handle potential null value
      color: model.bgColor ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.5,),
          Column(
            children: [
              Text(model.title, style: Theme.of(context).textTheme.headline3,),
              Text(model.subTitle, textAlign: TextAlign.center,),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
