/**
 * vim: set ts=4 :
 * =============================================================================
 * This plugin is a modification of the "fashion_fof"
 * https://github.com/CrimsonTautology/sm-fashion-fof
 * The models on this plugin come from gamebanana.com and Gmod workshop and converted to Fistful of Frags
 * Credits for the "fashion_fof" plugin and all other code by: CrimsonTautology
 * =============================================================================
 */

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <clientprefs>


#define PLUGIN_VERSION "1.0"
#define PLUGIN_NAME "-- Fistful Of Skins --"

public Plugin myinfo =
{
    name = PLUGIN_NAME,
    author = "Paralhama",
    description = "Allows players to choose custom skins.",
    version = PLUGIN_VERSION,
    url = "No website, for now..."
};

int g_PathFinderModelIndex;
int g_ArthurMorganModelIndex;
int g_TrevorModelIndex;
int g_JasonModelIndex;
int g_DemonViolinistModelIndex;
int g_TheTrapperModelIndex;
int g_johnwickModelIndex;
int g_zackModelIndex;
int g_JohnMarstonModelIndex;
int g_ErronBlackModelIndex;
int g_raymccallModelIndex;
int g_revenantModelIndex;
int g_hitmanModelIndex;
int g_joelModelIndex;
int g_vaasModelIndex;
int g_sniperModelIndex;
int g_prisonerModelIndex;
int g_billythekidModelIndex;
int g_BuffaloBillModelIndex;
int g_dannytrejoModelIndex;
int g_plaguedoktorModelInde;
int g_samuraiModelIndex;

#include "fof_skins/clients.sp"
#include "fof_skins/menus.sp"

ConVar g_EnabledCvar;

public void OnPluginStart()
{
    CreateConVar("sm_skins_version", PLUGIN_VERSION, PLUGIN_NAME,
            FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY | FCVAR_DONTRECORD);
    g_EnabledCvar = CreateConVar("sm_skins_enabled", "1", "Enabled");

    LoadTranslations("config_fofskins.phrases");

    RegConsoleCmd("sm_skins", Command_Skins, "Escolha uma Skin!");

    HookEvent("player_spawn", Event_PlayerSpawn);

    AutoExecConfig();
}

public void OnMapStart()
{
    g_PathFinderModelIndex = PrecacheModel("models/fof_skins/players/pathfinder/pathfinder.mdl");
    g_ArthurMorganModelIndex = PrecacheModel("models/fof_skins/players/arthur_morgan_v2/arthur_morgan.mdl");
    g_TrevorModelIndex = PrecacheModel("models/fof_skins/players/trevor/trevor.mdl");
    g_JasonModelIndex = PrecacheModel("models/fof_skins/players/jason_v2/jason.mdl");
    g_DemonViolinistModelIndex = PrecacheModel("models/fof_skins/players/demon_violinist/demon_violinist.mdl");
    g_TheTrapperModelIndex = PrecacheModel("models/fof_skins/players/the_trapper_v2/the_trapper.mdl");
    g_johnwickModelIndex = PrecacheModel ("models/fof_skins/players/john_wick/john_wick.mdl");
    g_zackModelIndex = PrecacheModel ("models/fof_skins/players/zack_v2/zack.mdl");
    g_JohnMarstonModelIndex = PrecacheModel ("models/fof_skins/players/johnmarston_v2/johnmarston.mdl");
    g_ErronBlackModelIndex = PrecacheModel ("models/fof_skins/players/erronblack_v2/erronblack.mdl");
    g_raymccallModelIndex = PrecacheModel ("models/fof_skins/players/ray_mccall_v2/ray_mccall.mdl");
    g_revenantModelIndex = PrecacheModel ("models/fof_skins/players/revenant_v2/revenant.mdl");
    g_hitmanModelIndex = PrecacheModel ("models/fof_skins/players/hitman/hitman.mdl");
    g_joelModelIndex = PrecacheModel ("models/fof_skins/players/joel_v2/joel.mdl");
    g_vaasModelIndex = PrecacheModel ("models/fof_skins/players/vaas/vaas.mdl");
    g_sniperModelIndex = PrecacheModel ("models/fof_skins/players/sniper_tf2_v2/sniper_tf2.mdl");
    g_prisonerModelIndex = PrecacheModel ("models/fof_skins/players/prisoner/prisoner.mdl");
    g_billythekidModelIndex = PrecacheModel ("models/fof_skins/players/billy_the_kid_v2/billy_the_kid.mdl");
    g_BuffaloBillModelIndex = PrecacheModel ("models/fof_skins/players/Buffalo_Bill_v2/Buffalo_Bill.mdl");
    g_dannytrejoModelIndex = PrecacheModel ("models/fof_skins/players/dannytrejo/dannytrejo.mdl");
    g_plaguedoktorModelInde = PrecacheModel ("models/fof_skins/players/plague_doktor_v2/plague_doktor.mdl");
    g_samuraiModelIndex = PrecacheModel ("models/fof_skins/players/samurai/samurai.mdl");
}

Action Command_Skins(int client, int args)
{
    if(!(0 < client <= MaxClients)) return Plugin_Handled;

    SkinsableClient fclient = SkinsableClient(client);
    ShowSkinsMenu(fclient);

    return Plugin_Handled;
}

void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
    if(!IsSkinsEnabled()) return;

    int userid = event.GetInt("userid");
    RequestFrame(PlayerSpawnDelay, userid);
}

void PlayerSpawnDelay(int userid)
{
    int client = GetClientOfUserId(userid);
    if(!(0 < client <= MaxClients)) return;

    SkinsableClient fclient = SkinsableClient(client);
    fclient.Refresh();
}

bool IsSkinsEnabled()
{
    return g_EnabledCvar.BoolValue;
}

