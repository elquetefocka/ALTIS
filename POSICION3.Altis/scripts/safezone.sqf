private ["_eh1","_inArea","_zone1","_zone2","_zone3","_dis"];

_zone1 = getMarkerPos "zonasegura_kavala";
_zone2 = getMarkerPos "zonasegura_pirgos";
_zone3 = getMarkerPos "zonasegura_sofia";
_dis = 200;                          

_inArea = false;

while {true} do
{
   if (alive player) then
   {
   if (((_zone1 distance player < _dis) || (_zone2 distance player < _dis) || (_zone3 distance player < _dis)) && (!_inArea)) then 
   {     
      _eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
      _inArea = true;
      hint "Entraste en Zona Segura";
	  player allowDamage false;
   };

   if (((_zone1 distance player > _dis) && (_zone2 distance player > _dis) && (_zone3 distance player > _dis)) && (_inArea)) then 
   {    
      player removeEventHandler ["fired", _eh1];
      _inArea = false;
      hint "Abandonaste Zona Segura";
	  player allowDamage true;
   };
	
	/*	
   if (_zone1 distance player < _dis) then
   {
		if ((side player == east) || (side player == resistance)) then
		{
			player setDammage 1;
		};
   } else
   {
		if (_zone2 distance player < _dis) then
		{
			if ((side player == west) || (side player == resistance)) then
			{
				hint "Entraste";
			};
		} else
		{
			if (_zone3 distance player < _dis) then
			{
				if ((side player == east) || (side player == west)) then
				{
					hint "Entraste";
				};
			};
		};
   };
   */
   };
sleep 3;
};