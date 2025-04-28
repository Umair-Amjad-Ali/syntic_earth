import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/dropdown_controller.dart';
import 'package:syntic_earth/views/widgets/bottom_sheet.dart';
import 'package:syntic_earth/views/widgets/button.dart';
import 'package:syntic_earth/views/widgets/map_screen.dart';

class BottomsheetProfileScreen extends StatelessWidget {
  BottomsheetProfileScreen({super.key});
  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(height: mediaQuery.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: dropdownController.toggleTilesContainer,

                            child: Container(
                              decoration: BoxDecoration(color: Colors.black),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.grid_view,
                                        color: Colors.tealAccent,
                                      ),
                                      Text(
                                        "20/750 Tiles Selected",
                                        style: TextStyle(
                                          color: Colors.tealAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    dropdownController
                                            .isDropdownOpenedTilesSelected
                                            .value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
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

                Obx(
                  () => Container(
                    width: mediaQuery.width * 0.4,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(color: const Color(0xff313150)),
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
                            offset: Offset(0, -10),
                            maxHeight: mediaQuery.height * 0.4,

                            width: mediaQuery.width * 0.4,
                            decoration: BoxDecoration(
                              color: const Color(0xff313150),
                            ),
                          ),
                          items:
                              dropdownController.resourcesList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(color: Colors.white),
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
                              Text(
                                dropdownController.resources.value.isEmpty
                                    ? 'Select item'
                                    : dropdownController.resources.value,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Icon(
                                dropdownController.isDropdownOpened.value
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
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
                                borderColor: Colors.cyanAccent,
                                text: "Details",
                                btnwidth: mediaQuery.width * 0.25,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Buttonwidget(
                                  // color: Colors.pinkAccent,
                                  borderColor: Colors.pinkAccent,
                                  text: "Clear Selection",
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: const Text(
                                  "T1",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: Colors.cyanAccent,
                                child: const Icon(
                                  Icons.flight_takeoff,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Min. Essence Text
                          const Text(
                            "Min. Essence",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // Min. Essence Value
                          Row(
                            children: [
                              const Icon(
                                Icons.diamond,
                                color: Colors.cyanAccent,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "193.2849",
                                style: const TextStyle(
                                  color: Colors.cyanAccent,
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
            SizedBox(height: mediaQuery.height * 0.7, child: MapScreen()),
            BottomSheetWidget(),
          ],
        ),
      ),
    );
  }
}
