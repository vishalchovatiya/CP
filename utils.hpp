#pragma once

#include <algorithm>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>
#include <prettyprint.hpp>

using namespace std;

#define DEBUG(X)    cout<<#X<<" = "<<X<<endl;
#define ALL(X)    begin(X), end(X)

using u64 = uint64_t;
using u32 = uint32_t;
using u8 = uint8_t;
struct u56 { uint64_t var : 56; };
struct u48 { uint64_t var : 48; };

u64 set_bit(u64 n, u64 k) {
    return (n | (1 << (k - 1)));
}

u64 clear_bit(u64 n, u64 k) {
    return (n & (~(1 << (k - 1))));
}

u64 toggle_bit(u64 n, u64 k) {
    return (n ^ (1 << (k - 1)));
}

#define letter_to_number(lowercase_char) (lowercase_char-'a')

u64 str_to_byte_array(const char* str){
    u8 *p = (u8 *)str;
    u64 result = 0;
    u8 *r = (u8 *)&result;
    while(*p != '\0') *r++ = *p++;
    return result;
}

void byte_array_to_str(const u64 byte_arr, char* str){
    u8 *s = (u8 *)str;
    u8 *b = (u8 *)&byte_arr;
    s[0] = b[0];
    s[1] = b[1];
    s[2] = b[2];
    s[3] = b[3];
    s[4] = b[4];
    s[5] = b[5];
    s[6] = b[6];
    s[7] = b[7];
    s[8] = '\0';
}
