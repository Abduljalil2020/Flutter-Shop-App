import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/component/constants.dart';
import 'package:shop_app/shared/cubit/app_cubit/cubit.dart';
import 'package:shop_app/shared/cubit/app_cubit/states.dart';
import 'package:shop_app/shared/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop_app/shop_app/login/shop_login_screen.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/shop_app/on_boarding/on_boarding.dart';
import 'package:shop_app/styles/themes.dart';
import 'network/local/cash_helper.dart';
import 'network/remote/dio_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();

  bool? onBoarding = CasheHelper.getData(key: 'onBoarding');
  Widget widget;
   token =CasheHelper.getData(key: 'token');
  print(token);

  if(onBoarding!= null){
    if(token!=null){
      widget= ShopLayout();
    }else{
      widget = ShopLoginScreen();
    }

  }else{
    widget= OnBoardingScreen();
  }


  BlocOverrides.runZoned(
          () {
        runApp(MyApp(
           widget
        ));
      },
    blocObserver:  MyBlocObserver());
}
class MyApp extends StatelessWidget
{
 final Widget startWidget;
  MyApp(this.startWidget);



  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),


        ),
        BlocProvider(

            create: (BuildContext context) =>
            ShopCubit()..getHomeData()..getCategoriosData()..getFavorites()..getUserData()

        ),
      ],

      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            darkTheme:darkTheme,
            themeMode:ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}



























