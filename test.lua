

task.spawn(function()
    local function v2()
        local _ErrorPrompt = game:GetService('CoreGui'):WaitForChild('RobloxPromptGui', 60):WaitForChild('promptOverlay', 60):WaitForChild('ErrorPrompt', 999999)

        print('Found:', _ErrorPrompt)

        if _ErrorPrompt then
            game['Teleport Service']:Teleport(game.PlaceId)
        end
    end

    while true do
        v2()
        task.wait(1)
    end
end)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

game:GetService('TweenService')
game:GetService('UserInputService')

function antiafk()
    if getgenv().AA then
        return
    else
        print('Anti-Afk Inited.')

        local v3 = require(game.ReplicatedStorage.Library.Client.Network)
        local _Fire = v3.Fire

        setreadonly(v3, false)

        function v3.Fire(...)
            if ({...})[1] ~= 'Idle Tracking: Update Timer' then
                return _Fire(...)
            end
        end

        setreadonly(v3, true)

        local v5, v6, v7 = pairs(getconnections(game.UserInputService.WindowFocusReleased))

        while true do
            local v8

            v7, v8 = v5(v6, v7)

            if v7 == nil then
                break
            end
            if v8.Disable then
                v8:Disable()
            end
        end

        local v9, v10, v11 = pairs(getconnections(game.UserInputService.WindowFocused))

        while true do
            local v12

            v11, v12 = v9(v10, v11)

            if v11 == nil then
                break
            end
            if v12.Disable then
                v12:Disable()
            end
        end

        getgenv().AA = true

        while true do
            game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Unknown, false, nil)
            wait(math.random(15, 120))
        end
    end
end

local u13 = nil
local u14 = nil
local u15 = nil

task.spawn(function()
    local v16, v17, v18 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Verteniasty/Pet-rbx/refs/heads/main/KeySystemMain.lua'))()

    u15 = v18
    u14 = v17
    u13 = v16
end)

local v19 = {
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
}
local u20 = {
    {
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
        'v',
        'w',
        'x',
        'y',
        'z',
    },
    v19,
}

local function u24(p21)
    local v22 = ''

    for _ = 1, p21 do
        local v23 = u20[math.random(1, #u20)]

        v22 = v22 .. v23[math.random(1, #v23)]
    end

    return v22
end

local u25 = identifyexecutor()
local v26 = require(game.ReplicatedStorage.Blunder.BlunderMessage)
local _key = v26.key

setreadonly(v26, false)

function v26.key(...)
    local v28 = ...

    if v28.message == 'PING' or v28.message == 'Anti Cheat fetched error in console' then
        return _key(...)
    end

    warn('Anti Cheat fetched error in console')
    print('BLUNDER')
    print(v28.messageType)
    print(v28.message, '\n')

    local v29 = {}
    local v30 = {
        color = 16711680,
        fields = {
            {
                name = 'Error Message',
                value = v28.message,
            },
            {
                name = 'Error Traceback',
                value = v28.stackTrace,
            },
        },
        thumbnail = {
            url = 'https://cdn.discordapp.com/attachments/1350493793803042816/1350494850935422986/warning.png?ex=67d6f1d7&is=67d5a057&hm=9fdca4551b0bddf817f164960286b4f800fb592287218c66ae273e3e9330c71c&',
        },
        footer = {
            text = game.Players.LocalPlayer.Name .. u25,
        },
    }

    __set_list(v29, 1, {v30});

    ({
        content = 'Hook Fetched error in console!',
    }).embeds = v29
end

setreadonly(v26, true)

getgenv().VRT = {Lib = {}}

local v31, v32, v33 = pairs(game:GetService('ReplicatedStorage').Library.Client:GetDescendants())
local u34 = u13
local u35 = u15
local u36 = {
    [8737899170] = 'World 1',
    [16498369169] = 'World 2',
    [17503543197] = 'World 3',
}

while true do
    local v37, u38 = v31(v32, v33)

    if v37 == nil then
        break
    end

    v33 = v37

    if u38:IsA('ModuleScript') then
        local _, v39 = pcall(function()
            return require(u38)
        end)

        getgenv().VRT.Lib[tostring(u38)] = v39
        getgenv().VRT.Lib[1] = 'Inited'
    end
end

local function u41()
    local v40 = {}

    if debug.getinfo(getgenv().request).what == 'Lua' then
        table.insert(v40, 'WHAT')
    end
    if isfunctionhooked(request) then
        table.insert(v40, 'FH1')
    end
    if isfunctionhooked(getgenv().request) then
        table.insert(v40, 'FH2')
    end

    return #v40 > 0 and true or false, v40
end

function SendWebhook(p42, p43)
    local v44, _ = u41()

    if not v44 then
        local v45 = request
        local v46 = {
            Url = p42,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
            },
            Body = game.HttpService:JSONEncode(p43),
        }

        v45(v46)
    end
end

local u47 = nil

task.spawn(function()
    u47 = request({
        Url = 'https://raw.githubusercontent.com/Verteniasty/Pets-Go/refs/heads/main/Version',
        Method = 'GET',
    }).Body

    local v48 = identifyexecutor() or 'Unknown'
    local v49 = game.MarketplaceService:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
    local v50 = {
        username = 'Execution Logs',
        footer = {
            text = 'Vrt Execution Log',
            icon_url = 'https://cdn.discordapp.com/icons/1103035026930671656/724be00a3c4c6abaa52dc3d0dfff8991.webp?size=128',
        },
        embeds = {
            {
                title = '\u{fffd}\u{fffd}\u{fe0f}New Execution.',
                color = 4962791,
                fields = {
                    {
                        name = '',
                        value = '**`Player Name: ' .. game.Players.LocalPlayer.Name .. '`\n' .. '`Placeid: ' .. game.PlaceId .. '`\n' .. '`Game Name: ' .. v49.Name .. '`\n' .. '`Execution Time: ' .. os.date('%c') .. '`\n' .. '`Executor: ' .. v48 .. '`**\n' .. '-# script version: ' .. u47,
                    },
                },
            },
        },
    }

    SendWebhook('https://discord.com/api/webhooks/1360241802187112569/Xy16q8-7oTrrnVed2iRNKssVXy24oAtVqstyX47AL1VAQ3CTIeSEvtJlrw8yOgRo4g7t', v50)
end)
game:GetService('RunService')

local u51 = require(game:WaitForChild('ReplicatedStorage'):WaitForChild('Library'):WaitForChild('Client'):WaitForChild('Network'))
local u52 = require(game:GetService('ReplicatedStorage').Library.Items)
local u53 = {}
local u54 = {}
local u55 = {}
local u56 = require(game.ReplicatedStorage.Library.Client.PlayerPet)
local u57 = getsenv(game:GetService('Players').LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend'])
local u58 = require(game:GetService('ReplicatedStorage').Library.Client.NotificationCmds)
local u59 = require(game:GetService('ReplicatedStorage').Library.Client.InstancingCmds)
local u60 = require(game:GetService('ReplicatedStorage').Library.Client.InstanceZoneCmds)

require(game:GetService('ReplicatedStorage').Library.Client.CustomEggsCmds)

local u61 = require(game:GetService('ReplicatedStorage').Library.Client.EggCmds)

require(game:GetService('ReplicatedStorage').Library.Types.Quests)
require(game.ReplicatedStorage.Library.Client.Save)

local u62 = nil
local u63 = nil
local u64 = nil
local u65 = nil
local u66 = {}

getgenv().v_settings = {
    functionToggles = {
        MailboxEnabled = false,
        HugeMailboxEnabled = false,
        MailboxUsername = '',
        MailboxItems = {},
        InputedMailboxItem = '',
        InputedMailboxAmount = 0,
        MailboxSendHugesType = '',
        MailboxClaimAll = false,
        SelectedLootboxes = {},
        SelectedGifts = {},
        SelectedChestsUpgrades = {},
        BuySelectedChestUpgrades = false,
        ChestHeroicMode = false,
    },
    functionsValues = {
        ClickAuraValue = 75,
        EggAnimation = u57.PlayEggAnimation,
        PetSpeed = u56.CalculateSpeedMultiplier,
    },
    functions = {
        CollectOrbs = function()
            local v67, v68, v69 = pairs(game:GetService('Workspace').__THINGS:FindFirstChild('Orbs'):GetChildren())

            while true do
                local v70

                v69, v70 = v67(v68, v69)

                if v69 == nil then
                    break
                end

                u51.Fire('Orbs: Collect', {
                    tonumber(v70.Name),
                })
                v70:Destroy()
            end
        end,
        ClickAura = function()
            if not game.Players.LocalPlayer.Character then
                return
            end

            local _HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v72, v73, v74 = pairs(workspace.__THINGS:WaitForChild('Breakables'):GetChildren())

            while true do
                local v75

                v74, v75 = v72(v73, v74)

                if v74 == nil then
                    break
                end
                if (_HumanoidRootPart.Position - v75.WorldPivot.Position).Magnitude < getgenv().v_settings.functionsValues.ClickAuraValue and v75:IsA('Model') then
                    u51.UnreliableFire('Breakables_PlayerDealDamage', v75.Name)

                    break
                end
            end
        end,
        VisualizeClickAura = function(p76)
            if workspace:FindFirstChild('M') and getgenv().v_settings.functionToggles.ClickAuraVisualizer then
                local _M = workspace:FindFirstChild('M')

                _M.Size = Vector3.new(0.2, p76 * 2, p76 * 2)
                _M.Rotation = Vector3.new(0, 0, 90)

                return _M
            end
            if getgenv().v_settings.functionToggles.ClickAuraVisualizer then
                local _Part = Instance.new('Part', workspace)

                _Part.Name = 'M'
                _Part.CanCollide = false
                _Part.Anchored = true
                _Part.Shape = 'Cylinder'
                _Part.Size = Vector3.new(0.2, p76 * 2, p76 * 2)
                _Part.Transparency = 0.5
                _Part.BrickColor = BrickColor.new('Light green (Mint)')
                _Part.Rotation = Vector3.new(0, 0, 90)

                return _Part
            end
        end,
        OptimizeBreakables = function()
            getgenv().v_settings.OptimizeBreakables = workspace.__DEBRIS.ChildAdded:Connect(function(p79)
                xpcall(function()
                    game.Debris:AddItem(p79, 0)
                end, function(_) end)
            end)
        end,
        OptimizePets = function()
            local v80, v81, v82 = pairs(workspace.__THINGS.Pets:GetChildren())

            while true do
                local v83

                v82, v83 = v80(v81, v82)

                if v82 == nil then
                    break
                end

                local v84, v85, v86 = pairs(v83:GetDescendants())

                while true do
                    local v87

                    v86, v87 = v84(v85, v86)

                    if v86 == nil then
                        break
                    end
                    if v87:IsA('Part') then
                        v87.Color = Color3.fromRGB(255, 255, 255)
                        v87.Size = Vector3.new(2.5, 2.5, 2.5)
                        v87.Material = Enum.Material.SmoothPlastic
                    end
                    if v87:IsA('SpecialMesh') or (v87:IsA('ParticleEmitter') or (v87:IsA('MeshPart') or v87:IsA('Decal'))) then
                        v87:Destroy()
                    end
                end
            end
        end,
        FastFarm = function()
            table.clear(u55)

            local v88 = GetClosestBreakables()
            local v89 = PlayerPets()
            local v90 = math.floor(#v89 / #v88)
            local v91 = #v89 % #v88
            local v92, v93, v94 = pairs(v88)
            local v95 = 1

            while true do
                local v96

                v94, v96 = v92(v93, v94)

                if v94 == nil then
                    break
                end

                local v97

                if v94 <= v91 then
                    v97 = v90 + 1
                else
                    v97 = v90
                end

                for _ = 1, v97 do
                    u55[v89[v95].euid] = v96
                    v95 = v95 + 1
                end
            end

            local v98 = {u55}

            u51.Fire('Breakables_JoinPetBulk', unpack(v98))
        end,
        FastFarm2 = function()
            table.clear(u55)

            local v99 = GetClosestBreakables()
            local v100 = PlayerPets()
            local v101, v102, v103 = pairs(v100)

            while true do
                local v104

                v103, v104 = v101(v102, v103)

                if v103 == nil then
                    break
                end

                local v105 = RandomCoinNumber(v99)

                u55[v104.Name] = v105
            end

            local v106 = {u55}

            u51.Fire('Breakables_JoinPetBulk', unpack(v106))
        end,
        OpenClosestEgg = function()
            local v107 = require(game:GetService('ReplicatedStorage').Library.Client.EggCmds).GetMaxHatch()
            local v108, v109 = FindClosestCustomEgg()
            local v110, v111 = FindClosestEgg()

            if v111 and v109 then
                if v109 < v111 then
                    local v112 = {
                        tostring(v108),
                        v107,
                    }

                    u51.Invoke('CustomEggs_Hatch', unpack(v112))
                elseif v111 < v109 then
                    u51.Invoke('Eggs_RequestPurchase', unpack({v110, v107}))
                end
            end
        end,
        HugePetSpeed = function()
            function u56.CalculateSpeedMultiplier()
                return math.huge
            end
        end,
        HideEggAnimation = function()
            function u57.PlayEggAnimation() end
        end,
        HookEggAnimation = function()
            u57.PlayEggAnimation = getgenv().v_settings.functionsValues.EggAnimation

            function u57.PlayEggAnimation(p113)
                local v114 = require(game:GetService('ReplicatedStorage').Library.Client.EggCmds)

                u58.Message.Bottom({
                    Message = 'Still Openin ' .. p113 .. ' ' .. tostring(v114.GetMaxHatch()),
                    Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)),
                })
            end
        end,
        CombinePetCards = function(_)
            local _Inventory = require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory

            if not _Inventory.Card then
                print("Don't have any cards")

                return "Don't have any cards"
            end

            local _Card = _Inventory.Card

            local function u119(p117)
                local v118 = p117 / 3

                if v118 % 1 ~= 0 then
                    local _ = p117 - 1
                end

                return v118
            end

            local v120, v121, v122 = pairs(_Card)
            local v123 = u119
            local v124 = {}

            while true do
                local v125

                v122, v125 = v120(v121, v122)

                if v122 == nil then
                    break
                end

                local v126 = v125._am or 1

                if v126 >= 3 then
                    v124[v122] = v123(v126)
                end
            end

            game:GetService('ReplicatedStorage'):WaitForChild('Network'):WaitForChild('CardCombinationMachine_ActivateBulk'):InvokeServer(unpack({v124}))
        end,
    },
}

local _Zones = require(game:GetService('ReplicatedStorage').Library.Directory).Zones
local _Goals = require(game:GetService('ReplicatedStorage').Library.Types.Quests).Goals
local u129 = {}
local _ = getgenv().VRT.Lib.RaidCmds
local _ = getgenv().VRT.Lib.RaidInstance
local _ = getgenv().VRT.Lib.InstancingCmds
local u342 = {
    BuyNextZone = function(p130)
        local _ZoneGateQuest = getgenv().VRT.Lib.Save.Get().ZoneGateQuest
        local v132 = getcurrency()
        local _, v133 = p130.ZoneUtil:GetMaxOwnedZone()
        local v134 = p130.ZoneUtil:GetMaxZoneNumber()
        local v135, v136 = getgenv().VRT.Lib.ZoneCmds.GetNextZone()

        if v133.ZoneNumber ~= v134 then
            if require(game:GetService('ReplicatedStorage').Library.Balancing.CalcGatePrice)(v136) <= v132 then
                getgenv().VRT.Lib.Network.Invoke('Zones_RequestPurchase', v135)
            else
                p130:TeleportToBestZone()
            end
            if v133.ZoneNumber == v134 or not _ZoneGateQuest then
                p130:TeleportToBestZone()
            else
                setthreadidentity(4)
                p130:MakeGateQuest()
            end
            if p130:CanRebirth() then
                local _ = p130.Rebirth
            end
        else
            p130:TeleportToBestZone()
        end
    end,
    BuyPetSlots = function(_)
        local _PetSlotsPurchased = getgenv().VRT.Lib.Save.Get().PetSlotsPurchased
        local v138 = require(game:GetService('ReplicatedStorage').Library.Client.PetEquipCmds).GetStatus(_PetSlotsPurchased + 1)

        if v138 == 'UNLOCKED' or v138 == 'NEXT' then
            local _ = getgenv().VRT.Lib.Network.Invoke
            local _ = _PetSlotsPurchased + 1
        end
    end,
    ActivateFlag = function(p139)
        local _SelectedFlag = getgenv().v_settings.functionToggles.SelectedFlag

        if _SelectedFlag then
            local v141 = getgenv().v_settings.functionToggles.FlagAmount or 1
            local _FlexibleFlagCmds = getgenv().VRT.Lib.FlexibleFlagCmds
            local v143 = getupvalue(_FlexibleFlagCmds.GetActiveFlag, 3)
            local _MapCmds = getgenv().VRT.Lib.MapCmds
            local v145 = _MapCmds.GetCurrentInstanceInfo()

            if v145 then
                local v146, v147 = p139.FlagUtil:getFlag(_SelectedFlag)

                if not v146 then
                    print('No Flag in Inventory')

                    return 'No Flag in Inventory'
                end

                local v148 = v147._am or 1

                if v148 < v141 then
                    v141 = v148
                end

                p139.FlagUtil:computeMaxFlags()

                local v149 = not v143['2!' .. v145.InstanceId .. '!' .. v145.AreaId] and 0 or p139.FlagUtil:flagPlaced(v143['2!' .. v145.InstanceId .. '!' .. v145.AreaId].Model)

                if tonumber(v149) < v141 then
                    local v150 = tonumber(v141 - v149)

                    getgenv().VRT.Lib.FlexibleFlagCmds.Consume(_SelectedFlag, v146, v150)
                end
            else
                local v151 = _MapCmds.GetCurrentZone()
                local v152, v153 = p139.FlagUtil:getFlag(_SelectedFlag)

                if not v152 then
                    print('No Flag in Inventory')

                    return 'No Flag in Inventory'
                end

                local v154 = v153._am or 1

                if v154 < v141 then
                    v141 = v154
                end

                p139.FlagUtil:computeMaxFlags()

                local v155 = not v143['1!' .. v151 .. '!Main'] and 0 or p139.FlagUtil:flagPlaced(v143['1!' .. v151 .. '!Main'].Model)

                if tonumber(v155) < v141 then
                    local v156 = tonumber(v141 - v155)

                    getgenv().VRT.Lib.FlexibleFlagCmds.Consume(_SelectedFlag, v152, v156)
                end
            end
        end
    end,
    PutPetsInDaycare = function(p157)
        local v158, _, _ = p157.DaycareUtil:FetchPetsForDaycare()

        if v158 then
            local _DaycareCmds = getgenv().VRT.Lib.DaycareCmds
            local v160 = 0
            local v161, v162, v163 = pairs(v158)
            local v164, _ = v161(v162, v163)

            if v164 ~= nil then
                v160 = v160 + 1
            end
            if v160 > 0 then
                _DaycareCmds.Enroll(v158)
            end
        end
    end,
    ClaimFreeGifts = function(_)
        local v165 = require(game.ReplicatedStorage.Library.Directory.FreeGifts)
        local v166 = getgenv().VRT.Lib.Save.Get()
        local _FreeGiftsRedeemed = v166.FreeGiftsRedeemed
        local _FreeGiftsTime = v166.FreeGiftsTime
        local v169, v170, v171 = pairs(v165)

        while true do
            local v172

            v171, v172 = v169(v170, v171)

            if v171 == nil then
                break
            end
            if v172.WaitTime >= _FreeGiftsTime then
                return
            end
            if not table.find(_FreeGiftsRedeemed, v172._id) then
                return getgenv().VRT.Lib.Network.Invoke('Redeem Free Gift', v172._id) and true or false
            end
        end
    end,
    ActivateUltimate = function(_)
        local v173 = getgenv().VRT.Lib.UltimateCmds.GetEquippedItem()

        if v173 then
            return getgenv().VRT.Lib.UltimateCmds.Activate(v173._data.id)
        end
    end,
    TeleportToBestZone = function(p174)
        local _, v175 = p174.ZoneUtil:GetMaxOwnedZone()
        local _ZoneFolder = v175.ZoneFolder

        if not (_ZoneFolder and _ZoneFolder:FindFirstChild('PERSISTENT')) then
            local _, v177 = p174.ZoneUtil:GetZoneFromNumber(v175.ZoneNumber - 1)

            _ZoneFolder = v177.ZoneFolder
        end

        local _Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _ZoneFolder.PERSISTENT.Teleport.Position).Magnitude

        if _ZoneFolder:FindFirstChild('INTERACT') then
            if _ZoneFolder.INTERACT.BREAKABLE_SPAWNS:FindFirstChild('Main') then
                _Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _ZoneFolder.INTERACT.BREAKABLE_SPAWNS.Main.Position).Magnitude
            else
                _Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _ZoneFolder.INTERACT.BREAKABLE_SPAWNS:GetChildren()[1].Position).Magnitude
            end
        end
        if _Magnitude >= 20 then
            while not _ZoneFolder:FindFirstChild('INTERACT') do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _ZoneFolder.PERSISTENT.Teleport.CFrame

                wait(0.05)
            end

            local v179

            if _ZoneFolder.INTERACT.BREAKABLE_SPAWNS:FindFirstChild('Main') then
                v179 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _ZoneFolder.INTERACT.BREAKABLE_SPAWNS.Main.Position).Magnitude
            else
                v179 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _ZoneFolder.INTERACT.BREAKABLE_SPAWNS:GetChildren()[1].Position).Magnitude
            end
            if v179 >= 20 then
                if _ZoneFolder.INTERACT.BREAKABLE_SPAWNS:FindFirstChild('Main') then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _ZoneFolder:FindFirstChild('INTERACT'):FindFirstChild('BREAKABLE_SPAWNS'):FindFirstChild('Main').CFrame
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _ZoneFolder:FindFirstChild('INTERACT'):FindFirstChild('BREAKABLE_SPAWNS'):GetChildren()[1].CFrame
                end
            end
        end
    end,
    TeleportToAnotherWorld = function(p180)
        local _, v181 = getgenv().VRT.Lib.ZoneCmds.GetNextZone()
        local v182 = p180.WorldUtil:GetWorld()

        if v181.WorldNumber ~= v182.WorldNumber then
            local _ = getgenv().VRT.Lib.Network.Invoke
            local _ = 'World' .. v181.WorldNumber .. 'Teleport'
        end
    end,
    CanRebirth = function(p183)
        local _, v184 = p183.ZoneUtil:GetMaxOwnedZone()
        local v185 = getgenv().VRT.Lib.RebirthCmds.GetNextRebirth()

        if v185 then
            return v184.ZoneNumber >= v185.ZoneNumberRequired
        else
            return false
        end
    end,
    Rebirth = function(_)
        return getgenv().VRT.Lib.RebirthCmds.Rebirth(tostring(getgenv().VRT.Lib.RebirthCmds.GetNextRebirth().RebirthNumber))
    end,
    QuestName = function(_, p186)
        local v187, v188, v189 = pairs(_Goals)

        while true do
            local v190

            v189, v190 = v187(v188, v189)

            if v189 == nil then
                break
            end
            if p186 == v190 then
                return v189
            end
        end

        return nil
    end,
    MakeGateQuest = function(p191)
        require(game:GetService('ReplicatedStorage').Library.Items.MiscItem)('Supercomputer Radio'):HasAny()

        local v192 = getgenv().VRT.Lib.Save.Get()
        local v193 = p191.WorldUtil:GetWorld()
        local _ = v193.MapName
        local _WorldNumber = v193.WorldNumber
        local _ZoneGateQuest2 = v192.ZoneGateQuest
        local _Progress = _ZoneGateQuest2.Progress
        local _Type = _ZoneGateQuest2.Type
        local _Amount = _ZoneGateQuest2.Amount
        local v199 = p191:QuestName(_Type)

        print(v199, _Type, _Progress, _Amount)

        if v199 == 'BEST_EGG' and _Progress < _Amount then
            local v200 = getgenv().VRT.Lib.EggCmds.GetMaxHatch()
            local _MaximumAvailableEgg = v192.MaximumAvailableEgg
            local v202 = workspace:FindFirstChild('__THINGS'):FindFirstChild('Eggs'):FindFirstChild('World' .. _WorldNumber)
            local v203, v204, v205 = pairs(require(game:GetService('ReplicatedStorage').Library.Directory.Eggs))
            local v206 = nil
            local v207 = nil

            while true do
                local v208

                v205, v208 = v203(v204, v205)

                if v205 == nil then
                    break
                end
                if v208.eggNumber == _MaximumAvailableEgg then
                    v206 = v208
                end
            end

            local v209 = getcurrency()
            local v210 = require(game:GetService('ReplicatedStorage').Library.Balancing.CalcEggPricePlayer)(v206) * v200

            print(v209, v210, v210 * math.round((_Amount - _Progress) / v200))

            if v209 < v210 * math.round((_Amount - _Progress) / v200) then
                p191:TeleportToBestZone()

                return
            end

            local v211, v212, v213 = pairs(v202:GetChildren())

            while true do
                local v214

                v213, v214 = v211(v212, v213)

                if v213 == nil then
                    break
                end
                if v214.Name:split(' ')[1] == tostring(_MaximumAvailableEgg) then
                    v207 = v214
                end
            end

            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v207.Tier.Position).Magnitude >= 25 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v207.Tier.CFrame
            end

            getgenv().VRT.Lib.Network.Invoke('Eggs_RequestPurchase', v206._id, v200)
        elseif v199 == 'BREAKABLE' and _Progress < _Amount then
            p191:TeleportToBestZone()
        elseif v199 == 'BEST_COIN_JAR' and _Progress < _Amount then
            p191:TeleportToBestZone()

            local _Misc = v192.Inventory.Misc
            local v216, v217, v218 = pairs(_Misc)

            while true do
                local v219

                v218, v219 = v216(v217, v218)

                if v218 == nil then
                    break
                end
                if v219.id == 'Basic Coin Jar' then
                    local _ = v219._am

                    getgenv().VRT.Lib.Network.Invoke('CoinJar_Spawn', v218)
                end
            end
        elseif v199 == 'BEST_COMET' and _Progress < _Amount then
            p191:TeleportToBestZone()

            local _Misc2 = v192.Inventory.Misc
            local v221, v222, v223 = pairs(_Misc2)

            while true do
                local v224

                v223, v224 = v221(v222, v223)

                if v223 == nil then
                    break
                end
                if v224.id == 'Comet' then
                    local _ = v224._am

                    getgenv().VRT.Lib.Network.Invoke('Comet_Spawn', v223)
                end
            end
        elseif v199 == 'BEST_GOLD_PET' and _Progress < _Amount then
            local v225 = getcurrency()
            local v226 = getgenv().VRT.Lib.EggCmds.GetMaxHatch()
            local _MasteryCmds = getgenv().VRT.Lib.MasteryCmds
            local _Pet = v192.Inventory.Pet
            local _MaximumAvailableEgg2 = v192.MaximumAvailableEgg
            local v230 = 0

            if _MasteryCmds.HasPerk('Pets', 'GoldReduction') then
                v230 = v230 + _MasteryCmds.GetPerkPower('Pets', 'GoldReduction')
            end

            local v231 = _Amount - _Progress
            local v232 = v231 + 1
            local v233 = (v231 + 1) * (10 - v230)
            local v234 = workspace:FindFirstChild('__THINGS'):FindFirstChild('Eggs'):FindFirstChild('World' .. _WorldNumber)
            local v235, v236, v237 = pairs(require(game:GetService('ReplicatedStorage').Library.Directory.Eggs))
            local v238 = nil
            local v239 = nil

            while true do
                local v240

                v237, v240 = v235(v236, v237)

                if v237 == nil then
                    break
                end
                if v240.eggNumber == _MaximumAvailableEgg2 then
                    v238 = v240
                end
            end

            local v241, v242, v243 = pairs(v234:GetChildren())

            while true do
                local v244

                v243, v244 = v241(v242, v243)

                if v243 == nil then
                    break
                end
                if v244.Name:split(' ')[1] == tostring(_MaximumAvailableEgg2) then
                    v239 = v244
                end
            end

            local v245 = require(game:GetService('ReplicatedStorage').Library.Balancing.CalcEggPricePlayer)(v238) * v226
            local v246, v247, v248 = pairs(v238.pets)
            local v249 = {}

            while true do
                local v250

                v248, v250 = v246(v247, v248)

                if v248 == nil then
                    break
                end

                table.insert(v249, v250[1])
            end

            local v251, v252, v253 = pairs(_Pet)
            local v254 = false

            while true do
                local v255

                v253, v255 = v251(v252, v253)

                if v253 == nil then
                    break
                end
                if table.find(v249, v255.id) then
                    local v256 = v255._am or 1
                    local v257 = v255.pt or 0

                    if v233 <= v256 and v257 == 0 then
                        print(v255.id, v256, v233, v257)

                        local _GoldMachine_Activate, v259 = getgenv().VRT.Lib.Network.Invoke('GoldMachine_Activate', unpack({v253, v232}))

                        print('Should Convert', _GoldMachine_Activate, v259)

                        v254 = true
                    end
                end
            end

            if not v254 then
                if v225 <= v245 then
                    p191:TeleportToBestZone()

                    return
                end
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v239.Tier.Position).Magnitude >= 25 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v239.Tier.CFrame
                end

                getgenv().VRT.Lib.Network.Invoke('Eggs_RequestPurchase', v238._id, v226)
            end
        elseif v199 == 'BEST_RAINBOW_PET' and _Progress < _Amount then
            local v260 = getcurrency()
            local v261 = getgenv().VRT.Lib.EggCmds.GetMaxHatch()
            local _MasteryCmds2 = getgenv().VRT.Lib.MasteryCmds
            local _Pet2 = v192.Inventory.Pet
            local _MaximumAvailableEgg3 = v192.MaximumAvailableEgg
            local v265 = 0

            if _MasteryCmds2.HasPerk('Pets', 'GoldReduction') then
                v265 = v265 + _MasteryCmds2.GetPerkPower('Pets', 'GoldReduction')
            end

            local v266 = _Amount - _Progress
            local v267 = v266 + 1
            local _ = v266 * 10 + 1
            local v268 = (v266 + 1) * (10 - v265)
            local v269 = workspace:FindFirstChild('__THINGS'):FindFirstChild('Eggs'):FindFirstChild('World' .. _WorldNumber)
            local v270, v271, v272 = pairs(require(game:GetService('ReplicatedStorage').Library.Directory.Eggs))
            local v273 = nil
            local v274 = nil

            while true do
                local v275

                v272, v275 = v270(v271, v272)

                if v272 == nil then
                    break
                end
                if v275.eggNumber == _MaximumAvailableEgg3 then
                    v273 = v275
                end
            end

            local v276, v277, v278 = pairs(v269:GetChildren())

            while true do
                local v279

                v278, v279 = v276(v277, v278)

                if v278 == nil then
                    break
                end
                if v279.Name:split(' ')[1] == tostring(_MaximumAvailableEgg3) then
                    v274 = v279
                end
            end

            local v280 = require(game:GetService('ReplicatedStorage').Library.Balancing.CalcEggPricePlayer)(v273) * v261
            local v281, v282, v283 = pairs(v273.pets)
            local v284 = {}

            while true do
                local v285

                v283, v285 = v281(v282, v283)

                if v283 == nil then
                    break
                end

                table.insert(v284, v285[1])
            end

            local v286, v287, v288 = pairs(_Pet2)
            local v289 = 0
            local v290 = false
            local v291 = false

            while true do
                local v292

                v288, v292 = v286(v287, v288)

                if v288 == nil then
                    break
                end
                if table.find(v284, v292.id) then
                    local v293 = v292._am or 1
                    local v294 = v292.pt or 0

                    if v289 <= v293 and v294 == 1 then
                        v289 = v266 * 10 - v293 + 10
                    end
                    if v268 <= v293 and v294 == 1 then
                        print(v292.id, v293, v268, v294)

                        local _RainbowMachine_Activate, v296 = getgenv().VRT.Lib.Network.Invoke('RainbowMachine_Activate', unpack({v288, v267}))

                        print('Should Convert', _RainbowMachine_Activate, v296)

                        v290 = true
                    end
                end
            end

            if v289 == 0 then
                v289 = v266 * 10 + 10
            end

            print('Goldens:', v289, 'Normals:', v289 * (10 - v265))

            if not v290 then
                local v297, v298, v299 = pairs(_Pet2)

                while true do
                    local v300

                    v299, v300 = v297(v298, v299)

                    if v299 == nil then
                        break
                    end
                    if table.find(v284, v300.id) then
                        local v301 = v300._am or 1
                        local v302 = v300.pt or 0

                        if v289 * (10 - v265) <= v301 and v302 == 0 then
                            print(v300.id, v301, v289 * 10, v302)

                            local _GoldMachine_Activate2, v304 = getgenv().VRT.Lib.Network.Invoke('GoldMachine_Activate', unpack({v299, v289}))

                            print('Should Convert', _GoldMachine_Activate2, v304)

                            v291 = true
                        end
                    end
                end
            end
            if not (v290 or v291) then
                if v260 <= v280 then
                    p191:TeleportToBestZone()

                    return
                end
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v274.Tier.Position).Magnitude >= 25 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v274.Tier.CFrame
                end

                getgenv().VRT.Lib.Network.Invoke('Eggs_RequestPurchase', v273._id, v261)
            end
        end
    end,
    GetMachines = function(p305)
        table.clear(u129)

        local v306 = p305.WorldUtil:GetWorld()

        if workspace:FindFirstChild(v306.MapName) then
            local v307, v308, v309 = pairs(workspace:FindFirstChild(v306.MapName):GetDescendants())

            while true do
                local v310

                v309, v310 = v307(v308, v309)

                if v309 == nil then
                    break
                end
                if v310.Name:match('Machines') and v310.Name:match('Machine') then
                    print(v309, v310)

                    u129[v310.Name] = v310.Arrow.CFrame
                end
            end
        end
    end,
    WorldUtil = {
        GetWorld = function(_)
            local v311 = u36[game.PlaceId]

            return require(game.ReplicatedStorage.Library.Directory.Worlds)[v311]
        end,
        GetWorldByNumber = function(_, p312)
            return require(game.ReplicatedStorage.Library.Directory.Worlds)['World ' .. p312]
        end,
    },
    FlagUtil = {
        computeMaxFlags = function(_)
            local _MasteryCmds3 = getgenv().VRT.Lib.MasteryCmds

            return not _MasteryCmds3.HasPerk('Breakables', 'FlagSlots') and 24 or 24 + _MasteryCmds3.GetPerkPower('Breakables', 'FlagSlots')
        end,
        computeDuration = function(_, p314)
            local _MasteryCmds4 = getgenv().VRT.Lib.MasteryCmds

            if not _MasteryCmds4.HasPerk('Breakables', 'FlagDuration') then
                return p314.Duration
            end

            local v316 = p314.Duration * _MasteryCmds4.GetPerkPower('Breakables', 'FlagDuration')

            return math.ceil(v316)
        end,
        flagPlaced = function(_, p317)
            return p317 and ((not p317:FindFirstChild('FlagPole'):FindFirstChild('Attachment'):FindFirstChild('ZoneFlag'):FindFirstChild('Title') and '' or p317:FindFirstChild('FlagPole'):FindFirstChild('Attachment'):FindFirstChild('ZoneFlag'):FindFirstChild('Title').Text):match('%d+') or 1) or 0
        end,
        getFlag = function(_, p318)
            local _Misc3 = getgenv().VRT.Lib.Save.Get().Inventory.Misc
            local v320, v321, v322 = pairs(_Misc3)

            while true do
                local v323

                v322, v323 = v320(v321, v322)

                if v322 == nil then
                    break
                end
                if v323.id == p318 then
                    return v322, v323
                end
            end

            return nil
        end,
    },
    DaycareUtil = {},
    ZoneUtil = {
        GetZoneFromNumber = function(_, p324)
            local v325, v326, v327 = pairs(_Zones)

            while true do
                local v328

                v327, v328 = v325(v326, v327)

                if v327 == nil then
                    break
                end
                if v328.ZoneNumber == p324 then
                    return v327, v328
                end
            end
        end,
        GetMaxZoneNumber = function(_)
            local v329, v330, v331 = pairs(require(game:GetService('ReplicatedStorage').Library.Directory.Zones))
            local v332 = 0

            while true do
                local v333

                v331, v333 = v329(v330, v331)

                if v331 == nil then
                    break
                end
                if v332 <= v333.ZoneNumber then
                    v332 = v333.ZoneNumber
                end
            end

            return v332
        end,
        GetMaxOwnedZone = function(p334)
            local v335, v336 = p334:GetZoneFromNumber(1)
            local _UnlockedZones = getgenv().VRT.Lib.Save.Get().UnlockedZones

            if not _UnlockedZones then
                return v335, v336
            end

            local v338, v339, v340 = pairs(_UnlockedZones)

            while true do
                v340 = v338(v339, v340)

                if v340 == nil then
                    break
                end

                local v341 = _Zones[v340]

                if v341.ZoneNumber > v336.ZoneNumber then
                    v335 = v340
                    v336 = v341
                end
            end

            return v335, v336
        end,
    },
}

tick()

local v343, v344, v345 = pairs(game:GetService('ReplicatedStorage').Library.Directory:GetChildren())
local u346 = u57
local u347 = u56
local u348 = _Goals
local u349 = u47
local u350 = u51
local u351 = {}

while true do
    local v352, v353 = v343(v344, v345)

    if v352 == nil then
        break
    end

    v345 = v352

    if v353:IsA('ModuleScript') and v353.Name ~= 'DropTables' then
        local v354, v355, v356 = pairs(require(v353))

        while true do
            local v357

            v356, v357 = v354(v355, v356)

            if v356 == nil then
                break
            end

            table.insert(u351, v357)
        end
    end
end

local function u364(p358)
    local v359, v360, u361 = pairs(getmetatable(u52).__index)

    while true do
        local v362

        u361, v362 = v359(v360, u361)

        if u361 == nil then
            break
        end

        local v363, _ = pcall(function()
            return u52[u361](p358)
        end)

        if v363 then
            return u361
        end
    end

    return nil
end
local function u370(p365)
    local v366, v367, v368 = pairs(u351)

    while true do
        local v369

        v368, v369 = v366(v367, v368)

        if v368 == nil then
            break
        end
        if v369._id == p365 then
            return p365
        end
    end

    return nil
end
local function u380(p371)
    local v372, v373, v374 = pairs(require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory)

    while true do
        local v375

        v374, v375 = v372(v373, v374)

        if v374 == nil then
            break
        end

        local v376, v377, v378 = pairs(v375)

        while true do
            local v379

            v378, v379 = v376(v377, v378)

            if v378 == nil then
                break
            end
            if v379.id == p371 then
                return v378, v379
            end
        end
    end

    return nil
end
local function u390()
    if getgenv().v_settings.functionToggles.MailboxUsername ~= '' then
        local v381, v382, v383 = pairs(getgenv().v_settings.functionToggles.MailboxItems)

        while true do
            local v384

            v383, v384 = v381(v382, v383)

            if v383 == nil then
                break
            end
            if not u370(v383) then
                warn('CheckIfExists Error Send screenshot')

                return
            end

            local v385, v386 = u380(v383)

            if v385 and v386 then
                local v387 = u364(v383)

                if not v387 then
                    warn('GetItemType Error Send screenshot')

                    return
                end

                local v388 = u52[v387]:From(v386)

                if v384 <= (v388._data._am or 0) then
                    local v389 = 'VRT ' .. u24(8)

                    warn('Sending Mailbox to:', getgenv().v_settings.functionToggles.MailboxUsername:lower(), '\n', 'With Description:', v389, '\n', 'Item:', v383, '\n', 'Amount:', v388._data._am, '\n')
                    u350.Invoke('Mailbox: Send', getgenv().v_settings.functionToggles.MailboxUsername:lower(), v389, v387, v385, v388._data._am or 1)
                end
            end
        end
    end
end
local function u405(p391, p392)
    if getgenv().v_settings.functionToggles.MailboxUsername ~= '' then
        local v393 = require(game.ReplicatedStorage.Library.Client.Save).Get()
        local v394 = getgenv().v_settings.functionToggles.MailboxSendHugesType or ''

        if v394 == '' then
            return
        elseif not p391 or (not p392 or v394 == 'New') then
            if v394 == 'All' then
                local v395, v396, v397 = pairs(v393.Inventory.Pet)

                while true do
                    local v398

                    v397, v398 = v395(v396, v397)

                    if v397 == nil then
                        break
                    end
                    if v398.id:match('Huge') then
                        if not u370(v398.id) then
                            warn('CheckIfExists Error Send screenshot')

                            return
                        end

                        local v399, v400 = u380(v398.id)

                        if v399 and v400 then
                            local v401 = u364(v398.id)

                            if not v401 then
                                warn('GetItemType Error Send screenshot')

                                return
                            end

                            local v402 = u52[v401]:From(v398)
                            local v403 = 'VRT ' .. u24(8)

                            warn('Sending Mailbox to:', getgenv().v_settings.functionToggles.MailboxUsername:lower(), '\n', 'With Description:', v403, '\n', 'Item:', v398.id, '\n', 'Amount:', v402._data._am or 1, '\n')
                            u350.Invoke('Mailbox: Send', getgenv().v_settings.functionToggles.MailboxUsername:lower(), v403, v401, v399, v402._data._am or 1)
                        end
                    end
                end
            elseif v394 == 'New' then
                local v404 = 'VRT ' .. u24(8)

                warn('Sending Mailbox to:', getgenv().v_settings.functionToggles.MailboxUsername:lower(), '\n', 'With Description:', v404, '\n', 'Item:', p392.id, '\n', 'Amount:', p392._am or 1, '\n')
                u350.Invoke('Mailbox: Send', getgenv().v_settings.functionToggles.MailboxUsername:lower(), v404, 'Pet', p391, p392._am or 1)
            end
        end
    else
        return
    end
end
local function u409()
    local _InputedMailboxItem = getgenv().v_settings.functionToggles.InputedMailboxItem
    local _InputedMailboxAmount = getgenv().v_settings.functionToggles.InputedMailboxAmount
    local _MailboxItems = getgenv().v_settings.functionToggles.MailboxItems

    if _InputedMailboxItem ~= '' and (_InputedMailboxAmount ~= 0 and _MailboxItems) then
        if not u370(_InputedMailboxItem) then
            return false
        end

        getgenv().v_settings.functionToggles.MailboxItems[_InputedMailboxItem] = _InputedMailboxAmount

        return true
    end
end
local function u413(_)
    local _InputedMailboxItem2 = getgenv().v_settings.functionToggles.InputedMailboxItem
    local _InputedMailboxAmount2 = getgenv().v_settings.functionToggles.InputedMailboxAmount
    local _MailboxItems2 = getgenv().v_settings.functionToggles.MailboxItems

    if _InputedMailboxItem2 ~= '' and (_InputedMailboxAmount2 ~= 0 and _MailboxItems2) then
        if not u370(_InputedMailboxItem2) then
            return nil
        end

        getgenv().v_settings.functionToggles.MailboxItems[_InputedMailboxItem2] = nil
    end
end
local function u414()
    u350.Invoke('Mailbox: Claim All')
end

local u415 = require(game.ReplicatedStorage.Library.Client.DaycareCmds)
local u416 = require(game:GetService('ReplicatedStorage').Library.Modules.DaycareLoot)

require(game.ReplicatedStorage.Library.Client.Save).Get()

local u417 = require(game.ReplicatedStorage.Library.Items.PetItem)
local u418 = require(game.ReplicatedStorage.Library.Client.Save)

function FetchPetsForDaycare()
    local v419 = u418.Get()

    if v419 then
        local _Pet3 = v419.Inventory.Pet
        local v421 = u415.GetMaxSlots() - u415.GetUsedSlots()

        if v421 <= 0 then
            local _DaycareActive = v419.DaycareActive
            local v423, v424, v425 = pairs(_DaycareActive)

            while true do
                local v426

                v425, v426 = v423(v424, v425)

                if v425 == nil then
                    break
                end
                if u415.ComputeRemainingTime(v425, workspace:GetServerTimeNow()) == 0 then
                    local v427 = u415.Claim(v425)

                    if v427 then
                        return nil, 'Successfully claimed daycare pet: ' .. v426.Pet.id, v427
                    else
                        return nil, 'Failed To claim daycare pet: ' .. v426.Pet.id, v427
                    end
                end
            end

            return nil, 'All Daycare Slots taken'
        end

        local v428 = v421 * 10
        local v429, v430, v431 = pairs(_Pet3)
        local v432 = 0
        local v433 = {}

        while true do
            local v434

            v431, v434 = v429(v430, v431)

            if v431 == nil then
                break
            end

            local v435 = u417(v434.id)

            if v435:GetExclusiveLevel() < 4 and (v434._am or 1) >= 10 then
                if v432 >= v428 then
                    return v433
                end

                setthreadidentity(4)

                local _, v436 = u416.ComputePetLootPool(game.Players.LocalPlayer, v435)

                if v436 * 10 == 10 and v428 <= v434._am then
                    local v437 = math.min(v434._am, v428 - v428 % 10)

                    if v437 > 0 then
                        v433[v431] = v437 / 10
                        v432 = v432 + v437
                    end
                end
            end
        end

        return v433
    end
end
function PutPetsInDaycare()
    local v438, _, _ = FetchPetsForDaycare()

    if v438 then
        local v439 = 0
        local v440, v441, v442 = pairs(v438)
        local v443, _ = v440(v441, v442)

        if v443 ~= nil then
            v439 = v439 + 1
        end
        if v439 > 0 then
            local v444, v445 = u415.Enroll(v438)

            if v444 then
                print('Successfully Enrolled Pet Table:', v445, v438)
            else
                print('Failed to Enroll Pet Table:', v445, v438)
            end
        end
    end
end

local u446 = {}
local u447 = false
local u448 = {}

function GetThumbnailUrl(p449)
    local v450 = {
        Url = 'https://thumbnails.roblox.com/v1/assets?assetIds=' .. tostring(p449) .. '&size=700x700&format=Png&isCircular=false',
        Method = 'GET',
    }
    local v451 = request(v450)

    return game:GetService('HttpService'):JSONDecode(v451.Body).data[1].imageUrl
end

local function u455(p452)
    local v453 = tostring(p452)

    repeat
        local v454

        v453, v454 = v453:gsub('^(%-?%d+)(%d%d%d)', '%1,%2')
        count = v454
    until count == 0

    return v453
end

function SendPublicHatch(_) end
function SendHatch(p456)
    if table.find(u448, game.Players.LocalPlayer.Name) then
        return
    else
        local _DiscordWebhook = getgenv().v_settings.functionToggles.DiscordWebhook
        local v458 = getgenv().v_settings.functionToggles.DiscordUserId or '1'
        local v459 = require(game.ReplicatedStorage.Library.Directory.Pets)
        local v460 = require(game.ReplicatedStorage.Library.Items).Pet:From(p456)
        local _id = v460._data.id
        local _ = v460._data._am
        local v462 = v460._data.pt or 0
        local v463 = getgenv().VRT.Lib.RAPCmds.Get(v460) or 'No Rap'
        local v464 = getgenv().VRT.Lib.ExistCountCmds.Get(v460) or 'No Exist Count'
        local v465 = v462 == 1 and 'Golden' or (v462 == 2 and 'Rainbow' or 'Normal')
        local v466

        if v465 == 'Golden' then
            v466 = v459[v460._data.id].goldenThumbnail
        else
            v466 = v459[v460._data.id].thumbnail
        end

        local v467 = GetThumbnailUrl(v466:match('%d+'))
        local v468 = u455(v463)
        local v469 = u455(v464)
        local v470 = v465 == 'Rainbow' and 16737996 or 30893
        local v471 = {
            username = 'VRT Hatch Notifier',
            content = '<@' .. v458 .. '>',
            embeds = {
                {
                    color = v470,
                    thumbnail = {url = v467},
                    fields = {
                        {
                            name = 'Hatched a ' .. v465 .. ' ' .. _id .. '!',
                            value = utf8.char(128160) .. ' **Rap Value: `' .. v468 .. '`**\n' .. utf8.char(127757) .. ' **Exist Count: `' .. v469 .. '`**',
                        },
                        {
                            name = '**Account Info:**',
                            value = '**Account Name:** ||' .. game.Players.LocalPlayer.Name .. '||',
                        },
                    },
                },
            },
        }

        if getgenv().v_settings.functionToggles.SendWebhook then
            if _DiscordWebhook then
                request({
                    Url = _DiscordWebhook,
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                    },
                    Body = game.HttpService:JSONEncode(v471),
                })
            end
        else
            return
        end
    end
end

local u472 = 0
local u473 = 0

function CheckPets()
    local v474 = getgenv().VRT.Lib.Save.Get()
    local v475, v476, v477 = pairs(v474.Inventory.Pet)
    local v478 = {}

    while true do
        local v479

        v477, v479 = v475(v476, v477)

        if v477 == nil then
            break
        end
        if v479.id:match('Huge') or v479.id:match('Titanic') then
            v478[v477] = v479
        end
    end

    local v480, v481, v482 = pairs(v478)

    while true do
        local v483

        v482, v483 = v480(v481, v482)

        if v482 == nil then
            break
        end
        if not u446[v482] and u447 then
            if v483.id:match('Huge') then
                u472 = u472 + 1
            elseif v483.id:match('Titanic') then
                u473 = u473 + 1
            end

            SendHatch(v483)
            u405(v482, v483)
        end
    end

    u447 = true
    u446 = v478
end

if not getgenv().WEB then
    getgenv().WEB = false

    task.spawn(function()
        wait(15)

        getgenv().WEB = true

        while getgenv().WEB do
            CheckPets()
            wait(15)
        end
    end)
end

local u484 = require(game:GetService('ReplicatedStorage').Library.Client.FruitCmds)
local u485 = require(game.ReplicatedStorage.Library.Client.Save)

local function u490(p486, p487)
    local v488 = p487 and 'Shiny' or 'Normal'

    if not u484.GetActiveFruits()[p486] then
        return u484.ComputeFruitQueueLimit()
    end

    local v489 = u484.GetActiveFruits()[p486][v488]

    return u484.ComputeFruitQueueLimit() - #v489
end
local function u498(p491, p492)
    local _Fruit = u485.Get().Inventory.Fruit
    local v494, v495, v496 = pairs(_Fruit)

    while true do
        local v497

        v496, v497 = v494(v495, v496)

        if v496 == nil then
            break
        end
        if v497.id == p491 and (p492 and v497.sh or not p492) then
            return v496, v497
        end
    end

    return nil
end
local function v509()
    local _SelectedFruits = getgenv().v_settings.functionToggles.SelectedFruits

    if _SelectedFruits then
        local v500, v501, v502 = pairs(_SelectedFruits)

        while true do
            local v503

            v502, v503 = v500(v501, v502)

            if v502 == nil then
                break
            end

            local v504 = v503:split(' ')[1] == 'Shiny' and true or false
            local v505, v506 = u498(v503, v504)
            local v507 = u490(v503, v504)
            local v508 = (v506._am or 1) < v507 and (v506._am or 1) or v507

            u350.Fire('Fruits: Consume', v505, v508)
            wait(1)
        end
    end
end

local u510 = require(game:GetService('ReplicatedStorage').Library.Client.LootboxCmds)

local function v520()
    local _SelectedLootboxes = getgenv().v_settings.functionToggles.SelectedLootboxes

    if #_SelectedLootboxes ~= 0 then
        local v512, v513, v514 = pairs(_SelectedLootboxes)

        while true do
            local v515

            v514, v515 = v512(v513, v514)

            if v514 == nil then
                break
            end

            local v516, v517 = u380(v515)

            if v516 and v517 then
                local v518 = (v517._am or 1) > 8 and 8 or (v517._am or 1)
                local v519 = u52.Lootbox(v515)

                v519._uid = v516

                u510.Open(v519, v518)
            end
        end
    end
end
local function v529()
    local _SelectedGifts = getgenv().v_settings.functionToggles.SelectedGifts

    if #_SelectedGifts ~= 0 then
        local v522, v523, v524 = pairs(_SelectedGifts)

        while true do
            local v525

            v524, v525 = v522(v523, v524)

            if v524 == nil then
                break
            end

            local v526, v527 = u380(v525)

            if v526 and v527 then
                local v528 = (v527._am or 1) > 100 and 100 or (v527._am or 1)

                u350.Invoke('GiftBag_Open', v525, v528)
            end
        end
    end
end

local u530 = getsenv(game:GetService('Players').LocalPlayer.PlayerScripts:WaitForChild('Scripts'):WaitForChild('Game'):WaitForChild('Misc'):WaitForChild('Shiny Relics'))
local u531 = require(game.ReplicatedStorage.Library.Client.NotificationCmds)

local function u532()
    return #getgenv().VRT.Lib.Save.Get().ShinyRelics
end
local function u535()
    local u533 = 0
    local v534 = getupvalue(u530.SetupRelics, 7)

    table.foreach(v534, function()
        u533 = u533 + 1
    end)

    return u533
end
local function u538()
    repeat
        wait(0.5)
    until ShinyRelicsParagraph

    local v536 = u532()
    local v537 = u535()

    setthreadidentity(8)

    return ShinyRelicsParagraph:Set({
        Title = 'Collected Relics',
        Content = "You Have Collected <font color='#2b94d4'>" .. v536 .. '/' .. v537 .. '</font> Shiny Relics',
    })
end

task.spawn(function()
    while true do
        u538()
        wait(5)
    end
end)

local function v544()
    local v539 = getupvalue(u530.SetupRelics, 7)
    local v540, v541, v542 = pairs(v539)

    while true do
        local v543

        v542, v543 = v540(v541, v542)

        if v542 == nil then
            break
        end
        if not v543.Found and u350.Invoke('Relic_Found', v543.Id) then
            v543.Found = true

            u531.Message.Bottom({
                Message = string.format('Shiny Relic Discovered!   <font color="rgb(255,255,255)">Collected %s/%s</font>', tostring(u532()), tostring(u535())),
                Color = Color3.fromRGB(255, 255, 0),
            })
        end
    end

    wait(2.5)
end

require(game:GetService('ReplicatedStorage'):WaitForChild('Library'):WaitForChild('Client'):WaitForChild('UpgradeCmds'))

local u545 = require(game:GetService('ReplicatedStorage'):WaitForChild('Library'):WaitForChild('Directory'):WaitForChild('Ranks'))

local function u551()
    local _Rank = getgenv().VRT.Lib.Save.Get().Rank
    local v547, v548, v549 = pairs(u545)

    while true do
        local v550

        v549, v550 = v547(v548, v549)

        if v549 == nil then
            break
        end
        if v550.RankNumber == _Rank then
            return v550
        end
    end
end
local function u560()
    local v552 = getgenv().VRT.Lib.Save.Get()
    local v553 = u551()
    local _RedeemedRankRewards = v552.RedeemedRankRewards
    local _Rewards = v553.Rewards
    local v556, v557, v558 = pairs(_Rewards)

    while true do
        local v559

        v558, v559 = v556(v557, v558)

        if v558 == nil then
            break
        end
        if not _RedeemedRankRewards[tostring(v558)] then
            return false
        end
    end

    return true
end
local function v569()
    if not u560() then
        local v561 = getgenv().VRT.Lib.Save.Get()
        local _RankStars = v561.RankStars
        local _RedeemedRankRewards2 = v561.RedeemedRankRewards
        local _Rewards2 = u551().Rewards
        local v565, v566, v567 = pairs(_Rewards2)

        while true do
            local v568

            v567, v568 = v565(v566, v567)

            if v567 == nil then
                break
            end
            if v568.StarsRequired > _RankStars then
                return "Can't afford"
            end

            _RankStars = _RankStars - v568.StarsRequired

            if not _RedeemedRankRewards2[tostring(v567)] then
                u350.Fire('Ranks_ClaimReward', v567)
                wait(1)
            end
        end
    end
end

local u570 = require(game:GetService('ReplicatedStorage').Library.Util.WorldsUtil)
local u571 = game:GetService('ReplicatedStorage').__DIRECTORY.Eggs['Zone Eggs'][u570.GetWorld()._id]

function FindClosestCustomEgg()
    if game.Players.LocalPlayer.Character then
        local _HumanoidRootPart2 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local _CustomEggs = workspace.__THINGS.CustomEggs
        local _huge = math.huge
        local v575, v576, v577 = pairs(_CustomEggs:GetChildren())
        local v578 = nil

        while true do
            local v579

            v577, v579 = v575(v576, v577)

            if v577 == nil then
                break
            end
            if v579:IsA('Model') then
                local _Magnitude2 = (_HumanoidRootPart2.Position - v579.WorldPivot.Position).Magnitude

                if _Magnitude2 < _huge then
                    v578 = v579
                    _huge = _Magnitude2
                end
            end
        end

        return v578, _huge
    end
end
function FindClosestEgg()
    local _HumanoidRootPart3 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local v582 = workspace.__THINGS.Eggs[u570.GetEggsModelName()]
    local _huge2 = math.huge
    local v584, v585, v586 = pairs(v582:GetChildren())
    local v587 = nil

    while true do
        local v588

        v586, v588 = v584(v585, v586)

        if v586 == nil then
            break
        end
        if v588:IsA('Model') then
            local _Magnitude3 = (_HumanoidRootPart3.Position - v588:FindFirstChild('Light').CFrame.Position).Magnitude

            if _Magnitude3 < _huge2 then
                v587 = v588
                _huge2 = _Magnitude3
            end
        end
    end

    if not v587 then
        return
    end

    local v590 = string.split(v587.Name, ' ')
    local v591 = u571
    local v592, v593, v594 = pairs(v591:GetDescendants())
    local v595 = nil

    while true do
        local v596

        v594, v596 = v592(v593, v594)

        if v594 == nil then
            v596 = v595

            break
        end
        if v596.Name:match(v590[1]) then
            local v597 = string.split(v596.Name, ' ')

            if v597[6] then
                v587 = v597[3] .. ' ' .. v597[4] .. ' ' .. v597[5] .. ' ' .. v597[6]
            elseif v597[5] then
                v587 = v597[3] .. ' ' .. v597[4] .. ' ' .. v597[5]
            else
                v587 = v597[3] .. ' ' .. v597[4]
            end

            break
        end
    end

    return v587, _huge2, v596
end

local function u604()
    local v598 = require(game:GetService('ReplicatedStorage').Library.Client.EggCmds).GetMaxHatch()
    local v599, v600 = FindClosestCustomEgg()
    local v601, v602 = FindClosestEgg()

    if v602 and v600 then
        if v600 < v602 then
            local v603 = {
                tostring(v599),
                v598,
            }

            u350.Invoke('CustomEggs_Hatch', unpack(v603))
        elseif v602 < v600 then
            u350.Invoke('Eggs_RequestPurchase', unpack({v601, v598}))
        end
    end
end

local u605 = require(game:GetService('ReplicatedStorage').Library.Client.InstanceZoneCmds)
local u606 = require(game.ReplicatedStorage.Library.Client.Network)

local function v610()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        return
    else
        local _EasterEvent = workspace.__THINGS.Instances:FindFirstChild('EasterEvent')

        if _EasterEvent then
            local _Teleports = _EasterEvent:FindFirstChild('Teleports')

            if _Teleports then
                local _Enter = _Teleports:FindFirstChild('Enter')

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _Enter.CFrame
            end
        else
            return
        end
    end
end
local function u611()
    return u605.GetMaximumOwnedZoneNumber()
end

local u612 = require(game:GetService('ReplicatedStorage').Library.Types.Quests)

local function u618(p613)
    local v614, v615, v616 = pairs(u612.Goals)

    while true do
        local v617

        v616, v617 = v614(v615, v616)

        if v616 == nil then
            break
        end
        if v617 == p613 then
            return v616, v617
        end
    end
end
local function u625(p619)
    local _Pet4 = require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory.Pet
    local v621, v622, v623 = pairs(_Pet4)

    while true do
        local v624

        v623, v624 = v621(v622, v623)

        if v623 == nil then
            break
        end
        if (v624.pt or 0) == 0 and not v624.sh and (v624._am or 1) >= p619 * 11 then
            return v623, v624
        end
    end

    return nil
end
local function u632(p626)
    local _Pet5 = require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory.Pet
    local v628, v629, v630 = pairs(_Pet5)

    while true do
        local v631

        v630, v631 = v628(v629, v630)

        if v630 == nil then
            break
        end
        if (v631.pt or 0) == 1 and not v631.sh and (v631._am or 1) >= p626 * 11 then
            return v630, v631
        end
    end

    return nil
end
local function u639()
    local _Easter = game:GetService('ReplicatedStorage').__DIRECTORY.Eggs.Events.Easter
    local v634, v635, v636 = pairs(_Easter:GetChildren())
    local v637 = 1

    while true do
        local v638

        v636, v638 = v634(v635, v636)

        if v636 == nil then
            break
        end
        if v637 == tonumber(v638.Name:split(' ')[1]) then
            return v638
        end
    end

    return nil
end
local function u646(p640)
    local v641 = require(game:GetService('ReplicatedStorage').Library.Client.CustomEggsCmds)
    local v642, v643, v644 = pairs(v641.All())

    while true do
        local v645

        v644, v645 = v642(v643, v644)

        if v644 == nil then
            break
        end
        if v645._id == p640._id then
            return v645._model
        end
    end
end
local function u649()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        local _PriceHUD = u646(require(u639())).PriceHUD
        local v648 = 30

        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _PriceHUD.Position).Magnitude >= 35 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _PriceHUD.CFrame + _PriceHUD.CFrame.LookVector * v648
        end
    end
end
local function u651()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        local v650 = u611() + 1

        u606.Invoke('InstanceZones_RequestPurchase', 'EasterEvent', v650)
    end
end
local function u652()
    return require(game.ReplicatedStorage.Library.Client.CurrencyCmds).Get('EasterCoins')
end
local function v659()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        local v653 = getsenv(game:GetService('Players').LocalPlayer.PlayerScripts.Scripts.Game.Events.Easter['Egg Hunt'])
        local v654 = getupvalue(v653.isSpawned, 2)

        if v654 then
            local v655, v656, v657 = pairs(v654.EggData)

            while true do
                local v658

                v657, v658 = v655(v656, v657)

                if v657 == nil then
                    break
                end

                local _, _ = u606.Invoke('Easter Egg Hunt: Claim', v658.ClaimId)
            end
        end
    end
end

local u660 = require(game.ReplicatedStorage.Library.Types.Easter)
local u661 = require(game:GetService('ReplicatedStorage').Library.Client.GiantEasterBasketCmds)

local function u668(p662)
    local _Misc4 = require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory.Misc
    local v664, v665, v666 = pairs(_Misc4)

    while true do
        local v667

        v666, v667 = v664(v665, v666)

        if v666 == nil then
            break
        end
        if v667.id == p662 then
            return v667, v666
        end
    end

    return nil
end
local function v678()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        local v669, v670, v671 = pairs(u660.EasterBoostDirectory)

        while true do
            local v672

            v671, v672 = v669(v670, v671)

            if v671 == nil then
                break
            end

            local v673 = u661.GetBoostTime(v671)
            local v674 = math.round(u660.FuelToTimeConversion)
            local _FuelMachineMaxTime = u660.FuelMachineMaxTime

            if math.floor((_FuelMachineMaxTime - v673) / v674) > 15 then
                local v676 = u668(v671)

                if v676 then
                    local _ = v676.id
                    local v677 = v676._am or 1

                    u606.Invoke('GiantEasterBasket_AddTime', v671, v677)
                end
            end
        end
    end
end
local function u684()
    local _Misc5 = require(game.ReplicatedStorage.Library.Client.Save).Get().Inventory.Misc
    local v680, v681, v682 = pairs(_Misc5)

    while true do
        local v683

        v682, v683 = v680(v681, v682)

        if v682 == nil then
            break
        end
        if v683.id == 'Easter Secret Key' then
            return true
        end
    end

    return false
end
local function v689()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        if u611() >= 5 then
            if u684() then
                u606.Invoke('Easter_SecretUnlock')
                u606.Fire('Instancing_PlayerLeaveInstance', 'EasterEvent')
                wait(0.5)
                u606.Invoke('Instancing_PlayerEnterInstance', 'EasterEggRoulette')
                wait(0.5)
                u606.Invoke('Instancing_InvokeCustomFromClient', 'EasterEggRoulette', 'ClaimSecretEgg', 7)
                u606.Fire('Instancing_PlayerLeaveInstance', 'EasterEggRoulette')
                wait(0.5)
                u606.Invoke('Instancing_PlayerEnterInstance', 'EasterEvent')
                wait(1)

                local v685, v686, v687 = pairs(game:GetService('Players').LocalPlayer.PlayerGui:GetChildren())

                while true do
                    local v688

                    v687, v688 = v685(v686, v687)

                    if v687 == nil then
                        break
                    end
                    if v688:IsA('Model') then
                        v688:Destroy()
                    end
                end
            end
        end
    else
        return
    end
end

local u690 = tick()

local function v718()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        local v691 = require(game:GetService('ReplicatedStorage').Library.Client.InstancingCmds)
        local v692 = require(game.ReplicatedStorage.Library.Client.Save).Get()

        if v692 then
            local v693 = v691.Get()

            if v693 then
                local _InstanceVars = v692.InstanceVars
                local _ = _InstanceVars.EasterEvent.QuestActive
                local _ = v693.instanceZones

                u652()

                local v695 = u611() + 1
                local v696 = v691.Get().instanceZones[v695]

                if v696 then
                    local _QuestActive = _InstanceVars.EasterEvent.QuestActive

                    if _QuestActive then
                        local v698 = u618(_QuestActive.Type)
                        local v699 = _QuestActive.Amount - _QuestActive.Progress

                        print('[DEBUG] \n ' .. 'Current Quest: ' .. v698 .. ' \n ' .. 'Amount Needed: ' .. _QuestActive.Progress .. '/' .. _QuestActive.Amount)

                        if v698 == 'GOLD_PET' and 0 < v699 then
                            local v700 = u625(v699)

                            if v700 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.__THINGS.__INSTANCE_CONTAINER.Active.EasterEvent.Teleports['1'].CFrame

                                wait(1)
                                u606.Invoke('GoldMachine_Activate', v700, v699)
                            else
                                u649()
                                getgenv().v_settings.functions.OpenClosestEgg()
                            end
                        elseif v698 == 'EGG' and 0 < v699 then
                            u649()
                            u604()
                        elseif v698 == 'RAINBOW_PET' and 0 < v699 then
                            local v701 = u632(v699)

                            if v701 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.__THINGS.__INSTANCE_CONTAINER.Active.EasterEvent.Teleports['1'].CFrame

                                wait(1)
                                u606.Invoke('RainbowMachine_Activate', v701, v699)
                            else
                                u649()
                                getgenv().v_settings.functions.OpenClosestEgg()
                            end
                        elseif v698 == 'BREAKABLE' and 0 < v699 then
                            u611()

                            local v702 = 1
                            local _EasterEvent2 = workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent')

                            if not _EasterEvent2 then
                                return
                            end

                            local v704, v705, v706 = pairs(_EasterEvent2.Teleports:GetChildren())

                            while true do
                                local v707

                                v706, v707 = v704(v705, v706)

                                if v706 == nil then
                                    break
                                end
                                if tonumber(v707.Name) == v702 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v707.Position + Vector3.new(55, 0, -25))).Magnitude >= 35 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v707.CFrame + Vector3.new(55, 0, -25)
                                end
                            end
                        elseif v699 < 0 then
                            if u652() < v696.CurrencyCost then
                                if tick() - u690 >= 60 then
                                    u690 = tick()

                                    u604()
                                end

                                local _EasterEvent3 = workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent')
                                local v709 = u611()
                                local _Teleports2 = _EasterEvent3:FindFirstChild('Teleports')

                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (_Teleports2[tostring(v709)].Position + Vector3.new(55, 0, -25))).Magnitude >= 35 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _Teleports2[tostring(v709)].CFrame + Vector3.new(55, 0, -25)
                                end
                            else
                                u651()
                            end
                        end
                    elseif u652() < v696.CurrencyCost then
                        local _Teleports3 = workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent'):FindFirstChild('Teleports')

                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (_Teleports3['1'].Position + Vector3.new(55, 0, -25))).Magnitude >= 35 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _Teleports3['1'].CFrame + Vector3.new(55, 0, -25)
                        end
                    else
                        u651()
                    end

                    return
                else
                    local v712 = u611()
                    local _EasterEvent4 = workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent')

                    if _EasterEvent4 then
                        local v714, v715, v716 = pairs(_EasterEvent4.Teleports:GetChildren())

                        while true do
                            local v717

                            v716, v717 = v714(v715, v716)

                            if v716 == nil then
                                break
                            end
                            if tonumber(v717.Name) == v712 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v717.Position + Vector3.new(55, 0, -25))).Magnitude >= 35 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v717.CFrame + Vector3.new(55, 0, -25)
                            end
                        end
                    end
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end

local _EasterUpgrades = game:GetService('ReplicatedStorage').__DIRECTORY.EventUpgrades.Event.EasterUpgrades
local v720, v721, v722 = pairs(_EasterUpgrades:GetChildren())
local u723 = u485
local u724 = u405
local u725 = u606
local v726 = {}

while true do
    local v727

    v722, v727 = v720(v721, v722)

    if v722 == nil then
        break
    end

    local v728 = require(v727)

    table.insert(v726, v728._id)
end

local function u735()
    local v729 = require(game.ReplicatedStorage.Library.Client.Save).Get()

    if v729 then
        local _Misc6 = v729.Inventory.Misc
        local v731, v732, v733 = pairs(_Misc6)

        while true do
            local v734

            v733, v734 = v731(v732, v733)

            if v733 == nil then
                break
            end
            if v734.id == 'Easter Token' then
                return v734._am or 1
            end
        end

        return nil
    end
end
local function v746()
    local _SelectedChestsUpgrades = getgenv().v_settings.functionToggles.SelectedChestsUpgrades

    if #_SelectedChestsUpgrades ~= 0 then
        local _EventUpgrades = require(game.ReplicatedStorage.Library.Client.Save).Get().EventUpgrades
        local v738 = _EasterUpgrades
        local v739, v740, v741 = pairs(v738:GetChildren())

        while true do
            local v742

            v741, v742 = v739(v740, v741)

            if v741 == nil then
                break
            end

            local v743 = require(v742)

            if table.find(_SelectedChestsUpgrades, v743._id) then
                local v744 = (_EventUpgrades[v743._id] or 0) + 1
                local v745 = v743.TierCosts[v744]

                if not v745 then
                    return
                end
                if v745._data._am <= u735() and (u725.Invoke('EventUpgrades: Purchase', v743._id) and math.random(1, 3) == 3) then
                    u725.Fire('EventLog_Once', 'CloseTab', 'EasterUpgradeMachine')
                end
            end
        end
    end
end
local function v747()
    if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild('EasterEvent') then
        if require(game.ReplicatedStorage.Library.Client.Save).Get().EasterHeroicActivations >= 1 then
            u725.Fire('Instancing_FireCustomFromClient', 'EasterEvent', 'SpawnHeroicChest')
        end
    else
        return
    end
end

function getcurrency()
    local v748 = u342.WorldUtil:GetWorld()
    local _ = v748.MapName
    local _WorldNumber2 = v748.WorldNumber
    local v750 = nil

    if _WorldNumber2 == 1 then
        v750 = getgenv().VRT.Lib.CurrencyCmds.Get('Coins')
    elseif _WorldNumber2 == 2 then
        v750 = getgenv().VRT.Lib.CurrencyCmds.Get('TechCoins')
    elseif _WorldNumber2 == 3 then
        v750 = getgenv().VRT.Lib.CurrencyCmds.Get('VoidCoins')
    end

    return v750
end
function RandomCoinNumber(p751)
    if p751 == nil then
        return nil
    elseif #p751 ~= 0 then
        return p751[math.random(1, #p751)]
    else
        return nil
    end
end

local u752 = require(game:GetService('ReplicatedStorage').Library.Client.PlayerPet)

function PlayerPets()
    table.clear(u54)

    local v753, v754, v755 = pairs(u752.GetAll())

    while true do
        local v756

        v755, v756 = v753(v754, v755)

        if v755 == nil then
            break
        end
        if v756.owner == game.Players.LocalPlayer then
            table.insert(u54, v756)
        end
    end

    return u54
end
function partunderplayer()
    local v757 = nil
    local v758 = nil

    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
        local _Character = game.Players.LocalPlayer.Character
        local _HumanoidRootPart4 = _Character:FindFirstChild('HumanoidRootPart')

        if _HumanoidRootPart4 then
            local v761 = Vector3.new(0, -500, 0)
            local v762 = Ray.new(_HumanoidRootPart4.Position, v761)

            v757, v758 = game.Workspace:FindPartOnRay(v762, _Character)
        end
    end

    return v757, v758
end
function GetClosestBreakables()
    if game.Players.LocalPlayer.Character then
        table.clear(u53)

        local v763 = workspace.__THINGS:WaitForChild('Breakables'):GetChildren()
        local _Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local v765 = getgenv().VRT.Lib.InstancingCmds.Get()
        local v766 = v765 and v765.instanceID or nil
        local v767, v768, v769 = pairs(v763)

        while true do
            local v770

            v769, v770 = v767(v768, v769)

            if v769 == nil then
                break
            end
            if (v770:IsA('Model') and v770:GetAttribute('ParentID') == getgenv().VRT.Lib.MapCmds.GetCurrentZone() or v770:GetAttribute('ParentID') == v766) and (v770.WorldPivot.Position - _Position).Magnitude < 85 then
                table.insert(u53, v770.Name)
            end
        end

        return u53
    end
end

local u771 = require(game:GetService('ReplicatedStorage').Library.Util.WorldsUtil)
local u772 = game:GetService('ReplicatedStorage').__DIRECTORY.Eggs['Zone Eggs'][u771.GetWorld()._id]

function FindClosestCustomEgg()
    if game.Players.LocalPlayer.Character then
        local _HumanoidRootPart5 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local _CustomEggs2 = workspace.__THINGS.CustomEggs
        local _huge3 = math.huge
        local v776, v777, v778 = pairs(_CustomEggs2:GetChildren())
        local v779 = nil

        while true do
            local v780

            v778, v780 = v776(v777, v778)

            if v778 == nil then
                break
            end
            if v780:IsA('Model') then
                local _Magnitude4 = (_HumanoidRootPart5.Position - v780.WorldPivot.Position).Magnitude

                if _Magnitude4 < _huge3 then
                    v779 = v780
                    _huge3 = _Magnitude4
                end
            end
        end

        return v779, _huge3
    end
end
function FindClosestEgg()
    local _HumanoidRootPart6 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local v783 = workspace.__THINGS.Eggs[u771.GetEggsModelName()]
    local _huge4 = math.huge
    local v785, v786, v787 = pairs(v783:GetChildren())
    local v788 = nil

    while true do
        local v789

        v787, v789 = v785(v786, v787)

        if v787 == nil then
            break
        end
        if v789:IsA('Model') then
            local _Magnitude5 = (_HumanoidRootPart6.Position - v789:FindFirstChild('Light').CFrame.Position).Magnitude

            if _Magnitude5 < _huge4 then
                v788 = v789
                _huge4 = _Magnitude5
            end
        end
    end

    if not v788 then
        return
    end

    local v791 = string.split(v788.Name, ' ')
    local v792 = u772
    local v793, v794, v795 = pairs(v792:GetDescendants())
    local v796 = nil

    while true do
        local v797

        v795, v797 = v793(v794, v795)

        if v795 == nil then
            v797 = v796

            break
        end
        if v797.Name:match(v791[1]) then
            local v798 = string.split(v797.Name, ' ')

            if v798[6] then
                v788 = v798[3] .. ' ' .. v798[4] .. ' ' .. v798[5] .. ' ' .. v798[6]
            elseif v798[5] then
                v788 = v798[3] .. ' ' .. v798[4] .. ' ' .. v798[5]
            else
                v788 = v798[3] .. ' ' .. v798[4]
            end

            break
        end
    end

    return v788, _huge4, v797
end

if workspace.__THINGS:WaitForChild('Breakables'):FindFirstChild('Highlight') then
    workspace.__THINGS.Breakables:FindFirstChild('Highlight'):Destroy()
end

function MaxEventZone()
    if u59.Get() then
        return #u59.Get().instanceZones
    end
end
function GetCurrentEvent()
    local v799 = u59.All()
    local v800, v801, v802 = pairs(v799)

    while true do
        local v803

        v802, v803 = v800(v801, v802)

        if v802 == nil then
            break
        end
        if v803:match('Event') then
            u65 = v803
        end
    end
end
function GetCurrentEventInstance()
    local v804 = u59.Get()

    if not v804 then
        return false
    end

    u62 = v804
    u63 = v804.instanceID

    return true
end
function GetCurrentEventInstanceZones()
    return u62.instanceZones
end
function GetCurrentEventInstanceFolder()
    u64 = workspace.__THINGS.Instances:FindFirstChild(u63)

    return u64
end
function GetEventMaximumZoneNumber()
    return u60.GetMaximumOwnedZoneNumber()
end
function GetMaxHatchCount()
    return u61.GetMaxHatch()
end
function GetEventZoneToBuy()
    local v805 = GetCurrentEventInstanceZones()
    local v806 = GetEventMaximumZoneNumber()

    if v805[v806] and v805[v806 + 1] then
        return v805[v806], v805[v806 + 1]
    else
        return nil
    end
end
function BuyZone()
    local v807 = GetCurrentCoins()
    local v808 = GetEventZoneToBuy()
    local _CurrencyCost = v808.CurrencyCost
    local _ = v808.DisplayName

    if _CurrencyCost > v807 then
        return false
    end

    local v810 = {
        u63,
        GetEventMaximumZoneNumber() + 1,
    }

    game:GetService('ReplicatedStorage'):WaitForChild('Network'):WaitForChild('InstanceZones_RequestPurchase'):InvokeServer(unpack(v810))

    return true
end
function GetQuestFromId(p811)
    local v812, v813, v814 = pairs(u348.Goals)

    while true do
        local v815

        v814, v815 = v812(v813, v814)

        if v814 == nil then
            break
        end
        if p811 == v815 then
            return v814
        end
    end
end
function GetIdFromQuest(p816)
    local v817, v818, v819 = pairs(u348.Goals)

    while true do
        local v820

        v819, v820 = v817(v818, v819)

        if v819 == nil then
            break
        end
        if p816 == v819 then
            return v820
        end
    end
end
function CurrentZoneQuest()
    table.clear(u66)

    local _QuestActive2 = u723.InstanceVars[u63].QuestActive

    u66.progress = _QuestActive2.Progress
    u66.type = _QuestActive2.Type
    u66.amount = _QuestActive2.Amount

    return u66
end
function MakeQuest()
    local v822 = CurrentZoneQuest()
    local v823 = GetQuestFromId(v822.type)

    if v822.progress >= v822.amount then
        BuyZone()
    end

    warn(v823)

    if v823 == 'RAINBOW_PET' then
        local _Pet6 = u723.Inventory.Pet
        local v825, v826, v827 = pairs(_Pet6)

        while true do
            local v828

            v827, v828 = v825(v826, v827)

            if v827 == nil then
                break
            end

            local v829 = v828._am or 1
            local _pt = v828.pt

            if not v828.sh and (_pt == 1 and v822.amount * 10 < v829) then
                local v831 = {
                    v827,
                    v822.amount + 2,
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Network'):WaitForChild('RainbowMachine_Activate'):InvokeServer(unpack(v831))
            end
        end
    elseif v823 == 'BREAKABLE' then
        local v832 = GetCurrentEventInstanceFolder()

        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v832.BREAKABLE_SPAWNS.Main_1.Position).Magnitude >= 40 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v832.BREAKABLE_SPAWNS.Main_1.CFrame
        end
    elseif v823 == 'EGG' then
        TeleportToEventZone(1)
    elseif v823 == 'GOLD_PET' then
        local _Pet7 = u723.Inventory.Pet
        local v834, v835, v836 = pairs(_Pet7)

        while true do
            local v837

            v836, v837 = v834(v835, v836)

            if v836 == nil then
                break
            end

            local v838 = v837._am or 1
            local v839 = v837.pt or 0

            if not v837.sh and (v839 == 0 and v822.amount * 10 < v838) then
                local v840 = {
                    v836,
                    v822.amount + 2,
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Network'):WaitForChild('RainbowMachine_Activate'):InvokeServer(unpack(v840))
            end
        end
    end
end
function TeleportToEventZone(p841)
    local _HumanoidRootPart7 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local _BREAKABLE_SPAWNS = GetCurrentEventInstanceFolder().BREAKABLE_SPAWNS
    local _Teleports4 = workspace.__THINGS.__INSTANCE_CONTAINER.Active.PetGamesEvent.Teleports

    if _BREAKABLE_SPAWNS:FindFirstChild('Main_' .. tostring(p841)) and (_HumanoidRootPart7.Position - _BREAKABLE_SPAWNS:FindFirstChild('Main_' .. tostring(p841)).Position).Magnitude <= 90 then
        local v845 = GetClosestEventEgg()

        if (_HumanoidRootPart7.Position - v845.Center.Position).Magnitude >= 50 then
            _HumanoidRootPart7.CFrame = v845.Center.CFrame + Vector3.new(0, 0, -30)
        end
    else
        _HumanoidRootPart7.CFrame = _Teleports4[tostring(p841)].CFrame

        task.wait(1)
    end
end
function PrintDebugInfo()
    print('Debug Info:')
    print(' - ScriptVersion: ', u349)
    print(' - shouldcreatenewraid: ', shouldcreatenewraid)
    print(' - InRaid: ', InRaid())
    print(' - GetDifficulty: ', GetDifficulty())
    print(' - GetAvailablePortal: ', GetAvailablePortal())
    print(' - GetPartyMode: ', GetPartyMode())
    print(' - IsFarming: ', getgenv().Raid.IsFarming)
    print(' - GetThreadIdentity: ', getthreadidentity())
    print(' - GetThreadContext: ', getthreadcontext())
    setthreadidentity(8)
end

local v846, v847, v848 = pairs(require(game:GetService('ReplicatedStorage').Library.Directory.ZoneFlags))
local v849 = {}

while true do
    local v850, _ = v846(v847, v848)

    if v850 == nil then
        break
    end

    v848 = v850

    if not v849.Flags then
        v849.Flags = {}
    end

    table.insert(v849.Flags, v850)
end

setthreadidentity(8)

local function u857(p851)
    local v852, v853, v854 = pairs(p851)
    local v855 = ''

    while true do
        local v856

        v854, v856 = v852(v853, v854)

        if v854 == nil then
            break
        end

        v855 = v855 .. v854 .. ' ' .. v856 .. '\n'
    end

    return v855
end
local function u865(p858)
    local v859, v860, v861 = pairs(p858)
    local v862 = true
    local v863 = ''

    while true do
        local v864

        v861, v864 = v859(v860, v861)

        if v861 == nil then
            break
        end
        if v862 then
            v863 = v863 .. v861 .. ' ' .. v864
            v862 = false
        else
            v863 = v863 .. ',' .. v861 .. ' ' .. v864
        end
    end

    return v863
end

(function()
    if isfile('VRT/Config/MailboxItems.txt') then
        local _VRTConfigMailboxItemstxt = readfile('VRT/Config/MailboxItems.txt')
        local v867, v868, v869 = string.gmatch(_VRTConfigMailboxItemstxt, '([^,]+)')
        local v870 = {}

        while true do
            v869 = v867(v868, v869)

            if v869 == nil then
                break
            end

            local v871, v872 = string.match(v869, '^(.-)%s*(%d+)$')

            if v871 and v872 then
                table.insert(v870, {
                    name = v871,
                    amount = tonumber(v872),
                })
            end
        end

        local v873, v874, v875 = pairs(v870)

        while true do
            local v876

            v875, v876 = v873(v874, v875)

            if v875 == nil then
                break
            end

            getgenv().v_settings.functionToggles.MailboxItems[v876.name] = v876.amount
        end
    end
end)()

---------------------------------------------------------------------
-- PHẦN THAY THẾ GIAO DIỆN (DÁN TỪ ĐÂY ĐẾN HẾT SCRIPT)
---------------------------------------------------------------------
local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kingltnnn/testt/refs/heads/main/lib.lua"))()
local Window = UILib:CreateUI()
Window:SetScale(1)

-- Thay thế hệ thống Notify của Rayfield bằng StarterGui Core
local function Notify(params)
    game.StarterGui:SetCore("SendNotification", {
        Title = params.Title,
        Text = params.Content,
        Duration = params.Duration or 5
    })
end

-- ==============================================================
-- CÁC HÀM WRAPPER ĐỂ TƯƠNG THÍCH LOGIC CŨ VỚI HUGEGAMES UI
-- ==============================================================
local function v890(Section, Name, Flag, Table, Func, WaitTime, CheckFlag)
    Section:Toggle(Name, false, function(state)
        getgenv().v_settings.functionToggles[Flag] = state
        task.spawn(function()
            while getgenv().v_settings.functionToggles[Flag] do
                if not getgenv().v_settings.functionToggles[CheckFlag] then
                    local success, err = pcall(function() return Func(Table) end)
                    if not success then warn('[ERROR]', Flag, err) end
                end
                task.wait(WaitTime)
            end
        end)
    end)
end

local function u908(Section, Name, Flag, Func, WaitTime, Ext1, CheckFlag, Ext2)
    local ToggleObj = Section:Toggle(Name, false, function(state)
        if Flag == 'StatiscticsUI' and not state then
            local children = game.CoreGui:GetChildren()
            for _, child in pairs(children) do
                if child.Name == 'MainScreen' then child:Destroy() end
            end
        end
        if Ext1 == 'FarmRaid' then shouldcreatenewraid = true end

        print('Setting:', Flag, 'To:', state)
        getgenv().v_settings.functionToggles[Flag] = state

        local delayTime = 0
        task.spawn(function()
            while getgenv().v_settings.functionToggles[Flag] do
                if not getgenv().v_settings.functionToggles[CheckFlag] then
                    local success, err = xpcall(Func, function(err) return debug.traceback(err, 2) end)
                    if not success then warn('[ERROR]', Flag, err) end
                end
                if Ext2 ~= 'MineEvery' then
                    delayTime = WaitTime
                else
                    delayTime = getgenv().v_settings.functionToggles[Ext2] or WaitTime
                end
                task.wait(delayTime)
            end
        end)
    end)
    return ToggleObj
end

local function v912(Section, Name, Func)
    Section:Button(Name, function() Func() end, "Execute")
end

local function v928(Section, Name, Flag, OptionsTable, Multiple)
    if Multiple then
        if not getgenv().v_settings.functionToggles[Flag] then
            getgenv().v_settings.functionToggles[Flag] = {}
        end
        Section:DropDown(Name, OptionsTable, function(selected)
            if not table.find(getgenv().v_settings.functionToggles[Flag], selected) then
                table.insert(getgenv().v_settings.functionToggles[Flag], selected)
            else
                for i, v in ipairs(getgenv().v_settings.functionToggles[Flag]) do
                    if v == selected then
                        table.remove(getgenv().v_settings.functionToggles[Flag], i)
                        break
                    end
                end
            end
        end)
    else
        Section:DropDown(Name, OptionsTable, function(selected)
            getgenv().v_settings.functionToggles[Flag] = selected
        end)
    end
end

local function v934(Section, Name, Flag, Placeholder)
    Section:Input(Name, function(text)
        getgenv().v_settings.functionToggles[Flag] = text
        Notify({Title = Name .. ' Updated!', Content = Name .. ' Updated!', Duration = 3})
    end)
end

-- ==============================================================
-- TAB 1: TESTING
-- ==============================================================
local _TestingTab = Window:CreateTab('Testing')

local _TestingSec = _TestingTab:Section('Testing Section')
_TestingSec:Label('Discord: .gg/JwfXeX9gjw')
_TestingSec:Label('Updated For Conveyor Event')

local _TestingWebhookSec = _TestingTab:Section('Webhook Section')
v934(_TestingWebhookSec, 'Discord Webhook (Ping On Huge/Titanic)', 'DiscordWebhook', 'Input Discord Webhook')
v934(_TestingWebhookSec, 'Discord UserId', 'DiscordUserId', 'Input Discord Account ID')
u908(_TestingWebhookSec, 'Send Webhook on Huge/Titanic Pet', 'SendWebhook', CheckPets, 15)

local _TestingFuncSec = _TestingTab:Section('Testing Functions Section')
ShinyRelicsParagraph = _TestingFuncSec:Label('Collected Relics: 0/0')
function ShinyRelicsParagraph:Set(data)
    if self.Frame and self.Frame:FindFirstChild("Title") then
        local content = data.Content:gsub("<[^>]+>", "")
        self.Frame.Title.Text = data.Title .. ": " .. content
    end
end

u908(_TestingFuncSec, 'Collect Relics', 'AutoRelics', v544, 5)
u908(_TestingFuncSec, 'Auto Claim Rank Rewards', 'AutoClaimRankRewards', v569, 5)
v890(_TestingFuncSec, 'Buy Next Zone', 'BuyNextZone', u342, u342.BuyNextZone, 0.05)
v890(_TestingFuncSec, 'Teleport To Best Unlocked World', 'TeleportToBestUnlockedWorld', u342, u342.TeleportToAnotherWorld, 1)
v890(_TestingFuncSec, 'Buy Pet Slots', 'BuyPetSlots', u342, u342.BuyPetSlots, 0.25)
v890(_TestingFuncSec, 'Use Ultimate', 'UseUltimate', u342, u342.ActivateUltimate, 0.25)
v928(_TestingFuncSec, 'Select Flag to Use', 'SelectedFlag', v849.Flags, false)

_TestingFuncSec:Slider('Flag Amount to Use', 1, 45, function(val)
    getgenv().v_settings.functionToggles['FlagAmount'] = val
end)

v890(_TestingFuncSec, 'Use Selected Flag', 'UseSelectedFlag', u342, u342.ActivateFlag, 1)
u908(_TestingFuncSec, 'Auto Daycare (Claim and Enroll)', 'AutoDayCare', PutPetsInDaycare, 2.5)
v912(_TestingFuncSec, 'Debug Print', PrintDebugInfo)

-- ==============================================================
-- TAB 2: EVENT
-- ==============================================================
local _EventTab = Window:CreateTab('Event')
local _EventSec = _EventTab:Section('Event Section')

u908(_EventSec, 'Auto Enter Easter Event', 'EnterEasterEvent', v610, 5)
u908(_EventSec, 'Farm Last Area', 'FarmEasterLastArea', v718, 1)
u908(_EventSec, 'Claim Easter Eggs', 'EasterClaimEgg', v659, 2.5)
v928(_EventSec, 'Select Chest Upgrades you Want to Upgrade', 'SelectedChestsUpgrades', v726, true)
u908(_EventSec, 'Buy Selected Chest Upgrades', 'BuySelectedChestUpgrades', v746, 1.5)
u908(_EventSec, 'Make Chest Heroic', 'ChestHeroicMode', v747, 1)
u908(_EventSec, 'Auto Make Egg Roulette', 'AutoEggRoulette', v689, 1)
u908(_EventSec, 'Auto Boost Easter Basket', 'BoostGiantBasket', v678, 5)

-- ==============================================================
-- TAB 3: MAILBOX
-- ==============================================================
local _MailboxTab = Window:CreateTab('Mailbox')
local _MailboxSec = _MailboxTab:Section('Mailbox Section')

local u945 = _MailboxSec:Label('Selected Items To Mailbox: None')
function u945:Set(data)
    if self.Frame and self.Frame:FindFirstChild("Title") then
        local content = data.Content:gsub("<[^>]+>", "")
        self.Frame.Title.Text = data.Title .. ": " .. content
    end
end

_MailboxSec:Input('Input Username you want to mailbox items to', function(val)
    getgenv().v_settings.functionToggles.MailboxUsername = val
end)
_MailboxSec:DropDown('Send Huges Mode', {'All', 'New'}, function(selected)
    getgenv().v_settings.functionToggles.MailboxSendHugesType = selected
end)
_MailboxSec:Input('Input Item name you want to mailbox', function(val)
    getgenv().v_settings.functionToggles.InputedMailboxItem = val
end)
_MailboxSec:Input('Send if Item Amount is higher than (amount)', function(val)
    if val:match('%d+') then
        getgenv().v_settings.functionToggles.InputedMailboxAmount = tonumber(val)
    else
        Notify({Title = 'Error', Content = 'Item Amount need to be a number'})
    end
end)

_MailboxSec:Button('Add Inputed Item To List', function()
    if not u409() then
        Notify({Title = 'Wrong Item Name', Content = 'Inputed Wrong Item Name Try With Capitalized Letters'})
    end
    u945:Set({Title = 'Selected Items To Mailbox', Content = u857(getgenv().v_settings.functionToggles.MailboxItems)})
    writefile('VRT/Config/MailboxItems.txt', u865(getgenv().v_settings.functionToggles.MailboxItems))
end, "Add")

_MailboxSec:Button('Remove Inputed Item To List', function()
    u413()
    u945:Set({Title = 'Selected Items To Mailbox', Content = u857(getgenv().v_settings.functionToggles.MailboxItems)})
    writefile('VRT/Config/MailboxItems.txt', u865(getgenv().v_settings.functionToggles.MailboxItems))
end, "Remove")

_MailboxSec:Toggle('Send Selected Items', false, function(state)
    getgenv().v_settings.functionToggles.MailboxEnabled = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.MailboxEnabled do
            u390()
            task.wait(5)
        end
    end)
end)

_MailboxSec:Toggle('Send Huges By Mode', false, function(state)
    getgenv().v_settings.functionToggles.HugeMailboxEnabled = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.HugeMailboxEnabled do
            u724()
            task.wait(5)
        end
    end)
end)

_MailboxSec:Toggle('Auto Claim Mailbox', false, function(state)
    getgenv().v_settings.functionToggles.MailboxClaimAll = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.MailboxClaimAll do
            u414()
            task.wait(5)
        end
    end)
end)

-- ==============================================================
-- TAB 4: AUTO-FARM
-- ==============================================================
local _AutoFarmTab = Window:CreateTab('Auto-Farm')

local _FarmSec = _AutoFarmTab:Section('Farming Section')
_FarmSec:Toggle('Fast Farm', false, function(state)
    getgenv().v_settings.functionToggles.FastFarm = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.FastFarm do
            getgenv().v_settings.functions.FastFarm()
            task.wait(0.15)
        end
    end)
end)

_FarmSec:Toggle('(Old test which works better for you) Fast Farm', false, function(state)
    getgenv().v_settings.functionToggles.FastFarm2 = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.FastFarm2 do
            getgenv().v_settings.functions.FastFarm2()
            task.wait(0.2)
        end
    end)
end)

_FarmSec:Toggle('Auto Collect Orbs', false, function(state)
    getgenv().v_settings.functionToggles.AutoOrbs = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.AutoOrbs do
            getgenv().v_settings.functions.CollectOrbs()
            task.wait(0.01)
        end
    end)
end)

_FarmSec:Toggle('Inf Pet Speed', false, function(state)
    getgenv().v_settings.functionToggles.HugePetSpeed = state
    if state then
        getgenv().v_settings.functions.HugePetSpeed()
    else
        u347.CalculateSpeedMultiplier = getgenv().v_settings.functionsValues.PetSpeed
    end
end)

local _EggSec = _AutoFarmTab:Section('Egg Opening')
local u959 = _EggSec:Toggle('Hide Egg Animation', false, function(state)
    getgenv().v_settings.functionToggles.HideEggAnimation = state
    if state then
        task.spawn(function()
            while getgenv().v_settings.functionToggles.HideEggAnimation do
                getgenv().v_settings.functions.HideEggAnimation()
                wait(5)
            end
        end)
    else
        u346.PlayEggAnimation = getgenv().v_settings.functionsValues.EggAnimation
    end
end)

local HookEggAnimationToggle = _EggSec:Toggle('Hook Egg Animation', false, function(state)
    getgenv().v_settings.functionToggles.HookEggAnimation = state
    if state then
        task.spawn(function()
            while getgenv().v_settings.functionToggles.HookEggAnimation do
                getgenv().v_settings.functions.HookEggAnimation()
                wait(5)
            end
        end)
    else
        u346.PlayEggAnimation = getgenv().v_settings.functionsValues.EggAnimation
    end
end)

_EggSec:Toggle('Auto Open Closest Egg', false, function(state)
    getgenv().v_settings.functionToggles.OpenClosestEgg = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.OpenClosestEgg do
            getgenv().v_settings.functions.OpenClosestEgg()
            task.wait(0.01)
        end
    end)
end)

local _ClickAuraSec = _AutoFarmTab:Section('Click Aura')
_ClickAuraSec:Slider('Click Aura Slider', 1, 150, function(val)
    getgenv().v_settings.functionsValues.ClickAuraValue = val
end)

_ClickAuraSec:Toggle('Click Aura Visualizer', false, function(state)
    if not state and workspace:FindFirstChild('M') then
        workspace:FindFirstChild('M'):Destroy()
    end
    getgenv().v_settings.functionToggles.ClickAuraVisualizer = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.ClickAuraVisualizer do
            getgenv().v_settings.functions.VisualizeClickAura(getgenv().v_settings.functionsValues.ClickAuraValue).Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            task.wait(0.01)
        end
    end)
end)

_ClickAuraSec:Toggle('Click Aura', false, function(state)
    getgenv().v_settings.functionToggles.ClickAura = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.ClickAura do
            getgenv().v_settings.functions.ClickAura()
            task.wait(0.01)
        end
    end)
end)

local _OptimizeSec = _AutoFarmTab:Section('Optimize')
_OptimizeSec:Toggle('Optimize Breakables', false, function(state)
    getgenv().v_settings.functionToggles.OptimizeBreakables = state
    if state then
        pcall(function() return getgenv().v_settings.functions.OptimizeBreakables() end)
    elseif getgenv().v_settings.OptimizeBreakables then
        getgenv().v_settings.OptimizeBreakables:Disconnect()
        getgenv().v_settings.OptimizeBreakables = nil
    end
end)

_OptimizeSec:Toggle('Optimize Pets', false, function(state)
    getgenv().v_settings.functionToggles.OptimizePets = state
    task.spawn(function()
        while getgenv().v_settings.functionToggles.OptimizePets do
            getgenv().v_settings.functions.OptimizePets()
            task.wait(5)
        end
    end)
end)

-- ==============================================================
-- TAB 5: AUTO CONSUME/OPEN
-- ==============================================================
local _AutoConsumeTab = Window:CreateTab('Auto Consume/Open')

local _FruitsSec = _AutoConsumeTab:Section('Fruits Section')
v928(_FruitsSec, 'Select Fruits to Use', 'SelectedFruits', v974, true)
u908(_FruitsSec, 'Use Selected Fruits', 'UseSelectedFruits', v509, 5)

local _LootBoxesSec = _AutoConsumeTab:Section('LootBoxes Section')
v928(_LootBoxesSec, 'Select Lootboxes to Open', 'SelectedLootboxes', v975, true)
u908(_LootBoxesSec, 'Open Selected Lootboxes', 'OpenSelectedLootboxes', v520, 1)
v928(_LootBoxesSec, 'Select Gift Bags to Open', 'SelectedGifts', v976, true)
u908(_LootBoxesSec, 'Open Selected GiftBags', 'OpenSelectedGifts', v529, 1)

