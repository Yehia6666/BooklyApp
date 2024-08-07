import 'package:bookly_app/core/utlis/style.dart';
import 'package:bookly_app/features/home/presentation/view/widget/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/featuerd_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBooklyListView(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Newest Books',
                  style: Style.textStyle18,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: NewestBooksListView(),
        ),
      ],
    );
  }
}
