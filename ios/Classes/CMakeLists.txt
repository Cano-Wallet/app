cmake_minimum_required(VERSION 3.4.1)  # for example

add_library(argon2_ffi

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        argon2_ffi.c

        argon2src/argon2.c
        argon2src/core.c
        argon2src/encoding.c
        argon2src/genkat.c
        argon2src/ref.c
        argon2src/thread.c
        argon2src/blake2/blake2b.c
        )
        
#set_target_properties(argon2_ffi PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/argon2_ffi.so)
