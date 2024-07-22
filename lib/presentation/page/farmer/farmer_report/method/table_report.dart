import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_report/farmer_detail_report_page.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableReport extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  const TableReport({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
  });

  @override
  ConsumerState<TableReport> createState() => _TableReportState();
}

class _TableReportState extends ConsumerState<TableReport> {
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
        field: 'nik',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Alamat',
        field: 'kelompokTani',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.1,
      ),
      PlutoColumn(
        title: 'Tahun',
        field: 'name',
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
        final data = rendererContext.cell.value as Report;
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_rounded),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(child: FarmerDetailReportPage(data));
                  },
                );
              },
            ),
            data.information != "terima"
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.buildShowDialog(
                        berhasil: "Hapus",
                        onTapCancel: () {},
                        onTapSucces: () async {},
                        judul: "Konfirmasi Tambae Member",
                        keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
                      );
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.ref
          .watch(reportProviderProvider.notifier)
          .getComplaintReport(),
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
                        .nameFarmer), // Assuming 'name' is a property in your data
                'kelompokTani': PlutoCell(value: e.value.farmerGroup),
                'name': PlutoCell(value: e.value.information),
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
