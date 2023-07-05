import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordResetInput extends StatefulWidget {
  const PasswordResetInput(
      {this.suffixIcon,
      required this.padding,
      required this.titleText,
      required this.hintText,
      required this.getValues,
      required this.obscureText,
      this.keyboardType,
      super.key});

  final String titleText;
  final String hintText;
  final void Function(String, String) getValues;
  final double padding;
  final bool obscureText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;

  @override
  State<PasswordResetInput> createState() => _PasswordResetInputState();
}

class _PasswordResetInputState extends State<PasswordResetInput> {
  bool focus = false;
  dynamic text = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.padding,
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              widget.titleText,
              style: GoogleFonts.inter(
                color: (focus || text != '')
                    ? const Color(0xff9CA3AF)
                    : const Color(0xff374151),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Focus(
            onFocusChange: ((value) {
              if (value) {
                setState(() {
                  focus = value;
                });
              } else {
                setState(() {
                  focus = value;
                });
              }
            }),
            child: TextFormField(
              keyboardType: widget.keyboardType,
              cursorColor: const Color(0xff32B768),
              obscureText: widget.obscureText,
              onChanged: (value) {
                setState(() {
                  text = value;
                });

                widget.getValues(widget.titleText, value);
              },
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                contentPadding: const EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  borderSide: const BorderSide(
                    color: Color(0xffBEC5D1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  borderSide: const BorderSide(
                    color: Color(0xffBEC5D1),
                  ),
                ),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9CA3AF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
