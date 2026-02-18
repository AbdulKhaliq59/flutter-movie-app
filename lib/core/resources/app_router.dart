import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/presentation/pages/main_page.dart';
import 'package:movies_app/features/movies/presentation/pages/movie_details_view.dart';
import 'package:movies_app/features/movies/presentation/pages/movies_view.dart';
import 'package:movies_app/features/movies/presentation/pages/popular_movies_view.dart';
import 'package:movies_app/features/movies/presentation/pages/top_rated_movies_view.dart';
import 'package:movies_app/features/search/presentation/pages/search_view.dart';
import 'package:movies_app/features/tv_shows/presentation/pages/popular_tv_shows_view.dart';
import 'package:movies_app/features/tv_shows/presentation/pages/top_rated_tv_shows_view.dart';
import 'package:movies_app/features/tv_shows/presentation/pages/tv_show_details_view.dart';
import 'package:movies_app/features/tv_shows/presentation/pages/tv_shows_view.dart';

import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/features/watchlist/presentation/pages/watchlist_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String tvShowsPath = '/tvShows';
const String tvShowDetailsPath = 'tvShowDetails/:tvShowId';
const String popularTVShowsPath = 'popularTVShows';
const String topRatedTVShowsPath = 'topRatedTVShows';
const String searchPath = '/search';
const String watchlistPath = '/watchlist';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MoviesView()),
            routes: [
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: MovieDetailsView(
                    movieId: int.parse(state.pathParameters['movieId']!),
                  ),
                ),
              ),
              GoRoute(
                name: AppRoutes.popularMoviesRoute,
                path: popularMoviesPath,
                pageBuilder: (context, state) =>
                    const CupertinoPage(child: PopularMoviesView()),
              ),
              GoRoute(
                name: AppRoutes.topRatedMoviesRoute,
                path: topRatedMoviesPath,
                pageBuilder: (context, state) =>
                    const CupertinoPage(child: TopRatedMoviesView()),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.tvShowsRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TVShowsView()),
            routes: [
              GoRoute(
                name: AppRoutes.tvShowDetailsRoute,
                path: tvShowDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: TVShowDetailsView(
                    tvShowId: int.parse(state.pathParameters['tvShowId']!),
                  ),
                ),
              ),
              GoRoute(
                name: AppRoutes.popularTvShowsRoute,
                path: popularTVShowsPath,
                pageBuilder: (context, state) =>
                    const CupertinoPage(child: PopularTVShowsView()),
              ),
              GoRoute(
                name: AppRoutes.topRatedTvShowsRoute,
                path: topRatedTVShowsPath,
                pageBuilder: (context, state) =>
                    const CupertinoPage(child: TopRatedTVShowsView()),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchView()),
          ),
          GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: WatchlistView()),
          ),
        ],
      ),
    ],
  );
}
