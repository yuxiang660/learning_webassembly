#ifndef EM_PORT_API
#   if defined(__EMSCRIPTEN__)
#      include <emscripten.h>
#      if defined(__cplusplus)
#         define EM_PORT_API(rettype) extern "C" rettype EMSCRIPTEN_KEEPALIVE
#      else
#         define EM_PORT_API(rettype) rettype EMSCRIPTEN_KEEPALIVE
#      endif
#   else
#      if defined(__cplusplus)
#         define EM_PORT_API(rettype) extern "C" rettype
#      else
#         define EM_PORT_API(rettype) rettype
#      endif
#   endif
#endif

#include <iostream>

EM_PORT_API(int) Hello() {
   std::cout << "hello" << std::endl;
   return 1;
}

EM_PORT_API(int) Add(int a, int b) {
   return a + b;
}

EM_PORT_API(const char*) GetString() {
   static const char* str = "string from c";
   return str;
}

EM_PORT_API(int) SetString(const char* s) {
   std::cout << s << std::endl;
   return 2;
}

