import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlText extends StatelessWidget {
  final String htmlText;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Margin? marginTop;
  final Margin? marginBottom;
  const HtmlText(this.htmlText,
      {Key? key,
        this.textAlign,
        this.textStyle,
        this.maxLines,
        this.overflow,
        this.marginTop,
        this.marginBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlText,
      style: {
        "#": Style(
          margin: Margins(
              left: Margin(0),
              right: Margin(0),
              top: marginTop,
              bottom: marginBottom),
          fontFamily: textStyle?.fontFamily,
          maxLines: maxLines,
          textOverflow: overflow,
          fontSize: textStyle?.fontSize == null
              ? null
              : FontSize(textStyle!.fontSize!),
          fontWeight: textStyle?.fontWeight,
          color: textStyle?.color,
        ),
        "p": Style(
          maxLines: maxLines,
          fontFamily: textStyle?.fontFamily,
          fontSize: textStyle?.fontSize == null
              ? null
              : FontSize(textStyle!.fontSize!),
          lineHeight:
          textStyle?.height == null ? null : LineHeight(textStyle!.height),
          fontWeight: textStyle?.fontWeight,
          color: textStyle?.color,
          letterSpacing: textStyle?.letterSpacing,
          fontStyle: textStyle?.fontStyle,
          textOverflow: overflow,
          textAlign: textAlign,
        ),
      },
    );
  }
}
