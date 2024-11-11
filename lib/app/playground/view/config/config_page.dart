import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_state.dart';
import '../../../home/widgets/block_widget.dart';
import '../../../theme/colors.dart';
import '../../../theme/icons.dart';
import '../../../theme/widgets/font_sizes_v2.dart';
import '../../widgets/numericKeyPad/cubit/numerickeypad_cubit.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key, required this.operationMode});

  static const String route = '/config';

  final OperationMode operationMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Row(
            children: [
              Text('Configurations'),
            ],
          ),
        ),
        body: Center(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpacer(),
                      const H2('Select the number of operations',
                      color: AppColors.detailsColor, bold: true,),
                      const VSpacer(),
                      Wrap(
                        spacing: 32,
                        runSpacing: 32,
                        alignment: WrapAlignment.center,
                        children:[
                          for(int i = 0; i < 6; i++)
                            _operationBox(
                              context,
                              maxOperations: (i+1)*10,
                              numSum: 3,
                              maxDigits: 100,
                              minDigits: 1,
                              operationMode: operationMode
                            ),
                        ]
                      ),
                      const VSpacer(),

                    ],
                  ),
              ),
            ),
          ),
        ),
        ),
    );
  }


  Widget _operationBox(BuildContext context, {required int maxOperations, required int numSum, required int maxDigits, required int minDigits, required OperationMode operationMode}) {

    final playGroundState = PlayGroundState(
      maxOperations: maxOperations,
      numSum: numSum,
      maxDigits: maxDigits,
      minDigits: minDigits,
      operationMode: operationMode,
      pageController: PageController(),
      numerickeypadCubit: NumerickeypadCubit(),
    );

    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, '/playground',
            arguments: {
              'playGroundState': playGroundState
            });
      },
      icon: _getIcon(operationMode),
      label: '$maxOperations',
    );
  }

  SvgPicture _getIcon(OperationMode operationMode) {
    switch(operationMode){
      case OperationMode.addition:
        return AppIcons.additional;
      case OperationMode.subtraction:
        return AppIcons.subtract;
      case OperationMode.multiplication:
        return AppIcons.multiply;
      case OperationMode.division:
        return AppIcons.division;
      case OperationMode.mixed:
        return AppIcons.arithmeticIcon;
      default:
        return AppIcons.additional;
    }
  }
}
