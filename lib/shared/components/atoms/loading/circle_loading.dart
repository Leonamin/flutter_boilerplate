import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  const CircleLoading({super.key, this.color});
  final Color? color;

  factory CircleLoading.indicatorBright() =>
      const CircleLoading(color: Colors.white);

  factory CircleLoading.indicatorDark() =>
      const CircleLoading(color: Color(0xFF3C3C44));

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Center(
      child: !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoActivityIndicator(radius: w * 0.05, color: color)
          : CircularProgressIndicator(color: color),
    );
  }
}
