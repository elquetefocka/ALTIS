private ["_eh1","_inArea","_zone1","_zone2","_zone3","_dis"];

_zone1 = getMarkerPos "zona_bancocentral";

_dis = 20;                          

_inArea = false;



switch (playerSide) do
{
	case civilian:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis)) && (!_inArea)) then 
				{     
					_inArea = true;
					[[_vault],"life_fnc_bancocentralalarma",nil,true] spawn life_fnc_MP;
					[[3,"<t size='1.5'><t color='#00FF00'>BANCO CENTRAL ALARMA</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

				};

				if (((_zone1 distance player > _dis) ) && (_inArea)) then 
				{    
					
					_inArea = false;
					
				};
     
			};
		};
	
	};
	

};