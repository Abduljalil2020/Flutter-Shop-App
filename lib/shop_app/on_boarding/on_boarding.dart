
import 'package:flutter/material.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/shared/component/componentes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/colors.dart';
import '../login/shop_login_screen.dart';

class BoardingModel {
 final  String image ;
 final String title ;
 final String body ;
 BoardingModel({
  required this.image,
  required this.title,
  required this.body,
});
}




class OnBoardingScreen extends StatefulWidget {


  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 var boardController = PageController();

 List <BoardingModel> boarding=[
   BoardingModel(
       image: 'assets/images/onboard.png',
      title: 'title  1',
       body: 'body  1'
   ),
   BoardingModel(
       image: 'assets/images/onboard.png',
       title: 'title  2',
       body: 'body  2'
   ),
   BoardingModel(
       image: 'assets/images/onboard.png',
       title: 'title  3',
       body: 'body  3'
   )

 ];

   bool isLast = false;
   void submit(){
     CasheHelper.saveData(key: 'onBoarding', value: true).then((value) {
       if(value){
         navigateAndFinish(
           context,
           ShopLoginScreen(),
         );
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body:Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index){
                  if (index== boarding.length-1){
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },

              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(onPressed:(){
                  if(isLast){
                   submit();
                  }else {
                    boardController.nextPage(
                      duration:  const Duration (milliseconds: 750),
                      curve: Curves.bounceInOut
                  );
                  }
                },
                  child: const Icon(
                    Icons.arrow_forward_ios
                  ),

                )
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        model.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
      ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        model.body,
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
      ),
      ),
    ],

  );
}
