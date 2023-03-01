// import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import 'package:graphql/client.dart';

const String getPosts = r'''
  query GetPosts {
  getPosts {
    _id
    author {
      name
      email
    }
    content
    title
  }
}
''';

class Resource with ChangeNotifier {
  // final String resource;

  List<dynamic> _records = [];

  List<dynamic> get records {
    return [..._records];
  }

  Resource();

  Future<void> fetchAndSetRecords() async {
    final graphqlUrl = dotenv.env['APOLLO_SERVER_URL'];

    if (graphqlUrl != null) {
      final httpLink = HttpLink(graphqlUrl);
      try {
        final GraphQLClient client = GraphQLClient(
          /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
          cache: GraphQLCache(),
          link: httpLink,
        );

        final QueryOptions options = QueryOptions(
          document: gql(getPosts),
        );

        final QueryResult result = await client.query(options);

        if (result.hasException) {
          print(result.exception.toString());
        }
      } catch (err) {
        print(err);
        throw err;
      }
    }

    // try {
    //   final response = await http.get(getResourceRecordsUrl);

    //   final List<dynamic> loadedRecords = [];
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;

    //   notifyListeners();
    // } catch (error) {
    //   throw error;
    // }
  }
}
