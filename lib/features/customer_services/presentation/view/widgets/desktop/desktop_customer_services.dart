import 'package:flutter/material.dart';

import '../../../../tawk_chat_widget.dart';


class DesktopCustomerServices extends StatelessWidget {
  const DesktopCustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TawkChatWidgest(
        userName: "Moahmed", 
        userEmail: "",
      ),
    );
  }
}
