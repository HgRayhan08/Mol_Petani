import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class SubmissionFertilizerPplPage extends ConsumerStatefulWidget {
  const SubmissionFertilizerPplPage({super.key});

  @override
  ConsumerState<SubmissionFertilizerPplPage> createState() =>
      _SubmissionFertilizerPplPageState();
}

class _SubmissionFertilizerPplPageState
    extends ConsumerState<SubmissionFertilizerPplPage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pengajuan PPL"),
      ),
      body: FutureBuilder(
          future: ref.watch(dataUserProvider.notifier).getallDistributor(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            return Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: data!
                      .map((e) => DropdownMenuItem<String>(
                            value: e.name,
                            child: Text(
                              e.name,
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
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
