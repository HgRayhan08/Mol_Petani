import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_main_page/main_farmer_page.dart';
import 'package:mol_petani/presentation/page/all_news.dart/news_page.dart';
import 'package:mol_petani/presentation/page/all_news_web_view/news_web_view_page.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/distribution_detail_send_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/distributor_forms_sends_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_history_sends_fertilizer/distribution_history_send_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_report/farmer_report_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_history_accepted_kuota_fertilizer/group_history_accepted_kuota_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/gagal/gagal_distributor_history_submission_kuota/distributor_history_submission_kuota_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_update_sends/ditributor_update_sends.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_create_report/farmer_create_report_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_accepted_fertilizer/farmer_detail_accepted_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_report/farmer_detail_report_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_form_acception_fertilizer/farmer_form_acception_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribusi_kuota_fertilizer_farmer/group_distibution_kuota_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_accepted_kuota_fertilizer/group_accepted_kuota_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/group_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/group_detail_acception_kuota_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_data_farmer/group_detail_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/group_detail_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_member_farmer_group/group_detail_member_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_pest_report/group_detail_pest_report_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/group_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_distribution_fertilizer_farmer/group_form_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_acception_fertilizer_received/group_forms_acception_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/group_form_report_hama_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_history_submission_report/group_history_submission_report_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_member_farmer_group/group_member_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_register_account_farmer/group_register_account_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_report_hama/group_report_hama_page.dart';
import 'package:mol_petani/presentation/page/maps/maps_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_supporting_data/detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_farmer_supporting_data/group_form_farmer_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_history_submission_fertilizer_group/group_history_submission_fertizer_group_page.dart';

import 'package:mol_petani/presentation/page/gagal/data_submission_farmer/data_submission_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_additional_data_fertilizer_page/group_additional_data_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/all_loading_page/loading_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_data_farmer/ppl_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/ppl_detail_complaint_report_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_data_farmer/ppl_detail_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_distributor/ppl_detail_distributor_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_farmer_grup/ppl_detail_farmer_grup_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/ppl_detail_monitoring_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_pest_reporting/ppl_detail_pest_reporting_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_submission_group/ppl_detail_submission_group_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_supporting_data/ppl_detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_distributor_data/ppl_distributor_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_farmer_grup_data/ppl_farmer_grup_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_form_maps_farmer/ppl_form_maps_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_pest_report/ppl_history_pest_report_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_report_complaint/ppl_history_report_complaint_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_main_page/main_ppl_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring/ppl_monitoring_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring_farmer_group/ppl_monitoring_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/ppl_register_distributor_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer/ppl_register_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer_grup/register_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/ppl_submission_data_fertilizer_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_group/ppl_submision_group_page.dart';
import 'package:mol_petani/presentation/page/user_login/user_login_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_main_page/main_distributot_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_main_page/main_kelompok_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_group/group_form_submission_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/group_submission_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/page/gagal/submission_fertilizer_ppl/submission_fertilizer_ppl_page.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: "/loading",
        name: "loading",
        builder: (context, state) => const LoadingPage(),
      ),
      GoRoute(
        path: "/user-login",
        name: "user-login",
        builder: (context, state) => UserLoginPage(),
      ),
      GoRoute(
        path: "/news",
        name: "news",
        builder: (context, state) => const Newspage(),
      ),
      GoRoute(
        path: "/news-web",
        name: "news-web",
        builder: (context, state) => NewsWebViewPage(state.extra as String),
      ),

      // home penyuluh pertanian lapangan
      GoRoute(
        path: "/main-ppl",
        name: "main-ppl",
        builder: (context, state) => const MainPplPage(),
        routes: [
          GoRoute(
            path: "data-distributor",
            name: "data-distributor",
            builder: (context, state) => const PplDistributorDataPage(),
          ),
          GoRoute(
            path: "regis-distributor",
            name: "regis-distributor",
            builder: (context, state) => PplRegisterDistributorPage(),
          ),
          GoRoute(
            path: "regis-kelompok",
            name: "regis-kelompok",
            builder: (context, state) => PplRegisterGrupFarmerPage(),
          ),
          GoRoute(
            path: "regis-farmer",
            name: "regis-farmer",
            builder: (context, state) => const PplRegisterFarmer(),
          ),
          GoRoute(
            path: "data-grup-farmer",
            name: "data-grup-farmer",
            builder: (context, state) => const PplFarmerGrupDataPage(),
          ),
          GoRoute(
            path: "collection-submission-group",
            name: "collection-submission-group",
            builder: (context, state) =>
                const PplSubmissionDataFertilizerFarmerGroupPage(),
          ),
          GoRoute(
            path: "submission-group",
            name: "submission-group",
            builder: (context, state) => PplSubmissionGroupPage(
              state.extra as UserFarmerGroup,
            ),
          ),
          GoRoute(
            path: "detail-distributor",
            name: "detail-distributor",
            builder: (context, state) => PplDetailDistributorPage(
              state.extra as UserDistrubutor,
            ),
          ),
          GoRoute(
            path: "detail-farmer-group",
            name: "detail-farmer-group",
            builder: (context, state) => PplDetailFarmerGroupPage(
              state.extra as UserFarmerGroup,
            ),
          ),
          GoRoute(
              path: "detail-submission-fertilizer",
              name: "detail-submission-fertilizer",
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>;
                final data = extra['data'] as DataSubmissionGroup;
                final user = extra['user'] as UserFarmerGroup;
                return PplDetailSubmissionGroup(data, user);
              }
              // PplDetailSubmissionGroup(state.extra as DataSubmissionGroup),
              ),
          GoRoute(
            path: "detail-supporting-submission",
            name: "detail-supporting-submission",
            builder: (context, state) => PplDetailSupportingDataPage(
                state.extra as SupportingDataFertilizer),
          ),
          GoRoute(
            path: "data-farmer-ppl",
            name: "data-farmer-ppl",
            builder: (context, state) => const PplDataFarmer(),
          ),
          GoRoute(
            path: "maps-page",
            name: "maps-page",
            builder: (context, state) => const MapsPage(),
          ),
          GoRoute(
            path: "monitoring-page",
            name: "monitoring-page",
            builder: (context, state) => const PplMonitoringPage(),
          ),
          GoRoute(
            path: "monitoring-group",
            name: "monitoring-group",
            builder: (context, state) =>
                PplMonitoringFarmerGroupPage(state.extra as UserFarmerGroup),
          ),
          GoRoute(
            path: "detail-monitoring-group",
            name: "detail-monitoring-group",
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final data = extra['data'] as SubmissionKuotaFertilizer;
              final user = extra['user'] as UserFarmerGroup;
              return PplDetailMonitoringFarmerGroupPage(data, user);
            },
          ),
          GoRoute(
            path: "ppl-detail-farmer",
            name: "ppl-detail-farmer",
            builder: (context, state) => PplDetailDataFarmerPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "ppl-form-maps",
            name: "ppl-form-maps",
            builder: (context, state) => PplFormMapsFarmerPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "ppl-detail-complaint-reporting",
            name: "ppl-detail-complaint-reporting",
            builder: (context, state) => PplDetailComplaintReportPage(
              state.extra as Report,
            ),
          ),
          GoRoute(
            path: "ppl-detail-pest-reporting",
            name: "ppl-detail-pest-reporting",
            builder: (context, state) => PplDetailPestReportingPage(
              state.extra as PestReport,
            ),
          ),
          GoRoute(
            path: "ppl-history-pest-reporting",
            name: "ppl-history-pest-reporting",
            builder: (context, state) => PplHistoryPestReportPage(),
          ),
          GoRoute(
            path: "ppl-history-report-complaint",
            name: "ppl-history-report-complaint",
            builder: (context, state) => PplHistoryReportComplaint(),
          ),
        ],
      ),
      // end ppl

      // home farmer group
      GoRoute(
        path: "/main-kelompok",
        name: "main-kelompok",
        builder: (context, state) => const MainKelompokPage(),
        routes: [
          GoRoute(
            path: "create-submission-grup",
            name: "create-submission-grup",
            builder: (context, state) => const GroupFormSubmissionGroupPage(),
          ),
          GoRoute(
            path: "create-submission-farmer",
            name: "create-submission-farmer",
            builder: (context, state)
                // {
                //   final extra = state.extra as Map<String, dynamic>;
                //   final data = extra['data'] as DataSubmissionGroup;
                //   final user = extra['user'] as UserFarmerGroup;
                //   return GroupFormSubmissionFarmerSupportingDataPage(data, user);
                // }
                =>
                GroupFormSubmissionFarmerSupportingDataPage(
              state.extra as DataSubmissionGroup,
            ),
          ),
          GoRoute(
            path: "submission-fertilizer-group",
            name: "submission-fertilizer-group",
            builder: (context, state) => const GroupSubmissionFertilizerGroup(),
          ),
          GoRoute(
            path: "detail-submission-grup",
            name: "detail-submission-grup",
            builder: (context, state) => GroupAdditionalFertilizerPage(
              state.extra as DataSubmissionGroup,
            ),
          ),
          GoRoute(
            path: "detail-supporting-grup",
            name: "detail-supporting-grup",
            builder: (context, state) => GroupDetailSupportingDataPage(
                state.extra as SupportingDataFertilizer),
          ),
          GoRoute(
            path: "history-submission-grup",
            name: "history-submission-grup",
            builder: (context, state) =>
                const GroupHistorySubmissionFertilizerPage(),
          ),
          GoRoute(
            path: "accepted-fertilizer-grup",
            name: "accepted-fertilizer-grup",
            builder: (context, state) =>
                const GroupAcceptedKuotaFertilizerPage(),
          ),
          GoRoute(
            path: "history-accepted-grup",
            name: "history-accepted-grup",
            builder: (context, state) =>
                const GroupHistoryAcceptedKuotaFertilizerPage(),
          ),
          GoRoute(
            path: "detail-accepted-grup",
            name: "detail-accepted-grup",
            builder: (context, state) => GroupDetailAcceptedKuotaPage(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "forms-acception-group",
            name: "forms-acception-group",
            builder: (context, state) => GroupFormsAcceptionFertilizerPage(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "data-farmer",
            name: "data-farmer",
            builder: (context, state) => const GroupDataFarmerpage(),
          ),
          GoRoute(
            path: "detail-data-farmer",
            name: "detail-data-farmer",
            builder: (context, state) => GroupDetailDataFarmerPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "detail-member-group",
            name: "detail-member-group",
            builder: (context, state) => GroupDetailMemberFarmerGroupPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "member-farmer-group",
            name: "member-farmer-group",
            builder: (context, state) => const GroupMemberFarmerGroupPage(),
          ),
          GoRoute(
            path: "register-account-farmer",
            name: "register-account-farmer",
            builder: (context, state) => GroupRegisterAccountFarmerPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "accepted-farmer",
            name: "accepted-farmer",
            builder: (context, state) =>
                GroupDistributionKuotaFertilizerFarmerpage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "form_distribution-farmer",
            name: "form_distribution-farmer",
            builder: (context, state) =>
                GroupFormDistributionFertilizerFarmerPage(
              state.extra as UserFarmer,
            ),
          ),
          GoRoute(
            path: "detail-distribution-fertilizer-farmer",
            name: "detail-distribution-fertilizer-farmer",
            builder: (context, state) =>
                GroupDetailDistributionFertilizerFarmerPage(
              state.extra as DistributionFertilizerFarmer,
            ),
          ),
          GoRoute(
            path: "report-hama",
            name: "report-hama",
            builder: (context, state) => GroupReportHamaPage(),
          ),
          GoRoute(
            path: "form-report-hama",
            name: "form-report-hama",
            builder: (context, state) => GroupFormReportHamaPage(),
          ),
          GoRoute(
            path: "group-detail-submission-reporting",
            name: "group-detail-submission-reporting",
            builder: (context, state) => GroupDetailPestReportPage(
              state.extra as PestReport,
            ),
          ),
          // GoRoute(
          //   path: "group-history-submission-reporting",
          //   name: "group-history-submission-reporting",
          //   builder: (context, state) => GroupHistorySubmissionReportPage(),
          // ),
        ],
      ),
      // end Group Farmer

      // Home distributor
      GoRoute(
        path: "/main-dist",
        name: "main-dist",
        builder: (context, state) => const MainDistributorPage(),
        routes: [
          // GoRoute(
          //   path: "detail-submission-fertilzer",
          //   name: "detail-submission-fertilzer",
          //   builder: (context, state) => DistributorDetailKuotaFertilizerPage(
          //       state.extra as SubmissionKuotaFertilizer),
          // ),
          GoRoute(
            path: "forms-sends-fertilizer",
            name: "forms-sends-fertilizer",
            builder: (context, state) => const DistributorFormsSendsPage(),
          ),
          GoRoute(
            path: "distributor-history-kuota",
            name: "distributor-history-kuota",
            builder: (context, state) =>
                const DistributorHistorySubissionKuotaPage(),
          ),
          // GoRoute(
          //   path: "detail-distributor-history",
          //   name: "detail-distributor-history",
          //   builder: (context, state) => DistributorDetailHistoryKuotaPage(
          //     state.extra as SubmissionKuotaFertilizer,
          //   ),
          // ),
          GoRoute(
            path: "detail-send-fertilizer",
            name: "detail-send-fertilizer",
            builder: (context, state) => DistributionDetailSendFertilizerPage(
              state.extra as SubmissionKuotaFertilizer,
            ),
          ),
          GoRoute(
            path: "update-send-fertilizer",
            name: "update-send-fertilizer",
            builder: (context, state) => DistributorUpdateSendsPage(
              state.extra as String,
            ),
          ),
          GoRoute(
            path: "distributor-history-sends",
            name: "distributor-history-sends",
            builder: (context, state) =>
                const DistributionHistorySendFertilizerPage(),
          ),
        ],
      ),
      // End Distrinutor
      // home farmer
      GoRoute(
        path: "/main-farmer",
        name: "main-farmer",
        builder: (context, state) => const MainFarmerPage(),
        routes: [
          GoRoute(
            path: "farmer-create-report",
            name: "farmer-create-report",
            builder: (context, state) => const FarmerCreateReportPage(),
          ),
          GoRoute(
            path: "farmer-detail-accepted",
            name: "farmer-detail-accepted",
            builder: (context, state) => FarmerDetailAcceptedFertilizerPage(
              state.extra as DistributionFertilizerFarmer,
            ),
          ),
          GoRoute(
            path: "form-farmer-accepted",
            name: "form-farmer-accepted",
            builder: (context, state) => FarmerFormAcceptionFertilizerPage(
              state.extra as DistributionFertilizerFarmer,
            ),
          ),
          GoRoute(
            path: "farmer-report",
            name: "farmer-report",
            builder: (context, state) => FarmerReportPage(),
          ),
          GoRoute(
            path: "farmer-detail-complaint-reporting",
            name: "farmer-detail-complaint-reporting",
            builder: (context, state) => FarmerDetailReportPage(
              state.extra as Report,
            ),
          ),
        ],
      ),
      // end Farmer

      // GoRoute(
      //   path: "/data-submission-farmer",
      //   name: "data-submission-farmer",
      //   builder: (context, state) => DataSubmissionFarmer(
      //     state.extra as DataSubmissionGroup,
      //   ),
      // ),
      // GoRoute(
      //   path: "/all-submission-grup",
      //   name: "all-submission-grup",
      //   builder: (context, state) => const PplSubmissionFertilizerGroupPage(),
      // ),
      // GoRoute(
      //   path: "/detail-fertilizer-farmer",
      //   name: "detail-fertilizer-farmer",
      //   builder: (context, state) => DetailDataFertilizerFarmerPage(
      //     state.extra as SupportingDataFertilizer,
      //   ),
      // ),
      // GoRoute(
      //   path: "/submission-fertilizer-ppl",
      //   name: "submission-fertilizer-ppl",
      //   builder: (context, state) => const SubmissionFertilizerPplPage(),
      // ),
    ], initialLocation: "/loading", debugLogDiagnostics: false);
