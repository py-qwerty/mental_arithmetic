


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_arithmetic/app/theme/widgets/formats.dart';

import '../../../theme/colors.dart';
import 'cubit/display_cubit.dart';
import 'cubit/display_state.dart';

class CustomDisplay extends StatelessWidget {


   static Widget create(DisplayCubit displayCubit){
     return BlocProvider.value(
        value: displayCubit,
       child:  CustomDisplay()
      );
    }



  final TextStyle styleOperator =  GoogleFonts.indieFlower(
    fontSize: 64,
    color: AppColors.detailsColor,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );

  final TextStyle styleResult = GoogleFonts.indieFlower(
    fontSize: 34,
    color: AppColors.detailsColor,
    letterSpacing: 1.1,
  );




  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DisplayCubit, DisplayState>(
        builder: (context, stateDisplay)
    {
      return Container(
        padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                    AutoSizeText(
                      '${stateDisplay.operation} = ${stateDisplay.mode != answerMode.none? stateDisplay.result:'?'}',
                      style: styleOperator,
                      maxLines: 1,
                      minFontSize: 20,
                    ),

              AutoSizeText(
                    textAlign: TextAlign.center,
                    CustomFormats.numberFormat(stateDisplay.value),
                    minFontSize: 64,
                    style: GoogleFonts.indieFlower(
                      color: stateDisplay.mode == answerMode.wrong ?
                      AppColors.red
                          :
                      stateDisplay.mode == answerMode.correct ?
                      AppColors.green
                          :
                      AppColors.detailsColor,
                      letterSpacing: 1.1,
                    ),
                  ),


            ],
          ),

      );
    });
  }


}
