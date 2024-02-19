import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/presentation/page/all_submission_fertilizer_grup/all_submission_fertilizer_grup_page.dart';
import 'package:mol_petani/presentation/page/create_data_submission_fertilizer_page/create_data_submission_grup_page.dart';
import 'package:mol_petani/presentation/page/data_page/data_distributor_page.dart';
import 'package:mol_petani/presentation/page/data_page/data_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/data_submission_farmer/data_submission_farmer.dart';
import 'package:mol_petani/presentation/page/data_submission_grup_farmer_page/data_submission_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/detail_data_fertilizer_farmer/detail_data_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/detail_submission_fertilizer_grup/detail_submission_fertilizer_grup_page.dart';
import 'package:mol_petani/presentation/page/loading_page/loading_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_distributor_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_kelompok_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_petani_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_ppl_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_distributot_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_kelompok_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_ppl_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_distributor_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/create_submission_fertilizer_page/farmer_grup_submission_page.dart';
import 'package:mol_petani/presentation/page/submission_data_fertilizer_grup/submission_data_fertilizer_grup_page.dart';
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
        path: "/main-ppl",
        name: "main-ppl",
        builder: (context, state) => const MainPplPage(),
      ),
      GoRoute(
        path: "/main-dist",
        name: "main-dist",
        builder: (context, state) => const MainDistributorPage(),
      ),
      GoRoute(
        path: "/main-kelompok",
        name: "main-kelompok",
        builder: (context, state) => const MainKelompokPage(),
      ),
      GoRoute(
        path: "/regis-distributor",
        name: "regis-distributor",
        builder: (context, state) => RegisterDistributorPage(),
      ),
      GoRoute(
        path: "/regis-kelompok",
        name: "regis-kelompok",
        builder: (context, state) => RegisterGrupFarmerPage(),
      ),
      GoRoute(
        path: "/data-grup-farmer",
        name: "data-grup-farmer",
        builder: (context, state) => const DataGrupFarmerPage(),
      ),
      GoRoute(
        path: "/data-distributor",
        name: "data-distributor",
        builder: (context, state) => const DataDistributorPage(),
      ),
      GoRoute(
        path: "/create-submission-grup",
        name: "create-submission-grup",
        builder: (context, state) => const FarmerGrupFertilizerPage(),
      ),
      GoRoute(
        path: "/create-submission-farmer",
        name: "create-submission-farmer",
        builder: (context, state) => CreateDataSubmissionFertilizerGrup(
            state.extra as DataSubmissionFertilizer),
      ),
      GoRoute(
        path: "/data-submission-farmer",
        name: "data-submission-farmer",
        builder: (context, state) => DataSubmissionFarmer(
          state.extra as DataSubmissionFertilizer,
        ),
      ),
      GoRoute(
        path: "/submission-data-fertilizer-grup",
        name: "submission-data-fertilizer-grup",
        builder: (context, state) => SubmissionDataFertilizerGrup(),
      ),
      GoRoute(
        path: "/all-submission-grup",
        name: "all-submission-grup",
        builder: (context, state) =>
            AllSubmissionFertilizerGrup(state.extra as String),
      ),
      GoRoute(
        path: "/detail-submission-fertilizer-grup",
        name: "detail-submission-fertilizer-grup",
        builder: (context, state) =>
            DetailSubmissionFertilizerGrupPage(state.extra as String),
      ),
      GoRoute(
        path: "/detail-fertilizer-farmer",
        name: "detail-fertilizer-farmer",
        builder: (context, state) => DetailDataFertilizerFarmerPage(
          state.extra as PetaniPupuk,
        ),
      ),
    ], initialLocation: "/loading", debugLogDiagnostics: false);
