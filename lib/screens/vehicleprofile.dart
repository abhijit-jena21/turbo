import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/home.dart';
import '../models/homemodel.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

class VehicleProfile extends StatelessWidget {
  final String vnum;
  final String vclass;
  final String vmake;
  final String vmodel;
  final String vfuel;
  final String vtrans;
  VehicleProfile(
      {this.vnum,
      this.vclass,
      this.vmake,
      this.vmodel,
      this.vfuel,
      this.vtrans});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<HomeModel>().getItem();
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
            // toolbarHeight: 50.height,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
              height: 70.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      height: 40.height,
                      color: Colors.deepPurple,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(vmodel.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Lato',
                                      color: Colors.white)),
                              Text(vnum.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Lato',
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2,
                      children: [
                        Column(
                          children: [
                            Text("MAKE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                  color: Colors.black54
                                )),
                            Text(vmake.toUpperCase(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("MODEL",
                             textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                            Text(vmodel.toUpperCase(),
                             textAlign: TextAlign.center,
                             
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("FUEL TYPE",
                             textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                            Text(vfuel.toUpperCase(),
                             textAlign: TextAlign.center,
                            maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("TRANSMISSION",
                             textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                            Text(vtrans.toUpperCase(),
                             textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                          ],
                        )
                      ],
                    ),
                    
                  ],
                ),
              )));
    });
  }
}
