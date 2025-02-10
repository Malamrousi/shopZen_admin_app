import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';

import '../get_users_bloc.dart';
import '../text_search_filed.dart';

class DisplayUserBody extends StatelessWidget {
  const DisplayUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          verticalSpacing(40),
       TextSearchFiled(),
          verticalSpacing(40),
          Flexible(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: GetUsersBloc(),
                )
              ],
            )),
        ],
      ),
    );
  }
}
