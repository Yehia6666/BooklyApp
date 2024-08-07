part of 'newset_book_cubit.dart';

abstract class NewestBookState extends Equatable {
  const NewestBookState();

  @override
  List<Object> get props => [];
}

class NewsetBookInitial extends NewestBookState {}

class NewsetBookLoading extends NewestBookState {}

class NewsetBookFailure extends NewestBookState {
  final String errorMessage;

  const NewsetBookFailure(this.errorMessage);
}

class NewsetBookSuccess extends NewestBookState {
  final List<BookModel> books;

  const NewsetBookSuccess(this.books);
}
