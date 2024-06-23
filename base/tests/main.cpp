#include "utils/md5.hpp"

#include <cstring>

int main(const int argc, const char *argv[]) {
  // 执行单元测试用例
  if (argc == 2) {
    if (strcmp(argv[1], "md5") == 0)
      return TestMd5();
  }
  return 0;
}