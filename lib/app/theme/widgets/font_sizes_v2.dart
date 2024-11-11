import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Definición de las constantes basadas en potencias de 2
const double fontSizeH0 = 64;   // Mitad de 100.sp
const double fontSizeH1 = 32;   // Mitad de 60.sp
const double fontSizeH2 = 20;   // Mitad de 40.sp
const double fontSizeH3 = 16;   // Mitad de 32.sp (no cambia porque ya es
// potencia de 2)
const double fontSizeH4 = 14;    // Mitad de 20.sp
const double fontSizeH5 = 12;    // Mitad de 16.sp (no cambia porque ya es
// potencia de 2)


class VSpacer extends StatelessWidget {
  const VSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 32);
  }
}


class BaseText extends StatelessWidget {

  const BaseText(this.text, this.fontSize, {
    super.key,
    this.color,
    this.textAlign,
    this.bold = false,
    this.maxLines = 10000000000,
    this.shadow = false,
    this.letterSpacing,
    this.lineHeight,
    this.underline = false,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final bool bold;
  final int? maxLines;
  final bool shadow;
  final double? letterSpacing;
  final double? lineHeight;
  final bool underline;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.indieFlower(
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: color,
        letterSpacing: letterSpacing,
        height: lineHeight,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        decorationColor: color,
        shadows: [
          if (shadow) const Shadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset.zero,
          ) else const Shadow(
            color: Colors.transparent,
          ),
        ],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// Clases con las fuentes ajustadas
class H0 extends BaseText {
  const H0(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH0, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}

class H1 extends BaseText {
  const H1(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH1, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}

class H2 extends BaseText {
  const H2(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH2, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}

class H3 extends BaseText {
  const H3(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH3, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}

class H4 extends BaseText {
  const H4(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH4, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}

class H5 extends BaseText {
  const H5(String text, {Key? key, Color? color, TextAlign? textAlign, bool bold = false, int? maxLines = 4, bool shadow = false, double? letterSpacing, double? lineHeight, bool underline = false})
      : super(text, fontSizeH5, color: color, textAlign: textAlign, bold: bold, maxLines: maxLines, shadow: shadow, letterSpacing: letterSpacing, lineHeight: lineHeight, underline: underline, key: key);
}


// Define similar classes for H0b, H1b, H3b, H4b, H5b
class BaseButton extends StatelessWidget {

  const BaseButton(this.text, {
    required this.onPressed,
    required this.fontSize,
    super.key,
    this.color,
    this.textAlign,
    this.bold = false,
    this.maxLines = 1,
    this.shadow = false,
    this.letterSpacing,
    this.lineHeight,
    this.underline = false,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final TextAlign? textAlign;
  final bool bold;
  final int? maxLines;
  final bool shadow;
  final double? letterSpacing;
  final double? lineHeight;
  final bool underline;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        child: Align(
          alignment: textAlign == TextAlign.start ? Alignment.centerLeft : Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'PlusJakartaSans',
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: color,
              letterSpacing: letterSpacing,
              height: lineHeight,
              decoration: underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: color,
              shadows: [
                if (shadow) const Shadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ) else const Shadow(
                  color: Colors.transparent,
                ),
              ],
            ),
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class H0b extends BaseButton {
  const H0b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH0);
}

class H1b extends BaseButton {
  const H1b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH1);
}

// Ajuste en las clases H2b, H3b, etc. aplicando las constantes.

class H2b extends BaseButton {
  const H2b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH2);
}

class H3b extends BaseButton {
  const H3b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH3);
}

class H4b extends BaseButton {
  const  H4b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH4);
}

class H5b extends BaseButton {
  const H5b(super.text, {required super.onPressed, super.key, super.color, super.textAlign, super.bold, int super.maxLines = 4, super.shadow, super.letterSpacing, super.lineHeight, super.underline})
      : super(fontSize: fontSizeH5);
}


class BaseTextField extends StatelessWidget {

  const BaseTextField(
      this.controller,
      this.fontSize, {
        required this.width, super.key,
        this.color,
        this.textAlign,
        this.bold = false,
        this.maxLines,
        this.shadow = false,
        this.letterSpacing,
        this.lineHeight,
        this.underline = false,
        this.hintText,
        this.borderSide,
        this.roundCorners = false,
        this.borderColor,
        this.borderRadius,
        this.isPassword = false,
        this.onChange,
      });
  final TextEditingController controller;
  final Color? color;
  final TextAlign? textAlign;
  final bool bold;
  final int? maxLines;
  final bool shadow;
  final double? letterSpacing;
  final double? lineHeight;
  final bool underline;
  final double fontSize;
  final double width;
  final String? hintText;
  final BorderSide? borderSide;
  final bool roundCorners;
  final Color? borderColor;
  final double? borderRadius;
  final bool isPassword;
  // ignore: inference_failure_on_function_return_type
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        enabled: true,
        controller: controller,
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'PlusJakartaSans',
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color,
          letterSpacing: letterSpacing,
          height: lineHeight,
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
          decorationColor: color,
          shadows: [
            if (shadow) const Shadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(0, 0),
            ) else const Shadow(
              color: Colors.transparent,
            ),
          ],
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          border: roundCorners
              ? OutlineInputBorder(
            borderSide: borderSide ?? const BorderSide(),
            borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          )
              : UnderlineInputBorder(
            borderSide: borderSide ?? const BorderSide(),
          ),
          hintText: hintText,
        ),
        onChanged: onChange,
      ),
    );
  }
}

// Definición de las clases Hf con los valores ajustados

class H0f extends BaseTextField {
  const H0f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide? borderSide,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH0, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}

class H1f extends BaseTextField {
  const H1f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide? borderSide = BorderSide.none,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH1, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}

class H2f extends BaseTextField {
  const H2f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide? borderSide = BorderSide.none,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH2, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}

class H3f extends BaseTextField {
  const H3f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide? borderSide = BorderSide.none,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH3, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}

class H4f extends BaseTextField {
  const H4f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide? borderSide = BorderSide.none,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH4, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}

class H5f extends BaseTextField {
  const H5f(
      TextEditingController controller, {
        required double width, Key? key,
        Color? color,
        TextAlign? textAlign,
        bool bold = false,
        int? maxLines,
        bool shadow = false,
        double? letterSpacing,
        double? lineHeight,
        bool underline = false,
        BorderSide borderSide = BorderSide.none,
        bool roundCorners = false,
        Color? borderColor,
        double? borderRadius,
        bool isPassword = false,
        String? hintText,
        // ignore: inference_failure_on_function_return_type
        Function(String)? onChange,
      }) : super(
    controller,
    fontSizeH5, // Usar constante ajustada
    width: width,
    color: color,
    textAlign: textAlign,
    bold: bold,
    maxLines: maxLines,
    shadow: shadow,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    underline: underline,
    key: key,
    borderSide: borderSide,
    roundCorners: roundCorners,
    borderColor: borderColor,
    borderRadius: borderRadius,
    isPassword: isPassword,
    hintText: hintText,
    onChange: onChange,
  );
}