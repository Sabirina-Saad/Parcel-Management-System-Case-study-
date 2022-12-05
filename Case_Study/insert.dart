import 'dart:io';
import 'dart:math';

class Insert {
    var pid;  //parcel id 
  var name;
  var email;
  var houseNo;
  var phoneNo;
  var gender;
  var numberOfParcel;
  var dateTime = DateTime.now().day;  //date created parcel 

//function to remove parcel after 2 days 
  void removeParcelAfterTwoDays(Set<List> data_storage) {
    for (var element in data_storage) {
      for (var e in element) {
        int d = e['dateTime'];  // assign dateTime to integer value 
        if (DateTime.now().day - d > 2) {
          element.remove(0);  //removes element if its more than 2 days 
        }
      }
    }
  }
//adds parcel
  void enterParcelDetails(Set<List> data_storage) {
    stdout.write("Enter house Number to insert parcel: ");
    houseNo= stdin.readLineSync();

//checks if house number is greater than data_storage length 
    if (int.parse(houseNo) > data_storage.length) {
      stdout.write("Error!!!Please input house number between 1 and 30:");
    } else {
      stdout.write(
          "Enter Number of parcels to be delivered in house number $houseNo: ");
      numberOfParcel = stdin.readLineSync();
      var pNo = int.parse(numberOfParcel);
      //checks if parcelNo is greater than 5 
      if (pNo > 5) {
        print("Error!!!: Maximum parcels is 5,please try again");
      }
      //if parcel number is less than 5 else part will be executed 
       else {
//create  list to store parcels
        for (var i = 0; i < pNo; i++) {
           print('\n');
          print('Enter Parcel ${i+1} Details');
          stdout.write("Enter Recpients name: ");
          name = stdin.readLineSync();
          stdout.write("Enter email: ");
          email = stdin.readLineSync();
          stdout.write("Enter  phone number: ");
          phoneNo = stdin.readLineSync();
          stdout.write("Enter  gender: ");
          gender = stdin.readLineSync();

        var rand = Random();
          pid = rand.nextInt(5000);  //generates random number from 1- 5000 for parcel id 
//creates map to store parcel details 
          var parcelData = {
            'id' : '${pid}',
            'name': name,
            'email': email,
            'houseNumber': houseNo,
            'phoneNumber': phoneNo,
            'gender': gender,
            'dateTime': dateTime,
          };
//use for loop to iterate elements in data_storage 
          for (var element in data_storage) {
            if (element.length != 5) {
              element.add(parcelData);    //addes elements in parcelData map to Data_storage 
              break;
            }
          }
        }
      }
    }
  }
}
