import 'package:bookly_app/core/function/launch_url.dart';
import 'package:bookly_app/core/widget/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink);
            },
            text: getText(bookModel),
            textSize: 14,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            backgroundColor: const Color(0xffEf8262),
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
  
  getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable' ;
    } else {
      return 'Preview' ;
    }
  }
}
