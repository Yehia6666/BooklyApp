import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());
    HomeRepo homeRepo;

  Future <void> fetchSimilerBook({required String category}) async {
    emit(SimilerBooksLoading()) ;
    var result = await homeRepo.fetchSimilerBook(category:category );
    result.fold((failuer) {
      emit(SimilerBooksFailure(failuer.errorMessage)) ;
    }, (books){
      emit(SimilerBooksSuccess(books));
    });
   }
}
