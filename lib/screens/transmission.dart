import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/vehiclemodel.dart';
import '../screens/vehicleprofile.dart';
import '../widgets/listtilewidget.dart';
import '../models/homemodel.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

class Transmission extends StatelessWidget {
  final String vnum;
  final String vclass;
  final String vmake;
  final String vmodel;
  final String vfuel;
  Transmission({this.vnum, this.vclass, this.vmake, this.vmodel, this.vfuel});
  final List transmission = [
    "Manual",
    "Automatic",
  ];
  @override
  Widget build(BuildContext context) {
    var vehicleDb = Provider.of<HomeModel>(context, listen: false);
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
          height: 70.height,
          child: SingleChildScrollView(
              child: ListView.builder(
            itemCount: transmission.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              void navigator() async{
                    await vehicleDb.addItem(Vehicle(
                        vehicleNumber: vnum,
                        make: vmake,
                        model: vmodel,
                        fuel: vfuel,
                        transmission: transmission.elementAt(index)));
                    vehicleDb.getItem();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => VehicleProfile(
                                  vnum: vnum,
                                  vclass: vclass,
                                  vmake: vmake,
                                  vmodel: vmodel,
                                  vfuel: vfuel,
                                  vtrans: transmission.elementAt(index),
                                )));
                  }
              return ListTileWidget(
                index: index,
                inputList: transmission,
                function: navigator,
              );
            
            },
          )),
        ),
      );
    });
  }
}
