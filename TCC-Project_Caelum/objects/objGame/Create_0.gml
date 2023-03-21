//Inicialização e objetos/variaveis globais
randomise();

global.textSpd = 0.6;
global.gamePaused = false;
global.insLifted = noone;
global.instCamera = instance_create_layer(0, 0, layer, objCamera);
global.instUI = instance_create_layer(0, 0, layer, objUI);

//Items equipaveis
global.playerSwordUnlock = false;
global.playerItemEquiped = -1;
global.playerBombUnlocked = false;
global.playerBombAmmo = -1;

//Variaveis sobre a transição de salas
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = -1;

//Vida do jogador
global.playerLifeMax = 3 * LIFE_PER_HEARTH;
global.playerLife = global.playerLifeMax;

global.playerHasWakeUp = false;

//Items diversos
global.playerMoney = 0;
global.playerKeys = 0;

// Armazenando objetos em uma sala
global.savedObjectProperties = ds_list_create();

// Armazena onde o jogador é para respawnar(renascer?) após morrer e tentar denovo
global.respawnRoom = rCaveF1;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);


