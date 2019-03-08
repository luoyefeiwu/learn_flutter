import 'package:azlistview/azlistview.dart';

/// 请求与返回实体类

class ComData {
  int size;
  List datas;

  ComData.fromJson(Map<String, dynamic> json)
      : size = json['size'],
        datas = json['datas'];
}

class ComReq {
  int cid;

  ComReq.fromJson(Map<String, dynamic> json) : cid = json['size'];
}

class ReposModel {
  int id;
  String title;
  String desc;
  String author;
  String link;
  String projectLink;
  String envelopePic;
  String supperChapterName;
  int publishTime;
  bool collect;

  ReposModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'],
        author = json['author'],
        link = json['link'],
        projectLink = json['projectLink'],
        envelopePic = json['envelopePic'],
        publishTime = json['publishTime'],
        collect = json['collect'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'author': author,
        'link': link,
        'projectLink': projectLink,
        'envelopePic': envelopePic,
        'supperChapterName': supperChapterName,
        'publishTime': publishTime,
        'collect': collect,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"envelopePic\":\"$envelopePic\"");
    sb.write('}');
    return sb.toString();
  }
}

class BannerModel {
  String title;
  int id;
  String url;
  String imagePath;

  BannerModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json["id"],
        url = json["url"],
        imagePath = json["imagePath"];

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'url': url,
        'imagePath': imagePath,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imagePath\":\"$imagePath\"");
    sb.write('}');
    return sb.toString();
  }
}

class TreeModel extends ISuspensionBean {
  String name;
  int id;
  List<TreeModel> children;
  String tagIndex;

  TreeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json["id"],
        children = (json['children'] as List)
            ?.map((e) => e == null
                ? null
                : new TreeModel.fromJson(e as Map<String, dynamic>))
            ?.toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'children': children,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"name\":\"$name\"");
    sb.write(",\"id\":$id");
    sb.write(",\"children\":$children");
    sb.write('}');
    return sb.toString();
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}

class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        '}';
  }
}

class RegisterReq {
  String username;
  String password;
  String repassword;

  RegisterReq(this.username, this.password, this.repassword);

  RegisterReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        repassword = json['repassword'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'repassword': repassword,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        ", \"repassword\":\"" +
        repassword +
        "\"" +
        '}';
  }
}
