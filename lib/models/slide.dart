import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Slide {
  final String appTitle = '채널표';
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}

final slideList = [
  Slide(
    imageUrl: 'assets/slide/1.png',
    title: 'Hello',
    description: Slide().appTitle+'는 직관적 UI로 높은 생산성을 추구합니다.'
    '팀원들과 RealTime DB를 활용하여 빠른 업무를 경험해보세요!\n'
      '32ch Mix Console에 여러분만의 시스템을 자유롭게 구축해보세요.',
  ),
  Slide(
    imageUrl: 'assets/slide/2.png',
    title: 'Hello',
    description: Slide().appTitle+'는 직관적 UI로 높은 생산성을 추구합니다.'
        '팀원들과 RealTime DB를 활용하여 빠른 업무를 경험해보세요!\n'
        '32ch Mix Console에 여러분만의 시스템을 자유롭게 구축해보세요.',
  ),
  Slide(
    imageUrl: 'assets/slide/1.png',
    title: 'Hello',
    description: Slide().appTitle+'는 직관적 UI로 높은 생산성을 추구합니다.'
        '팀원들과 RealTime DB를 활용하여 빠른 업무를 경험해보세요!\n'
        '32ch Mix Console에 여러분만의 시스템을 자유롭게 구축해보세요.',
  ),
];
