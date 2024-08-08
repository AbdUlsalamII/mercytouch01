class CartModel {
  int? drugsprice;
  int? counterdrugs;
  int? cartId;
  int? cartUsersid;
  int? cartDrugsid;
  int? drugsId;
  String? drugsName;
  String? drugsNameAr;
  String? drugsDesc;
  String? drugsDescAr;
  String? drugsImage;
  int? drugsCapacity;
  String? drugsType;
  int? drugsCount;
  int? drugsActive;
  int? drugsCost;
  String? drugsProductionDate;
  String? drugsExpirationDate;
  int? drugsCat;

  CartModel(
      {this.drugsprice,
      this.counterdrugs,
      this.cartId,
      this.cartUsersid,
      this.cartDrugsid,
      this.drugsId,
      this.drugsName,
      this.drugsNameAr,
      this.drugsDesc,
      this.drugsDescAr,
      this.drugsImage,
      this.drugsCapacity,
      this.drugsType,
      this.drugsCount,
      this.drugsActive,
      this.drugsCost,
      this.drugsProductionDate,
      this.drugsExpirationDate,
      this.drugsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    drugsprice = json['drugsprice'];
    counterdrugs = json['counterdrugs'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartDrugsid = json['cart_drugsid'];
    drugsId = json['drugs_id'];
    drugsName = json['drugs_name'];
    drugsNameAr = json['drugs_name_ar'];
    drugsDesc = json['drugs_desc'];
    drugsDescAr = json['drugs_desc_ar'];
    drugsImage = json['drugs_image'];
    drugsCapacity = json['drugs_capacity'];
    drugsType = json['drugs_type'];
    drugsCount = json['drugs_count'];
    drugsActive = json['drugs_active'];
    drugsCost = json['drugs_cost'];
    drugsProductionDate = json['drugs_production_date'];
    drugsExpirationDate = json['drugs_expiration_date'];
    drugsCat = json['drugs_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drugsprice'] = this.drugsprice;
    data['counterdrugs'] = this.counterdrugs;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_drugsid'] = this.cartDrugsid;
    data['drugs_id'] = this.drugsId;
    data['drugs_name'] = this.drugsName;
    data['drugs_name_ar'] = this.drugsNameAr;
    data['drugs_desc'] = this.drugsDesc;
    data['drugs_desc_ar'] = this.drugsDescAr;
    data['drugs_image'] = this.drugsImage;
    data['drugs_capacity'] = this.drugsCapacity;
    data['drugs_type'] = this.drugsType;
    data['drugs_count'] = this.drugsCount;
    data['drugs_active'] = this.drugsActive;
    data['drugs_cost'] = this.drugsCost;
    data['drugs_production_date'] = this.drugsProductionDate;
    data['drugs_expiration_date'] = this.drugsExpirationDate;
    data['drugs_cat'] = this.drugsCat;
    return data;
  }
}