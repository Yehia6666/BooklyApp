import 'package:bookly_app/core/utlis/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/book_details_veiw.dart';
import 'package:bookly_app/features/search/presentation/view/search_veiw.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kSerachView = '/searchView';
  static const kBookDetailsVew = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsVew,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilerBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsVeiw(bookModel: state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: kSerachView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
