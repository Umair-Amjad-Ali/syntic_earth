import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedSort = 'Tile Value Low'.obs;
  var selectedTileClass = '1'.obs;
  var selectedLandTier = 'Tier 1'.obs;
  var selectedCountry = Rxn<Country>();
  var resources = "Resources".obs;
  var isDropdownOpened = false.obs;
  var isDropdownOpenedTilesSelected = false.obs;
  final RxInt selectedDropdownIndex = (-1).obs;
  var isTilesContainerVisible = false.obs;

  void toggleTilesContainer() {
    isTilesContainerVisible.value = !isTilesContainerVisible.value;
    isDropdownOpenedTilesSelected.value = isTilesContainerVisible.value;
  }

  final Map<String, List<String>> tierWiseCountries = {
    'Tier 1': ['ZW', 'SK', 'RW', 'GQ', 'ZM'],
    'Tier 2': ['AO', 'SK', 'BW', 'GA', 'LK'],
    'Tier 3': ['IN', 'BD', 'KE', 'NG', 'PH', 'PK', 'ET', 'EG', 'VN', 'TH'],
    'Any': [],
  };

  void pickCountry(context, String selectedTier) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryFilter:
          selectedTier == 'Any' ? null : tierWiseCountries[selectedTier] ?? [],
      onSelect: (Country country) {
        selectedCountry.value = country;
      },
    );
  }

  // void pickCountry(context) {
  //   showCountryPicker(
  //     context: context,
  //     showPhoneCode: false,
  //     onSelect: (Country country) {
  //       selectedCountry.value = country;
  //     },
  //   );
  // }

  List<String> sortOptions = [
    'Tile Value Low',
    'Highest Net Worth',
    'Most Tiles',
    'Property Value Low',
  ];
  List<String> tileClasses = ['Any', '1', '2', '3', '4', '5'];
  List<String> landTiers = ['Any', 'Tier 1', 'Tier 2', 'Tier 3'];
  List<String> resourcesList = [
    "Bauxite",
    "Boron",
    "Chromium",
    "Coal",
    "Cobalt",
    "Copper",
    "Diamond",
    "Freshwater",
    "Gold",
    "Iridium",
    "Iron Ore",
    "Limestone",
    "Molybdenum",
    "Neodymium",
    "Nickel",
    "Niobium",
    "Oil",
    "Platinum",
    "Rhenium",
    "Sand",
    "Silver",
    "Tantalum",
    "Tellurium",
    "Thorium",
    "Tin",
    "Titanium",
    "Tungsten",
    "Uranium",
    "Vanadium",
    "Wood",
    "Zinc",
    "Zirconium",
  ];
}
