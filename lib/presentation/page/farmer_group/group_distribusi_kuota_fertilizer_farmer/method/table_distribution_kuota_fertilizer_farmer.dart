import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/group_detail_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableDistributionKuotaFertilizerFarmer extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  final UserFarmer user;
  const TableDistributionKuotaFertilizerFarmer({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
    required this.user,
  });

  @override
  ConsumerState<TableDistributionKuotaFertilizerFarmer> createState() =>
      _TableDistributionKuotaFertilizerFarmerState();
}

class _TableDistributionKuotaFertilizerFarmerState
    extends ConsumerState<TableDistributionKuotaFertilizerFarmer> {
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
        width: PlutoGridSettings.bodyMinWidth * 0.35,
      ),
      PlutoColumn(
        title: 'Nama',
        field: 'nama',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.4,
      ),
      PlutoColumn(
        title: 'Distribusi',
        field: 'distribusi',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
        title: 'Tahun',
        field: 'tahun',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
        title: 'Nomor Telp',
        field: 'tanggal',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.3,
      ),
      PlutoColumn(
          title: 'Action',
          field: 'action',
          type: PlutoColumnType.text(),
          width: PlutoGridSettings.bodyMinWidth * 0.8,
          renderer: _buildRowAction),
    ];
  }

  Widget _buildRowAction(PlutoColumnRendererContext rendererContext) {
    return Consumer(
      builder: (context, ref, child) {
        final data = rendererContext.cell.value as DistributionFertilizerFarmer;
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_rounded),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: GroupDetailDistributionFertilizerFarmerPage(data),
                    );
                  },
                );
              },
            ),
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
      future: widget.ref
          .watch(fertilizerSubmissionProvider.notifier)
          .getSendFertilizerFarmer(idFarmer: widget.user.idUserFarmer),
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
                'nama': PlutoCell(
                    value: e.value
                        .farmerName), // Assuming 'name' is a property in your data
                'distribusi': PlutoCell(value: e.value.distribution),
                'tahun': PlutoCell(value: e.value.distribution),
                'tanggal': PlutoCell(value: e.value.distribusiDate),
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
