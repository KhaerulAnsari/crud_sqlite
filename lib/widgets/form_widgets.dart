import 'package:flutter/material.dart';
import 'package:scholl/theme/theme.dart';

class FormWidget extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget? widget;
  const FormWidget({
    super.key,
    this.textEditingController,
    this.obscureText,
    this.title,
    this.hintText,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title!,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            obscureText: obscureText ?? false,
            controller: textEditingController,
            // cursorColor: blueColor,
            // onChanged: (value) {
            //   setState(
            //     () {},
            //   );
            // },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 15,
                // bottom: 20,
                // top: 20,
              ),
              suffixIcon: widget ?? const SizedBox(),
              fillColor: const Color(0xFFF1F0F5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: blueColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              hintText: hintText,
            ),
            style: blackTextStyle,
          ),
        ),
      ],
    );
  }
}
