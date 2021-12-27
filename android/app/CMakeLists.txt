cmake_minimum_required(VERSION 3.4.1)  # for example

add_library(argon2_ffi

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        ../../ios/Classes/argon2_ffi.c

        ../../ios/Classes/argon2src/argon2.c
        ../../ios/Classes/argon2src/core.c
        ../../ios/Classes/argon2src/encoding.c
        ../../ios/Classes/argon2src/genkat.c
        ../../ios/Classes/argon2src/ref.c
        ../../ios/Classes/argon2src/thread.c
        ../../ios/Classes/argon2src/blake2/blake2b.c
        )
        
#set_target_properties(argon2_ffi PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/argon2_ffi.so)
