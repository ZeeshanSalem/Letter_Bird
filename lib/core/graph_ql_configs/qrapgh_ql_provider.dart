import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlClass{
  static HttpLink httpLink = HttpLink(
    'https://api.letterbird.app/',
  );

  static Link link = httpLink;

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
    ),
  );


  GraphQLClient clientToQuery(){
    return GraphQLClient(
      alwaysRebroadcast: true,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
    );
  }




}