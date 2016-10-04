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

## Use as Dependency

You can use this library as a dependency, as it is simply a mod. You can also just put the files in your own mod, if you prefer that.

```json
"requires" : [ "DollGenerator" ],
```

```json
"includes" : [ "DollGenerator" ],
```

## Thanks
Special thanks to Mappo, Apple and the 100 people that have been running around holding dolls for the idea.
