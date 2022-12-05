
import 'dart:io';

class View {
  var houseNum;

//function to view parcels 
  void viewParcelDetails(Set<List> data_storage){  //checking parcesl in data_storage 
    stdout.write("Enter house number to view parcels: ");
    houseNum = stdin.readLineSync();

    for (var element in data_storage) {   ///iterate items in data_storage 
      for (var e in element) {
        //checks parcels based on house number 
        if (e['houseNumber'] == houseNum) {
          print('\n');
          print('**** Parcel Details *****');
          print('Parcel ID: ${e['id']}');
          print('Recipent name : ${e['name']}');
          print('email : ${e['email']}');
          print('houseNumber : ${e['houseNumber']}');
          print('phoneNumber : ${e['phoneNumber']}');
          print('gender : ${e['gender']}');
          
        }
        //informs users if they didnt receive parcels 
        else if(e['houseNumber'] != houseNum){
          
          print("No Parcels delivered to house Number  $houseNum");
          break;
        }
    }
  }
}
 }