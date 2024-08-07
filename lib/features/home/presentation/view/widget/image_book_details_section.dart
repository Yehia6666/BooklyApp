import 'package:bookly_app/core/utlis/style.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_action.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';

class ImageBookDetailsSection extends StatelessWidget {
  const ImageBookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .235,
          ),
          child:  CustomBookImageItem(
            imageUrl:
                bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 34,
        ),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          style: Style.textStyle30.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            
            style: Style.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
         BookRating(
          rating: bookModel.volumeInfo.pageCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 24,
        ),
         BookAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
