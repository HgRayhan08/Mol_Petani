import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableSubmissionFarmerGroup extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  const TableSubmissionFarmerGroup({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
  });

  @override
  ConsumerState<TableSubmissionFarmerGroup> createState() =>
      _TableSubmissionFarmerGroupState();
}

class _TableSubmissionFarmerGroupState
    extends ConsumerState<TableSubmissionFarmerGroup> {
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
        title: 'Nik',
        field: 'nik',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Ketua Kelompok Tani',
        field: 'nama',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Nomor Telp',
        field: 'nomor',
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
        final data = rendererContext.cell.value as UserFarmerGroup;
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_rounded),
              onPressed: () async {
                ref.read(routerProvider).goNamed(
                      "submission-group",
                      extra: data,
                    );
                // if (reesult != null) {}
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
      future: widget.ref.watch(dataUserProvider.notifier).getallGrupFarmer(),
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
                'nik': PlutoCell(
                    value: e.value
                        .familyIdentificationNumber), // Assuming 'name' is a property in your data
                'nama': PlutoCell(value: e.value.leaderName),
                'nomor': PlutoCell(value: e.value.mobileNumber),
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
            // function pagination
            createFooter: (stateManager) {
              stateManager.setPageSize(20, notify: false); // default 40
              return PlutoPagination(stateManager);
            },
          );
        } else {
          return const Center(child: Text("Failed to load data"));
        }
      },
    );
  }
}