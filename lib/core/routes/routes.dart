import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_challenge/favorites/presentation/pages/favorites_page.dart';
import 'package:tmdb_challenge/movies/domain/entities/movie.dart';
import 'package:tmdb_challenge/movies/presentation/pages/home_page.dart';
import 'package:tmdb_challenge/movies/presentation/pages/movie_details_page.dart';
import 'package:tmdb_challenge/movies/presentation/pages/tabs/now_playing.dart';
import 'package:tmdb_challenge/movies/presentation/pages/tabs/popular.dart';
import 'package:tmdb_challenge/movies/presentation/pages/tabs/top_rated.dart';
import 'package:tmdb_challenge/movies/presentation/pages/tabs/upcoming.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRoutes {
  // Pages
  static const loginPage = 'loginPage';
  static const homePage = 'homePage';
  static const movieDetailsPage = 'movieDetailsPage';
  static const favoritesPage = 'favoritesPage';

  // Tabs
  static const nowPlayingTab = 'nowPlaying';
  static const popularTab = 'popularTab';
  static const topRatedTab = 'topRatedTab';
  static const upcomingTab = 'upcomingTab';

  static final appRoutes = GoRouter(
    initialLocation: '/nowPlaying',
    navigatorKey: rootNavigatorKey,
    routes: [
      // routes
      // GoRoute(
      //   path: '/loginScreen',
      //   name: loginScreen,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      GoRoute(
        path: '/favoritesPage',
        name: favoritesPage,
        builder: (context, state) => const FavoritesPage(),
      ),

      GoRoute(
        path: '/homePage',
        name: favoritesPage,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: '/movieDetailsPage',
        name: movieDetailsPage,
        builder: (context, state) {
          return MovieDetailsPage(
            movie: state.extra as Movie,
          );
        },
      ),

      // bottom navigation bar tabs
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => HomePage(child: child),
        routes: [
          GoRoute(
            path: '/nowPlaying',
            name: nowPlayingTab,
            builder: (context, state) => const NowPlayingTab(),
          ),
          GoRoute(
            path: '/popularTab',
            name: popularTab,
            builder: (context, state) => const PopularTab(),
          ),
          GoRoute(
            path: '/topRatedTab',
            name: topRatedTab,
            builder: (context, state) => const TopRatedTab(),
          ),
          GoRoute(
            path: '/upcomingTab',
            name: upcomingTab,
            builder: (context, state) => const UpcomingTab(),
          ),
        ],
      ),
    ],
  );
}
