class Agency {
  String id;
  String idPartenaire;
  String login;
  String password;
  String logo;
  String nom;
  String numero;
  String ville;
  String quartier;
  double longitude;
  double latitude;
  String adresse;
  String etat;
  String createdAt;
  String isSiege;
  String canMakeDepot;
  String canMakeRetrait;
  String lastLogin;
  String code;
  String credits;
  double distance;

  Agency(
      {this.id,
      this.idPartenaire,
      this.login,
      this.password,
      this.logo,
      this.nom,
      this.numero,
      this.ville,
      this.quartier,
      this.longitude,
      this.latitude,
      this.adresse,
      this.etat,
      this.createdAt,
      this.isSiege,
      this.canMakeDepot,
      this.canMakeRetrait,
      this.lastLogin,
      this.code,
      this.credits,
      this.distance});

  Agency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPartenaire = json['idPartenaire'];
    login = json['login'];
    password = json['password'];
    logo = json['logo'];
    nom = json['nom'];
    numero = json['numero'];
    ville = json['ville'];
    quartier = json['quartier'];
    longitude = double.parse(json['longitude'] ?? "0");
    latitude = double.parse(json['latitude'] ?? "0");
    adresse = json['adresse'];
    etat = json['etat'];
    createdAt = json['created_at'];
    isSiege = json['isSiege'];
    canMakeDepot = json['canMakeDepot'];
    canMakeRetrait = json['canMakeRetrait'];
    lastLogin = json['last_login'];
    code = json['code'];
    credits = json['credits'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idPartenaire'] = this.idPartenaire;
    data['login'] = this.login;
    data['password'] = this.password;
    data['logo'] = this.logo;
    data['nom'] = this.nom;
    data['numero'] = this.numero;
    data['ville'] = this.ville;
    data['quartier'] = this.quartier;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['adresse'] = this.adresse;
    data['etat'] = this.etat;
    data['created_at'] = this.createdAt;
    data['isSiege'] = this.isSiege;
    data['canMakeDepot'] = this.canMakeDepot;
    data['canMakeRetrait'] = this.canMakeRetrait;
    data['last_login'] = this.lastLogin;
    data['code'] = this.code;
    data['credits'] = this.credits;
    data['distance'] = this.distance;
    return data;
  }
}
