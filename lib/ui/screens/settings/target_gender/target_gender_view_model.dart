import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/gender.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class TargetMatchingGenderViewModel extends BaseViewModel{

  GraphQlClass graphQlClass = GraphQlClass();
  List<Gender> allGender = [];

  TargetMatchingGenderViewModel(){
    getGender();
  }




  onGenderSelection(index){
    setState(ViewState.busy);
    allGender[index].isSelected =! allGender[index].isSelected!;
    setState(ViewState.idle);
  }

  void getGender() async{
    setState(ViewState.busy);
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().getGender)));
      if(result.data != null){
        
        for(int  i = 0; i < result.data!["Genders"].length; i++ ){
          print(result.data!["Genders"][i]);
          allGender.add(Gender.fromJson(result.data!["Genders"][i]));
        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }
}

