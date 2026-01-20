import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 237, 255),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 85,
            ),
            _loginAnimation(),
            SizedBox(
              height:70,
            ),
            _loginContainer(),
                      ],
        ),
      )
    );
  }
} 


Widget _loginAnimation()
{
  return Container(
    height: 260,
    width: 280,
    child: Lottie.asset('assets/login_screen_animation1.json'),
  );
}

Widget _loginContainer()
{
  return Expanded(child: Container(
    padding: EdgeInsets.all(24),
    
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )
    ),
    child: Column(
      children: [
        Text('Your Complete Guide to Indian Constitution',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: 1.2,
        ),),
        SizedBox(height: 20,),
        Text('Simplified articles, real-world stories, and current bills — all in one app.',style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey,
          fontSize: 12,
          height: 1.5,
        ),),
        SizedBox(
          height: 30,
        ),
        CustomButton(),
      ],
    ),
    
    
  ));
}

class CustomButton extends StatefulWidget {
  // final String text;
  // final icons;
  // final Color backgroundColor;
  // final double fontsize;
  // final Color bordercolor;
  // final Color gradientcolor1;
  // final Color gradientcolor2;




  const CustomButton({super.key,
  //  required this.text,
  //  this.icons,
  //  required this.backgroundColor,
  //  required this.bordercolor,
  //  required this.gradientcolor1,
  //  required this.gradientcolor2,
  //  required this.fontsize,   

  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      onTap: () {
        print("Button Pressed");
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,

        // 🔽 Move button down when pressed
        transform: Matrix4.translationValues(
          0,
          _isPressed ? 4 : 0,
          0,
        ),

        margin:  EdgeInsets.symmetric(horizontal: 10),
        height: 62,

        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border(top: BorderSide(
          color: Colors.grey,
          width: 2,
        ),left: BorderSide(
          color: Colors.grey,
          width: 2,
        ), right: BorderSide(
          color: Colors.grey,
          width: 2,
        ),),

          // Gradient for depth
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3A3A3A),
              Color(0xFF2A2A2A),
            ],
          ),

          // Shadow changes on press
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: _isPressed ? 1 :0,
              offset: Offset(0, _isPressed ? 2 : 6),
            ),
          ],
        ),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/images/google.svg',
              height: 24,
              ),
              // SizedBox(width: 10),
              Text(
                'Sign Up With Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


