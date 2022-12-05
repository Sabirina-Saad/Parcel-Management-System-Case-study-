/*
created by : 
-Sabirin Saad Jama(1835578)
-Laboni Akter (1822794)

A parcel management system.

REQUIREMENTS
    1. It contains 30 empty slots for storage.
    2. Each slot can only store any item for 2 days only.
    3. Any Uncollected parcel will be returned to sender after 2 days.
    4. Item is stored based on house number.
    5. Each storage can store a maximum of 5 parcels.
*/


import 'dart:io';
import 'insert.dart';
import 'view.dart';



void main() {
    var data_storage = {
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  };  //use sets  to store 30 empty lists as storage
  
  Insert insert = new Insert();      //instantiating of insert class
  View view = new View();          //instantiating of view class

  

  while (true) {

    print("\n*********PARCEL MANAGEMENT SYSTEM********\n");
    print("1. Insert or Add Parcel");   //adding parcel to the storage
    print(
        "2. View Parcel"); //print total number of parcels based on house number
    print("3. Exit");     //exits from the system

    stdout.write("Enter your choice from 1-3: ");



    // use try and catch to handle user error
    //if user inputs different option we ask them to renter again
    try {
      dynamic input = stdin.readLineSync();
      var user_input = int.parse(input);
      

      if (user_input > 3 || user_input < 0) {
        print("ERROR: Please select  a number between 1-3");
        continue;
      }
      //checking users input or options
      switch (user_input) {
        case 1:
          {
           insert.enterParcelDetails(data_storage);
            break;
          }
        case 2:
          {
          view.viewParcelDetails(data_storage);
            break;
          }

        case 3:
          {
            print("Thank you for using Parcel Management Sytem");
            exit(3); //exits at 
          }
      }
    } catch (e) {
      print("ERROR: Pls enter an interger number from 1-3");
    }

    insert.removeParcelAfterTwoDays(data_storage); 
  }
}
