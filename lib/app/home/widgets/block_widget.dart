

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key, required this.onTap,
    required this.icon,
    this.label});

  final Function onTap;
  final SvgPicture icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.detailsColor  ,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
            child: label!= null && label!.isNotEmpty? Text(
              label??'',
              style: const TextStyle(
                color: AppColors.backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ):icon),
      ),
    );
  }
}
