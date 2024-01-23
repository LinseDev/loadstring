local key_table = {
  key1 = true,
  key2 = true
}

local hwid_table = {}

function on_load(key)
  local player_name = get_player_name()
  
  if not key_table[key] then
    print("Invalid key: " .. key)
    return
  end
  
  local hwid = hwid_table[key] or generate_hwid()
  
  hwid_table[key] = hwid
  getgenv.key = key
  
  print("HWID for " .. player_name .. ": " .. hwid)
end

function on_player_join(player)
  local player_name = get_player_name(player)
  local key = getgenv.key
  local hwid = hwid_table[key]

  if not hwid then
    print("Player " .. player_name .. " has an invalid HWID")
    kick_player(player, "HWID Error")
    return
  end

  -- Your main script logic goes here
  print("Tested")
end

function generate_hwid()
  -- Generate a random number for HWID
  return math.random(100000000, 999999999)
end
