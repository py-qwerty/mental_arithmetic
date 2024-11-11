




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_state.dart';
import '../../theme/colors.dart';
import '../cubit/play_ground_cubit.dart';
import '../widgets/display/display.dart';
import '../widgets/numericKeyPad/numeric_keypad.dart';

class PlayGroundPage  extends StatelessWidget {
  const PlayGroundPage ({super.key});

  static const String route = '/playground';

  final mainMenuStyle = const TextStyle(
    fontSize: 24,
    color: AppColors.backgroundColor,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );

  static Widget create({required PlayGroundState playGroundState}){
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: PlayGroundCubit(playGroundState)),
        BlocProvider.value(value: playGroundState.numerickeypadCubit,)
      ],
      child: const PlayGroundPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //---------- generate displays ------------
    final playGroundCubit = context.read<PlayGroundCubit>();
    playGroundCubit.generateDisplays();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
            title: BlocBuilder<PlayGroundCubit, PlayGroundState>(
                builder:(context, state) =>
                    BlocSelector<PlayGroundCubit, PlayGroundState, PageController>(
                  selector: (state) => state.pageController,
                  builder:(context, page) => _menuTitle(state),
                ),),
          ),
        body:  Column(
          children: [
            _listDisplays(context),
            NumericKeyPad(
              onKeyPressed: (value){
                playGroundCubit.checkOperation(value, context: context);
              },
            ),
          ],
        ),
        )
      );
  }

  Widget _listDisplays(BuildContext context) {
    return BlocBuilder<PlayGroundCubit, PlayGroundState>(
      builder: (context, state) {
        return Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: state.pageController,
            physics: state.isPlaying? const NeverScrollableScrollPhysics(): const AlwaysScrollableScrollPhysics(),
            children: state.operations
                .map((display) => CustomDisplay.create(display))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _menuTitle(PlayGroundState state) {
    return Text(
      'Page: ${(state.pageController.page!= null?
      state.pageController.page!.round()+1: 0)
      }/${state.maxOperations} | Score: ${state.score}',
      style: mainMenuStyle,
    );
  }

}


