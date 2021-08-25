import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/interest.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class Login5InterestViewModel extends BaseViewModel{
  GraphQlClass graphQlClass = GraphQlClass();
  List<Interest> interest  = [];

  Login5InterestViewModel(){
    getInterest();
  }



  void getInterest() async{
    setState(ViewState.busy);
    print("Interes");
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().interest)));
      if(result.data != null){

        for(int  i = 0; i < result.data!["Interests"].length; i++ ){
          print(result.data!["Interests"][i]);
        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }


}