import 'package:bookly_app/core/utlis/style.dart';
import 'package:bookly_app/features/home/presentation/view/widget/similar_book_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also Like',
          style: Style.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SimilarBookListView(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
