import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Buttonwidget extends StatelessWidget {
  final String? text;
  final VoidCallback? ontapped;
  final double? btnwidth;
  final Color? color; // background color
  final Color? borderColor;
  final bool enabled;
  final String? imageAssetPath; // optional image path
  final TextStyle? textStyle;

  const Buttonwidget({
    super.key,
    this.text,
    this.ontapped,
    this.btnwidth,
    this.color,
    this.borderColor,
    this.imageAssetPath,
    this.textStyle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(
        onTap: enabled ? ontapped : null,
        child: Container(
          height: mediaQuery.height * 0.06,
          width: btnwidth ?? mediaQuery.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(mediaQuery.width * 0.022),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageAssetPath != null) ...[
                SvgPicture.asset(
                  imageAssetPath!,
                  height: mediaQuery.height * 0.03,
                  width: mediaQuery.width * 0.03,
                ),
                const SizedBox(width: 8),
              ],
              if (text != null)
                Text(
                  text!,
                  style:
                      textStyle ??
                      TextStyle(
                        fontSize: mediaQuery.height * 0.025,
                        color: borderColor ?? Colors.black,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
