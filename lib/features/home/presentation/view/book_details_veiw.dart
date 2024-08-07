import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsVeiw extends StatefulWidget {
  const BookDetailsVeiw({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsVeiw> createState() => _BookDetailsVeiwState();
}

class _BookDetailsVeiwState extends State<BookDetailsVeiw> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilerBooksCubit>(context).fetchSimilerBook(
      category: widget.bookModel.volumeInfo.categories![0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
