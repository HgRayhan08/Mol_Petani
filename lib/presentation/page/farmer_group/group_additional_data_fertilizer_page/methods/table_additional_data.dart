// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
// import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
// import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
// import 'package:mol_petani/presentation/page/farmer_group/group_detail_supporting_data/detail_supporting_data_page.dart';
// import 'package:mol_petani/presentation/provider/router/router_provider.dart';
// import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
// import 'package:pluto_grid/pluto_grid.dart';

// class TableAdditionalData extends ConsumerStatefulWidget {
//   final double width;
//   final double height;
//   final WidgetRef ref;
//   final DataSubmissionGroup data;
//   const TableAdditionalData(
//       {super.key,
//       required this.ref,
//       required this.width,
//       required this.height,
//       required this.data});

//   @override
//   ConsumerState<TableAdditionalData> createState() =>
//       _TableAdditionalDataState();
// }

// class _TableAdditionalDataState extends ConsumerState<TableAdditionalData> {
//   late final PlutoGridStateManager stateManager;
//   List<PlutoColumn> columns = [];
//   late List<PlutoRow> rows;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize columns
//     columns = [
//       PlutoColumn(
//         title: 'No.',
//         field: 'no',
//         type: PlutoColumnType.number(),
//         width: PlutoGridSettings.bodyMinWidth * 0.5,
//       ),
//       PlutoColumn(
//         title: 'Nik',
//         field: 'nik',
//         type: PlutoColumnType.text(),
//         width: PlutoGridSettings.bodyMinWidth * 1.6,
//       ),
//       PlutoColumn(
//         title: 'Nama Petani',
//         field: 'nama',
//         type: PlutoColumnType.text(),
//         width: PlutoGridSettings.bodyMinWidth * 1.6,
//       ),
//       PlutoColumn(
//         title: 'Luas Lahan',
//         field: 'luas',
//         type: PlutoColumnType.text(),
//         width: PlutoGridSettings.bodyMinWidth * 1.5,
//       ),
//       PlutoColumn(
//           title: 'Action',
//           field: 'action',
//           type: PlutoColumnType.text(),
//           width: PlutoGridSettings.bodyMinWidth * 1.2,
//           renderer: _buildRowAction),
//     ];
//   }

//   Widget _buildRowAction(PlutoColumnRendererContext rendererContext) {
//     return Consumer(
//       builder: (context, ref, child) {
//         final data = rendererContext.cell.value as SupportingDataFertilizer;
//         return Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.assignment_rounded),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Dialog(
//                       child: GroupDetailSupportingDataPage(data),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: widget.ref
//           .watch(fertilizerSubmissionProvider.notifier)
//           .getDataSubmisiionFarmer(
//             idKelompok: widget.data.idDocument.toString(),
//           ),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (!snapshot.hasData || snapshot.data == null) {
//           return const Center(child: Text("No data available"));
//         } else if (snapshot.hasData) {
//           var data = snapshot.data!;

//           rows = data.asMap().entries.map<PlutoRow>((e) {
//             return PlutoRow(
//               cells: {
//                 'no': PlutoCell(
//                     value:
//                         e.key + 1), // Assuming 'no' is a property in your data
//                 'nik': PlutoCell(
//                     value: e.value
//                         .nik), // Assuming 'name' is a property in your data
//                 'nama': PlutoCell(value: e.value.namaPetani),
//                 'luas': PlutoCell(value: e.value.luasLahan),
//                 'action': PlutoCell(value: e.value),
//               },
//             );
//           }).toList();

//           return PlutoGrid(
//             columns: columns,
//             rows: rows,
//             onLoaded: (PlutoGridOnLoadedEvent event) {
//               stateManager = event.stateManager;
//               // stateManager.setShowColumnFilter(true);
//             },
//             onChanged: (PlutoGridOnChangedEvent event) {},
//             configuration: PlutoGridConfiguration(
//               columnFilter: PlutoGridColumnFilterConfig(
//                 filters: [],
//                 resolveDefaultColumnFilter: (column, resolver) {
//                   if (column.field == 'name') {
//                     return resolver<PlutoFilterTypeContains>()
//                         as PlutoFilterType;
//                   }
//                   return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
//                 },
//               ),
//             ),
//           );
//         } else {
//           return const Center(child: Text("Failed to load data"));
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_supporting_data/detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_supporting_data/ppl_detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TableAdditionalData extends ConsumerStatefulWidget {
  final double width;
  final double height;
  final WidgetRef ref;
  final DataSubmissionGroup data;
  const TableAdditionalData({
    super.key,
    required this.ref,
    required this.width,
    required this.height,
    required this.data,
  });

  @override
  ConsumerState<TableAdditionalData> createState() =>
      _TableAdditionalDataState();
}

class _TableAdditionalDataState extends ConsumerState<TableAdditionalData> {
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
        width: PlutoGridSettings.bodyMinWidth * 0.46,
      ),
      PlutoColumn(
        title: 'Nik',
        field: 'nik',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.5,
      ),
      PlutoColumn(
        title: 'Nama Petani',
        field: 'nama',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.5,
      ),
      PlutoColumn(
        title: 'Luas Lahan',
        field: 'nomor',
        type: PlutoColumnType.text(),
        width: PlutoGridSettings.bodyMinWidth * 1.5,
      ),
      PlutoColumn(
          title: 'Action',
          field: 'action',
          type: PlutoColumnType.text(),
          width: PlutoGridSettings.bodyMinWidth * 1.5,
          renderer: _buildRowAction),
    ];
  }

  Widget _buildRowAction(PlutoColumnRendererContext rendererContext) {
    return Consumer(
      builder: (context, ref, child) {
        final data = rendererContext.cell.value as SupportingDataFertilizer;
        return Row(
          children: [
            IconButton(
                icon: const Icon(Icons.assignment_rounded),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: GroupDetailSupportingDataPage(data),
                      );
                    },
                  );
                }
                // IconButton(
                //   icon: const Icon(Icons.assignment_rounded),
                //   onPressed: () async {
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return Dialog(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(12.0)),
                //           child: PplDetailSupportingDataPage(data),
                //         );
                //       },
                //     );
                //     // context.getInheritedWidgetOfExactType("detail-submission-fertilizer", extra: data);
                //     // ref.read(routerProvider).goNamed(
                //     //       "detail-submission-fertilizer",
                //     //       extra: data,
                //     //     );
                //   },
                // ),
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
          .getDataSubmisiionFarmer(
            idKelompok: widget.data.idDocument.toString(),
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
                'no': PlutoCell(
                    value:
                        e.key + 1), // Assuming 'no' is a property in your data
                'nik': PlutoCell(
                    value: e.value
                        .nik), // Assuming 'name' is a property in your data
                'nama': PlutoCell(value: e.value.namaPetani),
                'nomor': PlutoCell(value: e.value.luasLahan),
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
