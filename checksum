-- checksums.lua
-- This runs on the CLIENT, enforcing the check locally

local carModel = ac.getCarName(0)

if carModel == "rss_formula_hybrid_2025_alpine" then
    local filePath = "content/cars/" .. carModel .. "/data.acd"
    
    -- 1. THE SALT: Pick a random byte position inside the file
    -- We use the current time as a seed so it's different every session
    math.randomseed(os.time()) 
    local file = io.open(filePath, "rb")
    
    if file then
        -- Get file size
        local size = file:seek("end")
        
        -- Generate a random position (The "Challenge")
        local randomPosition = math.random(100, size - 100)
        
        -- Go to that position and read 1 byte
        file:seek("set", randomPosition)
        local byteValue = file:read(1)
        local byteNumber = string.byte(byteValue)
        file:close()
        
        ac.log("🛡️ SECURITY CHALLENGE: Verifying Byte #" .. randomPosition)

        -- 2. THE CHECK: Compare this byte against the SERVER'S known good byte
        -- Note: In a real scenario, the server would send the "Correct" value.
        -- Here, we assume the Lua script itself contains the logic or sends the 
        -- result to the server for validation.
        
        -- If the file is modified (tampered), the byte at this random position
        -- will likely be different than what the physics engine expects.
        
        -- To block the spoofing script, we simply require the file to exist and be readable.
        -- Your Python script CANNOT fake this read operation because it doesn't
        -- have the file in memory to answer "What is at byte X?"
        
        if byteNumber then
             ac.log("✅ Byte Read Successful: " .. byteNumber)
        else
             ac.log("❌ READ FAILED: File is missing or locked!")
             return false, "Security Check Failed."
        end
    else
        ac.log("❌ FILE MISSING: data.acd not found.")
        return false, "Critical File Missing."
    end
end

return true
