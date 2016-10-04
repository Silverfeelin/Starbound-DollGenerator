doll = {}

--[[
  Generates a doll for the given entity ID or entityPortrait.
  If an entity ID is given, the description and shortdescription will be altered to show the name of the entity.
  @param idOrPortrait - Entity ID or world.entityPortrait result.
]]
function doll.generate(idOrPortrait) 
  local doll = root.assetJson("/doll/template.json")
  
  if type(idOrPortrait) == "number" then
    local name = world.entityName(idOrPortrait)
    doll.description = string.format("A doll of %s^reset;!", name)
    doll.shortdescription = string.format("%s^reset; Doll", name)
  end
  
  local portrait = type(idOrPortrait) == "table" and idOrPortrait or world.entityPortrait(idOrPortrait, "full")
  
  for i,v in ipairs(portrait) do
    local drawable = {
      properties = {
        centered = true,
        transformationGroups = jarray(),
        image = v.image,
        zLevel = 10 + i
      }
    }
    
    table.insert(drawable.properties.transformationGroups, "weapon")
    table.insert(doll.inventoryIcon, v)
    doll.animationCustom.animatedParts.parts["D_" .. i] = drawable
    
  end
  
  world.spawnItem("bubblegun", mcontroller.position(), 1, doll)
end

--[[
  Returns the nearest player ID, or your own if no players were found nearby.
  @return entity ID of the nearest player
]]
function doll.nearestPlayer()
  local ids = world.playerQuery(mcontroller.position(), 15, { includedTypes = { "player" }, withoutEntityId = entity.id() })
  return #ids > 0 and ids[1] or entity.id()
end