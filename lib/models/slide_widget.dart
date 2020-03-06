import 'package:flutter/material.dart';
import 'package:solution_4_setting/models/slide.dart';

class SlideItem extends StatelessWidget {

  final int currentIndex;
  SlideItem(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[currentIndex].imageUrl),
              fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[currentIndex].title,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          slideList[currentIndex].description,
        ),
      ],
    );
  }
}
