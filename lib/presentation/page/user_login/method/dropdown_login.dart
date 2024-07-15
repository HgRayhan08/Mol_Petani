import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownLogin extends ConsumerStatefulWidget {
  final double width;
  final double? wisthContainer;
  final double height;
  final String? selectedValue;
  final Function(String?)? onChanged;

  const DropdownLogin({
    Key? key,
    required this.width,
    required this.height,
    this.selectedValue,
    this.onChanged,
    this.wisthContainer = 140,
  }) : super(key: key);

  @override
  _DropdownLoginState createState() => _DropdownLoginState();
}

class _DropdownLoginState extends ConsumerState<DropdownLogin> {
  String? selectedValue;
  List<String> users = [
    "Penyuluh Pertanian Lapangan",
    "Kelompok Tani",
    "Distributor",
    "Petani"
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Pilih User',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: users
            .map((String user) => DropdownMenuItem<String>(
                  value: user,
                  child: Text(
                    user,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: widget.height * 0.06,
          width: widget.wisthContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          // maxHeight: widget.height * 0.5,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: widget.height * 0.08,
        ),
      ),
    );
  }
}
