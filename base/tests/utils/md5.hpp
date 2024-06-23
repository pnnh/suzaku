#include "lib/utils/md5.h"

int TestMd5() {

  std::string data{"1234abcd"};
  auto md5_hex = Md5Encoder::Encode(data);
  return 0;
}