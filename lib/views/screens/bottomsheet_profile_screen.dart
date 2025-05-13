import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/dropdown_controller.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/bottom_sheet.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/map_screen.dart';

class BottomsheetProfileScreen extends StatelessWidget {
  BottomsheetProfileScreen({super.key});
  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomFilterScreenAppbar(showIcon: false),
        backgroundColor: AppColors.bgColor,
        body: Column(
          children: [
            Row(
              children: [
                // Tiles Selector
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: dropdownController.toggleTilesContainer,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(color: AppColors.black),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Icon + Text (Wrapped in Flexible)
                                  Flexible(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.grid_view,
                                          color: AppColors.primaryColor,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 6),
                                        Flexible(
                                          child: Text(
                                            "20/750 Tiles Selected",
                                            style: const TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Dropdown Icon
                                  Icon(
                                    dropdownController
                                            .isDropdownOpenedTilesSelected
                                            .value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Dropdown
                Obx(
                  () => Container(
                    width: mediaQuery.width * 0.4,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 12,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          onMenuStateChange: (isOpen) {
                            dropdownController.isDropdownOpened.value = isOpen;
                          },
                          dropdownStyleData: DropdownStyleData(
                            isOverButton: false,
                            offset: const Offset(0, -10),
                            maxHeight: mediaQuery.height * 0.4,
                            width: mediaQuery.width * 0.4,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          items:
                              dropdownController.resourcesList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                          value:
                              dropdownController.resourcesList.contains(
                                    dropdownController.resources.value,
                                  )
                                  ? dropdownController.resources.value
                                  : null,
                          onChanged: (value) {
                            if (value != null) {
                              dropdownController.resources.value = value;
                              dropdownController.selectedDropdownIndex.value =
                                  -1;
                            }
                          },
                          customButton: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  dropdownController.resources.value.isEmpty
                                      ? 'Select item'
                                      : dropdownController.resources.value,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                dropdownController.isDropdownOpened.value
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Obx(() {
              return dropdownController.isTilesContainerVisible.value
                  ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Buttonwidget(
                                borderColor: AppColors.primaryColor,
                                text: "Details",
                                btnwidth: mediaQuery.width * 0.25,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Buttonwidget(
                                  borderColor: AppColors.alert,
                                  text: "Clear Selection",
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: AppColors.white,
                                child: const Text(
                                  "T1",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: Colors.cyanAccent,
                                child: const Icon(
                                  Icons.flight_takeoff,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Min. Essence",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.diamond,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "193.2849",
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  : SizedBox.shrink();
            }),

            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: MapScreen()),

                  DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    minChildSize: 0.1,
                    maxChildSize: 0.75,
                    builder: (context, scrollController) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: const BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: BottomSheetWidget(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
