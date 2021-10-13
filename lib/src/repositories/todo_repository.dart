import 'package:api/src/model/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
   Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([ client]) :dio = client ?? Dio();
    //if(dio == null){
      //this.dio = Dio();
    //} else{
      //this.dio = dio;
    //}
  //}

  Future<List<TodoModel>> fetchTods() async{
    final response= await dio.get(url);
    final list = response.data as List;
    return list.map((json) =>  TodoModel.fromJson(json)).toList();
  }
  
}


