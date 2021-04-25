import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../screens/number.dart';
import '../screens/vehicleprofile.dart';
import '../models/homemodel.dart';
import '../models/vehiclemodel.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<HomeModel>().getItem();
    return Consumer<HomeModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=>SystemNavigator.pop(),
            ),
            title: Text('Vehicles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lato',
                )),
          ),
          
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
              child: Padding(
              padding: EdgeInsets.only(top: 6.height),
              child: Column(
                
                children: <Widget>[
                  Container(
                    child: model.vehicleList.length == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No vehicles added",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: model.vehicleList.length,
                            itemBuilder: (context, index) {
                              Vehicle vehicle = model.vehicleList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              VehicleProfile(
                                                vnum: vehicle.vehicleNumber,
                                                vmake: vehicle.make,
                                                vmodel: vehicle.model,
                                                vfuel: vehicle.fuel,
                                                vtrans: vehicle.transmission,
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 2.height,
                                    horizontal: 4.5.width,
                                  ),
                                  height: 10.height,
                                  // width: 50.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  vehicle.vehicleNumber
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 7.text,
                                                  ),
                                                ),
                                                Text(
                                                  vehicle.make +
                                                      " " +
                                                      vehicle.model,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 5.text,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black38,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Divider(
                                        height: 2,
                                        color: Colors.black45,
                                        indent: 5,
                                        endIndent: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Number()));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 8.width,
            ),
          ),
        );
      },
    );
  }
}
