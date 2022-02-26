class Mydata {
  List<Products>? products;

  Mydata({this.products});

  Mydata.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? price;
  String? color;
  String? image;

  Products({this.id, this.name, this.price, this.color, this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    price = json['Price'];
    color = json['Color'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['Color'] = this.color;
    data['Image'] = this.image;
    return data;
  }
}
