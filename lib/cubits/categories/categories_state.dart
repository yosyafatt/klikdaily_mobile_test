part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final categories;
  CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesError extends CategoriesState {
  final error;
  CategoriesError(this.error);

  @override
  List<Object> get props => [error];
}
