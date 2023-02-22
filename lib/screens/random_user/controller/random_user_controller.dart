import 'package:demo39/screens/random_user/modal/random_user_modal.dart';
import 'package:get/get.dart';

class RandomUserController extends GetxController {
  RxList<Results>? user = <Results>[].obs;

  void ref(RandomModal? data) {
    print("====== ${data!.results![0].gender}");
    user!.value = data.results!;
    print("======user ${user![0].gender}");
  }
}
