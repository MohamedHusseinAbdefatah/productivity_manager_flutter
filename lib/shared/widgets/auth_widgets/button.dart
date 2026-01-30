import 'package:flutter/material.dart';

import '../../../core/constants.dart';

Widget CustomBUtton(Size size, String text,void Function() onpressed){return 
 MaterialButton(onPressed: onpressed
, child: Container(
  width: size.width*0.8,
  height: size.height*0.06,
  padding: EdgeInsets.symmetric(vertical: Appconstants.kdefpadding/2),
  decoration: BoxDecoration(
    color: Appconstants.kprimaryclolor,
    borderRadius: BorderRadius.circular(Appconstants.kdefradius),
  ),
  child: Center(
    child: Text( text ,style: TextStyle(
      color: Appconstants.kwhitecolor,
      fontWeight: FontWeight.bold,
    ),),
)
),

);
}