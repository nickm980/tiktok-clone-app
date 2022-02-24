import 'package:flutter/cupertino.dart';

class ResponsiveSafeArea extends StatelessWidget {
  const ResponsiveSafeArea({required ResponsiveBuilder builder, Key? key})
      : responsiveBuilder = builder,
        super(key: key);

  final ResponsiveBuilder responsiveBuilder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return responsiveBuilder(
            context,
            constraints.biggest,
          );
        },
      ),
    );
  }
}

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  Size size,
);
