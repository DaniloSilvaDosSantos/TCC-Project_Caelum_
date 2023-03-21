//Variaveis essenciais para as entidades

spd = 0
z = 0;
lifted = 0;
thrown = false;
spdThrow = 4;
hSpdEnt = 0;
vSpdEnt = 0;

// Atualizando o id da camada do tile de colisão
collisionMapId = layer_tilemap_get_id(layer_get_id("CollisionTiles"));

// Shader que brilha a entidade
flash = 0;
flashShader = shaderFlashWhite;
uFlash = shader_get_uniform(flashShader, "flash");

//Lista de drops da entidade
entityDropList = -1;
