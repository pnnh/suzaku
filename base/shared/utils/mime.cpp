#include "mime.h"
 
bool StdMimeUtils::isImage(const std::string &path) { 
  return false;
}

bool StdMimeUtils::isHidden(const std::string &path) { return false; }

// 一般不处理这些特殊的路径下面的文件
bool StdMimeUtils::isIgnore(const std::string &path) {
  return false;
}
