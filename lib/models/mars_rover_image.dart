
class MarsRoverImagePhotosRover {

  int id;
  String name;
  String landingDate;
  String launchDate;
  String status;

  MarsRoverImagePhotosRover({
    this.id,
    this.name,
    this.landingDate,
    this.launchDate,
    this.status,
  });
  MarsRoverImagePhotosRover.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    landingDate = json["landing_date"]?.toString();
    launchDate = json["launch_date"]?.toString();
    status = json["status"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["landing_date"] = landingDate;
    data["launch_date"] = launchDate;
    data["status"] = status;
    return data;
  }
}

class MarsRoverImagePhotosCamera {

  int id;
  String name;
  int roverId;
  String fullName;

  MarsRoverImagePhotosCamera({
    this.id,
    this.name,
    this.roverId,
    this.fullName,
  });

  MarsRoverImagePhotosCamera.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    roverId = json["rover_id"]?.toInt();
    fullName = json["full_name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["rover_id"] = roverId;
    data["full_name"] = fullName;
    return data;
  }
}

class MarsRoverImagePhotos {

  int id;
  int sol;
  MarsRoverImagePhotosCamera camera;
  String imgSrc;
  String earthDate;
  MarsRoverImagePhotosRover rover;

  MarsRoverImagePhotos({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });
  MarsRoverImagePhotos.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    sol = json["sol"]?.toInt();
    camera = (json["camera"] != null) ? MarsRoverImagePhotosCamera.fromJson(json["camera"]) : null;
    imgSrc = json["img_src"]?.toString();
    earthDate = json["earth_date"]?.toString();
    rover = (json["rover"] != null) ? MarsRoverImagePhotosRover.fromJson(json["rover"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["sol"] = sol;
    if (camera != null) {
      data["camera"] = camera.toJson();
    }
    data["img_src"] = imgSrc;
    data["earth_date"] = earthDate;
    if (rover != null) {
      data["rover"] = rover.toJson();
    }
    return data;
  }
}

class MarsRoverImage {

  List<MarsRoverImagePhotos> photos;

  MarsRoverImage({
    this.photos,
  });

  MarsRoverImage.fromJson(Map<String, dynamic> json) {
    if (json["photos"] != null) {
      final v = json["photos"];
      final arr0 = <MarsRoverImagePhotos>[];
      v.forEach((v) {
        arr0.add(MarsRoverImagePhotos.fromJson(v));
      });
      photos = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (photos != null) {
      final v = photos;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["photos"] = arr0;
    }
    return data;
  }
}
