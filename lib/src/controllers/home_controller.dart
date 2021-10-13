import 'package:api/src/model/todo_model.dart';
import 'package:api/src/repositories/todo_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class HomeController {
  List<TodoModel> todos= [];
  final TodoRepository repository;
  final state =ValueNotifier<HomeState>(HomeState.start);
  
  HomeController([ repository]):
  repository = repository ?? TodoRepository();

  Future start() async{
    state.value = HomeState.loading;
    try {
      todos = await repository.fetchTods();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
    
  }
}
enum HomeState{start, loading, sucess, error}