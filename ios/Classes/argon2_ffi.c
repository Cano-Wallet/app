#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "src/argon2.h"

#define _CRT_SECURE_NO_WARNINGS

ARGON2_PUBLIC int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}

#define HASHLEN 32
#define SALTLEN 16
#define PWD "password"

#define DEBUG 0
#define PRINT_DEBUG(fmt, ...) \
            do { if (DEBUG) printf(fmt, ##__VA_ARGS__); } while (0)

size_t b64_encoded_size(size_t inlen) {
    size_t ret;

    ret = inlen;
    if (inlen % 3 != 0)
        ret += 3 - (inlen % 3);
    ret /= 3;
    ret *= 4;

    return ret;
}

const char b64chars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

char *b64_encode(const unsigned char *in, size_t len) {
    char *out;
    size_t elen;
    size_t i;
    size_t j;
    size_t v;

    if (in == NULL || len == 0)
        return NULL;

    elen = b64_encoded_size(len);
    out = malloc(elen + 1);
    out[elen] = '\0';

    for (i = 0, j = 0; i < len; i += 3, j += 4) {
        v = in[i];
        v = i + 1 < len ? v << 8 | in[i + 1] : v << 8;
        v = i + 2 < len ? v << 8 | in[i + 2] : v << 8;

        out[j] = b64chars[(v >> 18) & 0x3F];
        out[j + 1] = b64chars[(v >> 12) & 0x3F];
        if (i + 1 < len) {
            out[j + 2] = b64chars[(v >> 6) & 0x3F];
        } else {
            out[j + 2] = '=';
        }
        if (i + 2 < len) {
            out[j + 3] = b64chars[v & 0x3F];
        } else {
            out[j + 3] = '=';
        }
    }

    return out;
}


char *hashStuff() {
    uint8_t hash1[HASHLEN];
    uint8_t salt[SALTLEN];
    memset(salt, 0x00, SALTLEN);

    #ifdef _MSC_VER
    uint8_t *pwd = (uint8_t *) _strdup(PWD);
    #else
    uint8_t *pwd = (uint8_t *) strdup(PWD);
    #endif
    uint32_t pwdlen = strlen((char *) pwd);

    uint32_t t_cost = 2;            // 1-pass computation
    uint32_t m_cost = (1 << 16);      // 64 mebibytes memory usage
    uint32_t parallelism = 1;       // number of threads and lanes
    argon2i_hash_raw(t_cost, m_cost, parallelism, pwd, pwdlen, salt, SALTLEN,
                     hash1, HASHLEN);
    char *b64ret = b64_encode(hash1, HASHLEN);
    return b64ret;
}

void debugBytes(uint8_t *bytes, uint32_t length) {
    PRINT_DEBUG("length: %d -- ", length);
    for (uint32_t i = 0; i < length; i++) {
        PRINT_DEBUG("%02x ", bytes[i]);
    }
}

ARGON2_PUBLIC char *hp_argon2_hash(uint8_t *key, uint32_t keylen, uint8_t *salt, uint32_t saltlen,
                     uint32_t m_cost,
                     uint32_t t_cost /* iterations*/, uint32_t parallelism,
                     uint32_t hashlen,
                     uint8_t type, int32_t version) {
    uint8_t *hash1 = malloc(sizeof(uint8_t) * hashlen);
    PRINT_DEBUG("keylen: %ld, saltlen: %ld, m_cost: %ld, t_cost: %ld, parallelism: %ld, hashlen: %ld, type: %d, version: %02x\n",
           (long)keylen, (long)saltlen, (long)m_cost, (long)t_cost, (long)parallelism, (long)hashlen, type, version);
    PRINT_DEBUG("key: ");

    debugBytes(key, keylen);
    PRINT_DEBUG("\n");

    PRINT_DEBUG("salt: ");
    debugBytes(salt, saltlen);
    PRINT_DEBUG("\n");

    if (type == 0) {
        PRINT_DEBUG("argon2d\n");
        argon2d_hash_raw(t_cost, m_cost, parallelism, key, keylen, salt,
                         saltlen,
                         hash1, hashlen);
    } else if (type == 1) {
        argon2i_hash_raw(t_cost, m_cost, parallelism, key, keylen, salt,
                         saltlen,
                         hash1, hashlen);
    } else if (type == 2) {
        argon2id_hash_raw(t_cost, m_cost, parallelism, key, keylen, salt,
                         saltlen,
                         hash1, hashlen);
    }

    PRINT_DEBUG("hash: ");
    debugBytes(hash1, hashlen);
    PRINT_DEBUG("\n");
    char *b64ret = b64_encode(hash1, hashlen);
    free(hash1);
    return b64ret;
}
