import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../../../cubits/filterchips/filterchips_cubit.dart';
import './../../../cubits/categories/categories_cubit.dart';
import '../../../utils/size_config.dart';

class HomeFilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filterCategory = context.watch<FilterChipsCubit>();
    return Container(
      height: vH(80.0),
      // color: Colors.grey,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CategoriesError) {
            return Text('Oops! : ' + state.error.toString());
          }

          if (state is CategoriesLoaded) {
            final categories = state.categories;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: vW(12.0)),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? vW(32.0) : 0,
                    right: index == 9 ? vW(32.0) : 0,
                  ),
                  child: ChoiceChip(
                    onSelected: (selected) {
                      filterCategory.select(index: selected ? index : 0);
                    },
                    selected: filterCategory.state == index,
                    label: Text('${categories[index]}'),
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
