import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // animação radius
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // animação radius
    _radiusAnimation = Tween(begin: 450.0, end: 10.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(
      () {
        setState(() {});
      },
    );

    // fazer animação
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circulo maior
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                      // blurradius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(6.0, 6.0),
                      // blurradius: 16.0,
                    ),
                  ],
                  color: const Color(0xFF692D94),
                ),
              ),
            ),

            // Segundo circulo
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(_radiusAnimation.value),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                      // blurradius: 5.0,
                    ),
                  ],
                  color: const Color(0xFF692D94),
                ),
              ),
            ),

            // Terceiro circulo
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2,
              child: Container(
                width: 175,
                height: 175,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                      // blurradius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(6.0, 6.0),
                      // blurradius: 16.0,
                    ),
                  ],
                ),
              ),
            ),

            // Quarto circulo
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                      // blurradius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(6.0, 6.0),
                      // blurradius: 16.0,
                    ),
                  ],
                ),
              ),
            ),

            // Quinto circulo
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(6.0, 6.0),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(6.0, 6.0),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.1,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 163, 138, 208),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(6.0, 6.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
