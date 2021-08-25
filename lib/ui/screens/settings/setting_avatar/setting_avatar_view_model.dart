import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/avatars.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class SettingAvatarViewModel extends BaseViewModel{
  GraphQlClass graphQlClass = GraphQlClass();
  List<Avatars> listOfAvatars = [];

  SettingAvatarViewModel(){
    getAvatars();
  }


  void getAvatars() async{
    setState(ViewState.loading);
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().avatars)));
      if(result.data != null){

        for(int  i = 0; i < result.data!["Avatars"].length; i++ ){
          print(result.data!["Avatars"][i]);
          listOfAvatars.add(Avatars.fromJson(result.data!["Avatars"][i]));

        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }
}