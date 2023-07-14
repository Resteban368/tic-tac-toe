import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triki/router/app_router.dart';


Future<void> main()async  {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}



class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      //quitar el banner de debug
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
     theme: ThemeData.dark(),


      
    );
  }
}



