class Profile {

   final String id;
   final String userId;
   final String name;
   final String createdAt;
   final String updatedAt;
   final String facebook;
   final String github;
   final String instagram;
   final String language;
   final String location;
   final String education;
   final String phone;
   final String profilePic;
   final String linkedin;


Profile({
  required this.education,
  required this.linkedin,
  required this.id, required this.userId, required this.name, required this.createdAt, required this.updatedAt,
  required this.facebook, required this.github, required this.instagram, required this.language, required this.location,
  required this.phone, required this.profilePic
});

}