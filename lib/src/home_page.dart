
import 'package:api/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  
 


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

   
 _sucess(){
   return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context,index){
          var todo = controller.todos[index];
        return ListTile(
          title: Text(todo.title),);
      },);

 }

 _erro(){
   return Center(
     child: RaisedButton(onPressed: () {
       controller.start();
     }, 
     child: Text('TENTAR NOVAMENTE'),),
   );
 }
 _loading(){
   return Center(
     child: CircularProgressIndicator(),
   );
 }

 _start(){
   return Container();
 }

 stateManagement(HomeState state){
   switch (state) {
     case HomeState.start:
       return _start();
       case HomeState.loading:
       return _loading();
       case HomeState.error:
       return _erro();
       case HomeState.sucess:
       return _sucess();
       
     default:
   }

 }

 @override
  void initState() {
    super.initState();
    controller.start();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List todo\s'),
      ),
      body: AnimatedBuilder(animation: controller.state, 
      builder: ( context, child) {
        return stateManagement(controller.state.value);
      },),
    );
  }
}