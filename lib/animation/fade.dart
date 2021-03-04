import 'package:flutter/widgets.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController controller;

  const FadeAnimation({
    Key key,
    @required this.child,
    @required this.controller,
  }) : super(key: key);

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);

  Animation<double> animation;
  Animation<double> animationOpacity;

  @override
  void initState() {
    super.initState();

    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOpacity = tweenOpacity.animate(animation);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: widget.child,
    );
  }
}
