

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    super.key, required this.onTap,
    this.icon,
    this.label,
    this.fill = true,
    this.alternativeIcon = const Icon(Icons.add),});

  final Function onTap;
  final bool fill;
  final SvgPicture? icon;
  final Icon alternativeIcon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: fill?AppColors.detailsColor: AppColors.backgroundColor,
          border: Border.all(
            color: AppColors.detailsColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.detailsColor,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
            child: label!= null && label!.isNotEmpty? Text(
              label??'',
              style: TextStyle(
                color: !fill? AppColors.detailsColor:AppColors.backgroundColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ):icon ?? alternativeIcon,),
      ),
    );
  }
}
