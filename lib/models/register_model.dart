class RegisterModel{
  RegisterModel({
    required this.mail,
    required this.isim,
    required this.soyIsim,
    required this.adres,
    required this.password,
    required this.phone
  });

  late final String mail;
  late final String isim;
  late final String soyIsim;
  late final String adres;
  late final String password;
  late final String phone;

  RegisterModel.fromJson(Map<String, dynamic> json){
    mail = json['mail'];
    isim = json['isim'];
    soyIsim = json['soyIsim'];
    adres = json['adres'];
    phone=json['phone'];
    password=json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mail'] = mail;
    _data['isim'] = isim;
    _data['soyIsim'] = soyIsim;
    _data['adres'] = adres;
    _data['phone']=phone;
    _data['password']=password;
    return _data;
  }
}