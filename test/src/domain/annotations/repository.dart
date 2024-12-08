import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';

@GenerateNiceMocks([
  MockSpec<http.Client>(),
  MockSpec<GithubRepository>(),
])
void main() {}
