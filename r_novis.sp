#include <sourcemod>

ConVar sv_cheats;

public Plugin myinfo =
{
	name = "novis - type 'r_novis 1' in console to see the entire fucking map in fucking noclip. CSGO sucks.",
};

public void OnPluginStart()
{
	sv_cheats = FindConVar("sv_cheats");
	HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Post);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	
	if(!IsFakeClient(client))
	{
		SendConVarValue(client, sv_cheats, "2");
	}
}
