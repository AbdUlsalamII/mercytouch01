class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteDoctorsid;
  int? doctorsId;
  String? doctorsEmail;
  String? doctorsPassword;
  String? doctorsName;
  int? doctorsPhone;
  String? doctorsImage;
  String? doctorsSpecialization;
  String? doctorsSummaryOfAchievements;
  int? doctorsYearOfExperiience;
  String? doctorsUniversity;
  String? doctorsDateofbirth;
  double? doctorsRating;
  String? doctorsClinicAddress;
  int? doctorsVerifycode;
  int? doctorsApprove;
  String? doctorsCreate;
  int? doctorsCat;
  int? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteDoctorsid,
      this.doctorsId,
      this.doctorsEmail,
      this.doctorsPassword,
      this.doctorsName,
      this.doctorsPhone,
      this.doctorsImage,
      this.doctorsSpecialization,
      this.doctorsSummaryOfAchievements,
      this.doctorsYearOfExperiience,
      this.doctorsUniversity,
      this.doctorsDateofbirth,
      this.doctorsRating,
      this.doctorsClinicAddress,
      this.doctorsVerifycode,
      this.doctorsApprove,
      this.doctorsCreate,
      this.doctorsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite-id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteDoctorsid = json['favorite_Doctorsid'];
    doctorsId = json['doctors_id'];
    doctorsEmail = json['doctors_email'];
    doctorsPassword = json['doctors_password'];
    doctorsName = json['doctors_name'];
    doctorsPhone = json['doctors_phone'];
    doctorsImage = json['doctors_image'];
    doctorsSpecialization = json['doctors_specialization'];
    doctorsSummaryOfAchievements = json['doctors_summary_of_achievements'];
    doctorsYearOfExperiience = json['doctors_year_of_experiience'];
    doctorsUniversity = json['doctors_university'];
    doctorsDateofbirth = json['doctors_dateofbirth'];
    doctorsRating = json['doctors_rating'];
    doctorsClinicAddress = json['doctors_clinic_Address'];
    doctorsVerifycode = json['doctors_verifycode'];
    doctorsApprove = json['doctors_approve'];
    doctorsCreate = json['doctors_create'];
    doctorsCat = json['doctors_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite-id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_Doctorsid'] = this.favoriteDoctorsid;
    data['doctors_id'] = this.doctorsId;
    data['doctors_email'] = this.doctorsEmail;
    data['doctors_password'] = this.doctorsPassword;
    data['doctors_name'] = this.doctorsName;
    data['doctors_phone'] = this.doctorsPhone;
    data['doctors_image'] = this.doctorsImage;
    data['doctors_specialization'] = this.doctorsSpecialization;
    data['doctors_summary_of_achievements'] = this.doctorsSummaryOfAchievements;
    data['doctors_year_of_experiience'] = this.doctorsYearOfExperiience;
    data['doctors_university'] = this.doctorsUniversity;
    data['doctors_dateofbirth'] = this.doctorsDateofbirth;
    data['doctors_rating'] = this.doctorsRating;
    data['doctors_clinic_Address'] = this.doctorsClinicAddress;
    data['doctors_verifycode'] = this.doctorsVerifycode;
    data['doctors_approve'] = this.doctorsApprove;
    data['doctors_create'] = this.doctorsCreate;
    data['doctors_cat'] = this.doctorsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}