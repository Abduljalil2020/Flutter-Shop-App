import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/cubit/register_cubit/states.dart';

import '../../../model/shop_app/login_mdel.dart';
import '../../../network/end_point.dart';



class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
   late  ShopLoginModel LoginModel;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data:
      {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,

      },
    ).then((value)
    {
     // print(value.data);
      LoginModel=  ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(LoginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

   emit(ShopChangeRegisterPasswordVisibilityState());
  }
}
