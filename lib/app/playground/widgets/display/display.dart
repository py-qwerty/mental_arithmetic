


import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_cubit.dart';
import 'package:mental_arithmetic/app/theme/widgets/formats.dart';
import '../../../theme/colors.dart';
import '../../../theme/widgets/font_sizes_v2.dart';
import 'cubit/display_cubit.dart';
import 'cubit/display_state.dart';

class CustomDisplay extends StatelessWidget {


   static Widget create(DisplayCubit displayCubit){
     return BlocProvider.value(
        value: displayCubit,
       child:  CustomDisplay()
      );
    }



  final TextStyle styleOperator = const TextStyle(
    fontSize: 64,
    color: AppColors.detailsColor,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );

  final TextStyle styleResult = const TextStyle(
    fontSize: 34,
    color: AppColors.detailsColor,
    letterSpacing: 1.1,
  );




  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DisplayCubit, DisplayState>(
        builder: (context, stateDisplay)
    {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Container(
          padding: const EdgeInsets.all(16),
            constraints: constraints,
            decoration: BoxDecoration(

              border: Border.all(color: AppColors.backgroundColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 InkWell(
                    onTap: () {
                      context.read<PlayGroundCubit>().speakTheOperation();
                    },
                    child: Stack(
                      children: [
                        // Capa de desenfoque

                        // Contenido principal
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(12), // Opcional: bordes redondeados
                            ),
                            child: AutoSizeText(
                              '${stateDisplay.operation} = ${stateDisplay.mode != answerMode.none ? stateDisplay.result : '?'}',
                              style: styleOperator,
                              maxLines: 1,
                              minFontSize: 20,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: context.read<PlayGroundCubit>().state.hide?
                            ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0, ):
                            ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0), // Ajusta los valores de sigmaX y sigmaY según tus necesidades
                            child: Container(
                              color: Colors.transparent, // Puedes ajustar la opacidad si lo deseas
                            ),
                          ),
                        ),

                        if(context.read<PlayGroundCubit>().state.hide &&
                        stateDisplay.mode != answerMode.none) ...[
                           Positioned.fill(
                               child: Center(child: H1(' = ${stateDisplay.result}',)))
                        ]
                      ],
                    ),
                  ),


                if(stateDisplay.value.isNotEmpty)
                 AutoSizeText(
                      textAlign: TextAlign.center,
                      CustomFormats.numberFormat(stateDisplay.value),
                      minFontSize: 64,
                      style: TextStyle(
                        color: stateDisplay.mode == answerMode.wrong?
                        AppColors.red
                            :
                        stateDisplay.mode == answerMode.correct?
                        AppColors.green
                            :
                        AppColors.detailsColor,
                        letterSpacing: 1.1,
                      ),
                    ),
              ],
            ),

        ),
      );
    });
  }


}
