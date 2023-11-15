project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}")
    objdir ("%{wks.location}/bin-int/%{prj.name}/%{cfg.buildcfg}")


    
    files
    {
    "src/internal.h",
    "src/mappings.h",
    "src/context.c",
    "src/init.c",
    "src/input.c",
    "src/monitor.c",
    "src/vulkan.c",
    "src/window.c"
    }
    includedirs { "glfw/include" }


    filter  "system:windows" 
        systemversion "latest"
        defines
        {
            "CRT_SECURE_NO_WARNING",
            "_GLFW_WIN32"
        }
        files
        {
          "src/wgl_context.c", 
          "src/win32_init.c",
          "src/win32_joystick.c",
          "src/win32_monitor.c",
          "src/win32_time.c",
          "src/win32_thread.c",
          "src/win32_window.c",
          "src/egl_context.c",
          "src/osmesa_context.c",
          "src/win32_platform.h",
          "src/win32_platform.h",
          "src/win32_joystick.h",
          "src/win32_monitor.h",
          "src/win32_platform.h",
          "src/win32_thread.h",
          "src/win32_window.h"
        }    

    filter { "configurations:Debug" }
        defines { "DEBUG" }
        symbols "On"

    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "On"
