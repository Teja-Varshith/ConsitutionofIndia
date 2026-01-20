import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomButton extends StatefulWidget {
  final String text;
  final String svgpath;
  final Color backgroundColor;
  final double fontsize;
  final Color bordercolor;
  
  final Color gradientcolor1;
 
  final FontWeight fontWeight;
  final Color fontcolor;
  final double letterSpacing;
  final double buttonheight;




  const CustomButton({super.key,
   required this.text,
   required this.backgroundColor,
   required this.bordercolor,
   required this.gradientcolor1,
  
   required this.fontsize, 
   required this.fontWeight, 
   required this.fontcolor, 
   required this.letterSpacing, 
   required this.buttonheight, 
   required this.svgpath,
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
        // print("Button Pressed");
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

        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: widget.buttonheight,
        width: 300,

        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border(top: BorderSide(
          color: widget.bordercolor,
          width: 2,
        ),left: BorderSide(
          color: widget.bordercolor,
          width: 2,
        ), right: BorderSide(
          color: widget.bordercolor,
          width: 2,
        ),),

          // Gradient for depth
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
            // colors: [
            
              color: widget.gradientcolor1,
          //   ],
          // ),

          // Shadow changes on press
          boxShadow: [
            BoxShadow(
              color: widget.backgroundColor.withOpacity(0.6),
              blurRadius: _isPressed ? 1 :0,
              offset: Offset(0, _isPressed ? 2 : 6),
            ),
          ],
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              
              children: [
                SvgPicture.asset(widget.svgpath,
                height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.fontcolor,
                    fontSize: widget.fontsize,
                    fontWeight: widget.fontWeight,
                    letterSpacing: widget.letterSpacing,
                  ),
                ),
                Spacer(),
                Icon(Icons.skip_next),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
