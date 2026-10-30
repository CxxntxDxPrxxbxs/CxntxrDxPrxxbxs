local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local LocalizationService = game:GetService("LocalizationService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end

local Config = {
    HubName = "Mystery Hub Rework",
    Key = "MHONTOP",
    DiscordLink = "https://discord.gg/g8NGM8VUD8",
    AllowedGameId = 210851291,
    AllowedPlaceIds = { 537413528 },
    WhitelistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Whitelist.json",
    BlacklistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Blacklist.json",
    WindUiUrl = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    WebhookUrl = "https://obscuravm.com/r/756120e0a3625accc384ade898d734fb/mystery-logger",
    CounterUrl = "https://webhook-bv4o.onrender.com/execute",
    LoaderUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Loader/refs/heads/main/Rework.lua",
}

local Strings = {
    en = {
        key_note = "Enter the key to unlock the hub.",
        blacklisted = "You are blacklisted.",
        game_not_supported = "This game is not supported by Mystery Hub.",
        copied = "Copied",
        copied_msg = "%s copied to clipboard.",
        error = "Error",
        no_clipboard = "Your executor can't copy to clipboard.",
        yes = "Yes",
        no = "No",
        unknown = "Unknown",
        open_hub = "Open %s",

        sec_dashboard = "Dashboard",
        sec_farming = "Farming",
        sec_building = "Building",
        sec_misc = "Miscellaneous",
        sec_server = "Server",
        sec_library = "Library",

        tab_home = "Home",
        tab_farm = "Farm",
        tab_data = "Data",
        tab_builder = "Builder",
        tab_shop = "Shop",
        tab_quest = "Quest",
        tab_troll = "Troll",
        tab_players = "Players",
        tab_extras = "Extras",
        tab_teleport = "Teleport",
        tab_settings = "Settings",

        home_player = "Player",
        home_player_info = "Player info",
        home_display_name = "Display name",
        home_username = "Username",
        home_user_id = "User ID",
        home_account_age = "Account age",
        home_days = "days",
        home_created = "Created",
        home_membership = "Membership",
        home_copy_user_id = "Copy User ID",
        home_game = "Game",
        home_game_info = "Game info",
        home_name = "Name",
        home_place_id = "Place ID",
        home_game_id = "Game ID",
        home_job_id = "Job ID",
        home_max_players = "Max players",
        home_live_stats = "Live server stats",
        home_loading = "Loading...",
        home_players = "Players",
        home_fps = "FPS",
        home_ping = "Ping",
        home_server_time = "Server time",
        home_memory = "Memory",
        home_copy_place_id = "Copy Place ID",
        home_copy_job_id = "Copy Job ID",
        home_rejoin = "Rejoin server",
        home_executor = "Executor",
        home_executor_info = "Executor info",
        home_version = "Version",
        home_cap_clipboard = "Clipboard",
        home_cap_http = "HTTP requests",
        home_cap_files = "File system",
        home_cap_hooks = "Hook functions",
        home_cap_drawing = "Drawing library",
        home_cap_queue = "Queue on teleport",
        home_community = "Community",
        home_copy_discord = "Copy Discord link",
        home_discord_desc = "Join the community server",
        home_discord_label = "Discord link",

        farm_section = "Auto Farm No teleport",
        farm_cave = "Auto Farm",
        farm_cave_desc = "Flies through the stages automatically without teleporting, respawns when it finishes and repeats until you turn it off",
        farm_speed_input = "Flight speed",
        farm_speed_ph = "400",
        farm_missing = "The stages could not be found.",

        ex_farm_section = "Farming Utilities",
        ex_lockpos = "Lock Position",
        ex_lockpos_desc = "Keeps your character frozen in place",
        ex_opt_section = "Optimization",
        ex_opt_note = "Everything is reversible: turning a toggle off restores the original values.",
        ex_opt_particles = "Remove Particles",
        ex_opt_particles_desc = "Removes particles, trails, beams, fire, smoke, sparkles and explosions, including new ones",
        ex_opt_effects = "Remove Lights & Effects",
        ex_opt_effects_desc = "Turns off lights, highlights and screen effects (bloom, blur, sun rays...)",
        ex_opt_graphics = "Low Graphics",
        ex_opt_graphics_desc = "Lowest quality, no shadows, flat materials and hidden decals",
        ex_move_section = "Movement & World",
        ex_infjump = "Infinite Jump",
        ex_infjump_desc = "Jump again while in the air",
        ex_time = "Change Time",
        ex_time_day = "Day",
        ex_time_night = "Night",
        ex_shader_section = "Shaders",
        ex_shader = "Shader",
        ex_shader_original = "Original",
        ex_shader_prev = "Previous",
        ex_shader_next = "Next",
        ex_shader_note = "Light & graphics optimization was turned off to apply the shader.",
        ex_player_section = "Player Settings",
        ex_speed_input = "Speed value",
        ex_speed_toggle = "Change Speed",
        ex_speed_desc = "Applies the typed WalkSpeed",
        ex_jump_input = "Jump value",
        ex_jump_toggle = "Change Jump",
        ex_jump_desc = "Applies the typed JumpPower",
        ex_gravity_input = "Gravity value",
        ex_gravity_toggle = "Change Gravity",
        ex_gravity_desc = "Applies the typed gravity (default 196.2)",
        ex_external_section = "External Scripts",
        ex_external_fail = "Could not load the script.",
        ex_server_section = "Server System",
        ex_server_autoreconnect = "Auto Reconnect",
        ex_server_autoreconnect_desc = "Rejoins the same server when an error message appears",
        ex_server_autoreconnect_auto = "Auto Reconnect (Automatic)",
        ex_server_autoreconnect_auto_desc = "Rejoins when you get kicked or disconnected",
        ex_server_hop_low = "Server Hop Low",
        ex_server_hop_low_desc = "Joins the public server with the fewest players",
        ex_server_hop_full = "Server Hop Full",
        ex_server_hop_full_desc = "Joins the fullest public server that still has space",
        ex_server_rejoin = "Reconnect Same Server",
        ex_server_joining = "Joining a server with %d players...",
        ex_server_none = "No available servers were found.",

        set_appearance = "Appearance",
        set_theme = "Theme",
        set_theme_desc = "Change the UI colors",
        set_transparency = "Transparency",
        set_transparency_d = "Make the window transparent",
        set_configuration = "Configuration",
        set_autosave = "Auto Save",
        set_autosave_desc = "Saves the current config every 5 seconds",
        set_select_config = "Select config",
        set_new_config = "New config name",
        set_new_config_ph = "My config",
        set_create_config = "Create config",
        set_create_desc = "Creates and saves a new config with the typed name",
        set_save_config = "Save config",
        set_load_config = "Load config",
        set_delete_config = "Delete config",
        set_config_title = "Config",
        set_type_name = "Type a valid name first.",
        set_created = "Created: %s",
        set_saved = "Saved: %s",
        set_loaded = "Loaded: %s",
        set_deleted = "Deleted: %s",
        set_cant_save = "Could not save.",
        set_cant_load = "Could not load.",
        set_hub_section = "Hub",
        set_notifications = "Notifications",
        set_notifications_desc = "Show or hide the hub's pop-up notifications",
        set_menukey = "Menu key",
        set_menukey_ph = "Q",
        set_menukey_set = "Menu key set to %s.",
        set_menukey_invalid = "Invalid key name.",
        set_fpscap = "FPS cap",
        set_fpscap_desc = "Limits your FPS (1 to 999)",
        set_fpscap_unsup = "Your executor doesn't support setfpscap.",
        set_autoload = "Load config on start",
        set_autoload_desc = "Loads the selected config automatically when the hub starts",
        set_requeue = "Auto execute on server change",
        set_requeue_desc = "Runs the hub again after a server hop or rejoin",
        set_requeue_unsup = "Your executor doesn't support queue_on_teleport.",
        set_requeue_nourl = "Set Config.LoaderUrl first.",
        set_panic = "Turn off all toggles",
        set_panic_desc = "Turns off every active feature at once",
        set_panic_done = "All toggles turned off.",
        set_unload = "Unload hub",
        set_unload_desc = "Turns off every loop, restores changes and closes the window",
    },

    es = {
        key_note = "Ingresa la clave para desbloquear el hub.",
        blacklisted = "Estás en la lista negra.",
        game_not_supported = "Este juego no es compatible con Mystery Hub.",
        copied = "Copiado",
        copied_msg = "%s copiado al portapapeles.",
        error = "Error",
        no_clipboard = "Tu executor no puede copiar al portapapeles.",
        yes = "Sí",
        no = "No",
        unknown = "Desconocido",
        open_hub = "Abrir %s",

        sec_dashboard = "Panel",
        sec_farming = "Farmeo",
        sec_building = "Construcción",
        sec_misc = "Misceláneo",
        sec_server = "Servidor",
        sec_library = "Biblioteca",

        tab_home = "Inicio",
        tab_farm = "Farmeo",
        tab_data = "Datos",
        tab_builder = "Constructor",
        tab_shop = "Tienda",
        tab_quest = "Misiones",
        tab_troll = "Troll",
        tab_players = "Jugadores",
        tab_extras = "Extras",
        tab_teleport = "Teletransporte",
        tab_settings = "Ajustes",

        home_player = "Jugador",
        home_player_info = "Información del jugador",
        home_display_name = "Nombre visible",
        home_username = "Usuario",
        home_user_id = "ID de usuario",
        home_account_age = "Edad de la cuenta",
        home_days = "días",
        home_created = "Creada",
        home_membership = "Membresía",
        home_copy_user_id = "Copiar ID de usuario",
        home_game = "Juego",
        home_game_info = "Información del juego",
        home_name = "Nombre",
        home_place_id = "ID del lugar",
        home_game_id = "ID del juego",
        home_job_id = "ID del servidor",
        home_max_players = "Máx. de jugadores",
        home_live_stats = "Estadísticas del servidor en vivo",
        home_loading = "Cargando...",
        home_players = "Jugadores",
        home_fps = "FPS",
        home_ping = "Ping",
        home_server_time = "Tiempo del servidor",
        home_memory = "Memoria",
        home_copy_place_id = "Copiar ID del lugar",
        home_copy_job_id = "Copiar ID del servidor",
        home_rejoin = "Reentrar al servidor",
        home_executor = "Executor",
        home_executor_info = "Información del executor",
        home_version = "Versión",
        home_cap_clipboard = "Portapapeles",
        home_cap_http = "Peticiones HTTP",
        home_cap_files = "Sistema de archivos",
        home_cap_hooks = "Funciones hook",
        home_cap_drawing = "Librería Drawing",
        home_cap_queue = "Cola al teletransportar",
        home_community = "Comunidad",
        home_copy_discord = "Copiar enlace de Discord",
        home_discord_desc = "Únete al servidor de la comunidad",
        home_discord_label = "Enlace de Discord",

        farm_section = "Auto Farm No teleport",
        farm_cave = "Auto Farm",
        farm_cave_desc = "Recorre los stages automáticamente sin teletransportarte, reaparece al terminar y repite hasta que lo apagues",
        farm_speed_input = "Velocidad de vuelo",
        farm_speed_ph = "400",
        farm_missing = "No se encontraron los stages.",

        ex_farm_section = "Utilidades de farmeo",
        ex_lockpos = "Bloquear posición",
        ex_lockpos_desc = "Mantiene a tu personaje congelado en su lugar",
        ex_opt_section = "Optimización",
        ex_opt_note = "Todo es reversible: al apagar un interruptor se restauran los valores originales.",
        ex_opt_particles = "Eliminar partículas",
        ex_opt_particles_desc = "Quita partículas, estelas, rayos, fuego, humo, destellos y explosiones, incluso las nuevas",
        ex_opt_effects = "Eliminar luces y efectos",
        ex_opt_effects_desc = "Apaga luces, resaltados y efectos de pantalla (bloom, desenfoque, rayos de sol...)",
        ex_opt_graphics = "Gráficos bajos",
        ex_opt_graphics_desc = "Calidad mínima, sin sombras, materiales lisos y calcomanías ocultas",
        ex_move_section = "Movimiento y mundo",
        ex_infjump = "Salto infinito",
        ex_infjump_desc = "Salta de nuevo estando en el aire",
        ex_time = "Cambiar hora",
        ex_time_day = "Día",
        ex_time_night = "Noche",
        ex_shader_section = "Shaders",
        ex_shader = "Shader",
        ex_shader_original = "Original",
        ex_shader_prev = "Anterior",
        ex_shader_next = "Siguiente",
        ex_shader_note = "Se apagó la optimización de luces y gráficos para aplicar el shader.",
        ex_player_section = "Configuración de jugador",
        ex_speed_input = "Valor de velocidad",
        ex_speed_toggle = "Cambiar velocidad",
        ex_speed_desc = "Aplica el WalkSpeed que escribiste",
        ex_jump_input = "Valor de salto",
        ex_jump_toggle = "Cambiar salto",
        ex_jump_desc = "Aplica el JumpPower que escribiste",
        ex_gravity_input = "Valor de gravedad",
        ex_gravity_toggle = "Cambiar gravedad",
        ex_gravity_desc = "Aplica la gravedad que escribiste (normal: 196.2)",
        ex_external_section = "Scripts externos",
        ex_external_fail = "No se pudo cargar el script.",
        ex_server_section = "Sistema de servidores",
        ex_server_autoreconnect = "Auto reconectar",
        ex_server_autoreconnect_desc = "Reentra al mismo servidor cuando aparece un mensaje de error",
        ex_server_autoreconnect_auto = "Auto reconectar (Automático)",
        ex_server_autoreconnect_auto_desc = "Reentra cuando te sacan o te desconectas",
        ex_server_hop_low = "Server Hop Low",
        ex_server_hop_low_desc = "Entra al servidor público con menos jugadores",
        ex_server_hop_full = "Server Hop Full",
        ex_server_hop_full_desc = "Entra al servidor público más lleno que todavía tenga espacio",
        ex_server_rejoin = "Reconectar al mismo servidor",
        ex_server_joining = "Entrando a un servidor con %d jugadores...",
        ex_server_none = "No se encontraron servidores disponibles.",

        set_appearance = "Apariencia",
        set_theme = "Tema",
        set_theme_desc = "Cambia los colores de la interfaz",
        set_transparency = "Transparencia",
        set_transparency_d = "Hace la ventana transparente",
        set_configuration = "Configuración",
        set_autosave = "Autoguardado",
        set_autosave_desc = "Guarda la config actual cada 5 segundos",
        set_select_config = "Seleccionar config",
        set_new_config = "Nombre de la nueva config",
        set_new_config_ph = "Mi config",
        set_create_config = "Crear config",
        set_create_desc = "Crea y guarda una nueva config con el nombre escrito",
        set_save_config = "Guardar config",
        set_load_config = "Cargar config",
        set_delete_config = "Eliminar config",
        set_config_title = "Config",
        set_type_name = "Escribe un nombre válido primero.",
        set_created = "Creada: %s",
        set_saved = "Guardada: %s",
        set_loaded = "Cargada: %s",
        set_deleted = "Eliminada: %s",
        set_cant_save = "No se pudo guardar.",
        set_cant_load = "No se pudo cargar.",
        set_hub_section = "Hub",
        set_notifications = "Notificaciones",
        set_notifications_desc = "Muestra u oculta las notificaciones emergentes del hub",
        set_menukey = "Tecla del menú",
        set_menukey_ph = "Q",
        set_menukey_set = "Tecla del menú cambiada a %s.",
        set_menukey_invalid = "Nombre de tecla inválido.",
        set_fpscap = "Límite de FPS",
        set_fpscap_desc = "Limita tus FPS (de 1 a 999)",
        set_fpscap_unsup = "Tu executor no soporta setfpscap.",
        set_autoload = "Cargar config al iniciar",
        set_autoload_desc = "Carga la config seleccionada automáticamente al iniciar el hub",
        set_requeue = "Auto ejecutar al cambiar de servidor",
        set_requeue_desc = "Vuelve a ejecutar el hub después de un server hop o rejoin",
        set_requeue_unsup = "Tu executor no soporta queue_on_teleport.",
        set_requeue_nourl = "Primero define Config.LoaderUrl.",
        set_panic = "Apagar todos los toggles",
        set_panic_desc = "Apaga todas las funciones activas de un solo golpe",
        set_panic_done = "Todos los toggles apagados.",
        set_unload = "Descargar hub",
        set_unload_desc = "Apaga todos los loops, restaura los cambios y cierra la ventana",
    },
}

local function detectLanguage()
    local codes = {}

    pcall(function()
        table.insert(codes, LocalizationService.RobloxLocaleId)
    end)
    pcall(function()
        table.insert(codes, LocalPlayer.LocaleId)
    end)

    for _, code in ipairs(codes) do
        local prefix = string.lower(tostring(code)):sub(1, 2)
        if prefix == "es" then
            return "es"
        elseif prefix == "en" then
            return "en"
        end
    end

    return "en"
end

local Language = detectLanguage()

local function L(key, ...)
    local text = (Strings[Language] and Strings[Language][key])
        or Strings.en[key]
        or key
    if select("#", ...) > 0 then
        return string.format(text, ...)
    end
    return text
end

local Util = {}
local Registry = {}
local Sections = {}
local Tabs = {}
local WindUI

function Util.register(flag, element)
    Registry[flag] = element
end

Util.notificationsEnabled = true

function Util.notify(title, content, icon)
    if not Util.notificationsEnabled then
        return
    end
    pcall(function()
        WindUI:Notify({
            Title = title,
            Content = content,
            Duration = 3,
            Icon = icon or "check",
        })
    end)
end

function Util.makeSetter(paragraph)
    local last
    return function(text)
        if text == last then return end
        last = text
        pcall(paragraph.SetDesc, paragraph, text)
    end
end

function Util.copyText(text)
    local fn = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
    if fn then
        return (pcall(fn, text))
    end
    return false
end

function Util.copyWithNotice(label, text)
    if Util.copyText(text) then
        Util.notify(L("copied"), L("copied_msg", label), "copy")
    else
        Util.notify(L("error"), L("no_clipboard"), "triangle-alert")
    end
end

function Util.formatTime(total)
    total = math.floor(total)
    return string.format(
        "%02d:%02d:%02d",
        math.floor(total / 3600),
        math.floor(total % 3600 / 60),
        total % 60
    )
end

function Util.yesNo(value)
    return value and L("yes") or L("no")
end

function Util.getExecutor(fallback)
    fallback = fallback or L("unknown")
    local ok, name, version = pcall(function()
        if identifyexecutor then
            return identifyexecutor()
        end
        if getexecutorname then
            return getexecutorname()
        end
        return nil
    end)
    if ok and name then
        return tostring(name), version and tostring(version) or fallback
    end
    return fallback, fallback
end

function Util.getGameName(fallback)
    if Util._gameName then return Util._gameName end
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if ok and type(info) == "table" and info.Name then
        Util._gameName = tostring(info.Name)
        return Util._gameName
    end
    return fallback or L("unknown")
end

function Util.getPing()
    local ok, value = pcall(function()
        return StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if ok and type(value) == "number" then
        return math.floor(value)
    end
    return 0
end

function Util.sanitizeName(name)
    local clean = tostring(name or ""):gsub("[^%w_%- ]", "")
    clean = clean:gsub("^%s+", ""):gsub("%s+$", "")
    return clean:sub(1, 32)
end

local Logger = {}

Logger.Colors = {
    Default = 0x3B0764,
    Blacklisted = 0xDC2626,
    Whitelisted = 0x22C55E,
}

function Logger.getRequest()
    return (syn and syn.request) or http_request or request
end

function Logger.getHwid()
    local ok, value = pcall(function()
        if gethwid then
            return gethwid()
        end
        if get_hwid then
            return get_hwid()
        end
        return nil
    end)
    if ok and value and tostring(value) ~= "" then
        return tostring(value)
    end

    local okClient, clientId = pcall(function()
        return RbxAnalyticsService:GetClientId()
    end)
    if okClient and clientId and tostring(clientId) ~= "" then
        return tostring(clientId)
    end

    return "Unknown"
end

function Logger.getPlatform()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return "Mobile"
    end
    if UserInputService.GamepadEnabled then
        return "Console"
    end
    return "PC"
end

function Logger.formatAge(days)
    local years = math.floor(days / 365)
    local remaining = days - years * 365
    if years > 0 then
        return years .. "y " .. remaining .. "d"
    end
    return days .. "d"
end

function Logger.getExecutions()
    local request = Logger.getRequest()
    if not request then
        return 0
    end

    local ok, response = pcall(function()
        return request({
            Url = Config.CounterUrl,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = "{}",
        })
    end)
    if not ok or type(response) ~= "table" then
        return 0
    end

    local body = response.Body or response.body
    if not body then
        return 0
    end

    local decodeOk, data = pcall(function()
        return HttpService:JSONDecode(body)
    end)
    if not decodeOk or type(data) ~= "table" then
        return 0
    end

    return tonumber(data.executions) or 0
end

function Logger.getAvatar(userId)
    local avatar = "https://www.roblox.com/headshot-thumbnail/image?userId="
        .. userId
        .. "&width=420&height=420&format=png"

    pcall(function()
        local data = HttpService:JSONDecode(game:HttpGet(
            "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
            .. userId
            .. "&size=420x420&format=Png"
        ))
        if data and data.data and data.data[1]
            and data.data[1].imageUrl and data.data[1].imageUrl ~= "" then
            avatar = data.data[1].imageUrl
        end
    end)

    return avatar
end

function Logger.send(title, status, color, reason)
    local executor, executorVersion = Util.getExecutor("Unknown")
    local userId = tostring(LocalPlayer.UserId)
    local jobId = tostring(game.JobId)
    local placeId = tostring(game.PlaceId)
    local membership = LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Premium" or "No Premium"
    local profileUrl = "https://www.roblox.com/users/" .. userId .. "/profile"
    local gameUrl = "https://www.roblox.com/games/" .. placeId

    local lines = {
        "**Player Info**",
        "Username: [`" .. LocalPlayer.Name .. "`](" .. profileUrl .. ")",
        "User ID: `" .. userId .. "`",
        "Display Name: " .. LocalPlayer.DisplayName,
        "Account Age: " .. Logger.formatAge(LocalPlayer.AccountAge),
        "Membership: " .. membership,
        "Platform: " .. Logger.getPlatform(),
        "HWID: `" .. Logger.getHwid() .. "`",
        "",
        "**Executor**",
        "Name: " .. executor,
        "Version: " .. executorVersion,
        "",
        "**Game Info**",
        "Game: [" .. Util.getGameName("Unknown") .. "](" .. gameUrl .. ")",
        "Game ID: " .. tostring(game.GameId),
        "Place ID: " .. placeId,
        "Server ID: " .. (jobId ~= "" and jobId or "Studio"),
        "Players: " .. #Players:GetPlayers() .. " / " .. Players.MaxPlayers,
        "",
        "**Access**",
        "Status: " .. tostring(status),
    }
    if reason then
        table.insert(lines, "Reason: " .. tostring(reason))
    end

    local payload = {
        username = Config.HubName,
        embeds = {
            {
                title = title,
                description = table.concat(lines, "\n"),
                color = color or Logger.Colors.Default,
                image = {
                    url = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Registros%20Imagen.png"
                },
                thumbnail = { url = Logger.getAvatar(userId) },
                footer = {
                    text = "Mystery Hub Logger • Total Executions: " .. Logger.getExecutions()
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            },
        },
    }

    local encodeOk, body = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not encodeOk then
        return false
    end

    local request = Logger.getRequest()
    if request then
        local ok, response = pcall(function()
            return request({
                Url = Config.WebhookUrl,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = body,
            })
        end)
        if not ok then
            return false
        end
        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    return (pcall(function()
        HttpService:PostAsync(Config.WebhookUrl, body, Enum.HttpContentType.ApplicationJson)
    end))
end

local function fetchUsers(url)
    local ok, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    if ok and type(result) == "table" and type(result.users) == "table" then
        return result.users
    end
    return {}
end

local function findUser(list, userId)
    for _, entry in ipairs(list) do
        if type(entry) == "table" and tonumber(entry.UserId) == userId then
            return entry
        end
    end
    return nil
end

local function isAllowedGame()
    if game.GameId ~= Config.AllowedGameId then
        return false
    end
    for _, placeId in ipairs(Config.AllowedPlaceIds) do
        if placeId == game.PlaceId then
            return true
        end
    end
    return false
end

local blacklistUsers, whitelistUsers
local pending = 2
task.spawn(function()
    blacklistUsers = fetchUsers(Config.BlacklistUrl)
    pending = pending - 1
end)
task.spawn(function()
    whitelistUsers = fetchUsers(Config.WhitelistUrl)
    pending = pending - 1
end)

local waitStart = os.clock()
while pending > 0 and os.clock() - waitStart < 10 do
    task.wait()
end

blacklistUsers = blacklistUsers or {}
whitelistUsers = whitelistUsers or {}

local blacklistEntry = findUser(blacklistUsers, LocalPlayer.UserId)
local isWhitelisted = findUser(whitelistUsers, LocalPlayer.UserId) ~= nil

local accessStatus, accessColor, accessTitle
if blacklistEntry then
    accessStatus = "Blacklisted"
    accessColor = Logger.Colors.Blacklisted
    accessTitle = "Blacklisted User Attempt"
elseif isWhitelisted then
    accessStatus = "Whitelisted"
    accessColor = Logger.Colors.Whitelisted
    accessTitle = "Whitelisted User Executed"
else
    accessStatus = "Executed"
    accessColor = Logger.Colors.Default
    accessTitle = "Mystery Hub Executed"
end

if not isAllowedGame() then
    Logger.send(
        "Unsupported Game Attempt",
        accessStatus,
        accessColor,
        "Unsupported game (Place ID " .. tostring(game.PlaceId) .. ")"
    )
    LocalPlayer:Kick(L("game_not_supported"))
    return
end

if blacklistEntry then
    local reason = tostring(blacklistEntry.Reason or L("blacklisted"))
    Logger.send(accessTitle, accessStatus, accessColor, reason)
    LocalPlayer:Kick(reason)
    return
end

task.spawn(Logger.send, accessTitle, accessStatus, accessColor)

local env = (getgenv and getgenv()) or _G
local runId = tostring(os.clock()) .. tostring(math.random(1000, 9999))

if env.MysteryHubWindow then
    pcall(function()
        env.MysteryHubWindow:Destroy()
    end)
end
env.MysteryHubRun = runId

local function isAlive()
    return env.MysteryHubRun == runId
end

do
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local function antiAfkPulse()
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(0, 0))
        end)
        pcall(function()
            VirtualInputManager:SendMouseMoveEvent(5, 5, game)
            VirtualInputManager:SendMouseButtonEvent(5, 5, 1, true, game, 0)
            VirtualInputManager:SendMouseButtonEvent(5, 5, 1, false, game, 0)
        end)
    end

    pcall(function()
        if getconnections then
            for _, c in ipairs(getconnections(LocalPlayer.Idled)) do
                pcall(function() c:Disable() end)
            end
        end
    end)

    local idleConnection
    idleConnection = LocalPlayer.Idled:Connect(function()
        if not isAlive() then
            idleConnection:Disconnect()
            return
        end
        antiAfkPulse()
    end)

    task.spawn(function()
        while isAlive() do
            task.wait(60)
            antiAfkPulse()
        end
    end)
end

local loaded, windUiResult = pcall(function()
    return loadstring(game:HttpGet(Config.WindUiUrl))()
end)
if not loaded or type(windUiResult) ~= "table" then
    return
end
WindUI = windUiResult

local themeName = "Sherya"
local themeOk = pcall(function()
    WindUI:AddTheme({
        Name = "Sherya",

        Accent = WindUI:Gradient({
            ["0"] = { Color = Color3.fromHex("#2e1065"), Transparency = 0 },
            ["100"] = { Color = Color3.fromHex("#1e0a3c"), Transparency = 0 },
        }, {
            Rotation = 45,
        }),
        Background = Color3.fromHex("#0d0816"),
        BackgroundTransparency = 0,
        Outline = Color3.fromHex("#7c3aed"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#8b7aa8"),
        Button = Color3.fromHex("#4c1d95"),
        Icon = Color3.fromHex("#a78bfa"),
        Hover = Color3.fromHex("#6d28d9"),

        WindowBackground = Color3.fromHex("#0d0816"),
        WindowShadow = Color3.fromHex("#000000"),

        WindowTopbarButtonIcon = Color3.fromHex("#a78bfa"),
        WindowTopbarTitle = Color3.fromHex("#FFFFFF"),
        WindowTopbarAuthor = Color3.fromHex("#c4b5fd"),
        WindowTopbarIcon = Color3.fromHex("#FFFFFF"),

        TabBackground = Color3.fromHex("#7c3aed"),
        TabTitle = Color3.fromHex("#FFFFFF"),
        TabIcon = Color3.fromHex("#a78bfa"),

        ElementBackground = Color3.fromHex("#a78bfa"),
        ElementTitle = Color3.fromHex("#FFFFFF"),
        ElementDesc = Color3.fromHex("#c4b5fd"),
        ElementIcon = Color3.fromHex("#a78bfa"),

        PopupBackground = Color3.fromHex("#0d0816"),
        PopupBackgroundTransparency = 0,
        PopupTitle = Color3.fromHex("#FFFFFF"),
        PopupContent = Color3.fromHex("#FFFFFF"),
        PopupIcon = Color3.fromHex("#a78bfa"),

        DialogBackground = Color3.fromHex("#0d0816"),
        DialogBackgroundTransparency = 0,
        DialogTitle = Color3.fromHex("#FFFFFF"),
        DialogContent = Color3.fromHex("#FFFFFF"),
        DialogIcon = Color3.fromHex("#a78bfa"),

        Toggle = Color3.fromHex("#4c1d95"),
        ToggleBar = Color3.fromHex("#FFFFFF"),

        Checkbox = Color3.fromHex("#4c1d95"),
        CheckboxIcon = Color3.fromHex("#FFFFFF"),

        Slider = Color3.fromHex("#4c1d95"),
        SliderThumb = Color3.fromHex("#FFFFFF"),
    })
    WindUI:SetTheme("Sherya")
end)
if not themeOk then
    themeName = "Dark"
end

local windowConfig = {
    Title = Config.HubName,
    Icon = "layout-dashboard",
    Author = "Build A Boat For Treasure Version",
    Folder = "MySuperHub",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    ToggleKey = Enum.KeyCode.Q,
    Transparent = true,
    Theme = themeName,
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
    },
}

if not isWhitelisted then
    windowConfig.KeySystem = {
        Key = { Config.Key },
        Note = L("key_note"),
        SaveKey = false,
    }
end

local Window = WindUI:CreateWindow(windowConfig)
env.MysteryHubWindow = Window

pcall(function()
    Window:EditOpenButton({
        Title = L("open_hub", Config.HubName),
        Icon = "layout-dashboard",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(
            Color3.fromHex("#4c1d95"),
            Color3.fromHex("#7c3aed")
        ),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    })
end)

local layout = {
    {
        Title = L("sec_dashboard"),
        Tabs = {
            { Key = "Home", Title = L("tab_home"), Icon = "house" },
        },
    },
    {
        Title = L("sec_farming"),
        Tabs = {
            { Key = "Farm", Title = L("tab_farm"), Icon = "pickaxe" },
            { Key = "Data", Title = L("tab_data"), Icon = "calculator" },
        },
    },
    {
        Title = L("sec_building"),
        Tabs = {
            { Key = "Builder", Title = L("tab_builder"), Icon = "hammer" },
        },
    },
    {
        Title = L("sec_misc"),
        Tabs = {
            { Key = "Shop", Title = L("tab_shop"), Icon = "store" },
            { Key = "Quest", Title = L("tab_quest"), Icon = "scroll" },
            { Key = "Troll", Title = L("tab_troll"), Icon = "skull" },
        },
    },
    {
        Title = L("sec_server"),
        Tabs = {
            { Key = "Players", Title = L("tab_players"), Icon = "users" },
            { Key = "Extras", Title = L("tab_extras"), Icon = "folders" },
            { Key = "Teleport", Title = L("tab_teleport"), Icon = "map-pin" },
        },
    },
    {
        Title = L("sec_library"),
        Tabs = {
            { Key = "Settings", Title = L("tab_settings"), Icon = "settings" },
        },
    },
}

for _, sectionData in ipairs(layout) do
    local section = Window:Section({
        Title = sectionData.Title,
        Opened = true,
    })
    Sections[sectionData.Title] = section

    for _, tabData in ipairs(sectionData.Tabs) do
        Tabs[tabData.Key] = section:Tab({
            Title = tabData.Title,
            Icon = tabData.Icon,
            Locked = false,
        })
    end
end

local pacedCount = 0
function Util.pace(tab)
    for _, name in ipairs({ "Section", "Paragraph", "Button", "Toggle", "Dropdown", "Input", "Divider" }) do
        local original = tab[name]
        if original then
            pcall(function()
                tab[name] = function(self, ...)
                    local result = original(self, ...)
                    pacedCount = pacedCount + 1
                    if pacedCount % 4 == 0 then
                        task.wait()
                        if not isAlive() then
                            error("hub reloaded", 0)
                        end
                    end
                    return result
                end
            end)
        end
    end
end

for _, tab in pairs(Tabs) do
    Util.pace(tab)
end

do
    local Home = Tabs.Home

    local fps, frames, lastCheck = 0, 0, os.clock()
    local fpsConnection = RunService.RenderStepped:Connect(function()
        frames = frames + 1
        local now = os.clock()
        if now - lastCheck >= 1 then
            fps = math.floor(frames / (now - lastCheck) + 0.5)
            frames = 0
            lastCheck = now
        end
    end)

    local createdAt = os.date("%Y-%m-%d", os.time() - LocalPlayer.AccountAge * 86400)

    Home:Section({ Title = L("home_player") })

    Home:Paragraph({
        Title = L("home_player_info"),
        Desc = table.concat({
            L("home_display_name") .. ": " .. LocalPlayer.DisplayName,
            L("home_username") .. ": " .. LocalPlayer.Name,
            L("home_user_id") .. ": " .. LocalPlayer.UserId,
            L("home_account_age") .. ": " .. LocalPlayer.AccountAge .. " " .. L("home_days"),
            L("home_created") .. ": " .. createdAt,
            L("home_membership") .. ": " .. LocalPlayer.MembershipType.Name,
        }, "\n"),
    })

    Home:Button({
        Title = L("home_copy_user_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_user_id"), tostring(LocalPlayer.UserId))
        end,
    })

    Home:Section({ Title = L("home_game") })

    Home:Paragraph({
        Title = L("home_game_info"),
        Desc = table.concat({
            L("home_name") .. ": " .. Util.getGameName(),
            L("home_place_id") .. ": " .. game.PlaceId,
            L("home_game_id") .. ": " .. game.GameId,
            L("home_job_id") .. ": " .. game.JobId,
            L("home_max_players") .. ": " .. Players.MaxPlayers,
        }, "\n"),
    })

    local ServerParagraph = Home:Paragraph({
        Title = L("home_live_stats"),
        Desc = L("home_loading"),
    })

    Home:Button({
        Title = L("home_copy_place_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_place_id"), tostring(game.PlaceId))
        end,
    })

    Home:Button({
        Title = L("home_copy_job_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_job_id"), tostring(game.JobId))
        end,
    })

    Home:Button({
        Title = L("home_rejoin"),
        Icon = "refresh-cw",
        Callback = function()
            local ok = pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
            end)
            if not ok then
                pcall(function()
                    TeleportService:Teleport(game.PlaceId, LocalPlayer)
                end)
            end
        end,
    })

    Home:Section({ Title = L("home_executor") })

    local executorName, executorVersion = Util.getExecutor()

    local capabilities = {
        { L("home_cap_clipboard"), (setclipboard or toclipboard) ~= nil },
        { L("home_cap_http"), (request or http_request or (syn and syn.request)) ~= nil },
        { L("home_cap_files"), (writefile and readfile) ~= nil },
        { L("home_cap_hooks"), hookfunction ~= nil },
        { L("home_cap_drawing"), Drawing ~= nil },
        { L("home_cap_queue"), (queue_on_teleport or (syn and syn.queue_on_teleport)) ~= nil },
    }

    local executorLines = {
        L("home_name") .. ": " .. executorName,
        L("home_version") .. ": " .. executorVersion,
    }
    for _, item in ipairs(capabilities) do
        table.insert(executorLines, item[1] .. ": " .. Util.yesNo(item[2]))
    end

    Home:Paragraph({
        Title = L("home_executor_info"),
        Desc = table.concat(executorLines, "\n"),
    })

    Home:Section({ Title = L("home_community") })

    Home:Button({
        Title = L("home_copy_discord"),
        Desc = L("home_discord_desc"),
        Icon = "message-circle",
        Callback = function()
            Util.copyWithNotice(L("home_discord_label"), Config.DiscordLink)
        end,
    })

    task.spawn(function()
        while task.wait(1) and isAlive() do
            pcall(function()
                ServerParagraph:SetDesc(table.concat({
                    L("home_players") .. ": " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers,
                    L("home_fps") .. ": " .. fps,
                    L("home_ping") .. ": " .. Util.getPing() .. " ms",
                    L("home_server_time") .. ": " .. Util.formatTime(workspace.DistributedGameTime),
                    L("home_memory") .. ": " .. math.floor(StatsService:GetTotalMemoryUsageMb()) .. " MB",
                }, "\n"))
            end)
        end
        fpsConnection:Disconnect()
    end)
end

pcall(function() Tabs.Home:Select() end)

do
    local Farm = Tabs.Farm

    local CaveFarm = {
        enabled = false,
        speed = 400,
        token = 0,
        noclipConn = nil,
    }

    local function getRoot()
        local character = LocalPlayer.Character
        return character and character:FindFirstChild("HumanoidRootPart"), character
    end

    local function getDarknessPart(index)
        local boatStages = workspace:FindFirstChild("BoatStages")
        local normal = boatStages and boatStages:FindFirstChild("NormalStages")
        local stage = normal and normal:FindFirstChild("CaveStage" .. index)
        if not stage then
            return nil
        end
        local part = stage:FindFirstChild("DarknessPart", true)
        if part and part:IsA("BasePart") then
            return part
        end
        return nil
    end

    local function startNoclip()
        if CaveFarm.noclipConn then
            return
        end
        CaveFarm.noclipConn = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if not character then
                return
            end
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end

    local function stopFarm()
        CaveFarm.enabled = false
        CaveFarm.token = CaveFarm.token + 1

        if CaveFarm.noclipConn then
            CaveFarm.noclipConn:Disconnect()
            CaveFarm.noclipConn = nil
        end

        local root, character = getRoot()
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
            pcall(function()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            end)
        end
        if root then
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end
    end

    local CaveToggle

    local function startFarm()
        CaveFarm.token = CaveFarm.token + 1
        local token = CaveFarm.token
        CaveFarm.enabled = true
        startNoclip()

        local function active()
            return CaveFarm.enabled and CaveFarm.token == token and isAlive()
        end

        local function waitForRespawn(oldCharacter)
            while active() do
                task.wait(0.2)
                local root, character = getRoot()
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if character and character ~= oldCharacter and root and humanoid and humanoid.Health > 0 then
                    break
                end
            end
            if active() then
                task.wait(1.5)
            end
        end

        task.spawn(function()
            while active() do
                local visited = 0

                for index = 1, 10 do
                    local target = getDarknessPart(index)

                    if target then
                        visited = visited + 1

                        while active() and target.Parent do
                            local dt = RunService.Heartbeat:Wait()
                            local root, character = getRoot()
                            local humanoid = character and character:FindFirstChildOfClass("Humanoid")

                            if root and humanoid and humanoid.Health > 0 then
                                humanoid.PlatformStand = true

                                local diff = target.Position - root.Position
                                local distance = diff.Magnitude
                                local step = CaveFarm.speed * dt

                                root.AssemblyLinearVelocity = Vector3.zero
                                root.AssemblyAngularVelocity = Vector3.zero

                                if distance <= step then
                                    root.CFrame = CFrame.new(target.Position) * root.CFrame.Rotation
                                    break
                                end

                                root.CFrame = CFrame.new(root.Position + diff.Unit * step) * root.CFrame.Rotation
                            end
                        end

                        if not active() then
                            return
                        end
                    end
                end

                if not active() then
                    return
                end

                if visited == 0 then
                    Util.notify(L("farm_section"), L("farm_missing"), "triangle-alert")
                    stopFarm()
                    pcall(function()
                        CaveToggle:Set(false)
                    end)
                    return
                end

                local _, character = getRoot()
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                    humanoid.Health = 0
                elseif character then
                    pcall(function()
                        character:BreakJoints()
                    end)
                end

                waitForRespawn(character)
            end
        end)
    end

    Farm:Section({ Title = L("farm_section") })

    Farm:Input({
        Title = L("farm_speed_input"),
        Placeholder = L("farm_speed_ph"),
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n then
                CaveFarm.speed = math.clamp(n, 10, 1000)
            end
        end,
    })

    CaveToggle = Farm:Toggle({
        Title = L("farm_cave"),
        Desc = L("farm_cave_desc"),
        Value = false,
        Callback = function(state)
            if state then
                startFarm()
            else
                stopFarm()
            end
        end,
    })
    Util.register("farm_cave_stages", CaveToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        pcall(stopFarm)
    end)
end

do
    local Data = Tabs.Data
end

do
    local Builder = Tabs.Builder
end

do
    local Shop = Tabs.Shop
end

do
    local Quest = Tabs.Quest
end

do
    local Troll = Tabs.Troll
end

do
    local PlayersTab = Tabs.Players
end

do
    local Extras = Tabs.Extras
    local Lighting = game:GetService("Lighting")

    Extras:Section({ Title = L("ex_farm_section") })

    local lockEnabled = false
    local lockHeartbeat = nil
    local lockCharConn = nil
    local lockSaved = nil

    local function stopLockHeartbeat()
        if lockHeartbeat then
            lockHeartbeat:Disconnect()
            lockHeartbeat = nil
        end
    end

    local function releaseLock(character)
        stopLockHeartbeat()

        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and lockSaved then
            humanoid.WalkSpeed = lockSaved.walkSpeed
            humanoid.JumpPower = lockSaved.jumpPower
            humanoid.AutoRotate = lockSaved.autoRotate
            pcall(function()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end)
        end
        lockSaved = nil
    end

    local function applyLock(character)
        stopLockHeartbeat()

        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then
            return
        end

        if not lockSaved then
            lockSaved = {
                walkSpeed = humanoid.WalkSpeed,
                jumpPower = humanoid.JumpPower,
                autoRotate = humanoid.AutoRotate,
            }
        end

        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.AutoRotate = false
        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end)

        local savedCFrame = root.CFrame

        lockHeartbeat = RunService.Heartbeat:Connect(function()
            if not lockEnabled then
                return
            end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                hrp.CFrame = savedCFrame
            end
        end)
    end

    local LockToggle = Extras:Toggle({
        Title = L("ex_lockpos"),
        Desc = L("ex_lockpos_desc"),
        Value = false,
        Callback = function(state)
            lockEnabled = state

            if lockCharConn then
                lockCharConn:Disconnect()
                lockCharConn = nil
            end

            if state then
                applyLock(LocalPlayer.Character)

                lockCharConn = LocalPlayer.CharacterAdded:Connect(function(character)
                    if lockEnabled then
                        task.wait(1)
                        applyLock(character)
                    end
                end)
            else
                releaseLock(LocalPlayer.Character)
            end
        end,
    })
    Util.register("ex_lock_position", LockToggle)

    local DISABLE = { Enabled = false }

    local RULES = {
        ParticleEmitter = {
            cat = "particles",
            set = { Enabled = false, Rate = 0, Lifetime = NumberRange.new(0) },
            clear = true,
        },
        Trail = { cat = "particles", set = DISABLE },
        Beam = { cat = "particles", set = DISABLE },
        Fire = { cat = "particles", set = DISABLE },
        Smoke = { cat = "particles", set = DISABLE },
        Sparkles = { cat = "particles", set = DISABLE },
        Explosion = { cat = "particles", set = { Visible = false } },

        PointLight = { cat = "effects", set = DISABLE },
        SpotLight = { cat = "effects", set = DISABLE },
        SurfaceLight = { cat = "effects", set = DISABLE },
        Highlight = { cat = "effects", set = DISABLE },
        BloomEffect = { cat = "effects", set = DISABLE },
        BlurEffect = { cat = "effects", set = DISABLE },
        SunRaysEffect = { cat = "effects", set = DISABLE },
        ColorCorrectionEffect = { cat = "effects", set = DISABLE },
        DepthOfFieldEffect = { cat = "effects", set = DISABLE },

        Decal = { cat = "graphics", set = { Transparency = 1 } },
        Texture = { cat = "graphics", set = { Transparency = 1 } },
    }

    local PART_SET = {
        CastShadow = false,
        Material = Enum.Material.Plastic,
    }

    local Opt = {
        active = { particles = false, effects = false, graphics = false },
        originals = {
            particles = setmetatable({}, { __mode = "k" }),
            effects = setmetatable({}, { __mode = "k" }),
            graphics = setmetatable({}, { __mode = "k" }),
        },
        connections = {},
        globals = nil,
    }

    local function applySet(category, object, set)
        local store = Opt.originals[category]
        local saved = store[object]
        if not saved then
            saved = {}
            store[object] = saved
        end

        for property, value in pairs(set) do
            if saved[property] == nil then
                saved[property] = object[property]
            end
            object[property] = value
        end
    end

    local function handle(object)
        local rule = RULES[object.ClassName]

        if rule then
            if Opt.active[rule.cat] then
                pcall(applySet, rule.cat, object, rule.set)
                if rule.clear then
                    pcall(object.Clear, object)
                end
            end
        elseif Opt.active.graphics and object:IsA("BasePart") and not object:IsA("Terrain") then
            pcall(applySet, "graphics", object, PART_SET)
        end
    end

    local function onAdded(object)
        local rule = RULES[object.ClassName]

        if rule then
            if Opt.active[rule.cat] then
                task.defer(handle, object)
            end
        elseif Opt.active.graphics and object:IsA("BasePart") then
            task.defer(handle, object)
        end
    end

    local function scan(root)
        local count = 0

        for _, object in ipairs(root:GetDescendants()) do
            if not isAlive() then
                return
            end

            handle(object)

            count = count + 1
            if count % 300 == 0 then
                task.wait()
            end
        end
    end

    local function ensureWatching()
        if Opt.connections.workspace then
            return
        end
        Opt.connections.workspace = workspace.DescendantAdded:Connect(onAdded)
        Opt.connections.lighting = Lighting.DescendantAdded:Connect(onAdded)
    end

    local function stopWatchingIfIdle()
        local active = Opt.active
        if active.particles or active.effects or active.graphics then
            return
        end

        for key, connection in pairs(Opt.connections) do
            connection:Disconnect()
            Opt.connections[key] = nil
        end
    end

    local function restoreCategory(category)
        local store = Opt.originals[category]

        for object, saved in pairs(store) do
            if object.Parent then
                for property, value in pairs(saved) do
                    pcall(function()
                        object[property] = value
                    end)
                end
            end
            store[object] = nil
        end
    end

    local function setGraphicsGlobals(enabled)
        local terrain = workspace:FindFirstChildOfClass("Terrain")

        if enabled then
            if Opt.globals then
                return
            end

            local saved = {}
            Opt.globals = saved

            pcall(function()
                saved.quality = settings().Rendering.QualityLevel
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)

            pcall(function()
                saved.shadows = Lighting.GlobalShadows
                saved.fog = Lighting.FogEnd
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 1000000
            end)

            if terrain then
                pcall(function()
                    saved.decoration = terrain.Decoration
                    terrain.Decoration = false
                end)
            end
        else
            local saved = Opt.globals
            if not saved then
                return
            end
            Opt.globals = nil

            pcall(function()
                if saved.quality ~= nil then
                    settings().Rendering.QualityLevel = saved.quality
                end
            end)

            pcall(function()
                if saved.shadows ~= nil then
                    Lighting.GlobalShadows = saved.shadows
                end
                if saved.fog ~= nil then
                    Lighting.FogEnd = saved.fog
                end
            end)

            if terrain and saved.decoration ~= nil then
                pcall(function()
                    terrain.Decoration = saved.decoration
                end)
            end
        end
    end

    local function setCategory(category, enabled)
        Opt.active[category] = enabled

        if enabled then
            ensureWatching()

            if category == "graphics" then
                setGraphicsGlobals(true)
            end

            task.spawn(function()
                scan(workspace)
                scan(Lighting)
            end)
        else
            restoreCategory(category)

            if category == "graphics" then
                setGraphicsGlobals(false)
            end

            stopWatchingIfIdle()
        end
    end

    Extras:Section({ Title = L("ex_opt_section") })

    Extras:Paragraph({
        Title = L("ex_opt_section"),
        Desc = L("ex_opt_note"),
    })

    local ParticlesToggle = Extras:Toggle({
        Title = L("ex_opt_particles"),
        Desc = L("ex_opt_particles_desc"),
        Value = false,
        Callback = function(state)
            setCategory("particles", state)
        end,
    })
    Util.register("opt_particles", ParticlesToggle)

    local EffectsToggle = Extras:Toggle({
        Title = L("ex_opt_effects"),
        Desc = L("ex_opt_effects_desc"),
        Value = false,
        Callback = function(state)
            setCategory("effects", state)
        end,
    })
    Util.register("opt_effects", EffectsToggle)

    local GraphicsToggle = Extras:Toggle({
        Title = L("ex_opt_graphics"),
        Desc = L("ex_opt_graphics_desc"),
        Value = false,
        Callback = function(state)
            setCategory("graphics", state)
        end,
    })
    Util.register("opt_graphics", GraphicsToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end

        lockEnabled = false

        if lockCharConn then
            lockCharConn:Disconnect()
            lockCharConn = nil
        end

        pcall(function()
            releaseLock(LocalPlayer.Character)
        end)

        for _, category in ipairs({ "particles", "effects", "graphics" }) do
            pcall(setCategory, category, false)
        end
    end)

    Extras:Section({ Title = L("ex_move_section") })

    local infiniteJump = false

    local InfJumpToggle = Extras:Toggle({
        Title = L("ex_infjump"),
        Desc = L("ex_infjump_desc"),
        Value = false,
        Callback = function(state)
            infiniteJump = state
        end,
    })
    Util.register("ex_inf_jump", InfJumpToggle)

    local jumpConn = UserInputService.JumpRequest:Connect(function()
        if not infiniteJump or not isAlive() then
            return
        end
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    local TimeDropdown = Extras:Dropdown({
        Title = L("ex_time"),
        Values = { L("ex_time_day"), L("ex_time_night") },
        Value = nil,
        AllowNone = true,
        Callback = function(option)
            if option == L("ex_time_night") then
                Lighting.ClockTime = 0
            elseif option == L("ex_time_day") then
                Lighting.ClockTime = 9
            end
        end,
    })
    Util.register("ex_time", TimeDropdown)

    Extras:Section({ Title = L("ex_shader_section") })

    local function rgb(r, g, b)
        return Color3.fromRGB(r, g, b)
    end

    local SHADER_PRESETS = {
        { Name = "Clean Day", Time = 14, Exposure = .08, Saturation = .08, Contrast = .06, Tint = rgb(255,255,255), Density = .08, Haze = .3 },
        { Name = "Soft Realism", Time = 14.5, Exposure = .04, Saturation = -.04, Contrast = .10, Tint = rgb(255,249,239), Density = .14, Haze = .7 },
        { Name = "Vibrant", Time = 13, Exposure = .12, Saturation = .35, Contrast = .13, Tint = rgb(255,253,247), Density = .10, Haze = .2, Bloom = .32 },
        { Name = "Golden Hour", Time = 17.3, Exposure = .12, Saturation = .15, Contrast = .14, Tint = rgb(255,225,181), Density = .22, Haze = 1.2, Air = rgb(255,210,155), Rays = .12 },
        { Name = "Warm Sunset", Time = 17.9, Exposure = .05, Saturation = .22, Contrast = .17, Tint = rgb(255,205,177), Density = .28, Haze = 1.5, Air = rgb(255,183,151), Bloom = .45 },
        { Name = "Tropical", Time = 13.5, Exposure = .15, Saturation = .27, Contrast = .10, Tint = rgb(230,255,242), Density = .16, Haze = .7, Air = rgb(174,235,240) },
        { Name = "Arctic", Time = 12, Exposure = .12, Saturation = -.16, Contrast = .15, Tint = rgb(203,231,255), Density = .24, Haze = 1.1, Air = rgb(195,225,255) },
        { Name = "Cloudy", Time = 13, Exposure = -.03, Saturation = -.22, Contrast = -.08, Tint = rgb(229,236,243), Density = .30, Haze = 1.8, Rays = 0, Brightness = 1.6 },
        { Name = "Cinematic Teal", Time = 16.5, Exposure = -.05, Saturation = -.15, Contrast = .24, Tint = rgb(199,237,239), Density = .20, Haze = 1, Ambient = rgb(62,92,105), Top = rgb(255,177,98) },
        { Name = "Noir", Time = 16, Exposure = -.12, Saturation = -1, Contrast = .36, Tint = rgb(255,255,255), Density = .20, Haze = 1.1, Rays = .02 },
        { Name = "Moonlight", Time = 0.5, Exposure = .12, Saturation = -.12, Contrast = .15, Tint = rgb(180,204,255), Density = .18, Haze = .7, Ambient = rgb(70,84,122), Brightness = 2, Rays = 0 },
        { Name = "Cyberpunk", Time = 21, Exposure = .02, Saturation = .40, Contrast = .23, Tint = rgb(220,178,255), Density = .26, Haze = 1.6, Air = rgb(161,105,224), Ambient = rgb(92,45,140), Bloom = .65, Rays = 0 },
        { Name = "Neon Purple", Time = 19.2, Exposure = .08, Saturation = .45, Contrast = .18, Tint = rgb(227,169,255), Density = .22, Haze = 1.3, Air = rgb(201,145,255), Bloom = .85, Rays = .02 },
        { Name = "Dreamy", Time = 16.7, Exposure = .18, Saturation = .08, Contrast = -.12, Tint = rgb(255,218,241), Density = .24, Haze = 1.8, Air = rgb(249,207,235), Bloom = .65 },
        { Name = "Soft Pastel", Time = 14, Exposure = .16, Saturation = -.24, Contrast = -.10, Tint = rgb(255,235,224), Density = .15, Haze = 1, Bloom = .25 },
        { Name = "Retro Film", Time = 15.7, Exposure = .02, Saturation = -.32, Contrast = -.06, Tint = rgb(255,229,185), Density = .19, Haze = 1.1, Ambient = rgb(111,99,82) },
        { Name = "Autumn", Time = 16.8, Exposure = .03, Saturation = .12, Contrast = .16, Tint = rgb(255,207,158), Density = .24, Haze = 1.2, Air = rgb(232,186,137) },
        { Name = "Desert", Time = 15.3, Exposure = .18, Saturation = .08, Contrast = .20, Tint = rgb(255,229,173), Density = .32, Haze = 2, Air = rgb(231,203,158), Rays = .10 },
        { Name = "Horror", Time = 23, Exposure = -.22, Saturation = -.40, Contrast = .28, Tint = rgb(185,218,187), Density = .40, Haze = 2.4, Air = rgb(122,156,132), Ambient = rgb(40,62,49), Brightness = 1.2, Rays = 0 },
        { Name = "Volcanic", Time = 18.5, Exposure = -.12, Saturation = .22, Contrast = .30, Tint = rgb(255,171,133), Density = .32, Haze = 1.9, Air = rgb(210,104,72), Ambient = rgb(108,42,32), Bloom = .60, Rays = .02 },
    }

    local LIGHT_PROPS = {
        "Ambient", "OutdoorAmbient", "Brightness", "ClockTime", "ExposureCompensation",
        "ColorShift_Top", "ColorShift_Bottom", "FogColor", "FogStart", "FogEnd",
        "EnvironmentDiffuseScale", "EnvironmentSpecularScale", "GlobalShadows",
    }
    local ATMO_PROPS = { "Density", "Offset", "Color", "Decay", "Glare", "Haze" }
    local SHADER_ALPHA = 0.75

    local Shader = {
        ready = false,
        index = 0,
        names = { L("ex_shader_original") },
        original = {},
        originalEffects = {},
        atmoOriginal = {},
        atmosphere = nil,
        owned = false,
        fx = {},
    }
    for _, preset in ipairs(SHADER_PRESETS) do
        table.insert(Shader.names, preset.Name)
    end

    local function mix(a, b, t)
        if typeof(a) == "Color3" then
            return a:Lerp(b, t)
        end
        return a + (b - a) * t
    end

    local function shaderSetup()
        if Shader.ready then
            return
        end
        Shader.ready = true

        for _, key in ipairs(LIGHT_PROPS) do
            Shader.original[key] = Lighting[key]
        end
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") and not effect:IsA("BlurEffect") then
                Shader.originalEffects[effect] = effect.Enabled
            end
        end

        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        Shader.owned = atmosphere == nil
        if Shader.owned then
            atmosphere = Instance.new("Atmosphere")
            atmosphere.Name = "MysteryShaderAtmosphere"
        end
        Shader.atmosphere = atmosphere
        for _, key in ipairs(ATMO_PROPS) do
            Shader.atmoOriginal[key] = atmosphere[key]
        end

        local function make(className, name)
            local effect = Instance.new(className)
            effect.Name = name
            effect.Enabled = false
            effect.Parent = Lighting
            return effect
        end
        Shader.fx.correction = make("ColorCorrectionEffect", "MysteryShaderColor")
        Shader.fx.bloom = make("BloomEffect", "MysteryShaderBloom")
        Shader.fx.rays = make("SunRaysEffect", "MysteryShaderRays")
    end

    local function shaderRestore()
        if not Shader.ready then
            return
        end
        for _, effect in pairs(Shader.fx) do
            effect.Enabled = false
        end
        for key, value in pairs(Shader.original) do
            pcall(function()
                Lighting[key] = value
            end)
        end
        for effect, enabled in pairs(Shader.originalEffects) do
            if effect.Parent then
                effect.Enabled = enabled
            end
        end
        if Shader.owned then
            Shader.atmosphere.Parent = nil
        else
            for key, value in pairs(Shader.atmoOriginal) do
                Shader.atmosphere[key] = value
            end
        end
    end

    local function shaderApply(preset)
        local alpha = SHADER_ALPHA
        local original = Shader.original
        local atmosphere = Shader.atmosphere

        for effect in pairs(Shader.originalEffects) do
            if effect.Parent then
                effect.Enabled = false
            end
        end

        local targets = {
            Brightness = preset.Brightness or 2.2,
            ExposureCompensation = preset.Exposure or 0,
            Ambient = preset.Ambient or rgb(91, 97, 109),
            OutdoorAmbient = preset.Ambient or rgb(125, 133, 148),
            ColorShift_Top = preset.Top or rgb(0, 0, 0),
            ColorShift_Bottom = rgb(0, 0, 0),
            FogColor = preset.Air or rgb(192, 218, 240),
            FogStart = 0,
            FogEnd = 100000,
            EnvironmentDiffuseScale = .8,
            EnvironmentSpecularScale = .7,
        }
        for key, value in pairs(targets) do
            Lighting[key] = mix(original[key], value, alpha)
        end

        local delta = (preset.Time - original.ClockTime + 12) % 24 - 12
        Lighting.ClockTime = (original.ClockTime + delta * alpha) % 24
        Lighting.GlobalShadows = true

        local fx = Shader.fx
        fx.correction.TintColor = mix(Color3.new(1, 1, 1), preset.Tint, alpha)
        fx.correction.Contrast = (preset.Contrast or 0) * alpha
        fx.correction.Saturation = (preset.Saturation or 0) * alpha
        fx.correction.Brightness = 0
        fx.correction.Enabled = true

        fx.bloom.Intensity = (preset.Bloom or .22) * alpha
        fx.bloom.Size = 28
        fx.bloom.Threshold = 1.25
        fx.bloom.Enabled = true

        fx.rays.Intensity = (preset.Rays or .05) * alpha
        fx.rays.Spread = .75
        fx.rays.Enabled = fx.rays.Intensity > 0

        local atmoOriginal = Shader.atmoOriginal
        atmosphere.Density = mix(Shader.owned and 0 or atmoOriginal.Density, preset.Density or .15, alpha)
        atmosphere.Offset = 0
        atmosphere.Color = mix(atmoOriginal.Color, preset.Air or rgb(199, 222, 245), alpha)
        atmosphere.Decay = mix(atmoOriginal.Decay, preset.Air or rgb(133, 153, 184), alpha)
        atmosphere.Glare = .15 * alpha
        atmosphere.Haze = (preset.Haze or .7) * alpha
        atmosphere.Parent = Lighting
    end

    local ShaderDropdown

    local function selectShader(name)
        local index = table.find(Shader.names, name)
        if not index or index == Shader.index then
            return
        end

        if index == 1 then
            Shader.index = 1
            shaderRestore()
            return
        end

        local turnedOff = false
        for _, toggle in ipairs({ EffectsToggle, GraphicsToggle }) do
            local ok, value = pcall(function()
                return toggle.Value
            end)
            if ok and value == true then
                pcall(function()
                    toggle:Set(false)
                end)
                turnedOff = true
            end
        end
        if turnedOff then
            Util.notify(L("ex_shader_section"), L("ex_shader_note"), "info")
        end

        shaderSetup()
        Shader.index = index
        shaderApply(SHADER_PRESETS[index - 1])
    end

    ShaderDropdown = Extras:Dropdown({
        Title = L("ex_shader"),
        Values = Shader.names,
        Value = Shader.names[1],
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectShader(option)
            end
        end,
    })
    Util.register("ex_shader", ShaderDropdown)

    local function stepShader(direction)
        local current = math.max(Shader.index, 1)
        local nextIndex = (current - 1 + direction) % #Shader.names + 1
        local name = Shader.names[nextIndex]
        selectShader(name)
        pcall(function()
            ShaderDropdown:Select(name)
        end)
    end

    Extras:Button({
        Title = L("ex_shader_prev"),
        Icon = "chevron-left",
        Callback = function()
            stepShader(-1)
        end,
    })

    Extras:Button({
        Title = L("ex_shader_next"),
        Icon = "chevron-right",
        Callback = function()
            stepShader(1)
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        infiniteJump = false
        if jumpConn then
            jumpConn:Disconnect()
        end
        pcall(function()
            shaderRestore()
            for _, effect in pairs(Shader.fx) do
                effect:Destroy()
            end
            if Shader.owned and Shader.atmosphere then
                Shader.atmosphere:Destroy()
            end
        end)
    end)

    Extras:Section({ Title = L("ex_player_section") })

    local PlayerCfg = {
        speed = { enabled = false, value = 16, original = nil },
        jump = { enabled = false, value = 50, original = nil, originalUse = nil },
        gravity = { enabled = false, value = 196.2, original = nil },
    }

    local function getHumanoid()
        local character = LocalPlayer.Character
        return character and character:FindFirstChildOfClass("Humanoid")
    end

    local function parseInput(text, min, max)
        local n = tonumber(text)
        if not n then
            return nil
        end
        return math.clamp(n, min, max)
    end

    local function applyPlayerCfg()
        if not (PlayerCfg.speed.enabled or PlayerCfg.jump.enabled or PlayerCfg.gravity.enabled) then
            return
        end
        local humanoid = getHumanoid()
        if humanoid then
            if PlayerCfg.speed.enabled then
                humanoid.WalkSpeed = PlayerCfg.speed.value
            end
            if PlayerCfg.jump.enabled then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = PlayerCfg.jump.value
            end
        end
        if PlayerCfg.gravity.enabled then
            workspace.Gravity = PlayerCfg.gravity.value
        end
    end

    local playerCfgConn = RunService.Heartbeat:Connect(function()
        if not isAlive() then
            return
        end
        pcall(applyPlayerCfg)
    end)

    Extras:Input({
        Title = L("ex_speed_input"),
        Placeholder = "16",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.speed.value = n
            end
        end,
    })

    local SpeedToggle = Extras:Toggle({
        Title = L("ex_speed_toggle"),
        Desc = L("ex_speed_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.speed.enabled = state
            local humanoid = getHumanoid()
            if state then
                PlayerCfg.speed.original = humanoid and humanoid.WalkSpeed or 16
            elseif humanoid then
                humanoid.WalkSpeed = PlayerCfg.speed.original or 16
            end
        end,
    })
    Util.register("ex_speed", SpeedToggle)

    Extras:Input({
        Title = L("ex_jump_input"),
        Placeholder = "50",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.jump.value = n
            end
        end,
    })

    local JumpToggle = Extras:Toggle({
        Title = L("ex_jump_toggle"),
        Desc = L("ex_jump_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.jump.enabled = state
            local humanoid = getHumanoid()
            if state then
                PlayerCfg.jump.original = humanoid and humanoid.JumpPower or 50
                PlayerCfg.jump.originalUse = humanoid and humanoid.UseJumpPower
            elseif humanoid then
                humanoid.JumpPower = PlayerCfg.jump.original or 50
                if PlayerCfg.jump.originalUse ~= nil then
                    humanoid.UseJumpPower = PlayerCfg.jump.originalUse
                end
            end
        end,
    })
    Util.register("ex_jump", JumpToggle)

    Extras:Input({
        Title = L("ex_gravity_input"),
        Placeholder = "196.2",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.gravity.value = n
            end
        end,
    })

    local GravityToggle = Extras:Toggle({
        Title = L("ex_gravity_toggle"),
        Desc = L("ex_gravity_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.gravity.enabled = state
            if state then
                PlayerCfg.gravity.original = workspace.Gravity
            else
                workspace.Gravity = PlayerCfg.gravity.original or 196.2
            end
        end,
    })
    Util.register("ex_gravity", GravityToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        PlayerCfg.speed.enabled = false
        PlayerCfg.jump.enabled = false
        PlayerCfg.gravity.enabled = false
        if playerCfgConn then
            playerCfgConn:Disconnect()
        end
        pcall(function()
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = PlayerCfg.speed.original or 16
                humanoid.JumpPower = PlayerCfg.jump.original or 50
                if PlayerCfg.jump.originalUse ~= nil then
                    humanoid.UseJumpPower = PlayerCfg.jump.originalUse
                end
            end
            workspace.Gravity = PlayerCfg.gravity.original or 196.2
        end)
    end)

    Extras:Section({ Title = L("ex_external_section") })

    local function runExternal(url)
        task.spawn(function()
            local ok = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            if not ok then
                Util.notify(L("error"), L("ex_external_fail"), "triangle-alert")
            end
        end)
    end

    Extras:Button({
        Title = "Infinite Yield",
        Icon = "terminal",
        Callback = function()
            runExternal("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
        end,
    })

    Extras:Button({
        Title = "Permanent Shiftlock",
        Icon = "lock",
        Callback = function()
            runExternal("https://pastebin.com/raw/CjNsnSDy")
        end,
    })

    Extras:Button({
        Title = "All Emotes",
        Icon = "smile",
        Callback = function()
            runExternal("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua")
        end,
    })

    Extras:Section({ Title = L("ex_server_section") })

    local GuiService = game:GetService("GuiService")
    local CoreGui = game:GetService("CoreGui")

    local ServerSys = {
        autoReconnect = false,
        autoReconnectAuto = false,
        errorConn = nil,
        ancestryConn = nil,
        promptConn = nil,
        lastTeleport = 0,
        hopping = false,
    }

    local function rejoinSameServer()
        if os.clock() - ServerSys.lastTeleport < 3 then
            return
        end
        ServerSys.lastTeleport = os.clock()

        local ok = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
        if not ok then
            pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        end
    end

    local function serverHop(descending)
        if ServerSys.hopping then
            return
        end
        ServerSys.hopping = true

        task.spawn(function()
            local ok, result = pcall(function()
                local url = "https://games.roblox.com/v1/games/" .. game.PlaceId
                    .. "/servers/Public?sortOrder=" .. (descending and "Desc" or "Asc")
                    .. "&limit=100"
                return HttpService:JSONDecode(game:HttpGet(url))
            end)

            local best = nil
            if ok and type(result) == "table" and type(result.data) == "table" then
                for _, server in ipairs(result.data) do
                    local playing = tonumber(server.playing)
                    local maxPlayers = tonumber(server.maxPlayers)

                    if server.id ~= game.JobId and playing and maxPlayers and playing < maxPlayers then
                        if not best
                            or (descending and playing > best.playing)
                            or (not descending and playing < best.playing) then
                            best = { id = server.id, playing = playing }
                        end
                    end
                end
            end

            if best then
                Util.notify(L("ex_server_section"), L("ex_server_joining", best.playing), "server")
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, best.id, LocalPlayer)
                end)
            else
                Util.notify(L("ex_server_section"), L("ex_server_none"), "triangle-alert")
            end

            task.wait(3)
            ServerSys.hopping = false
        end)
    end

    local AutoReconnectToggle = Extras:Toggle({
        Title = L("ex_server_autoreconnect"),
        Desc = L("ex_server_autoreconnect_desc"),
        Value = false,
        Callback = function(state)
            ServerSys.autoReconnect = state

            if state then
                if not ServerSys.errorConn then
                    ServerSys.errorConn = GuiService.ErrorMessageChanged:Connect(function()
                        if ServerSys.autoReconnect and isAlive() then
                            rejoinSameServer()
                        end
                    end)
                end
            elseif ServerSys.errorConn then
                ServerSys.errorConn:Disconnect()
                ServerSys.errorConn = nil
            end
        end,
    })
    Util.register("server_auto_reconnect", AutoReconnectToggle)

    local AutoReconnectAutoToggle = Extras:Toggle({
        Title = L("ex_server_autoreconnect_auto"),
        Desc = L("ex_server_autoreconnect_auto_desc"),
        Value = false,
        Callback = function(state)
            ServerSys.autoReconnectAuto = state

            if state then
                if not ServerSys.ancestryConn then
                    ServerSys.ancestryConn = LocalPlayer.AncestryChanged:Connect(function(_, parent)
                        if not parent and ServerSys.autoReconnectAuto then
                            rejoinSameServer()
                        end
                    end)
                end

                if not ServerSys.promptConn then
                    pcall(function()
                        local gui = CoreGui:WaitForChild("RobloxPromptGui", 5)
                        local overlay = gui and gui:WaitForChild("promptOverlay", 5)
                        if overlay then
                            ServerSys.promptConn = overlay.ChildAdded:Connect(function(child)
                                if child.Name == "ErrorPrompt" and ServerSys.autoReconnectAuto and isAlive() then
                                    rejoinSameServer()
                                end
                            end)
                        end
                    end)
                end
            else
                if ServerSys.ancestryConn then
                    ServerSys.ancestryConn:Disconnect()
                    ServerSys.ancestryConn = nil
                end
                if ServerSys.promptConn then
                    ServerSys.promptConn:Disconnect()
                    ServerSys.promptConn = nil
                end
            end
        end,
    })
    Util.register("server_auto_reconnect_auto", AutoReconnectAutoToggle)

    Extras:Button({
        Title = L("ex_server_hop_low"),
        Desc = L("ex_server_hop_low_desc"),
        Icon = "arrow-down",
        Callback = function()
            serverHop(false)
        end,
    })

    Extras:Button({
        Title = L("ex_server_hop_full"),
        Desc = L("ex_server_hop_full_desc"),
        Icon = "arrow-up",
        Callback = function()
            serverHop(true)
        end,
    })

    Extras:Button({
        Title = L("ex_server_rejoin"),
        Icon = "refresh-cw",
        Callback = function()
            rejoinSameServer()
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        ServerSys.autoReconnect = false
        ServerSys.autoReconnectAuto = false
        for _, key in ipairs({ "errorConn", "ancestryConn", "promptConn" }) do
            if ServerSys[key] then
                ServerSys[key]:Disconnect()
                ServerSys[key] = nil
            end
        end
    end)
end

do
    local Teleport = Tabs.Teleport
end

do
    local Settings = Tabs.Settings

    local ConfigManager = Window.ConfigManager
    local configCache = {}
    local currentConfig = "default"
    local newConfigName = ""
    local autoSaveEnabled = false

    local themeNames = {}
    local themesOk, themes = pcall(function()
        return WindUI:GetThemes()
    end)
    if themesOk and type(themes) == "table" then
        for name in pairs(themes) do
            table.insert(themeNames, name)
        end
    end
    if #themeNames == 0 then
        themeNames = { "Sherya", "Dark", "Light" }
    end
    table.sort(themeNames)

    Settings:Section({ Title = L("set_appearance") })

    local ThemeDropdown = Settings:Dropdown({
        Title = L("set_theme"),
        Desc = L("set_theme_desc"),
        Values = themeNames,
        Value = themeName,
        Callback = function(option)
            if type(option) ~= "string" then
                return
            end
            pcall(function()
                WindUI:SetTheme(option)
            end)
        end,
    })
    Util.register("theme", ThemeDropdown)

    local TransparencyToggle = Settings:Toggle({
        Title = L("set_transparency"),
        Desc = L("set_transparency_d"),
        Value = true,
        Callback = function(state)
            pcall(function()
                Window:ToggleTransparency(state)
            end)
        end,
    })
    Util.register("transparency", TransparencyToggle)

    local NotificationsToggle = Settings:Toggle({
        Title = L("set_notifications"),
        Desc = L("set_notifications_desc"),
        Value = true,
        Callback = function(state)
            Util.notificationsEnabled = state
        end,
    })
    Util.register("notifications", NotificationsToggle)

    Settings:Input({
        Title = L("set_menukey"),
        Placeholder = L("set_menukey_ph"),
        Value = "",
        Callback = function(text)
            text = tostring(text or ""):gsub("%s+", "")
            if text == "" then
                return
            end
            local ok, key = pcall(function()
                return Enum.KeyCode[string.upper(text)]
            end)
            if ok and key then
                pcall(function()
                    Window:SetToggleKey(key)
                end)
                Util.notify(L("set_hub_section"), L("set_menukey_set", string.upper(text)), "check")
            else
                Util.notify(L("error"), L("set_menukey_invalid"), "triangle-alert")
            end
        end,
    })

    Settings:Input({
        Title = L("set_fpscap"),
        Desc = L("set_fpscap_desc"),
        Placeholder = "60",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if not n then
                return
            end
            if not setfpscap then
                Util.notify(L("error"), L("set_fpscap_unsup"), "triangle-alert")
                return
            end
            pcall(setfpscap, math.clamp(math.floor(n), 1, 999))
        end,
    })

    local function getConfig(name)
        if not ConfigManager then
            return nil
        end
        if configCache[name] then
            return configCache[name]
        end
        local config = ConfigManager:CreateConfig(name)
        for flag, element in pairs(Registry) do
            config:Register(flag, element)
        end
        configCache[name] = config
        return config
    end

    local function runConfig(action, name)
        return pcall(function()
            local config = getConfig(name)
            config[action](config)
        end)
    end

    local function getConfigNames()
        local ok, names = pcall(function()
            return ConfigManager:AllConfigs()
        end)
        if ok and type(names) == "table" and #names > 0 then
            return names
        end
        return { "default" }
    end

    Settings:Section({ Title = L("set_configuration") })

    local AutoSaveToggle = Settings:Toggle({
        Title = L("set_autosave"),
        Desc = L("set_autosave_desc"),
        Value = false,
        Callback = function(state)
            autoSaveEnabled = state
        end,
    })
    Util.register("autosave", AutoSaveToggle)

    local AUTOLOAD_FILE = "MysteryHubAutoLoad.txt"
    local autoLoadEnabled = true
    pcall(function()
        if isfile and readfile and isfile(AUTOLOAD_FILE) then
            autoLoadEnabled = readfile(AUTOLOAD_FILE) ~= "false"
        end
    end)

    Settings:Toggle({
        Title = L("set_autoload"),
        Desc = L("set_autoload_desc"),
        Value = autoLoadEnabled,
        Callback = function(state)
            autoLoadEnabled = state
            pcall(function()
                if writefile then
                    writefile(AUTOLOAD_FILE, state and "true" or "false")
                end
            end)
        end,
    })

    local ConfigDropdown = Settings:Dropdown({
        Title = L("set_select_config"),
        Values = getConfigNames(),
        Value = currentConfig,
        Callback = function(option)
            if type(option) == "string" then
                currentConfig = option
            end
        end,
    })

    local function refreshConfigs(selectName)
        pcall(function()
            ConfigDropdown:Refresh(getConfigNames())
        end)
        pcall(function()
            ConfigDropdown:Select(selectName)
        end)
    end

    Settings:Input({
        Title = L("set_new_config"),
        Placeholder = L("set_new_config_ph"),
        Value = "",
        Callback = function(text)
            newConfigName = text
        end,
    })

    Settings:Button({
        Title = L("set_create_config"),
        Desc = L("set_create_desc"),
        Callback = function()
            local name = Util.sanitizeName(newConfigName)
            if name == "" then
                Util.notify(L("set_config_title"), L("set_type_name"), "triangle-alert")
                return
            end
            currentConfig = name
            runConfig("Save", name)
            refreshConfigs(name)
            Util.notify(L("set_config_title"), L("set_created", name), "check")
        end,
    })

    Settings:Button({
        Title = L("set_save_config"),
        Callback = function()
            local ok = runConfig("Save", currentConfig)
            Util.notify(
                L("set_config_title"),
                ok and L("set_saved", currentConfig) or L("set_cant_save"),
                ok and "check" or "triangle-alert"
            )
        end,
    })

    Settings:Button({
        Title = L("set_load_config"),
        Callback = function()
            local ok = runConfig("Load", currentConfig)
            Util.notify(
                L("set_config_title"),
                ok and L("set_loaded", currentConfig) or L("set_cant_load"),
                ok and "check" or "triangle-alert"
            )
        end,
    })

    Settings:Button({
        Title = L("set_delete_config"),
        Callback = function()
            local name = currentConfig
            runConfig("Delete", name)
            configCache[name] = nil
            currentConfig = "default"
            refreshConfigs("default")
            Util.notify(L("set_config_title"), L("set_deleted", name), "trash-2")
        end,
    })

    Settings:Section({ Title = L("set_hub_section") })

    local queueFn = queue_on_teleport or (syn and syn.queue_on_teleport)
    local requeueEnabled = false
    local RequeueToggle

    RequeueToggle = Settings:Toggle({
        Title = L("set_requeue"),
        Desc = L("set_requeue_desc"),
        Value = false,
        Callback = function(state)
            requeueEnabled = state
            if not state then
                return
            end
            local message
            if not queueFn then
                message = L("set_requeue_unsup")
            elseif Config.LoaderUrl == "" then
                message = L("set_requeue_nourl")
            end
            if message then
                requeueEnabled = false
                Util.notify(L("set_requeue"), message, "triangle-alert")
                task.defer(function()
                    pcall(function()
                        RequeueToggle:Set(false)
                    end)
                end)
            end
        end,
    })
    Util.register("auto_requeue", RequeueToggle)

    local teleportConn = LocalPlayer.OnTeleport:Connect(function()
        if requeueEnabled and queueFn and isAlive() and Config.LoaderUrl ~= "" then
            pcall(queueFn, 'loadstring(game:HttpGet("' .. Config.LoaderUrl .. '"))()')
        end
    end)

    local PANIC_SKIP = {
        theme = true,
        transparency = true,
        autosave = true,
        notifications = true,
        auto_requeue = true,
    }

    Settings:Button({
        Title = L("set_panic"),
        Desc = L("set_panic_desc"),
        Icon = "octagon-x",
        Callback = function()
            for flag, element in pairs(Registry) do
                if not PANIC_SKIP[flag] then
                    local ok, value = pcall(function()
                        return element.Value
                    end)
                    if ok and value == true then
                        pcall(function()
                            element:Set(false)
                        end)
                    end
                end
            end
            Util.notify(L("set_hub_section"), L("set_panic_done"), "check")
        end,
    })

    Settings:Button({
        Title = L("set_unload"),
        Desc = L("set_unload_desc"),
        Icon = "power",
        Callback = function()
            env.MysteryHubRun = nil
            task.wait(1.5)
            pcall(function()
                Window:Destroy()
            end)
            env.MysteryHubWindow = nil
        end,
    })

    task.spawn(function()
        while task.wait(5) and isAlive() do
            if autoSaveEnabled then
                runConfig("Save", currentConfig)
            end
        end
    end)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        requeueEnabled = false
        pcall(function()
            teleportConn:Disconnect()
        end)
    end)

    function Util.autoLoad()
        if autoLoadEnabled then
            runConfig("Load", currentConfig)
        end
    end
end

if Util.autoLoad then
    task.delay(2, Util.autoLoad)
end

pcall(function()
    Tabs.Home:Select()
end)
