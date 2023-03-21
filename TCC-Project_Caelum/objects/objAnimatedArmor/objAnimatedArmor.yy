{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "objAnimatedArmor",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parentEnemy","path":"objects/parentEnemy/parentEnemy.yy",},"propertyId":{"name":"enemyAttackDamage","path":"objects/parentEnemy/parentEnemy.yy",},"value":"4",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parentEnemy","path":"objects/parentEnemy/parentEnemy.yy",},"propertyId":{"name":"enemyHitPoints","path":"objects/parentEnemy/parentEnemy.yy",},"value":"50",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parentEnemy","path":"objects/parentEnemy/parentEnemy.yy",},"propertyId":{"name":"enemySpd","path":"objects/parentEnemy/parentEnemy.yy",},"value":"3.4",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parentEntity","path":"objects/parentEntity/parentEntity.yy",},"propertyId":{"name":"entityAttackImune","path":"objects/parentEntity/parentEntity.yy",},"value":"True",},
  ],
  "parent": {
    "name": "enemies",
    "path": "folders/Objects/enemies.yy",
  },
  "parentObjectId": {
    "name": "parentEnemy",
    "path": "objects/parentEnemy/parentEnemy.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyDisJump","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"104","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyJumpZHeight","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"15","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"entityOpenDoors","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"-1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "sprAnimatedArmor",
    "path": "sprites/sprAnimatedArmor/sprAnimatedArmor.yy",
  },
  "spriteMaskId": {
    "name": "sprAnimatedArmor",
    "path": "sprites/sprAnimatedArmor/sprAnimatedArmor.yy",
  },
  "visible": true,
}