import 'package:flutter_bloc/flutter_bloc.dart';

class FilterChipsCubit extends Cubit<int> {
  FilterChipsCubit() : super(0);

  void select({int index}) {
    emit(index);
  }
}
