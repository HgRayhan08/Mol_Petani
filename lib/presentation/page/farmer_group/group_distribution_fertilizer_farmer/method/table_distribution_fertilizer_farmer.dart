import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableDistributionFertilizerFarmer extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  const TableDistributionFertilizerFarmer({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
  });

  @override
  ConsumerState<TableDistributionFertilizerFarmer> createState() =>
      _TableDistributionFertilizerFarmerState();
}

class _TableDistributionFertilizerFarmerState
    extends ConsumerState<TableDistributionFertilizerFarmer> {
  late final PlutoGridStateManager stateManager;
  List<PlutoColumn> columns = [];
  late List<PlutoRow> rows;

  @override
  void initState() {
    super.initState();
    // Initialize columns
    columns = [
      PlutoColumn(
        title: 'No.',
        field: 'no',
        type: PlutoColumnType.number(),
        width: PlutoGridSettings.bodyMinWidth * 0.5,
      ),
      PlutoColumn(
        title: 'Nama',
        field: 'name',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Alamat',
        field: 'address',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Tahun',
        field: 'year',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
          title: 'Action',
          field: 'action',
          type: PlutoColumnType.text(),
          width: PlutoGridSettings.bodyMinWidth * 1.22,
          renderer: _buildRowAction),
    ];
  }

  Widget _buildRowAction(PlutoColumnRendererContext rendererContext) {
    return Consumer(
      builder: (context, ref, child) {
        final data = rendererContext.cell.value as UserFarmer;
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_rounded),
              onPressed: () {
                ref.read(routerProvider).pushNamed(
                      "accepted-farmer",
                      extra: data,
                    );
              },
            ),
            // IconButton(
            //   icon: const Icon(Icons.edit),
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Dialog(
            //           child: DistributorUpdateSendsPage(data),
            //         );
            //       },
            //     );
            //   },
            // ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.buildShowDialog(
                  berhasil: "Hapus",
                  onTapCancel: () {},
                  onTapSucces: () async {
                    setState(() {
                      rows.removeAt(rendererContext.rowIdx);
                    });
                    ref.read(routerProvider).pop();
                    await ref
                        .read(fertilizerSubmissionProvider.notifier)
                        .deleteSendFertilizer(idDocument: data.idDocument!);
                  },
                  judul: "Konfirmasi Hapus",
                  keterangan: "Apakah Anda yakin ingin menghapus item ini?",
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          widget.ref.watch(dataUserProvider.notifier).getMemberFarmerGroup(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text("No data available"));
        } else if (snapshot.hasData) {
          var data = snapshot.data!;

          rows = data.asMap().entries.map<PlutoRow>((e) {
            return PlutoRow(
              cells: {
                'no': PlutoCell(
                    value:
                        e.key + 1), // Assuming 'no' is a property in your data
                'name': PlutoCell(
                    value: e.value
                        .nik), // Assuming 'name' is a property in your data
                'address': PlutoCell(value: e.value.name),
                'year': PlutoCell(value: e.value.information),
                'action': PlutoCell(value: e.value),
              },
            );
          }).toList();

          return PlutoGrid(
            columns: columns,
            rows: rows,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              stateManager = event.stateManager;
              // stateManager.setShowColumnFilter(true);
            },
            onChanged: (PlutoGridOnChangedEvent event) {},
            configuration: PlutoGridConfiguration(
              columnFilter: PlutoGridColumnFilterConfig(
                filters: [],
                resolveDefaultColumnFilter: (column, resolver) {
                  if (column.field == 'name') {
                    return resolver<PlutoFilterTypeContains>()
                        as PlutoFilterType;
                  }
                  return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
                },
              ),
            ),
          );
        } else {
          return const Center(child: Text("Failed to load data"));
        }
      },
    );
  }
}
