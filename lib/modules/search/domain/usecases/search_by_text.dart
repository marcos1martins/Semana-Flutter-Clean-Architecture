import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<FailureException, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureException, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText == "") {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
