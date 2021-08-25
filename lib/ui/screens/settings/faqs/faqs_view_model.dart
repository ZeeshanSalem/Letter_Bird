import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class FaqsViewModel extends BaseViewModel{

  bool isAccountDeactivited = false;

  onToggleAccountActivition(val){
    setState(ViewState.busy);
    isAccountDeactivited = val;
    setState(ViewState.idle);
  }
}