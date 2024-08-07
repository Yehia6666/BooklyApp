import 'package:bookly_app/core/utlis/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/image_book_details_section.dart';
import 'package:bookly_app/features/home/presentation/view/widget/lsit_view_book_details_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouters.kBookDetailsVew,
                      extra: bookModel,
                    );
                  },
                  child: ImageBookDetailsSection(
                    bookModel: bookModel,
                  ),
                ),
                const Spacer(),
                const SimilarBookSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
