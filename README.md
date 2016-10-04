# Starbound Doll Generator
A library that lets you spawn dolls.

## Usage
Meant for use in tech scripts only.

```lua
require "/scripts/dollGenerator.lua"

doll.generate(entity.id())
doll.generate(doll.nearestPlayer())
doll.generate(world.entityPortrait(entity.id(), "full"))
```
