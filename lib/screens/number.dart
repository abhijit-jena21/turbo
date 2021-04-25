import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/vclass.dart';
import '../models/homemodel.dart';
import '../utils/sizeconfig.dart';
import '../utils/sizeextension.dart';

// ignore: must_be_immutable
class Number extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String vehicleNumber;
  final TextEditingController numberController = TextEditingController();
  Pattern pattern =
      (r'^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$');

  String vehicleNumberValidator(String value) {
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Vehicle number cannot be empty';
    } else if (!regExp.hasMatch(value)) return 'Enter valid vehicle number';

    return null;
  }

  formSubmit(BuildContext context) {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Vclass(vehicleNumber)));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<HomeModel>().getItem();
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create new vehicle profile',
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
            top: 40,
          ),
          height: 45.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('VEHICLE NUMBER',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    controller: numberController,
                    validator: vehicleNumberValidator,
                    decoration: InputDecoration(
                      hintText: "eg: MH 02 AH 2345",
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      )),
                    ),
                    onSaved: (value) {
                      vehicleNumber = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            formSubmit(context);
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 8.width,
          ),
        ),
      );
    });
  }
}
