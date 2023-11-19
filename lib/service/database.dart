import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseMethods {
 Future<void> addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  } catch (e) {
    print('Error adding user details: $e');
    // Handle the error accordingly
  }
}


Future<void> updateUserWallet(String id, String amount) async {
  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Wallet": amount});
    print("Wallet updated successfully!");
  } catch (e) {
    print('Error updating user wallet: $e');
    // Handle the error accordingly or rethrow for higher-level handling.
    rethrow;
  }
}

 Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
  return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
}

}
