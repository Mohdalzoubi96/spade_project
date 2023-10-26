class AvailableStocks {
  List<Rows>? rows;

  AvailableStocks({this.rows});

  AvailableStocks.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }
}

class Rows {
  int? id;
  int? itemId;
  String? title;
  String? sku;
  String? modelNumber;
  String? partNumber;
  String? margin;
  int? statusId;
  String? createdAt;
  String? updatedAt;
  String? totalQuantity;
  String? lowestPriceVariant;
  Item? item;
  List<AttributesGroups>? attributesGroups;
  List<Units>? units;

  Rows(
      {this.id,
      this.itemId,
      this.title,
      this.sku,
      this.modelNumber,
      this.partNumber,
      this.margin,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.totalQuantity,
      this.lowestPriceVariant,
      this.item,
      this.attributesGroups,
      this.units});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    title = json['title'];
    sku = json['sku'];
    modelNumber = json['model_number'];
    partNumber = json['part_number'];
    margin = json['margin'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalQuantity = json['total_quantity'];
    lowestPriceVariant = json['lowest_price_variant'];

    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    if (json['attributes_groups'] != null) {
      attributesGroups = <AttributesGroups>[];
      json['attributes_groups'].forEach((v) {
        attributesGroups!.add(new AttributesGroups.fromJson(v));
      });
    }
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
  }
}

class Item {
  int? id;
  String? name;
  String? modelNumber;
  int? partNumber;
  int? categoryId;
  String? image;
  String? minBid;
  String? basePrice;
  String? priceLimitPercent;
  String? lowestPriceLimit;
  int? statusId;
  int? order;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Item(
      {this.id,
      this.name,
      this.modelNumber,
      this.partNumber,
      this.categoryId,
      this.image,
      this.minBid,
      this.basePrice,
      this.priceLimitPercent,
      this.lowestPriceLimit,
      this.statusId,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.category});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    modelNumber = json['model_number'];
    partNumber = json['part_number'];
    categoryId = json['category_id'];
    image = json['image'];
    minBid = json['min_bid'];
    basePrice = json['base_price'];
    priceLimitPercent = json['price_limit_percent'];
    lowestPriceLimit = json['lowest_price_limit'];
    statusId = json['status_id'];
    order = json['order'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }
}

class Category {
  int? id;
  String? name;
  int? brandId;
  String? image;
  String? minBid;
  String? maxBid;
  int? statusId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  Category(
      {this.id,
      this.name,
      this.brandId,
      this.image,
      this.minBid,
      this.maxBid,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.brand});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brandId = json['brand_id'];
    image = json['image'];
    minBid = json['min_bid'];
    maxBid = json['max_bid'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }
}

class Brand {
  int? id;
  String? name;
  String? image;
  int? statusId;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
      this.name,
      this.image,
      this.statusId,
      this.createdAt,
      this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class AttributesGroups {
  int? id;
  int? variantId;
  int? attributeId;
  String? createdAt;
  String? updatedAt;
  Attribute? attribute;

  AttributesGroups(
      {this.id,
      this.variantId,
      this.attributeId,
      this.createdAt,
      this.updatedAt,
      this.attribute});

  AttributesGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantId = json['variant_id'];
    attributeId = json['attribute_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    attribute = json['attribute'] != null
        ? new Attribute.fromJson(json['attribute'])
        : null;
  }
}

class Attribute {
  int? id;
  int? parentId;
  String? name;
  int? order;
  String? hex;
  int? statusId;
  String? createdAt;
  String? updatedAt;
  AttributeParent? attributeParent;

  Attribute(
      {this.id,
      this.parentId,
      this.name,
      this.order,
      this.hex,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.attributeParent});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    order = json['order'];
    hex = json['hex'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    attributeParent = json['attribute_parent'] != null
        ? new AttributeParent.fromJson(json['attribute_parent'])
        : null;
  }
}

class AttributeParent {
  int? id;
  int? parentId;
  String? name;
  int? order;
  String? hex;
  int? statusId;
  String? createdAt;
  String? updatedAt;

  AttributeParent(
      {this.id,
      this.parentId,
      this.name,
      this.order,
      this.hex,
      this.statusId,
      this.createdAt,
      this.updatedAt});

  AttributeParent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    order = json['order'];
    hex = json['hex'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Units {
  int? id;
  int? quantity;
  String? price;
  int? userId;
  bool? rejected;
  bool? targetNotification;
  int? targetCount;
  bool? isVat;
  int? variantId;
  int? typeId;
  int? publicForeignId;
  int? companyId;
  int? connectedCompanyId;
  int? statusId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Units(
      {this.id,
      this.quantity,
      this.price,
      this.userId,
      this.rejected,
      this.targetNotification,
      this.targetCount,
      this.isVat,
      this.variantId,
      this.typeId,
      this.publicForeignId,
      this.companyId,
      this.connectedCompanyId,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    userId = json['user_id'];
    rejected = json['rejected'];
    targetNotification = json['target_notification'];
    targetCount = json['target_count'];
    isVat = json['is_vat'];
    variantId = json['variant_id'];
    typeId = json['type_id'];
    publicForeignId = json['public_foreign_id'];
    companyId = json['company_id'];
    connectedCompanyId = json['connected_company_id'];
    statusId = json['status_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  Company? company;

  User({this.id, this.company});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }
}

class Company {
  int? id;
  bool? isVat;
  int? connectedCompanyId;

  Company({this.id, this.isVat, this.connectedCompanyId});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isVat = json['is_vat'];
    connectedCompanyId = json['connected_company_id'];
  }
}
