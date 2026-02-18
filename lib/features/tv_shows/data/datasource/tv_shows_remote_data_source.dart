import 'package:movies_app/features/tv_shows/data/models/season_details_model.dart';
import 'package:movies_app/features/tv_shows/data/models/tv_show_details_model.dart';
import 'package:movies_app/features/tv_shows/data/models/tv_show_model.dart';

abstract class TVShowsRemoteDataSource {
  Future<List<TVShowModel>> getOnAirTVShows();
  Future<List<TVShowModel>> getPopularTVShows();
  Future<List<TVShowModel>> getTopRatedTVShows();
  Future<List<List<TVShowModel>>> getTVShows();
  Future<TVShowDetailsModel> getTVShowDetails(int id);
  Future<SeasonDetailsModel> getSeasonDetails(int id, int seasonNumber);
  Future<List<TVShowModel>> getAllPopularTVShows(int page);
  Future<List<TVShowModel>> getAllTopRatedTVShows(int page);
}
