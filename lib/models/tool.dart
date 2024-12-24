class ToolModel {
  String urn = "";
  String name = "";
  String title = "";
  String description = "";
  DateTime createTime = DateTime.utc(0);
  DateTime updateTime = DateTime.utc(0);
  String cover = "";
  String route = "";

  ToolModel({this.urn = "", this.name = ""});
}
