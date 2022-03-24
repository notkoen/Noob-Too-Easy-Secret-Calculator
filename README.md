# ze_Noob_Too_Easy_v3 Secret Trigger Calculator
SourceMod plugin for calculating the secret on ze_noob_too_easy_v3. The trigger involves using activator's HP to determine what the correct code should be.

# Changelogs
## Version 1.0
- Initial commit

## Version 1.0.1
- Add missing include file
- Add README.md
- Include information about original vscript function

## Version 1.1.0
- Add a check to make sure input is a number (Thanks [Detroid](https://steamcommunity.com/id/2132423]))

# Original VScript Function:
```Squirrel
::bk <- 100;
::button <- null;
::ybk <- 0;
::pow <- 10;

DES <- [1,3,6,5,4,8,0,9,2,7];
IPB <- [
57,49,41,33,25,17, 9,1,
59,51,43,35,27,19,11,3,
61,53,45,37,29,21,13,5,
63,55,47,39,31,23,15,7,
58,50,42,34,26,18,10,2,
60,52,44,36,28,20,12,4,
62,54,46,38,30,22,14,6,
64,56,48,40,32,24,16,8 ]

function button1(){ybk = ybk * pow + 1;}
function button2(){ybk = ybk * pow + 2;}
function button3(){ybk = ybk * pow + 3;}
function button4(){ybk = ybk * pow + 4;}
function button5(){ybk = ybk * pow + 5;}
function button6(){ybk = ybk * pow + 6;}
function button7(){ybk = ybk * pow + 7;}
function button8(){ybk = ybk * pow + 8;}
function button9(){ybk = ybk * pow + 9;}
function button0(){ybk = ybk * pow + 0;}

function buttonrt()
{
	ybk = 0;
	if(activator.GetHealth()<150)
	{
		activator.SetHealth(activator.GetHealth()+100);
	}
	local h = RandomInt(1,activator.GetHealth()-30);
	if(h%2==1)
	{
		activator.SetHealth(activator.GetHealth()+h);
	}
	else
	{
		activator.SetHealth(activator.GetHealth()-h);
		
	}
	button = activator.GetHealth();
	while(button < 100 )
	{
		button = button * 10;
	}
	while(button >= 1000)
	{
		button = (button -  button %10 ) / 10;
	}
	local b1 = button % 10;
	local b2 = ((button - b1) / 10)%10;
	local b3 = (((button - b1) / 10 )-b2)/10;
	bk = IPB[DES[b1]] * IPB[DES[b2]] * IPB[DES[b3]] + IPB[DES[b1]]+IPB[DES[b2]] + IPB[DES[b3]] +IPB[DES[(b1+b2+b3)%10]];	
}

function buttonok()
{
	if(ybk == bk)
	{
		EntFire("item_book2_door","Break","",0.0);
		activator.SetHealth(250);
	}else {buttonrt();}
}
```
