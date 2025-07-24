#pragma once

#include <stdbool.h>

/**
 * @brief Get the currently active language
 * 
 * @return const char* Current language ("eng" or "esp")
 */
const char *zmk_lang_toggle_get_language();
