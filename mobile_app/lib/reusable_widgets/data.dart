int count = 1;
class Data {
   String? temp;
   String? Date ;
Data();
Map<String,dynamic> toJson() => {'temp': temp,'date':Date };
Data.fromSnapshot(snapshot)
  :temp = snapshot.data()['temp'],
   Date = snapshot.data()['date'];

}

// class Image{
//    late String i;
//    Image();
// }
