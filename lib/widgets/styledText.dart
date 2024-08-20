import 'package:flutter/material.dart';

class Styledtext extends StatelessWidget {
  Styledtext(this.text, {super.key});
  final String text;

  @override
  build(context) {
    return Text(
      text,
      style: TextStyle(
          color: Color.fromRGBO(109, 49, 237, 1.000),
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          fontSize: 16),
    );
  }
}

// import 'package:flutter/material.dart';

// class Styledtext extends StatelessWidget{
//    Styledtext(this.text,{super.key});

//   final String text;
//   @override
//   build(context){
//     return   Text(text, style: const TextStyle(color: Colors.white
//  , fontSize: 20 , fontWeight: FontWeight.bold ),);
//   }
// }