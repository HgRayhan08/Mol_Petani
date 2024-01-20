import 'package:go_router/go_router.dart';
import 'package:mol_petani/presentation/page/login_page/login_ppl_page.dart';
import 'package:mol_petani/presentation/page/main_page/ppl_main_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_distributor_page.dart';
import 'package:mol_petani/presentation/page/register_page/register_kelompok_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: "/loginPpl",
        name: "loginPpl",
        builder: (context, state) => LoginPplPage(),
      ),
      GoRoute(
        path: "/mainPpl",
        name: "mainPpl",
        builder: (context, state) => const PplMainPage(),
      ),
      GoRoute(
        path: "/regis-distributor",
        name: "regis-distributor",
        builder: (context, state) => const RegisterDistributorPage(),
      ),
      GoRoute(
        path: "/regis-kelompok",
        name: "regis-kelompok",
        builder: (context, state) => const RegisterKelompokPage(),
      ),
    ], initialLocation: "/loginPpl", debugLogDiagnostics: false);
