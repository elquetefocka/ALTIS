_store = blackjack;
_denied1 = false;
_price = 2500;

if(life_cash < _price) exitWith {hint "Usted no tiene suficiente dinero conmigo, unos costes redondas $2500";};
life_cash = life_cash - _price;
removeAllActions blackjack;



				hint "Du bist am Zug!";
				_number = ceil(random 10);
				_pplayer = _this select 0;
				if (_number == 0) then {robberyreward = 5000; hint "19! Limpio, después de todo, ganó!";};
				if (_number == 1) then {robberyreward = 0; hint "18! Desafortunadamente perdido!";};
				if (_number == 2) then {robberyreward = 0; hint "8! Fracaso...";};						
				if (_number == 3) then {robberyreward = 0; hint "14! Sin embargo, esto va a mejorar...";};
				if (_number == 4) then {robberyreward = 0; hint "16! Rápido! Vamos, una ronda más..!";};
				if (_number == 5) then {robberyreward = 0; hint "12! Increíblemente, mi abuela juega mejor que tú!";};
				if (_number == 6) then {robberyreward = 0; hint "13! Perdió de nuevo .. Muy mal ..!";};
				if (_number == 7) then {robberyreward = 7500; hint "20! Casi perfecto! Has ganado!";};
				if (_number == 8) then {robberyreward = 0; hint "10! Así que .. se gana nada!";};
				if (_number == 9) then {robberyreward = 0; hint "11! Perderor¡¡!";};
				if (_number == 10) then {robberyreward = 10000; hint "21!!! Euro-Jackpot!!";};
				life_action_inUse = true;
	

sleep 2;
_robberycash = robberyreward;
_timer = time + (1 * 5);	
_toFar = false;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["Usted tiene que permanecer en la mesa y esperar su turno!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 5) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {hint "Estabas getazed, juego falló!";};
};

switch(true) do
{
	case (_toFar):
	{
		hint "Usted está demasiado lejos, la estancia en la mesa";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (!alive player):
	{
		hint "El juego salió mal, porque moriste.";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (life_istazed):
	{
		hint "Estabas getazed, juego fracasó!";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["Tienes $%1 ganados.", _robberycash];
		life_cash = life_cash + _robberycash;
		_denied1 = false;
		life_action_inUse = false;
	};	
};

sleep 10;
blackjack addAction["Jugar blackjack ($2500)",life_fnc_blackjack,"blackjack"];
life_action_inUse = false;