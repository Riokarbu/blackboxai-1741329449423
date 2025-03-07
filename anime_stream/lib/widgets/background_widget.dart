import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final double opacity;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.opacity = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image with Fade Effect
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa4c138158d17.jpg', // Placeholder anime girl image
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ColorFilter.mode(
              Colors.black.withOpacity(opacity),
              BlendMode.darken,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}

class FadeInBackground extends StatefulWidget {
  final Widget child;

  const FadeInBackground({
    super.key,
    required this.child,
  });

  @override
  State<FadeInBackground> createState() => _FadeInBackgroundState();
}

class _FadeInBackgroundState extends State<FadeInBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.9, end: 0.6).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return BackgroundWidget(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
