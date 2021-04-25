import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/listtilewidget.dart';

import 'fuel.dart';

class Model extends StatefulWidget {
  final String vnum;
  final String vclass;
  final String make;
  Model({this.vnum, this.vclass, this.make});
  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  Dio dio = Dio();
  var futureModels;
  make() async {
    var pathUrl =
        "https://test.turbocare.app/turbo/care/v1/models?class=${widget.vclass}&make=${widget.make}";
    try {
      return await dio.get(pathUrl);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "An error occurred",
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.black87,
          backgroundColor: Colors.grey.shade200);
      return "error";
    }
  }

  Future<List<dynamic>> getMake() async {
    Response response = await make();
    return response.data;
  }

  void initState() {
    super.initState();
    futureModels = getMake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Model',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
              )),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                FutureBuilder<List>(
                    future: futureModels,
                    // ignore: missing_return
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Empty",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.black87),
                              ),
                            ],
                          ));
                        } else {
                          return Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 20,
                              ),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    void navigator() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                            (BuildContext context) =>
                                              Fuel(
                                                vnum: widget.vnum,
                                                vclass: widget.vclass,
                                                vmake: widget.make,
                                                vmodel: snapshot.data.elementAt(index)
                                              )));
                                            }
                                                  return ListTileWidget(
                                                    index: index,
                                                    inputList: snapshot.data,
                                                    function: navigator,
                                                  );
                                  }));
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Text(
                          'error',
                          style: Theme.of(context).textTheme.headline3,
                        );
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: Center(
                            child: Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            )));
  }
}
