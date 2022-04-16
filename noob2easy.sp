#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>

int DES[10] = {1,3,6,5,4,8,0,9,2,7};
int IPB[64] = {57,49,41,33,25,17, 9,1,
               59,51,43,35,27,19,11,3,
               61,53,45,37,29,21,13,5,
               63,55,47,39,31,23,15,7,
               58,50,42,34,26,18,10,2,
               60,52,44,36,28,20,12,4,
               62,54,46,38,30,22,14,6,
               64,56,48,40,32,24,16,8};

public Plugin myinfo = {
    name = "N2E Secret Calculator",
    author = "koen",
    description = "Calculates the secret trigger code on ze_noob_too_easy_v3",
    version = "1.1.1",
    url = "https://steamcommunity.com/id/fungame1224/",
}

public void OnPluginStart()
{
    RegConsoleCmd("sm_n2e", Command_Noob2Easy, "Calculate the secret code for Noob Too Easy v3 Trigger");
}

public Action Command_Noob2Easy(int client, int args)
{
    if(args == 0)
    {
        ReplyToCommand(client, "[N2E Calculator] Usage: sm_n2e <Your HP>");
        return Plugin_Handled;
    }
    
    char sBuffer[16];
    GetCmdArg(1, sBuffer, sizeof(sBuffer));
    
    int input;
    int chars;
    
    if(strlen(sBuffer) > 0)
        chars = StringToIntEx(sBuffer, input);
        
    if(input == 0)
    {
        ReplyToCommand(client, "[N2E Calculator] You must enter a number");
        return Plugin_Handled;
    }
    
    if(input < 100)
        input = input * 10;
    if(input >= 1000)
        input = (input - input % 10) / 10;
    
    int b1 = input % 10;
    int b2 = ((input - b1) / 10) % 10;
    int b3 = (((input - b1) / 10) - b2) / 10;
    
    int bk = IPB[DES[b1]] * IPB[DES[b2]] * IPB[DES[b3]] + IPB[DES[b1]] + IPB[DES[b2]] + IPB[DES[b3]] +IPB[DES[(b1+b2+b3)%10]];
    
    ReplyToCommand(client, "[N2E Calculator] Your secret code is: %i", bk);
    return Plugin_Continue;
}