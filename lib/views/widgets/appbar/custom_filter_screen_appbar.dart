import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class CustomFilterScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showIcon;
  final VoidCallback? ontap;
  const CustomFilterScreenAppbar({super.key, this.showIcon = true, this.ontap});

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      color: AppColors.filterbgColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Inputfield(
                  hinttext: "Search",
                  sufficon: Icon(Icons.search),
                  sufficoncolor: AppColors.white,
                ),
              ),
              SizedBox(width: mediaQuery.width * 0.01),
              if (showIcon) ...[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    color: AppColors.white,
                    icon: const Icon(Icons.keyboard_arrow_up),
                    onPressed:
                        ontap, // You can handle collapse/filter hide here
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
