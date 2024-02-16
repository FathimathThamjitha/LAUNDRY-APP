class LaundryType{

  String id;
  String photo;
  String type;



  LaundryType(this.id,this.photo,this.type,);

}


class CustomerList{
  String id;
  String phone;
  String name;
  CustomerList(this.id,this.phone,this.name);
}

class LaundrycategoryList{
  String id;
  String photo;
  String name;
  double price;
  int count;
  double totalprize;

  LaundrycategoryList(this.id,this.photo,this.name,this.price,this.count,this.totalprize);




  }
class BookinglistModel{
  String id;
  String name;
  String phone;
  String address;
  String order_type;
  String order_date;
  String delivery_date;
  String order_time;
  String payment_method;
  String order_staus;
  String status;

  BookinglistModel(
      this.id,
      this.name,
      this.phone,
      this.address,
      this.order_type,
      this.order_date,
      this.delivery_date,
      this.order_time,
      this.payment_method,
      this.order_staus,
      this.status
      );
}
class WashlistModel{
  String item;
  int count;
  double price;

  WashlistModel(
      this.item,
      this.count,
      this.price
      );
}


