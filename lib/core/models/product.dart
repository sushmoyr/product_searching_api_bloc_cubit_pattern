import 'brand.dart';
import 'charge.dart';
import 'images.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product product) => json.encode(product.toJson());

class Product {
  Product({
    this.id,
    this.brand,
    this.image,
    this.images,
    this.slug,
    this.productName,
    this.model,
    this.commissionType,
    this.amount,
    this.tag,
    this.description,
    this.note,
    this.embaddedVideoLink,
    this.maximumOrder,
    this.stock,
    this.isBackOrder,
    this.specification,
    this.warranty,
    this.preOrder,
    this.productReview,
    this.isSeller,
    this.isPhone,
    this.willShowEmi,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.seller,
    this.createdBy,
    this.updatedBy,
    this.category,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seller = json['seller'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    category = json['category'] != null ? json['category'].cast<int>() : [];
  }
  int? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? seller;
  String? createdBy;
  String? updatedBy;
  List<int>? category;
  Product copyWith({
    int? id,
    Brand? brand,
    String? image,
    Charge? charge,
    List<Images>? images,
    String? slug,
    String? productName,
    String? model,
    String? commissionType,
    String? amount,
    String? tag,
    String? description,
    String? note,
    String? embaddedVideoLink,
    int? maximumOrder,
    int? stock,
    bool? isBackOrder,
    String? specification,
    String? warranty,
    bool? preOrder,
    int? productReview,
    bool? isSeller,
    bool? isPhone,
    bool? willShowEmi,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    String? seller,
    String? createdBy,
    String? updatedBy,
    List<int>? category,
  }) =>
      Product(
        id: id ?? this.id,
        brand: brand ?? this.brand,
        image: image ?? this.image,
        images: images ?? this.images,
        slug: slug ?? this.slug,
        productName: productName ?? this.productName,
        model: model ?? this.model,
        commissionType: commissionType ?? this.commissionType,
        amount: amount ?? this.amount,
        tag: tag ?? this.tag,
        description: description ?? this.description,
        note: note ?? this.note,
        embaddedVideoLink: embaddedVideoLink ?? this.embaddedVideoLink,
        maximumOrder: maximumOrder ?? this.maximumOrder,
        stock: stock ?? this.stock,
        isBackOrder: isBackOrder ?? this.isBackOrder,
        specification: specification ?? this.specification,
        warranty: warranty ?? this.warranty,
        preOrder: preOrder ?? this.preOrder,
        productReview: productReview ?? this.productReview,
        isSeller: isSeller ?? this.isSeller,
        isPhone: isPhone ?? this.isPhone,
        willShowEmi: willShowEmi ?? this.willShowEmi,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        seller: seller ?? this.seller,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        category: category ?? this.category,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['image'] = image;
    if (charge != null) {
      map['charge'] = charge?.toJson();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['slug'] = slug;
    map['product_name'] = productName;
    map['model'] = model;
    map['commission_type'] = commissionType;
    map['amount'] = amount;
    map['tag'] = tag;
    map['description'] = description;
    map['note'] = note;
    map['embadded_video_link'] = embaddedVideoLink;
    map['maximum_order'] = maximumOrder;
    map['stock'] = stock;
    map['is_back_order'] = isBackOrder;
    map['specification'] = specification;
    map['warranty'] = warranty;
    map['pre_order'] = preOrder;
    map['product_review'] = productReview;
    map['is_seller'] = isSeller;
    map['is_phone'] = isPhone;
    map['will_show_emi'] = willShowEmi;
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['seller'] = seller;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['category'] = category;
    return map;
  }
}
