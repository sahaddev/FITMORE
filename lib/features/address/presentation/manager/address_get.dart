import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';

class AddressGet extends GetxController {
  Future<void> addAddressOnButtonClick(
      {required nameEditcontroller,
      required phonenumberEditcontroller,
      required cityEditcontroller,
      required pincodeEditcontroller,
      required stateEditcontroller,
      required context}) async {
    final name = nameEditcontroller.text;
    final phoneNumber = phonenumberEditcontroller.text;
    final city = cityEditcontroller.text;
    final pincode = pincodeEditcontroller.text;
    final state = stateEditcontroller.text;

    if (name.isEmpty ||
        phoneNumber.isEmpty ||
        city.isEmpty ||
        pincode.isEmpty ||
        state.isEmpty) {
      return;
    }

    if (name.isNotEmpty ||
        phoneNumber.isNotEmpty ||
        city.isNotEmpty ||
        pincode.isNotEmpty ||
        state.isNotEmpty) {
      NavigationService.pop();
    }
  }

  Future<void> updateAddressOnButtonClick(
      {required nameEditcontroller,
      required phonenumberEditcontroller,
      required cityEditcontroller,
      required pincodeEditcontroller,
      required stateEditcontroller,
      required addresModel}) async {}
}
