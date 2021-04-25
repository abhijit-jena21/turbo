import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/listtilewidget.dart';

import 'model.dart';

class Make extends StatefulWidget {
  final String vnum;
  final String vclass;
  Make({this.vnum,this.vclass});
  @override
  _MakeState createState() => _MakeState();
}

class _MakeState extends State<Make> {
  Dio dio = Dio();
  var futureMakers;
  make() async {
    var pathUrl =
        "https://test.turbocare.app/turbo/care/v1/makes?class=${widget.vclass}";
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
    futureMakers = getMake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Make',
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
                    future: futureMakers,
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
                                              Model(
                                                        vnum: widget.vnum,
                                                        vclass: widget.vclass,
                                                        make: snapshot.data
                                                            .elementAt(index),
                                                      )));
                                            }
                                                  return ListTileWidget(
                                                    index: index,
                                                    inputList: snapshot.data,
                                                    function: navigator,
                                                  );
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: ListTile(
                                        leading: Text(
                                            snapshot.data.elementAt(index),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Lato',
                                                color: Colors.black87)),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black54,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      Model(
                                                        vnum: widget.vnum,
                                                        vclass: widget.vclass,
                                                        make: snapshot.data
                                                            .elementAt(index),
                                                      )));
                                        },
                                      ),
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
