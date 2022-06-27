

import '../../../model/shop_app/login_mdel.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates {
 final ShopLoginModel loginModel;

 ShopRegisterSuccessState( this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterStates
{
 final String error;

 ShopRegisterErrorState(this.error);
}

class ShopChangeRegisterPasswordVisibilityState extends ShopRegisterStates {}

