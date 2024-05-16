import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/page/all_home_page/home_farmer_page.dart';
import 'package:mol_petani/presentation/page/all_main_page/main_farmer_page.dart';
import 'package:mol_petani/presentation/page/all_news.dart/news_page.dart';
import 'package:mol_petani/presentation/page/all_news_web_view/news_web_view_page.dart';
import 'package:mol_petani/presentation/page/distributor_detail_history_submission_kuota/distributor_detail_history_kuota_page.dart';
import 'package:mol_petani/presentation/page/distributor_detail_kuota_fertilizer/distriutor_detail_kuota_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/distributor_forms_sends_fertilizer/distributor_forms_sends_page.dart';
import 'package:mol_petani/presentation/page/distributor_history_submission_kuota/distributor_history_submission_kuota_page.dart';
import 'package:mol_petani/presentation/page/distributor_submission_kuota/distributor_submission_kuoata_page.dart';
import 'package:mol_petani/presentation/page/farmer_create_report/farmer_create_report_page.dart';
import 'package:mol_petani/presentation/page/farmer_report/farmer_report_page.dart';
import 'package:mol_petani/presentation/page/group_accepted_kuota_fertilizer/group_accepted_kuota_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/group_data_farmer/group_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/group_detail_accepted_kuota/group_detail_accepted_kuota_page.dart';
import 'package:mol_petani/presentation/page/group_detail_data_farmer/group_detail_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/group_detail_member_farmer_group/group_detail_member_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/group_form_fertilizer_received/group_forms_received_page.dart';
import 'package:mol_petani/presentation/page/group_forms_data_farmer/group_forms_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/group_member_farmer_group/group_member_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/group_register_account_farmer/group_register_account_farmer_page.dart';
import 'package:mol_petani/presentation/page/all_detail_complaint_report/ppl_detail_complaint_report_page.dart';
import 'package:mol_petani/presentation/page/ppl_detail_monitoring_fertilizer/ppl_detail_monitoring_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/ppl_detail_submission_fertilizer_group/ppl_detail_submission_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl_detail_supporting_data/ppl_detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_detail_information/ppl_monitoring_group_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_detail_information/ppl_monitorinng_distributor_page.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_distribusi_fertilizer/ppl_monitoring_distribusi_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_fertilizer_group/ppl_monitoring_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_detail_information/ppl_monitoring_ppl_page.dart';
import 'package:mol_petani/presentation/page/ppl_submission_fertilizer_group/ppl_submission_fertlizer_goup_page.dart';
import 'package:mol_petani/presentation/page/group_detail_supporting_data/detail_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/group_form_submission_farmer_supporting_data/group_form_farmer_supporting_data_page.dart';
import 'package:mol_petani/presentation/page/ppl_forms_submission_kuota_fertilizer/ppl_form_submission_kuota_page.dart';
import 'package:mol_petani/presentation/page/group_history_submission_fertilizer_group/group_history_submission_fertizer_group_page.dart';
import 'package:mol_petani/presentation/page/ppl_detail_distributor/ppl_detail_distributor_page.dart';
import 'package:mol_petani/presentation/page/ppl_detail_farmer_grup/ppl_detail_farmer_grup_page.dart';
import 'package:mol_petani/presentation/page/ppl_distributor_data/ppl_distributor_data_page.dart';
import 'package:mol_petani/presentation/page/ppl_farmer_grup_data/ppl_farmer_grup_data_page.dart';
import 'package:mol_petani/presentation/page/data_submission_farmer/data_submission_farmer.dart';
import 'package:mol_petani/presentation/page/group_detail_submission_fertilizer_group/grup_detail_submission_fertilizer_grup_page.dart';
import 'package:mol_petani/presentation/page/all_loading_page/loading_page.dart';
import 'package:mol_petani/presentation/page/all_login_page/login_distributor_page.dart';
import 'package:mol_petani/presentation/page/all_login_page/login_kelompok_page.dart';
import 'package:mol_petani/presentation/page/farmer_login/login_petani_page.dart';
import 'package:mol_petani/presentation/page/all_login_page/login_ppl_page.dart';
import 'package:mol_petani/presentation/page/all_main_page/main_distributot_page.dart';
import 'package:mol_petani/presentation/page/all_main_page/main_kelompok_page.dart';
import 'package:mol_petani/presentation/page/all_main_page/main_ppl_page.dart';
import 'package:mol_petani/presentation/page/ppl_register_distributor/ppl_register_distributor_page.dart';
import 'package:mol_petani/presentation/page/ppl_register_farmer_grup/register_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/group_form_submission_group/group_form_submission_group_page.dart';
import 'package:mol_petani/presentation/page/group_submisson_fertilizer_group/group_submission_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/page/submission_fertilizer_ppl/submission_fertilizer_ppl_page.dart';
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
        path: "/login-ppl",
        name: "login-ppl",
        builder: (context, state) => LoginPplPage(),
      ),
      GoRoute(
        path: "/login-petani",
        name: "login-petani",
        builder: (context, state) => LoginPetaniPage(),
      ),
      GoRoute(
        path: "/login-kelompok",
        name: "login-kelompok",
        builder: (context, state) => LoginKelompokPage(),
      ),
      GoRoute(
        path: "/login-dis",
        name: "login-dis",
        builder: (context, state) => LoginDistributorPage(),
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
            builder: (context, state) => RegisterGrupFarmerPage(),
          ),
          GoRoute(
            path: "data-grup-farmer",
            name: "data-grup-farmer",
            builder: (context, state) => const PplFarmerGrupDataPage(),
          ),
          GoRoute(
            path: "forms-kuota-farmer",
            name: "forms-kuota-farmer",
            builder: (context, state) => PplFormsSubmissionKuotaPage(
              state.extra as DataSubmissionGroup,
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
            builder: (context, state) => PplDetailSubmissionFertilizerGroup(
                state.extra as DataSubmissionGroup),
          ),
          GoRoute(
            path: "detail-supporting-submission",
            name: "detail-supporting-submission",
            builder: (context, state) => PplDetailSupportingDataPage(
                state.extra as SupportingDataFertilizer),
          ),
          GoRoute(
            path: "monitoring-fertilizer-group",
            name: "monitoring-fertilizer-group",
            builder: (context, state) =>
                const PplMonitoringFertilizerGroupPage(),
          ),
          GoRoute(
            path: "detail-monitoring-fertilizer",
            name: "detail-monitoring-fertilizer",
            builder: (context, state) =>
                const PplDetailMonitorinngFertilizerPage(),
          ),
          GoRoute(
            path: "monitoring-distribusi-fertilizer",
            name: "monitoring-distribusi-fertilizer",
            builder: (context, state) => PplMonitoringDistribusiFertilizer(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "monitoring-submission-ppl",
            name: "monitoring-submission-ppl",
            builder: (context, state) => PplMonitoringSubmissionPpl(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "monitoring-submission-group",
            name: "monitoring-submission-group",
            builder: (context, state) => PplMonitoringSubmissionGroupFarmer(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "monitoring-submission-distributor",
            name: "monitoring-submission-distributor",
            builder: (context, state) => PplMonitoringSubmissionDistributor(
                state.extra as SubmissionKuotaFertilizer),
          ),
          GoRoute(
            path: "detail-complaint",
            name: "detail-complaint",
            builder: (context, state) => PplDetailComplaintReportPage(
              state.extra as Report,
            ),
          )
        ],
      ),

      // Home distributor
      GoRoute(
          path: "/main-dist",
          name: "main-dist",
          builder: (context, state) => const MainDistributorPage(),
          routes: [
            GoRoute(
              path: "distributor-submission-fertilzer",
              name: "distributor-submission-fertilzer",
              builder: (context, state) =>
                  const DistributorSubmissionKuotaPage(),
            ),
            GoRoute(
              path: "detail-submission-fertilzer",
              name: "detail-submission-fertilzer",
              builder: (context, state) => DistributorDetailKuotaFertilizerPage(
                  state.extra as SubmissionKuotaFertilizer),
            ),
            GoRoute(
              path: "forms-sends-fertilizer",
              name: "forms-sends-fertilizer",
              builder: (context, state) => DistributorFormsSendsPage(
                  state.extra as SubmissionKuotaFertilizer),
            ),
            GoRoute(
              path: "distributor-history-kuota",
              name: "distributor-history-kuota",
              builder: (context, state) =>
                  const DistributorHistorySubissionKuotaPage(),
            ),
            GoRoute(
              path: "detail-distributor-history",
              name: "detail-distributor-history",
              builder: (context, state) => DistributorDetailHistoryKuotaPage(
                state.extra as SubmissionKuotaFertilizer,
              ),
            ),
          ]),

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
          ]),

      GoRoute(
        path: "/data-submission-farmer",
        name: "data-submission-farmer",
        builder: (context, state) => DataSubmissionFarmer(
          state.extra as DataSubmissionGroup,
        ),
      ),
      GoRoute(
        path: "/all-submission-grup",
        name: "all-submission-grup",
        builder: (context, state) => const PplSubmissionFertilizerGroupPage(),
      ),
      // GoRoute(
      //   path: "/detail-fertilizer-farmer",
      //   name: "detail-fertilizer-farmer",
      //   builder: (context, state) => DetailDataFertilizerFarmerPage(
      //     state.extra as SupportingDataFertilizer,
      //   ),
      // ),
      GoRoute(
        path: "/submission-fertilizer-ppl",
        name: "submission-fertilizer-ppl",
        builder: (context, state) => const SubmissionFertilizerPplPage(),
      ),
    ], initialLocation: "/loading", debugLogDiagnostics: false);
