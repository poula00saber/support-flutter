import 'package:flutter/material.dart';
import 'package:trial/app_router.dart';

void main() {
  runApp(E_commerce(appRouter: AppRouter(),));
}

class E_commerce extends StatelessWidget {

  final AppRouter appRouter;

  const E_commerce({Key? key, required this.appRouter}): super(key: key) ;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
