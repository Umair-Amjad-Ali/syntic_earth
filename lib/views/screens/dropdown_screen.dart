import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntic_earth/controllers/dropdown_controller.dart';
import 'package:syntic_earth/views/screens/filtered_data_screen.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_filter_screen_appbar.dart';
import 'package:syntic_earth/views/widgets/custom_dropdown.dart';
import 'package:syntic_earth/views/widgets/textfield.dart';

class DropdownScreen extends StatelessWidget {
  DropdownScreen({super.key});

  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomFilterScreenAppbar(
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilteredDataScreen()),
          );
        },
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mediaQuery.height * 0.03),
            Container(
              color: Color(0xFF1B1C2B),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomDropdown(
                              label: "Sort By",
                              items: dropdownController.sortOptions,
                              value: dropdownController.selectedSort.value,
                              hint: "Sort By",
                              onChanged:
                                  (val) =>
                                      dropdownController.selectedSort.value =
                                          val!,
                              labelBuilder: (item) => item,
                            ),
                          ),
                        ),
                        SizedBox(width: mediaQuery.width * 0.03),
                        Expanded(
                          child: Obx(() {
                            final country =
                                dropdownController.selectedCountry.value;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filter by Country",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: mediaQuery.width * 0.03),
                                GestureDetector(
                                  onTap:
                                      () => dropdownController.pickCountry(
                                        context,
                                      ),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Color(0xff313150),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            country == null
                                                ? "Select Country"
                                                : "${country.flagEmoji} ${country.name}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQuery.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomDropdown(
                              label: "Filter by Tile Class",
                              items: dropdownController.tileClasses,
                              value: dropdownController.selectedTileClass.value,
                              hint: "Filter by Tile Class",
                              onChanged:
                                  (val) =>
                                      dropdownController
                                          .selectedTileClass
                                          .value = val!,
                              labelBuilder: (item) => item,
                            ),
                          ),
                        ),
                        SizedBox(width: mediaQuery.width * 0.03),
                        Expanded(
                          child: Obx(
                            () => CustomDropdown(
                              label: "Filter by Land Tier",
                              items: dropdownController.landTiers,
                              value: dropdownController.selectedLandTier.value,
                              hint: "Filter by Land Tier",
                              onChanged:
                                  (val) =>
                                      dropdownController
                                          .selectedLandTier
                                          .value = val!,
                              labelBuilder: (item) => item,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQuery.height * 0.03),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            // textAlign: TextAlign.start,
                            "Filter By Land Size",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        Inputfield(
                          hinttext: "Type...",
                          sufficon: Icon(Icons.search),
                          sufficoncolor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
