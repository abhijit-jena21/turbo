
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../models/homemodel.dart';


  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
  ];
