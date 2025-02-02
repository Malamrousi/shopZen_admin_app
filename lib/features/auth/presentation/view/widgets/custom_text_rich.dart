import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key,
      required this.tittle,
      required this.authText,
      required this.routeName, this.textStyle, this.textAuthStyle});
  final String tittle;
  final String authText;
  final String routeName;
  final TextStyle? textStyle;
  final TextStyle? textAuthStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style:textStyle ?? AppTextStyles.font16Medium(context),
        children: [
          TextSpan(
            text: tittle,
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamedAndRemoveUntil(routeName);
                },
              text: authText,
              style:textAuthStyle ?? AppTextStyles.font16MediumPrimary700(context)),
        ],
      ),
    );
  }
}