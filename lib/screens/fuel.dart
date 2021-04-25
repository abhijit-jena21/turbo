import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/transmission.dart';
import '../widgets/listtilewidget.dart';
import '../models/homemodel.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

class Fuel extends StatelessWidget {
  final String vnum;
  final String vclass;
  final String vmake;
  final String vmodel;
  Fuel({this.vnum, this.vclass, this.vmake, this.vmodel});
  final List fuel = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol + CNG",
    "Electric",
    "Hybrid"
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<HomeModel>().getItem();
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Select fuel type',
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
          height: 70.height,
          child: SingleChildScrollView(
              child: ListView.builder(
            itemCount: fuel.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              void navigator() {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Transmission(
                              vnum: vnum,
                              vclass: vclass,
                              vmake: vmake,
                              vmodel: vmodel,
                              vfuel: fuel.elementAt(index),
                            )));
                  }
              return ListTileWidget(
                index: index,
                inputList: fuel,
                function: navigator,
              );
            },
          )),
        ),
      );
    });
  }
}
