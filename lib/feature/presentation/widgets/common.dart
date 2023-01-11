import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SnackBarErr extends StatefulWidget {
  final String msg;
  const SnackBarErr({Key? key, required this.msg}) : super(key: key);

  @override
  State<SnackBarErr> createState() => _SnackBarErrState();
}

class _SnackBarErrState extends State<SnackBarErr> {
  @override
  Widget build(BuildContext context) {

    return showSnackBarError();
  }

   showSnackBarError(){
     var snackBar =  SnackBar(
       backgroundColor: Colors.red,
       duration: const Duration(seconds: 3),
       content: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text('$Widget.msg'),
           const Icon(FontAwesome.exclamation_triangle)
         ],
       ),
     );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
