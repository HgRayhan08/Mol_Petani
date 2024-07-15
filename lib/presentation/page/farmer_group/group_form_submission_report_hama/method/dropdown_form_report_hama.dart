import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class DropdownFormReportHama extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final String? selectedValue;
  final Function(String?)? onChanged;

  const DropdownFormReportHama({
    Key? key,
    required this.width,
    required this.height,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _DropdownFormReportHamaState createState() => _DropdownFormReportHamaState();
}

class _DropdownFormReportHamaState
    extends ConsumerState<DropdownFormReportHama> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(dataUserProvider.notifier).getMemberFarmerGroup(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Material(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Pilih Petani',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: snapshot.data!
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.idUserFarmer,
                        child: ListTile(
                          title: Text(e.name),
                          subtitle: Text(e.nik),
                        ),
                      ),
                    )
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
                  height: widget.height * 0.08,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: widget.height * 0.5,
                  width: widget.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
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
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
