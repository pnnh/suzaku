#include "md5.h"
#include <iostream>
#include <openssl/evp.h>
#include <openssl/md5.h>
#include <string>

std::string Md5Encoder::Encode(const std::string &data2) {
  const char data[]{"1234abcd"};
  // unsigned char md5[MD5_DIGEST_LENGTH];

  // 第一种方式
  // MD5(reinterpret_cast<const unsigned char *>(data), sizeof(data), md5);
  // //直接产生字符串的MD5

  // 第二种方式
  // MD5_CTX ctx;
  // MD5_Init(&ctx); // 初始化MD5上下文结构
  // MD5_Update(&ctx, data,
  //            sizeof(data)); // 刷新MD5，将文件连续数据分片放入进行MD5刷新
  // MD5_Final(md5, &ctx); // 产生最终的MD5数据

  EVP_MD_CTX *mdctx;
  unsigned char *md5_digest;
  unsigned int md5_digest_len = EVP_MD_size(EVP_md5());

  // MD5_Init
  mdctx = EVP_MD_CTX_new();
  EVP_DigestInit_ex(mdctx, EVP_md5(), NULL);

  // MD5_Update
  EVP_DigestUpdate(mdctx, reinterpret_cast<const unsigned char *>(data),
                   sizeof(data));

  // MD5_Final
  md5_digest = (unsigned char *)OPENSSL_malloc(md5_digest_len);
  EVP_DigestFinal_ex(mdctx, md5_digest, &md5_digest_len);
  EVP_MD_CTX_free(mdctx);

  std::string md5_hex;
  const char map[] = "0123456789abcdef";
  for (size_t i = 0; i < md5_digest_len; ++i) {
    // std::cout << int(md5_digest[i]) << " ";
    md5_hex += map[md5_digest[i] / 16];
    md5_hex += map[md5_digest[i] % 16];
  }
  std::cout << "\n" << md5_hex << std::endl;

  // std::string md5_hex{md5_digest, md5_digest + md5_digest_len};
  // std::cout << "\n" << md5_hex << std::endl;

  return "";
}