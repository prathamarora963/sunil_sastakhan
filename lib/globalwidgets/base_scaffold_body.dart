import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/color.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      height: context.height(),
      child: IgnorePointer(
        ignoring: false,
        child: Stack(
          children: [
            // Observer(
            //   builder: (_) => Center(
            //     child: CircularProgressIndicator(
            //       color: progressIndicatorColor,
            //     ).visible(false),
            //   ),
            // ),
            child,
          ],
        ),
      ),
    );
  }
}
