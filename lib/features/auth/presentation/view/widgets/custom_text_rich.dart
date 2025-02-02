import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key,
      required this.tittle,
      required this.authText,
      required this.routeName});
  final String tittle;
  final String authText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.font16Medium(context),
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
              style: AppTextStyles.font16MediumPrimary700(context)),
        ],
      ),
    );
  }
}