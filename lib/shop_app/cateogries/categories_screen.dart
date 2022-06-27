import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/component/componentes.dart';
import 'package:shop_app/shared/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_cubit/shop_states.dart';

import '../../model/shop_app/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return ListView.separated(
            itemBuilder:(context, index) =>
            buildCatItem(ShopCubit.get(context).categoriosModel!.data!.data![index]),
            separatorBuilder: (context, index) =>myDivider(),
            itemCount: ShopCubit.get(context).categoriosModel!.data!.data!.length,
        );
      },
    );

  }




  Widget buildCatItem(DataModel model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image.toString()),
          width: 80,
          height: 80,
          fit: BoxFit.cover,

        ),
        SizedBox(
          width: 10,
        ),
        Text(
          model.name.toString(),
          style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold

          ),

        ),
        //بياخد كل المسافه لحد اخر الشاشه
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        )
      ],
    ),
  );
}
