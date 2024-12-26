import 'package:suzaku/models/tool.dart';

List<ToolModel> webSelectTools() {
  List<ToolModel> list = List.empty(growable: true);

  var passwordTool = ToolModel(
    urn: 'f1b1b3b4-1b1b-3b1b-4b1b-5b1b6b1b7b1b8',
    name: 'Password Tool',
  );
  passwordTool.cover = "static/images/common/tools/password.png";
  passwordTool.route = "/password";
  list.add(passwordTool);

  var uuidTool = ToolModel(
    urn: 'f1b1b3b4-1b1b-3b1b-4b1b-5b1b6b1b7b1b8',
    name: 'UUID Tool',
  );
  uuidTool.cover = "static/images/common/tools/uuid.png";
  uuidTool.route = "/uuid";
  list.add(uuidTool);

  var svgTool = ToolModel(
    urn: '3bb59848-6551-4c95-a7cf-15665342ce16',
    name: 'SVG Tool',
  );
  svgTool.cover = "static/images/common/tools/images.png";
  svgTool.route = "/svg";
  list.add(svgTool);

  return list;
}
