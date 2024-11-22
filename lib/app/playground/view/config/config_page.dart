import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_cubit.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_state.dart';
import '../../../home/widgets/block_widget.dart';
import '../../../theme/colors.dart';
import '../../../theme/icons.dart';
import '../../../theme/widgets/font_sizes_v2.dart';


class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key, required this.operationMode});

  static const String route = '/config';

  static Widget create({required OperationMode operationMode}) {

    return BlocProvider(
        create: (context) => PlayGroundCubit(),
        child: ConfigPage(
          operationMode: operationMode,
        ));
  }

  final OperationMode operationMode;

  @override
  Widget build(BuildContext context) {
    context.read<PlayGroundCubit>().setOperationMode(operationMode);

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
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 4, left: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const VSpacer(),
                            const H4(
                              'Select the number of operations',
                              color: AppColors.detailsColor,
                              bold: true,
                            ),
                            const VSpacer(),
                            Center(
                              child: Wrap(
                                spacing: 32,
                                runSpacing: 32,
                                alignment: WrapAlignment.center,
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    BlocBuilder<PlayGroundCubit, PlayGroundState>(
                                      builder: (context, state) => _operationBox(
                                        context,
                                        maxOperations: 10 * (i + 1),
                                        operationMode: operationMode,
                                        state: state,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const VSpacer(),
                            if(operationMode != OperationMode.percentage) ...[
                            const H4('Select the level of difficulty',
                              color: AppColors.detailsColor, bold: true,),
                            const VSpacer(),
                            _levelBox(context),
                            const VSpacer(),
                            ],
                            const H4('¿With a voice?',
                              color: AppColors.detailsColor, bold: true,),
                            const VSpacer(),
                            _withSound(context),
                            const VSpacer(),
                            const H4('¿Hide the operation?',
                              color: AppColors.detailsColor, bold: true,),
                            const VSpacer(),
                            _hideWidget(context),
                            const VSpacer(),
                          ],
                        ),
                      ),
                    ),

                     _goToPlay(context),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  Widget _operationBox(
      BuildContext context, {
        required int maxOperations,
        required OperationMode operationMode,
        required PlayGroundState state,
      }) {
    final playGroundCubit = context.read<PlayGroundCubit>();
    return BlockWidget(
      fill: state.maxOperations == maxOperations,
      onTap: () {
        playGroundCubit.setOperations(maxOperations);
      },
      icon: _getIcon(operationMode),
      label: '$maxOperations',
    );
  }

  Widget _goToPlay(BuildContext context) {
    final playGroundCubit = context.read<PlayGroundCubit>();
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/playground',
            arguments: {
              'cubit': playGroundCubit,
            });
      },
      child: const H4(
        'Go to play',
        color: AppColors.backgroundColor,
        bold: true,
      ),
    );
  }

  SvgPicture _getIcon(OperationMode operationMode) {
    switch (operationMode) {
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

  _maxDigitsBox(BuildContext context, {required int maxDigits}) {
    final playGroundCubit = context.read<PlayGroundCubit>();
    final state = playGroundCubit.state;
    return BlockWidget(
      fill: state.maxDigits == maxDigits,
      onTap: () {
        playGroundCubit.setMaxDigits(maxDigits);

      },
      icon: AppIcons.percent,
      label: '$maxDigits',
    );
  }

  _withSound(BuildContext context) {
    final playGroundCubit = context.read<PlayGroundCubit>();

    return Center(
      child:  BlocBuilder<PlayGroundCubit, PlayGroundState>(
        builder:(context,state) => Wrap(
          spacing: 32,
          runSpacing: 32,
          children: [
            BlockWidget(
              fill: state.withVoice ,
              onTap: () {
                playGroundCubit.setVoice(true);
              },
              icon: SvgPicture.asset(
                'assets/icons/sound_min.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(!state.withVoice?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),

            BlockWidget(
              fill: !state.withVoice,
              onTap: () {
                playGroundCubit.setVoice(false);
              },
              icon: SvgPicture.asset(
                'assets/icons/sound_mute.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(state.withVoice?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _levelBox(BuildContext context) {
    final playGroundCubit = context.read<PlayGroundCubit>();

    return Center(
      child:  BlocBuilder<PlayGroundCubit, PlayGroundState>(
        builder:(context,state) => Wrap(
          spacing: 32,
          runSpacing: 32,
          children: [
            BlockWidget(
              fill: state.maxDigits == 1,
              onTap: () {
                playGroundCubit.setMaxDigits(1);
                playGroundCubit.setMinDigits(1);
              },
              icon: SvgPicture.asset(
                'assets/icons/level-two.svg',
                colorFilter: ColorFilter.mode(state.maxDigits != 1?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),
            BlockWidget(
              fill: state.maxDigits == 2,
              onTap: () {
                playGroundCubit.setMaxDigits(2);
                playGroundCubit.setMinDigits(1);
              },
              icon: SvgPicture.asset(
                'assets/icons/level-three.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(state.maxDigits != 2?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),
            BlockWidget(
              fill: state.maxDigits == 3,
              onTap: () {
                playGroundCubit.setMaxDigits(3);
                playGroundCubit.setMinDigits(1);
              },
              icon: SvgPicture.asset(
                'assets/icons/level-four.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(state.maxDigits != 3?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _hideWidget(BuildContext context) {
    final playGroundCubit = context.read<PlayGroundCubit>();

    return Center(
      child:  BlocBuilder<PlayGroundCubit, PlayGroundState>(
        builder:(context,state) => Wrap(
          spacing: 32,
          runSpacing: 32,
          children: [
            BlockWidget(
              fill: !state.hide ,
              onTap: () {
                playGroundCubit.setHide(false);

              },
              icon: SvgPicture.asset(
                'assets/icons/see.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(state.hide?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),

            BlockWidget(
              fill: state.hide,
              onTap: () {
                playGroundCubit.setHide(true);
                playGroundCubit.setVoice(true);
              },
              icon: SvgPicture.asset(
                'assets/icons/see-off.svg',
                semanticsLabel: 'Arithmetic Icon',
                colorFilter: ColorFilter.mode(!state.hide?AppColors.detailsColor: AppColors.backgroundColor, BlendMode.srcIn,),
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
