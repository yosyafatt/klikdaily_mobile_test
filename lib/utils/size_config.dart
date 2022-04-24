import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData mq;
  static double scw;
  static double sch;
  static Orientation or;

  init(BuildContext c) {
    mq = MediaQuery.of(c);
    scw = mq.size.width;
    sch = mq.size.height;
    or = mq.orientation;
  }
}

double vH(double h) {
  final double sch = SizeConfig.sch;
  return (h / 886) * sch;
}

double vW(double w) {
  final double scw = SizeConfig.scw;
  return (w / 414) * scw;
}
