import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';

class HomeFilterList extends StatefulWidget {
  @override
  _HomeFilterListState createState() => _HomeFilterListState();
}

class _HomeFilterListState extends State<HomeFilterList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: vH(80.0),
      // color: Colors.grey,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => SizedBox(width: vW(12.0)),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? vW(32.0) : 0,
              right: index == 9 ? vW(32.0) : 0,
            ),
            child: ChoiceChip(
              onSelected: (selected) {
                setState(() {
                  selectedIndex = selected ? index : 0;
                });
              },
              selected: selectedIndex == index,
              label: Text('Label $index'),
            ),
          );
        },
      ),
    );
  }
}
