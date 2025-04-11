import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TawkChatWidgest extends StatelessWidget {
  final String userName; 
  final String? userEmail; 

  const TawkChatWidgest({
    super.key,
    required this.userName,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    String? chatLink = dotenv.env['TAWKDIRECTCHATLINKK'];
    if (chatLink == null || chatLink.isEmpty) {
      return const Center(
        child: Text('Error: Direct Chat Link not found in .env'),
      );
    }

    return Tawk(
      directChatLink: chatLink,
      visitor: TawkVisitor(
        name: userName, 
        email: userEmail,
      ),
      onLoad: () {
        print('Chat Loaded Successfully');
      },
      onLinkTap: (String url) {
        print('Link Tapped: $url');
      },
     
    );
  }
}