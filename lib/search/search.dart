import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchResult> {
  SearchCubit() : super(SearchResult(SearchStatus.ok, "", []));

  void search(String text) async {
    print("SEARCH");
    emit(SearchResult(SearchStatus.loading, text, []));
    await requetst();
    emit(
      SearchResult(SearchStatus.ok, text, [SearchEntry("123")]),
    );
  }

  requetst() async {
    return Future.delayed(Duration(seconds: 1));
  }
}

enum SearchStatus { loading, ok }

class SearchResult {
  SearchResult(this.status, this.searchString, this.result);

  final SearchStatus status;
  final String searchString;
  final List<SearchEntry> result;
}

class SearchEntry {
  SearchEntry(this.sku);

  String sku;
}
