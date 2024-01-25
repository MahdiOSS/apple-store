class User {
  String avatar;
  String collectionId;
  String collectionName;
  String created;
  bool emailVisibility;
  String id;
  String name;
  String updated;
  String username;
  bool verified;

  User(
      this.name,
      this.username,
      this.id,
      this.avatar,
      this.collectionId,
      this.collectionName,
      this.created,
      this.emailVisibility,
      this.updated,
      this.verified);

  factory User.fromJson(Map<String, dynamic> json) => User(
      json["name"],
      json["username"],
      json["id"],
      json["avatar"],
      json["collectionId"],
      json["collectionName"],
      json["created"],
      json["emailVisibility"],
      json["updated"],
      json["verified"]);
}
