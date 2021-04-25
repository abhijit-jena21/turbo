import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final int index;
  final inputList;
  final void Function() function;
  ListTileWidget({this.index, this.inputList, this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
          leading: Text(inputList.elementAt(index),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lato',
                  color: Colors.black87)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
          ),
          onTap: function),
    );
  }
}
