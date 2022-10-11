import 'package:flutter/material.dart';

class community with ChangeNotifier{

  ConstantColors constanColors = ConstantColors();


  selectPostImageType(BuildContext context){

   

    return showModalBottomSheet(context: context, builder:(context){
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: constanColors.yellowColor,
          borderRadius: BorderRadius.circular(12
          )

        )
      )
    })
  }

   
}