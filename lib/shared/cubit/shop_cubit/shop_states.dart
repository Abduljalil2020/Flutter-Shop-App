import '../../../model/shop_app/change_favorites_model.dart';
import '../../../model/shop_app/login_mdel.dart';

abstract class ShopStates{}
 class ShopInitialState extends ShopStates{}

 class ShopChangeBottomNavState extends ShopStates{}



//Home
class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{}
 //Categories
class ShopLoadingCategoriesState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriosState extends ShopStates{}
//ChangeFavorites

class ShopChangeFavoritesState extends ShopStates{}

class ShopSuccessChangeFavoritesState extends ShopStates
{
 final ChangeFavoritesModel model;

 ShopSuccessChangeFavoritesState(this.model);
}
class ShopErrorChangeFavoritesState extends ShopStates{}

//get favourites
class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}
//UserData Registertion
class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates
{
 final ShopLoginModel loginModel;

 ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {}
//UpdateUser
class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
 final ShopLoginModel loginModel;

 ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}