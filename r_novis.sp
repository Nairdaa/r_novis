#include <sourcemod>

ConVar CV_CheatsOn;

public Plugin myinfo =
{
	name = "novis - type 'r_novis 1' in console to see the entire fucking map in fucking noclip. CSGO sucks.",
	description = "Volvo™ sucks"
};

public void OnPluginStart()
{
	CV_CheatsOn = FindConVar("sv_cheats");
	HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Post);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int iClient = GetClientOfUserId(event.GetInt("userid"));
	
	if(!IsFakeClient(iClient))
	{
		SendConVarValue(iClient, CV_CheatsOn, "2");
	}
}
