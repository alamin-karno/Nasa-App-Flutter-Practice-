class NASAAPODMODEL {
  String copyright;
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  NASAAPODMODEL({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  NASAAPODMODEL.fromJson(Map<String, dynamic> json) {
    copyright = json["copyright"]?.toString();
    date = json["date"]?.toString();
    explanation = json["explanation"]?.toString();
    hdurl = json["hdurl"]?.toString();
    mediaType = json["media_type"]?.toString();
    serviceVersion = json["service_version"]?.toString();
    title = json["title"]?.toString();
    url = json["url"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["copyright"] = copyright;
    data["date"] = date;
    data["explanation"] = explanation;
    data["hdurl"] = hdurl;
    data["media_type"] = mediaType;
    data["service_version"] = serviceVersion;
    data["title"] = title;
    data["url"] = url;
    return data;
  }
}
