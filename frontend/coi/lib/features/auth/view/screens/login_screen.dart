import 'package:coi/app/providers.dart';
import 'package:coi/features/auth/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class Loginscreen extends ConsumerStatefulWidget {
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends ConsumerState<Loginscreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 237, 255),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder:(context, constraints) {
           return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RepaintBoundary(child: _loginAnimation()),
                    const SizedBox(height: 150,),
                    Expanded(child: _loginContainer(ref)),
                              ],
                ),
              ),
            ),
          );
          }
        ),
      )
    );
  }
} 


Widget _loginAnimation(){
  return Padding(
    padding: EdgeInsets.only(top: 80),
    child: Container(
      height: 250,
      width: double.infinity,
      child: Lottie.asset('assets/login_screen_animation1.json'),
    ),
  );
}

Widget _loginContainer(WidgetRef ref){
  return Container(
    padding: EdgeInsets.all(24),
    
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        SizedBox(height: 20,),
        Text(
              'Your Complete Guide to Indian Constitution',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                height: 1.2,
              ),
            ),

            SizedBox(height: 10,),


        Text(
                                    'Use your College Credentials to Sign in instantly. No hassle, Just vibes!',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),


        Spacer(),
        CustomButton(
          onTap:  () async {
  final userModel = await ref
      .read(authControllerProvider.notifier)
      .signInWithGoogle();

  if (userModel != null) {
    ref.read(UserProvider.notifier).state = userModel;
  }
},

          text: 'Continue with Google',
          iconPath: 'assets/images/google.svg',
        ),

        SizedBox(height: 80,),
      ],
    ),
    
    
  );
}

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final String? iconPath;
  final Widget? icon;
  final double? height;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconPath,
    this.icon,
    this.height,
    this.margin,
    this.borderRadius,
    this.gradient,
    this.borderColor,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

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
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          _isPressed ? 4 : 0,
          0,
        ),
        margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 10),
        height: widget.height ?? 62,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          border: Border(
            top: BorderSide(
              color: widget.borderColor ?? colorScheme.outline,
              width: 2,
            ),
            left: BorderSide(
              color: widget.borderColor ?? colorScheme.outline,
              width: 2,
            ),
            right: BorderSide(
              color: widget.borderColor ?? colorScheme.outline,
              width: 2,
            ),
          ),
          color: widget.gradient == null 
              ? (widget.backgroundColor ?? colorScheme.surface) 
              : null,
          gradient: widget.gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: _isPressed ? 1 : 0,
              offset: Offset(0, _isPressed ? 2 : 6),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null)
                widget.icon!
              else if (widget.iconPath != null)
                SvgPicture.asset(
                  widget.iconPath!,
                  height: 24,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  8.0),
                child: Text(
                  widget.text,
                  style: widget.textStyle ?? 
                      textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


