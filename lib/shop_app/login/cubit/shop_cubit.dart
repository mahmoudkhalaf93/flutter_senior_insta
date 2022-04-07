import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/shop_app/login/cubit/shop_states.dart';
import 'package:flutter_senior/shop_app/login/remote/dio_helper.dart';
import 'package:flutter_senior/shop_app/login/remote/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

}