// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'movie.dart';
import 'movieapi.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {

  MovieApi _movieData = MovieApi();
  final List<Movie> _favoriteItems = [];

  List<Movie> _movies = [];

  List<Movie> get items => _favoriteItems;
  List<Movie> get movies => _movies;

  void add(Movie itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(Movie itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }

  loadMovies() async {
    List<Movie> listMovies = await _movieData.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }
}