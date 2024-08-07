import 'package:bookly_app/core/utlis/style.dart';
import 'package:bookly_app/features/search/presentation/view/widget/custom_search_text_feild.dart';
import 'package:bookly_app/features/search/presentation/view/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Search Result',
            style: Style.textStyle18,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        SearchResultListView(),
      ],
    );
  }
}
