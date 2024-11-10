

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key, required this.onTap, required this.icon});

  final Function onTap;
  final SvgPicture icon;

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
        child: icon,
      ),
    );
  }
}
