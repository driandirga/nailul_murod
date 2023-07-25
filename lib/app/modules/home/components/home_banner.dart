import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBanner extends GetView<HomeController> {
  const HomeBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Radius bRadius = const Radius.circular(130);
    return Container(
      height: size.height / 5,
      padding: const EdgeInsets.only(left: 16 * 1.5, right: 16 * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: bRadius,
        ),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 63, 81, 181),
          Color.fromARGB(255, 63, 81, 181)
        ], begin: FractionalOffset.bottomLeft, end: FractionalOffset.topRight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'Salafiyah Al-Ustmani\n',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: 'Beddian',
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 9,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
