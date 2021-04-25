import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/listtilewidget.dart';
import '../models/homemodel.dart';
import 'make.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

class Vclass extends StatelessWidget {
  final vehicleNumber;
  Vclass(this.vehicleNumber);
  final Map vclass = {"2 Wheeler": "2w", "4 Wheeler": "4w"};
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<HomeModel>().getItem();
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Select vehicle class',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
              )),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
          ),
          height: 45.height,
          child: SingleChildScrollView(
              child: ListView.builder(
            itemCount: vclass.keys.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              void navigator() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Make(
                              vnum: vehicleNumber,
                              vclass: vclass.values.elementAt(index),
                            )));
              }

              return ListTileWidget(
                index: index,
                inputList: vclass.keys.toList(),
                function: navigator,
              );
            },
          )),
        ),
      );
    });
  }
}
