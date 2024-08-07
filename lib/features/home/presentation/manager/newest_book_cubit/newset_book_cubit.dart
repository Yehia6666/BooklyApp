import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewsetBookInitial());
  HomeRepo homeRepo;

  Future <void> fetchNewestdBooks() async {
    emit(NewsetBookLoading()) ;
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failuer) {
      emit(NewsetBookFailure(failuer.errorMessage)) ;
    }, (books){
      emit(NewsetBookSuccess(books));
    });
   }
}
