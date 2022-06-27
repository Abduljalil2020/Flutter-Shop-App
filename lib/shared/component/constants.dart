// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//https://newsapi.org/v2/top-headlines?country=eg&apiKey=d6215c6e54964d49b0d3ed8d80ba4f9e


//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=d6215c6e54964d49b0d3ed8d80ba4f9e

import '../../network/local/cash_helper.dart';
import '../../shop_app/login/shop_login_screen.dart';
import 'componentes.dart';

void signOut(context)
{
  CasheHelper.removeData(key: 'token',).then((value) {
    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen(),);
    }
  });





}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
