var a = 0;
async function button() {
   a++;
   console.log(Module._Hello());
   console.log(Module._Add(0, a));
   var ptr = Module._GetString();
   var str = UTF8ToString(ptr);
   console.log(typeof(str));
   console.log(str);
   ptr = allocateUTF8OnStack("你好，Emscripten！");
   Module._SetString(ptr);
}
