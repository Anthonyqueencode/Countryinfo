import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycountryapp/apicomponents/countrylist.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mycountryapp/homepage.dart';
import 'package:mycountryapp/themes/provider_themes.dart';

void main(){
  runApp(
    ChangeNotifierProvider
    (
      create: (context )=> ProviderThemes(),
       child: mycountry(),
    )
  );
}

class mycountry extends StatelessWidget{               
  Widget build(BuildContext context){
    //for the sreen responsiveness
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)  {
return MaterialApp(
  home:CountryListScreen(),
     theme: Provider.of<ProviderThemes>(context).themeData,
     //context.watch<ProviderThemes>().themeData

  
  );
    
  }
    );
  }
  }
              