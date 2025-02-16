import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/bloc/bloc/get_all_categories_bloc.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/widgets/category_table.dart';

import '../../../../../core/utils/styles/app_text_styles.dart';

class GetAllCategoriesDataBloc extends StatelessWidget {
  const GetAllCategoriesDataBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          empty: () {
            return Center(
              child: Text("no_category_found".tr(context),
                  style: AppTextStyles.font16BoldFixedFontSize(context)),
            );
          },
          failure: (message) {
            return Center(
              child: Text("error_while_fetching_Categories".tr(context),
                  style: AppTextStyles.font16BoldFixedFontSize(context)),
            );
          },
          success: (categories) {
            return CategoryTable(categoriesList: categories.categoriesList!);
          },
        );
      },
    );
  }
}
