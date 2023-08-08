#include <emscripten.h>

int main(int argc, char **argv)
{
    (void)argc; (void)argv;

    emscripten_log(EM_LOG_CONSOLE, "Hello, World!");
    return 0;
}
