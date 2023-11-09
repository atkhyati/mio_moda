import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;

    canvas.drawLine(Offset(offset.dx + 17.w, 0),
        Offset(cfg.size!.width + offset.dx - 17.w, 0), paint);
  }
}
