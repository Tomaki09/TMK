-- โหลด Discord UI Library
local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()

-- สร้างหน้าต่าง UI
local win = DiscordLib:Window("TMK")

-- สร้าง Server + Channel
local serv = win:Server("By: Tomaki Zyrex", "http://www.roblox.com/asset/?id=6031075938")
local btns = serv:Channel("Tomaki")

-- ตัวแปรควบคุมสถานะ
local autoBuyAllSeeds = false

-- ปุ่ม Toggle เปิด/ปิด
btns:Toggle("ซื้อเมล็ดพืชทั้งหมด", false, function(state)
    autoBuyAllSeeds = state
    spawn(function()
        while autoBuyAllSeeds do
            -- รายชื่อเมล็ดทั้งหมด
            local seeds = {"Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Watermelon", "Rafflesia", "Green Apple", "Avocado", "Banana", "Pineapple", "Kiwi", "Bell Pepper", "Prickly Pear", "Loquat", "Feijoa", "Pitcher Plant", "Sugar Apple"} -- แก้/เพิ่มได้ตามต้องการ

            for _, seedName in ipairs(seeds) do
                local remote = game:GetService("ReplicatedStorage")
                    :WaitForChild("GameEvents")
                    :WaitForChild("BuySeedStock")
                remote:FireServer(seedName)
                task.wait(0.01) -- เว้นนิดหน่อยกันค้าง
            end

            task.wait(0.01) -- รอ 1 วิ ก่อนซื้อใหม่ทั้งชุด (ปรับเป็น 0.5 หรือเร็วขึ้นได้)
        end
    end)
end)

-- 🧰 Auto Buy Tools (Watering Can + Trowel)
local autoBuyGears = false
btns:Toggle("ซื้อเครื่องมือทั้งหมด", false, function(state)
    autoBuyGears = state
    spawn(function()
        while autoBuyGears do
            local tools = {"Watering Can", "Trowel", "Recall Wrench", "Basic Sprinkler", "Advanced Sprinkler", "Godly Sprinkler", "Magnifying Glass", "Tanning Mirror", "Master Sprinkler", "Cleaning Spray", "Favorite Tool", "Harvest Tool", "Friendship Pot"}
            for _, toolName in ipairs(tools) do
                local remote = game:GetService("ReplicatedStorage")
                    :WaitForChild("GameEvents")
                    :WaitForChild("BuyGearStock")
                remote:FireServer(toolName)
                task.wait(0.01)
            end
            task.wait(0.01)
        end
    end)
end)

-- 🥚 Auto Buy Pet Eggs ID 1, 2, 3
local autoBuyEggs = false
btns:Toggle("ซื้อไข่ทั้งหมด(ยกเว้นร้านค้าอีเว้น)", false, function(state)
    autoBuyEggs = state
    spawn(function()
        while autoBuyEggs do
            local eggIDs = {1, 2, 3}
            for _, eggID in ipairs(eggIDs) do
                local remote = game:GetService("ReplicatedStorage")
                    :WaitForChild("GameEvents")
                    :WaitForChild("BuyPetEgg")
                remote:FireServer(eggID)
                task.wait(0.1) -- หน่วงนิดหน่อยกันค้าง
            end
            task.wait(1) -- ซื้อครบ 1 รอบ รอ 1 วิ (ปรับให้เร็วขึ้นได้)
        end
    end)
end)
