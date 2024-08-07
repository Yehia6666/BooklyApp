import 'package:bookly_app/core/widget/custom_failure.dart';
import 'package:bookly_app/core/widget/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newset_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, });
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewsetBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBooksListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewsetBookFailure) {
          return CustomFailure(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
