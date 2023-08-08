#include <emscripten.h>

extern "C" void greet(const char *str);

int main(int argc, char **argv)
{
    (void)argc; (void)argv;

    emscripten_log(EM_LOG_CONSOLE, "Hello, World!");
    greet("username");

    return 0;
}
