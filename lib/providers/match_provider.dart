import 'package:flutter/material.dart';
import '../data/models/match_model.dart';
import '../data/repositories/match_repository.dart';

class MatchProvider extends ChangeNotifier {
  final MatchRepository _matchRepository;

  MatchProvider({required MatchRepository matchRepository})
      : _matchRepository = matchRepository;

  List<MatchModel> _matches = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MatchModel> get matches => _matches;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMatches() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _matches = await _matchRepository.getMatches();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
