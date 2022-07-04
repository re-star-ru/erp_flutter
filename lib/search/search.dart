import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

class SearchCubit extends Cubit<SearchResult> {
  SearchCubit() : super(SearchResult(SearchStatus.ok, "", []));

  void search(String text) async {
    if (text.length < 3) {
      emit(SearchResult(SearchStatus.ok, text, []));
      return;
    }

    print("SEARCH");
    emit(SearchResult(SearchStatus.loading, text, []));
    final result = await requetst(text);
    emit(
      SearchResult(SearchStatus.ok, text, result),
    );
  }

  final dio = Dio(
    BaseOptions(baseUrl: "https://api.re-star.ru/v1/oprox/search"),
  );

  Future<List<SearchEntry>> requetst(String query) async {
    final response = await dio.get('/$query');

    var a = (jsonDecode(response.data) as List<dynamic>)
        .map((v) => SearchEntry.fromJson(v));

    final uniques = <String, bool>{};

    for (var s in a) {
      uniques[s.sku] = true;
    }

    return uniques.keys.map((v) => SearchEntry(v)).toList();
  }
}

enum SearchStatus { loading, ok }

class SearchResult {
  SearchResult(this.status, this.searchString, this.result);

  final SearchStatus status;
  final String searchString;
  final List<SearchEntry> result;
}

@JsonSerializable()
class SearchEntry {
  SearchEntry(this.sku);

  final String sku;

  factory SearchEntry.fromJson(Map<String, dynamic> json) =>
      _$SearchEntryFromJson(json);
}
