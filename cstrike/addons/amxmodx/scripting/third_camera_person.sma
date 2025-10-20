#include <amxmodx>
#include <engine>

#define PLUGIN "Third Person Camera"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

new bool:g_bCamera[33];

public plugin_precache() precache_model("models/rpgrocket.mdl");

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    register_clcmd("say /camera", "clcmd_camera");
    register_clcmd("say camera", "clcmd_camera");
    register_clcmd("say /cam", "clcmd_camera");
    register_clcmd("say cam", "clcmd_camera");
}

public client_putinserver(id) g_bCamera[id] = false;
public client_disconnected(id) g_bCamera[id] = false;

public clcmd_camera(id)
{
    if (!is_user_connected(id))
        return;

    if (!is_user_alive(id))
    {
        client_print_color(id, 0, "^x01You must be^x03 alive^x01 to toggle the^x04 camera view^x01.");
        return;
    }

    if (g_bCamera[id])
    {
        set_view(id, CAMERA_NONE);
        g_bCamera[id] = false;
        client_print_color(id, 0, "^x01You have switched to^x03 First-Person View^x01.");
    }
    else
    {
        set_view(id, CAMERA_3RDPERSON);
        g_bCamera[id] = true;
        client_print_color(id, 0, "^x01You have switched to^x03 Third-Person View^x01.");
    }
}