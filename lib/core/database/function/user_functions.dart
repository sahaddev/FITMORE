import 'package:e_commerce/core/database/models/user/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);
UserFunction userr = UserFunction();

class UserFunction extends ChangeNotifier {
  Future<String> addUser(UserModel value) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    final id = await userDB.add(value);
    value.id = id;
    final user = userDB.get(id);
    userDB.put(
        id,
        UserModel(
            id: id,
            name: user!.name,
            phoneNumber: user.phoneNumber,
            email: user.email,
            password: user.password));
    userListNotifier.value.add(user);

    userListNotifier.notifyListeners();
    return "User Added Successfully";
  }

  Future<void> getAlluser() async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    userListNotifier.value.clear();
    userListNotifier.value.addAll(userDB.values);
    userListNotifier.notifyListeners();
  }

  Future<UserModel> getUserById(id) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    UserModel user = userDB.getAt(id)!;
    return user;
  }

  Future<void> updateUser(int id, UserModel value) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    if (userDB.containsKey(id)) {
      await userDB.put(id, value);
      int index = userListNotifier.value.indexWhere((user) => user.id == id);
      if (index != -1) {
        userListNotifier.value[index] = value;
        userListNotifier.notifyListeners();
      }
    }
    value.id = id;
    await userDB.put(id, value);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    try {
      final user = userDB.values.firstWhere(
          (element) => element.email == email && element.password == password);
      return {'login': true, 'message': 'Login Success', 'user': user};
    } catch (e) {
      return {'login': false, 'message': 'Invalid Email or Password'};
    }
  }
}
