import 'package:flutter/widgets.dart';

class Marquee extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final EdgeInsetsGeometry padding;
  final Duration animationDuration;
  final Curve curve;

  const Marquee({
    @required this.child,
    this.direction: Axis.horizontal,
    this.padding,
    this.animationDuration: const Duration(seconds: 3),
    this.curve: Curves.easeInOutQuint,
  });

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      padding: widget.padding,
      controller: scrollController,
      child: widget.child,
    );
  }

  void _scroll() {
    if (scrollController.hasClients == false) return;

    final scrollPosition = scrollController.position;
    final minScrollExtent = scrollPosition.minScrollExtent;
    final maxScrollExtent = scrollPosition.maxScrollExtent;

    if (scrollController.offset != minScrollExtent) {
      scrollController.jumpTo(minScrollExtent);
    }
    if (minScrollExtent != maxScrollExtent) {
      scrollController
          .animateTo(
            maxScrollExtent,
            duration: widget.animationDuration,
            curve: widget.curve,
          )
          .whenComplete(_scroll);
    }
  }
}
