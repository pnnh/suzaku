#pragma once

#include <string>

class StdMimeUtils {
public:
  static bool isImage(const std::string &path);
  static bool isHidden(const std::string &path);
  static bool isIgnore(const std::string &path);
};
