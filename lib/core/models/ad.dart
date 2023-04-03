class Ad {
  String id;
  String path;
  String nom;
  String priorite;
  String createdAt;
  String lien;

  Ad({this.id, this.path, this.nom, this.priorite, this.createdAt, this.lien});

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    nom = json['nom'];
    priorite = json['priorite'];
    createdAt = json['created_at'];
    lien = json['lien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['nom'] = this.nom;
    data['priorite'] = this.priorite;
    data['created_at'] = this.createdAt;
    data['lien'] = this.lien;
    return data;
  }
}
