_nearestunits = nearestObjects [<getPos player>,["Man","Car","Air","Ship"],<50>];
_nearestfriendlies = [];

if(civilian countSide _nearestunits > 0) then
	{	
		{
			_unit = _x;
			if(side _unit == <civilian>) then{_abortButton ctrlEnable false};
			}else{
			_abortButton ctrlEnable false
   
		};

	};


