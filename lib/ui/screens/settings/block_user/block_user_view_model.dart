import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class BlockUserViewModel extends BaseViewModel{

  List<BlockUserTestClass> blockUsers = [
    BlockUserTestClass(
      name: "THFKIF",
      nickName: "",
    ),

    BlockUserTestClass(
      name: "54TYRY",
      nickName: "Nicknicknicknick...",
    ),

    BlockUserTestClass(
      name: "TKFLD",
      nickName: "",
    ),
  ];

  unBlockUser(index){
    setState(ViewState.busy);
    blockUsers.removeAt(index);
    setState(ViewState.idle);
  }
}

class BlockUserTestClass{
  String? name;
  String? nickName;
  BlockUserTestClass({this.name, this.nickName});
}