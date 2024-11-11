


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';


import '../../../theme/colors.dart';
import 'cubit/numerickeypad_cubit.dart';

class NumericKeyPad extends StatelessWidget {
  const NumericKeyPad({super.key, required this.onKeyPressed});
  final Function onKeyPressed;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.furnitureColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _key(context, '1'),
              _key(context, '2'),
              _key(context, '3'),
            ],
          ),
          Row(
            children: [
              _key(context, '4'),
              _key(context, '5'),
              _key(context, '6'),
            ],
          ),
          Row(
            children: [
              _key(context, '7'),
              _key(context, '8'),
              _key(context, '9'),
            ],
          ),
          Row(
            children: [
              _key(context, '0'),
              _key(context, '-'),
              _key(context, 'CE'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _key(BuildContext context, String key) {
    final numericKeypadCubit = context.read<NumerickeypadCubit>();

    return Expanded(
      child: InkWell(
        onTap: () async{
          await HapticFeedback.selectionClick();
          if(key == 'CE'){
            numericKeypadCubit.onClear();
            onKeyPressed(numericKeypadCubit.state.value);
            return;
          }
          numericKeypadCubit.onKeyPressed(key);
          onKeyPressed(numericKeypadCubit.state.value);
        },
        child: Container(
          height: 72,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              key,
              style: GoogleFonts.indieFlower(
                  fontSize: 34,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
