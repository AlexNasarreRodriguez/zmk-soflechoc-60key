#define DT_DRV_COMPAT nasarre_behavior_lang_toggle

#include <device.h>
#include <drivers/behavior.h>
#include <logging/log.h>
#include <zmk/behavior.h>
#include <zmk/event_manager.h>

LOG_MODULE_DECLARE(zmk, CONFIG_ZMK_LOG_LEVEL);

// Global language state variable
static const char *current_lang = "eng"; // Default to English

struct behavior_lang_toggle_config {
    const char *lang_eng;
    const char *lang_esp;
};

static int on_lang_toggle_binding_pressed(struct zmk_behavior_binding *binding,
                                    struct zmk_behavior_binding_event event) {
    const struct device *dev = device_get_binding(binding->behavior_dev);
    const struct behavior_lang_toggle_config *cfg = dev->config;
    
    // Toggle language between eng and esp
    if (strcmp(current_lang, cfg->lang_eng) == 0) {
        current_lang = cfg->lang_esp;
        LOG_DBG("Language toggled to: %s", current_lang);
    } else {
        current_lang = cfg->lang_eng;
        LOG_DBG("Language toggled to: %s", current_lang);
    }

    return ZMK_BEHAVIOR_OPAQUE;
}

static int on_lang_toggle_binding_released(struct zmk_behavior_binding *binding,
                                      struct zmk_behavior_binding_event event) {
    return ZMK_BEHAVIOR_OPAQUE;
}

static const struct behavior_driver_api behavior_lang_toggle_driver_api = {
    .binding_pressed = on_lang_toggle_binding_pressed,
    .binding_released = on_lang_toggle_binding_released,
};

static int behavior_lang_toggle_init(const struct device *dev) {
    return 0;
}

// Get current language - can be called by other behaviors
const char *zmk_lang_toggle_get_language() {
    return current_lang;
}

#define LANG_TOGGLE_INST(n)                                                      \
    static struct behavior_lang_toggle_config behavior_lang_toggle_config_##n = { \
        .lang_eng = DT_INST_PROP(n, lang_eng),                                   \
        .lang_esp = DT_INST_PROP(n, lang_esp),                                   \
    };                                                                           \
    DEVICE_DT_INST_DEFINE(n, behavior_lang_toggle_init, NULL,                    \
                          NULL, &behavior_lang_toggle_config_##n,                 \
                          POST_KERNEL, CONFIG_KERNEL_INIT_PRIORITY_DEFAULT,       \
                          &behavior_lang_toggle_driver_api);

DT_INST_FOREACH_STATUS_OKAY(LANG_TOGGLE_INST)
