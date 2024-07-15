import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/ppl_detail_monitoring_farmer_group_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableMonitoringFarmerGroup extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  final UserFarmerGroup user;
  const TableMonitoringFarmerGroup({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
    required this.user,
  });

  @override
  ConsumerState<TableMonitoringFarmerGroup> createState() =>
      _TableMonitoringFarmerGroupState();
}

class _TableMonitoringFarmerGroupState
    extends ConsumerState<TableMonitoringFarmerGroup> {
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
        width: PlutoGridSettings.bodyMinWidth * 0.36,
      ),
      PlutoColumn(
        title: 'Kelompok Tani',
        field: 'year',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
        title: 'Ketua Kelompok Tani',
        field: 'nama',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
        title: 'Distributor',
        field: 'distributor',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
        title: 'Pengiriman',
        field: 'send',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.2,
      ),
      PlutoColumn(
          title: 'Action',
          field: 'action',
          type: PlutoColumnType.text(),
          width: PlutoGridSettings.bodyMinWidth * 1,
          renderer: _buildRowAction),
    ];
  }

  Widget _buildRowAction(PlutoColumnRendererContext rendererContext) {
    return Consumer(
      builder: (context, ref, child) {
        final data = rendererContext.cell.value as SubmissionKuotaFertilizer;
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_rounded),
              onPressed: () async {
                // context.getInheritedWidgetOfExactType("detail-submission-fertilizer", extra: data);
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:
                          PplDetailMonitoringFarmerGroupPage(data, widget.user),
                    );
                  },
                );
                setState(() {});
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
      future: widget.ref
          .watch(fertilizerSubmissionProvider.notifier)
          .dataMonitoring(
            idGroupFarmer: widget.user.uid,
          ),
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
                'no': PlutoCell(value: e.key + 1),
                'year': PlutoCell(value: e.value.year),
                'nama': PlutoCell(value: e.value.leaderName),
                'distributor': PlutoCell(value: e.value.nameDistributor),
                'send': PlutoCell(value: e.value.sendDate),
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
