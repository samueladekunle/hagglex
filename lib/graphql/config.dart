import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static ValueNotifier<GraphQLClient> initialise({String? token}) {
    final httpLink =
        HttpLink('https://hagglex-backend-staging.herokuapp.com/graphql');
    final authLink = AuthLink(getToken: () => 'Bearer $token');
    final link = authLink.concat(httpLink);
    return ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }
}
