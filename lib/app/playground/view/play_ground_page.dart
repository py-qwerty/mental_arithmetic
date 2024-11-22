




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_arithmetic/app/playground/cubit/play_ground_state.dart';
import 'package:mental_arithmetic/app/theme/icons.dart';
import '../../theme/colors.dart';
import '../../theme/widgets/font_sizes_v2.dart';
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

  static Widget create({required PlayGroundCubit cubit}) {
    return MultiBlocProvider(
      providers:[
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: cubit.state.numericKeypadCubit),
      ], child: const PlayGroundPage(),
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
            title: Row(
              children: [
                BlocSelector<PlayGroundCubit, PlayGroundState, Duration>(
                  selector: (state) => state.elapse,
                    builder:(context, elapse) {
                      return Row(
                        children: [
                          _menuTitle(),
                          H4(' | ${elapse.inSeconds.remainder(60)}:${elapse.inMilliseconds.remainder(60)} ',
                            color: AppColors.backgroundColor,
                            bold: true,
                          ),
                        ],
                      );
                    }
                    ),
              ],
            ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // Custom icon
            onPressed: () {
              final playGroundCubit = context.read<PlayGroundCubit>();
              // Define custom back action
              context.read<PlayGroundCubit>().clear();
              context.read<PlayGroundCubit>().close();
              Navigator.of(context).pop();

            },
          ),

          ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _listDisplays(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    splashColor: AppColors.backgroundColor,
                    highlightColor: AppColors.backgroundColor,
                    enableFeedback: true,
                    onTap: () {
                      playGroundCubit.previousPage();
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 32, left: 32),
                        child: AppIcons.arrowLeft)),
                H2b('Solve',
                  bold: true,
                color: AppColors.detailsColor,
                onPressed: (){
                  playGroundCubit.solve(context, transitionTime: 400, waitingTime: 400, solve: true);
                },),
                InkWell(
                    splashColor: AppColors.backgroundColor,
                    highlightColor: AppColors.backgroundColor,
                    enableFeedback: true,
                    onTap: () {
                      playGroundCubit.solve(context, transitionTime: 400, waitingTime: 0, solve: false);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 32, left: 32),
                        child: AppIcons.arrowRight)),

              ],
            ),
            const SizedBox(height: 16),
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
            physics: const AlwaysScrollableScrollPhysics(),
            onPageChanged: (index) {
              context.read<PlayGroundCubit>().setCurrentPage(index);
              context.read<PlayGroundCubit>().speakTheOperation();
            },
            children: state.operations
                .map((display) => CustomDisplay.create(display))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _menuTitle() {
    return Row(
      children: [
        BlocSelector<PlayGroundCubit, PlayGroundState, int>(
          selector: (state) => state.maxOperations,
          builder:(context, maxOperations) =>BlocSelector<PlayGroundCubit, PlayGroundState, int>(
            selector: (state) => state.score,
            builder:(context, score) =>BlocSelector<PlayGroundCubit, PlayGroundState, int>(
              selector: (state) => state.currentPage,
              builder:(context, currentPage) => H4(
                '${(currentPage+1)
                }/$maxOperations | Score: $score',
                color: AppColors.backgroundColor,
                bold: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

}


