import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPTextfield extends StatelessWidget {
  const OTPTextfield({required this.getPin, required this.index, super.key});

  final int index;
  final Function(String value, int index) getPin;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 64,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            getPin(value, index);
          }
        },
        cursorColor: const Color(0xff32B768),
        style: const TextStyle(
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          hintText: '0',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xff374151),
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: Color(0xff32B768),
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
