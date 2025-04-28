import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final String label;
  final void Function(T?) onChanged;
  final String Function(T) labelBuilder;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.labelBuilder,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: mediaQuery.height * 0.01),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xff313150),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              borderRadius: BorderRadius.circular(8),
              dropdownColor: Color(0xff313150),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              value: value,
              onChanged: onChanged,
              items:
                  items.map((T item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        labelBuilder(item),
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
