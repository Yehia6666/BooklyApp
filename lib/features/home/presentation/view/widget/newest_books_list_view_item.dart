import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utlis/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/core/utlis/style.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouters.kBookDetailsVew,
          extra: bookModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 30),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomBookImageItem(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Style.textStyle20.copyWith(
                          fontFamily: kGTSectraFine,
                          height: 1.15,
                        ),
                      ),
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: Style.textStyle14,
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Style.textStyle18.copyWith(
                              fontWeight: FontWeight.bold, height: 0.25),
                        ),
                        const Spacer(),
                        BookRating(
                          rating: bookModel.volumeInfo.pageCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
