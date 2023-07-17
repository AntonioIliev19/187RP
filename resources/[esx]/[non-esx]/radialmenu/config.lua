-- Menu configuration, array of menus to display
menuConfigs = {
    ['emotes'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "~",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"CANCEL", "NO", "CHEER", "CLAP", "FOLDARMS", "LEAN"},
                    commands = {"e cancel", "e no", "e cheer", "e slowclap", "e foldarms", "e leanwall"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"SALUTE", "FINGER", "PEACE", "FACEPALM", "DAMN", "FAIL", "DEAD", "GANG1", "GANG2", "COP", "HOLSTER", "CROWDS"},
                    commands = {"e salute", "e finger", "e peace", "e palm", "e damn", "e fail", "e dead", "e gang1", "e gang2", "e copidle", "e holster", "e copcrowd2"}
                }
            }
        }
    },
    ['vehicles'] = {                                -- Example menu for vehicle controls when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedInAnyVehicle(player, false)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "~",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:trunk.png", "imgsrc:hood.png",  "imgsrc:backdoors.png", "imgsrc:backleft.png", "imgsrc:backright.png", "imgsrc:left.png", "imgsrc:right.png"},
                    commands = {"engine", "lock", "trunk", "hood", "rdoors", "door 3", "door 4", "door 1", "door 2", "shuff"}
                }
            }
        }
    }
}

menuConfigs = {
    ['menu'] = {
    enableMenu = function()
        return true
    end,
    data = {
        keybind = "~",
        style = {
            sizePx = 600,
            slices = {
                default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
            },
            titles = {
                default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
            },
            icons = {
                width = 64,
                height = 64
            }
        },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:trunk.png", "imgsrc:hood.png",  "imgsrc:backdoors.png", "imgsrc:backleft.png", "imgsrc:backright.png", "imgsrc:left.png", "imgsrc:right.png"},
                    commands = {"engine", "lock", "trunk", "hood", "rdoors", "door 3", "door 4", "door 1", "door 2", "shuff"}
                },
                {
                    navAngle = 307,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                labels = {"Действия", "Анимации", "imgsrc:skull2.png", "Затвори", "Запази МПС"},
                commands = {"submenu1", "submenu3", "die", "closemenu", "save"}
                }
            }
    }
}
}


subMenuConfigs = {
    ['submenu1'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
				{
                    navAngle = 270,
                    minRadiusPercent = 0.2,
                    maxRadiusPercent = 0.5,
                    labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:trunk.png", "imgsrc:hood.png",  "imgsrc:backdoors.png", "imgsrc:backleft.png", "imgsrc:backright.png", "imgsrc:left.png", "imgsrc:right.png"},
                    commands = {"engine", "lock", "trunk", "hood", "rdoors", "door 3", "door 4", "door 1", "door 2", "shuff"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"Затвори", "Прибери", "Пура", "Пура2", "Цигара", "Джойнт", "Дръж пура", "Дръж Цигара", "Дръж Джойнт", "Изхвърли"},
                    commands = {"closemenu", "e stuckprop", "e cigar", "e cigar2", "e cig", "e joint", "e holdcigar", "e holdcig", "e holdjoint", "e stop"}
                }
            }
        }
    },
    ['submenu3'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
				{
                    navAngle = 270,
                    minRadiusPercent = 0.2,
                    maxRadiusPercent = 0.5,
                    labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:trunk.png", "imgsrc:hood.png",  "imgsrc:backdoors.png", "imgsrc:backleft.png", "imgsrc:backright.png", "imgsrc:left.png", "imgsrc:right.png"},
                    commands = {"engine", "lock", "trunk", "hood", "rdoors", "door 3", "door 4", "door 1", "door 2", "shuff"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"Затвори", "Здравей", "Среден пръст", "Мир", "Господи", "Въй", "Провал", "Припаднал", "Ганг1", "Ганг2", "Спри Анимация", "Облегни се", "Кръстосани ръце", "Ръкопляскане", "НЕ"},
                    commands = {"closemenu", "e salute", "e finger", "e peace", "e facepalm", "e damn", "e fail", "e dead", "e gang1", "e gang2", "e stop", "e leanwall", "e kors", "e cheer", "e no"}
                }
            }
        }
    },
}