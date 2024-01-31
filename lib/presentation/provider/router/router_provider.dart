import 'package:go_router/go_router.dart';
import 'package:mol_petani/presentation/page/loading_page/loading_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_distributor_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_kelompok_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_petani_page.dart';
import 'package:mol_petani/presentation/page/login_page/login_ppl_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_distributot_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_kelompok_page.dart';
import 'package:mol_petani/presentation/page/main_page/main_ppl_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_distributor_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_kelompok_page.dart';
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
        builder: (context, state) => RegisterKelompokPage(),
      ),
    ], initialLocation: "/loading", debugLogDiagnostics: false);
