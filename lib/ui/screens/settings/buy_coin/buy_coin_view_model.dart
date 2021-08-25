import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class BuyCoinViewModel extends BaseViewModel{
  List<PackagesTestClass> coins = [
    PackagesTestClass(
      selectedIcon: ImagesPath.single_unSelected_coin,
      unselectedIcon: ImagesPath.single_unSelected_coin,
      totalPrice: "4,99₺",
      totalCoins: "200 Coins",
      isSelected: false,
      hasBorder: true,
    ),

    PackagesTestClass(
      selectedIcon: ImagesPath.multi_selected_coin,
      unselectedIcon: ImagesPath.multi_unSelected_coin,
      totalPrice: "7,99₺",
      totalCoins: "500 Coins",
      isSelected: false,
      hasBorder: true,
    ),

    PackagesTestClass(
      selectedIcon: ImagesPath.multi_selected_coin,
      unselectedIcon: ImagesPath.multi_unSelected_coin,
      totalPrice: "13,99₺",
      totalCoins: "1.000 Coins",
      isSelected: false,
      hasBorder: true,
    ),


    PackagesTestClass(
      selectedIcon: ImagesPath.multi_selected_coin,
      unselectedIcon: ImagesPath.multi_unSelected_coin,
      totalPrice: "24,99₺",
      totalCoins: "2.000 Coins",
      isSelected: false,
      hasBorder: true,
    ),

    PackagesTestClass(
      selectedIcon: ImagesPath.single_unSelected_coin,
      unselectedIcon: ImagesPath.single_unSelected_coin,
      totalPrice: "4,99₺",
      totalCoins: "25Coins",
      isSelected: false,
      hasBorder: true,
    ),
  ];

  onCoinSelection(int index){
    setState(ViewState.busy);
    for(int  i = 0 ; i < coins.length; i++){
      if(i == index){
        coins[i].isSelected = true;
      }else{
        coins[i].isSelected = false;

      }
    }

    setState(ViewState.idle);
  }

}


class PackagesTestClass{
  String? selectedIcon;
  String? unselectedIcon;
  String? totalPrice;
  String? totalCoins;
  bool? isSelected;
  bool? hasBorder;
  PackagesTestClass({this.unselectedIcon, this.selectedIcon, this.totalPrice, this.totalCoins,this.isSelected, this.hasBorder});
}