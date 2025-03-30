import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/core/objects/drop_down_item.dart';

class CommonDropDown extends StatelessWidget {
  final List<DropDownItem> itemList;
  final String selectedValue;
  final Function(String) onChanged;

  const CommonDropDown({
    super.key,
    required this.itemList,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        onChanged: (newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        underline: Container(), // remove underline
        items: itemList.map((item) {
          return DropdownMenuItem<String>(
            value: item.itemTitle,
            child: Row(
              children: [
                Icon(item.itemIcon, size: 20),
                const SizedBox(width: 10.0),
                CommonText(
                  textTitle: item.itemTitle,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
