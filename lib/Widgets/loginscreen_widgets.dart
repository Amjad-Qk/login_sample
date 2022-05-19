import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.icon,
      this.validator,
      required this.controller,
      this.isPasswordField = false, this.obscureText = false})
      : super(key: key);

  final String label, hint;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPasswordField;
   bool obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            spreadRadius: 2,
            blurRadius: 10,
            color: Colors.blueGrey.shade100,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                widget.icon,
                color: Colors.black,
              ),
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.isPasswordField) {
                            widget.obscureText = !widget.obscureText;
                          }
                        });
                      },
                      icon: Icon(
                       widget.obscureText? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                    )
                  : null,
              hintText: widget.hint,
              hintStyle: GoogleFonts.comfortaa(
                height: 1.5,
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.buttonText, this.onPressed})
      : super(key: key);

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: GoogleFonts.comfortaa(
          fontSize: 12,
          color: Colors.blueGrey.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
