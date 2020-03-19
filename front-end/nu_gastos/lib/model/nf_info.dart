class NFInfo {
  String issuedOn;
  Issuer issuer;
  Protocol protocol;

  NFInfo({this.issuedOn, this.issuer, this.protocol});

  NFInfo.fromJson(Map<String, dynamic> json) {
    issuedOn = json['issuedOn'];
    issuer =
        json['issuer'] != null ? new Issuer.fromJson(json['issuer']) : null;
    protocol = json['protocol'] != null
        ? new Protocol.fromJson(json['protocol'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issuedOn'] = this.issuedOn;
    if (this.issuer != null) {
      data['issuer'] = this.issuer.toJson();
    }
    if (this.protocol != null) {
      data['protocol'] = this.protocol.toJson();
    }
    return data;
  }
}

class Issuer {
  String name;
  String tradeName;
  Address address;

  Issuer({this.name, this.tradeName, this.address});

  Issuer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tradeName = json['tradeName'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tradeName'] = this.tradeName;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class Address {
  Geolocation geolocation;

  Address({this.geolocation});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null
        ? new Geolocation.fromJson(json['geolocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation.toJson();
    }
    return data;
  }
}

class Geolocation {
  String lat;
  String long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Protocol {
  String accessKey;
  String receiptOn;
  List<Items> items;
  List<Payment> payment;

  Protocol({this.accessKey, this.receiptOn, this.items, this.payment});

  Protocol.fromJson(Map<String, dynamic> json) {
    accessKey = json['accessKey'];
    receiptOn = json['receiptOn'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    if (json['payment'] != null) {
      payment = new List<Payment>();
      json['payment'].forEach((v) {
        payment.add(new Payment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessKey'] = this.accessKey;
    data['receiptOn'] = this.receiptOn;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.payment != null) {
      data['payment'] = this.payment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String code;
  String unit;
  int quantity;
  int unitAmount;
  int totalAmount;

  Items(
      {this.code, this.unit, this.quantity, this.unitAmount, this.totalAmount});

  Items.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    unit = json['unit'];
    quantity = json['quantity'];
    unitAmount = json['unitAmount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['unitAmount'] = this.unitAmount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Payment {
  List<PaymentDetail> paymentDetail;

  Payment({this.paymentDetail});

  Payment.fromJson(Map<String, dynamic> json) {
    if (json['paymentDetail'] != null) {
      paymentDetail = new List<PaymentDetail>();
      json['paymentDetail'].forEach((v) {
        paymentDetail.add(new PaymentDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentDetail != null) {
      data['paymentDetail'] =
          this.paymentDetail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentDetail {
  String method;
  int amount;

  PaymentDetail({this.method, this.amount});

  PaymentDetail.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['amount'] = this.amount;
    return data;
  }
}
