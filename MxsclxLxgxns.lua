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
    HubName = "Mystery Hub - Muscle Legends",
    Key = "MHONTOP",
    DiscordLink = "https://discord.gg/yXgJzeRCn",
    AllowedGameId = 1268927906,
    AllowedPlaceIds = { 3623096087 },
    WhitelistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Whitelist.json",
    BlacklistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Blacklist.json",
    WindUiUrl = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    WebhookUrl = "https://obscuravm.com/r/756120e0a3625accc384ade898d734fb/mystery-logger",
    CounterUrl = "https://webhook-bv4o.onrender.com/execute",
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
        sec_misc = "Miscellaneous",
        sec_player = "Player",
        sec_library = "Library",

        tab_home = "Home",
        tab_farm = "Farm",
        tab_packs = "Packs",
        tab_extras = "Extras",
        tab_snacks = "Snacks",
        tab_data = "Data",
        tab_stats = "Stats",
        tab_killer = "Killer",
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

        farm_brawls = "Brawls",
        farm_autojoin = "Auto join Brawls",
        farm_autojoin_desc = "Joins brawls automatically when the prompt appears",
        farm_autowin = "Auto Win Brawls",
        farm_autowin_desc = "Win fights automatically",
        farm_rocks = "Rocks",
        farm_timer = "Farm Timer",
        farm_time = "Time",
        farm_reset_timer = "Reset timer",
        farm_select_rock = "Select Rock",
        farm_autorock = "Auto Farm Rock",
        farm_autorock_desc = "Punches the selected rock",
        farm_no_touch = "Your executor doesn't support firetouchinterest.",
        farm_tools = "Tools",
        farm_select_tool = "Select Tool",
        farm_autotool = "Auto Use Tool",
        farm_fasttools = "Fast Tools",
        farm_autotrain = "Auto Train",
        farm_autotrain_desc = "Trains automatically with any equipped tool or when sitting on a machine",
        farm_combo_title = "Tool + Rock",
        farm_combo_desc = "Combines training and damage to the rock",
        farm_select_combo = "Select Combo",
        farm_autocombo = "Auto Tool + Rock",
        farm_rebirths = "Farm Rebirths",
        farm_rebirth_target = "Rebirth Target",
        farm_rebirth_ph = "Amount of rebirths",
        farm_autorebirth_target = "Auto Rebirth Target",
        farm_autorebirth_inf = "Auto Rebirth Infinite",
        farm_rebirth_info_title = "Information",
        farm_rebirth_info = "First press Teleport King, then enable Lock Position",
        farm_lockpos = "Lock Position",
        farm_tpking = "Teleport King",
        farm_antirebirth = "Anti Rebirth",
        farm_antirebirth_unsup = "Anti Rebirth is not supported by your executor.",
        farm_antirebirth_already = "Anti Rebirth was already active.",
        farm_antirebirth_done = "Rebirths blocked permanently.",
        boss_section = "Auto Boss",
        boss_status_title = "Boss Status",
        boss_status = "Status",
        boss_active = "Active Boss",
        boss_inactive = "No Active Boss",
        boss_boss = "Boss",
        boss_health = "Health",
        boss_next = "Next Boss",
        boss_now = "Now",
        boss_none = "None",
        boss_spawn_in = "Spawn in %s",
        boss_autoboss = "Auto Boss",
        boss_unavailable = "The boss event is not available right now.",
        boss_safety = "Auto Boss stopped because you took damage.",
        bw_section = "Boss Webhook",
        bw_input = "Discord Webhook URL",
        bw_toggle = "Enable Boss Notifications",
        bw_toggle_desc = "Send boss event notifications to your Discord webhook",
        bw_test = "Test Webhook",
        bw_test_ok = "Webhook test sent successfully.",
        bw_test_fail = "Failed to send the webhook test.",
        bw_no_http = "Your executor does not support HTTP requests.",
        bw_invalid = "Invalid Discord webhook URL.",
        hw_section = "Halloween",
        hw_health_title = "Halloween Boss Health",
        hw_select = "Select Boss",
        hw_attack = "Attack Boss",

        pk_recommended = "Recommended speed: 40",
        pk_reps_speed = "Reps speed",
        pk_start = "Start",
        pk_egg = "Eat Egg (30 min)",
        pk_spin = "Auto Spin",
        pk_ind_squat = "Industrial Squat",
        pk_hal_squat = "Hallowed Squat",
        pk_best_pets = "Equip the best pets to farm",
        pk_time_title = "Farming Time",
        pk_time = "Time",
        pk_fastreps = "Fast Reps",
        pk_running = "Running",
        pk_stopped = "Stopped",
        pk_off = "Off",
        pk_ping = "Ping",
        pk_str_calc = "Strength (exact calculation)",
        pk_dur_calc = "Durability (exact calculation)",
        pk_totals = "Totals",
        pk_strength = "Strength",
        pk_durability = "Durability",
        pk_gained = "Gained",
        pk_hour = "1 Hour",
        pk_day = "1 Day",
        pk_week = "1 Week",
        pk_month = "1 Month",
        pk_rebirth_section = "Fast Rebirth",
        pk_important_title = "Important!",
        pk_important = "You can use Fast Rebirth if all your golems together reach 100% rep speed. Example: 10 Epic Golems = 100%. When rebirthing, the script equips Tribal Overlord or Titanium Hydra.",
        pk_rebirth_title = "Fast Rebirth",
        pk_rebirths = "Rebirths",
        pk_rebirths_gained = "Rebirths gained",
        pk_status = "Status",
        pk_active = "Active",
        pk_inactive = "Inactive",
        pk_rb_calc = "Rebirths (exact calculation)",
        pk_fast_rebirths = "Fast Rebirths",
        pk_ind_lift = "Industrial Lift",
        pk_hal_lift = "Hallowed Bar Lift",

        ex_farm_section = "Farming Utilities",
        ex_lockpos = "Lock Position",
        ex_lockpos_desc = "Keeps your character frozen in place",
        ex_autospin = "Auto Spin",
        ex_autospin_desc = "Spins the Fortune Wheel automatically",
        ex_spin_missing = "Fortune Wheel data was not found.",
        ex_hidepets = "Hide Pets",
        ex_hidepets_desc = "Hides your pets to reduce lag",
        ex_hidepopups = "Hide Popups",
        ex_hidepopups_desc = "Toggles the game's popup notifications",
        ex_opt_section = "Optimization",
        ex_opt_note = "Everything is reversible: turning a toggle off restores the original values.",
        ex_opt_particles = "Remove Particles",
        ex_opt_particles_desc = "Removes particles, trails, beams, fire, smoke, sparkles and explosions, including new ones",
        ex_opt_effects = "Remove Lights & Effects",
        ex_opt_effects_desc = "Turns off lights, highlights and screen effects (bloom, blur, sun rays...)",
        ex_opt_graphics = "Low Graphics",
        ex_opt_graphics_desc = "Lowest quality, no shadows, flat materials and hidden decals",
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

        st_select_player = "Select Player",
        st_player_stats = "Player Stats",
        st_strength = "Strength",
        st_gems = "Gems",
        st_agility = "Agility",
        st_rebirths = "Rebirths",
        st_durability = "Durability",
        st_kills = "Kills",
        st_brawls = "Brawls",
        st_mk_time = "Muscle King Time",
        st_map = "Current Map",
        st_evil = "Evil Karma",
        st_good = "Good Karma",
        st_advanced = "Advanced Stats",
        st_enemy_health = "Enemy Health",
        st_your_damage = "Your Damage",
        st_hits = "Hits to Kill",
        st_not_found = "Player not found",
        st_no_data = "No data",
        st_fake_section = "Fake Stats (Visual Only)",
        st_fake_title = "Fake Stats",
        st_fake_desc = "Visually changes the selected stats. Leave a box empty to restore that stat. Accepts suffixes like 5K, 2.5M, 1B.",
        st_fake_restore = "Restore Fake Stats",
        st_fake_restored = "Fake stats restored.",
        st_fake_invalid = "Invalid value or stat not found.",
        st_info_section = "Player Info Webhook",
        st_info_send = "Send Player Info",
        st_info_send_desc = "Sends your player info, stats and server data to your webhook",
        st_notify_section = "Notification Webhook",
        st_notify_minutes = "Minutes between reports",
        st_notify_toggle = "Enable Periodic Notifications",
        st_notify_toggle_desc = "Sends a full stats and farming report every X minutes until you turn it off",
        st_notify_test = "Send Test Report",
        st_notify_need_minutes = "Type the minutes first (1 or more).",
        st_notify_started = "Reports every %s min started.",
        st_notify_stopped = "Periodic reports stopped.",
        st_hook_sent = "Webhook sent successfully.",
        st_hook_failed = "Failed to send the webhook.",

        tp_work_section = "Workout Locations",
        tp_select_workout = "Select Workout",
        tp_select_location = "Select Location",
        tp_tp_workout = "Teleport to Workout",
        tp_treadmill_section = "Treadmill Locations",
        tp_select_treadmill = "Select Treadmill",
        tp_tp_treadmill = "Teleport to Treadmill",
        tp_island_section = "Islands",
        tp_select_island = "Select Island",
        tp_tp_island = "Teleport to Island",
        tp_brawl_section = "Brawl Islands",
        tp_select_brawl = "Select Brawl Island",
        tp_tp_brawl = "Teleport to Brawl Island",
        tp_failed = "Could not teleport: character not found.",
        tp_no_location = "That location is not available for this workout.",

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
        sec_misc = "Misceláneo",
        sec_player = "Jugador",
        sec_library = "Biblioteca",

        tab_home = "Inicio",
        tab_farm = "Farmeo",
        tab_packs = "Paquetes",
        tab_extras = "Extras",
        tab_snacks = "Snacks",
        tab_data = "Datos",
        tab_stats = "Estadísticas",
        tab_killer = "Killer",
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

        farm_brawls = "Seccion de peleas",
        farm_autojoin = "Auto unirse a la pelea",
        farm_autojoin_desc = "Se une automáticamente a las peleas cuando aparece el aviso",
        farm_autowin = "Auto ganar peleas",
        farm_autowin_desc = "Gana las peleas automáticamente",
        farm_rocks = "Rocas",
        farm_timer = "Temporizador de farmeo",
        farm_time = "Tiempo",
        farm_reset_timer = "Reiniciar temporizador",
        farm_select_rock = "Seleccionar roca",
        farm_autorock = "Auto farmear roca",
        farm_autorock_desc = "Golpea la roca seleccionada",
        farm_no_touch = "Tu executor no soporta firetouchinterest.",
        farm_tools = "Herramientas",
        farm_select_tool = "Seleccionar herramienta",
        farm_autotool = "Auto usar herramienta",
        farm_fasttools = "Herramientas rápidas",
        farm_autotrain = "Auto entrenar",
        farm_autotrain_desc = "Entrena automáticamente con cualquier herramienta equipada o al sentarte en una máquina",
        farm_combo_title = "Herramienta + Roca",
        farm_combo_desc = "Combina entrenamiento y daño a la roca",
        farm_select_combo = "Seleccionar combo",
        farm_autocombo = "Auto herramienta + roca",
        farm_rebirths = "Farmeo de Rebirths",
        farm_rebirth_target = "Meta de Rebirths",
        farm_rebirth_ph = "Cantidad de rebirths",
        farm_autorebirth_target = "Auto Rebirth hasta la meta",
        farm_autorebirth_inf = "Auto Rebirth infinito",
        farm_rebirth_info_title = "Información",
        farm_rebirth_info = "Primero presiona Teleport King y después activa Lock Position",
        farm_lockpos = "Bloquear posición",
        farm_tpking = "Teleport King",
        farm_antirebirth = "Anti Rebirth",
        farm_antirebirth_unsup = "Anti Rebirth no es soportado por tu executor.",
        farm_antirebirth_already = "Anti Rebirth ya estaba activo.",
        farm_antirebirth_done = "Rebirths bloqueados permanentemente.",
        boss_section = "Auto Boss",
        boss_status_title = "Estado del Boss",
        boss_status = "Estado",
        boss_active = "Boss activo",
        boss_inactive = "Sin boss activo",
        boss_boss = "Boss",
        boss_health = "Vida",
        boss_next = "Próximo boss",
        boss_now = "Ahora",
        boss_none = "Ninguno",
        boss_spawn_in = "Aparece en %s",
        boss_autoboss = "Auto Boss",
        boss_unavailable = "El evento de boss no está disponible ahora.",
        boss_safety = "Auto Boss detenido porque recibiste daño.",
        bw_section = "Webhook de jefes",
        bw_input = "URL del webhook de Discord",
        bw_toggle = "Activar notificaciones de jefes",
        bw_toggle_desc = "Envía notificaciones de eventos de jefes a tu webhook de Discord",
        bw_test = "Probar webhook",
        bw_test_ok = "La prueba del webhook se envió correctamente.",
        bw_test_fail = "No se pudo enviar la prueba del webhook.",
        bw_no_http = "Tu executor no admite solicitudes HTTP.",
        bw_invalid = "La URL del webhook de Discord no es válida.",
        hw_section = "Halloween",
        hw_health_title = "Vida de los bosses de Halloween",
        hw_select = "Seleccionar boss",
        hw_attack = "Atacar boss",

        pk_recommended = "Velocidad recomendada: 40",
        pk_reps_speed = "Velocidad de reps",
        pk_start = "Iniciar",
        pk_egg = "Comer huevo cada 30 minutos",
        pk_spin = "Auto giro",
        pk_ind_squat = "Sentadilla Industrial",
        pk_hal_squat = "Sentadilla Hallowed",
        pk_best_pets = "Equipar las mejores mascotas para farmear",
        pk_time_title = "Tiempo de farmeo",
        pk_time = "Tiempo",
        pk_fastreps = "Fast Reps",
        pk_running = "Activas",
        pk_stopped = "Detenidas",
        pk_off = "Apagadas",
        pk_ping = "Ping",
        pk_str_calc = "Calculadora de fuerza",
        pk_dur_calc = "Calculadora de durabilidad",
        pk_totals = "Totales",
        pk_strength = "Fuerza",
        pk_durability = "Durabilidad",
        pk_gained = "Ganada",
        pk_hour = "1 Hora",
        pk_day = "1 Día",
        pk_week = "1 Semana",
        pk_month = "1 Mes",
        pk_rebirth_section = "Fast Rebirth",
        pk_important_title = "¡Importante!",
        pk_important = "Puedes usar Fast Rebirth si entre todos tus golems completan el 100% de velocidad de rep. Ejemplo: 10 Golems Épicos = 100%. Al hacer rebirth, el script equipa Tribal Overlord o Titanium Hydra.",
        pk_rebirth_title = "Fast Rebirth",
        pk_rebirths = "Rebirths",
        pk_rebirths_gained = "Rebirths ganados",
        pk_status = "Estatus",
        pk_active = "Activo",
        pk_inactive = "Inactivo",
        pk_rb_calc = "Calculadora de renacimientos",
        pk_fast_rebirths = "Fast Rebirths",
        pk_ind_lift = "Levantamiento Industrial",
        pk_hal_lift = "Barra Hallowed",

        ex_farm_section = "Utilidades de farmeo",
        ex_lockpos = "Bloquear posición",
        ex_lockpos_desc = "Mantiene a tu personaje congelado en su lugar",
        ex_autospin = "Auto giro",
        ex_autospin_desc = "Gira la Ruleta de la Fortuna automáticamente",
        ex_spin_missing = "No se encontraron los datos de la Ruleta de la Fortuna.",
        ex_hidepets = "Ocultar mascotas",
        ex_hidepets_desc = "Oculta tus mascotas para reducir el lag",
        ex_hidepopups = "Ocultar popups",
        ex_hidepopups_desc = "Activa o desactiva los avisos emergentes del juego",
        ex_opt_section = "Optimización",
        ex_opt_note = "Todo es reversible: al apagar un interruptor se restauran los valores originales.",
        ex_opt_particles = "Eliminar partículas",
        ex_opt_particles_desc = "Quita partículas, estelas, rayos, fuego, humo, destellos y explosiones, incluso las nuevas",
        ex_opt_effects = "Eliminar luces y efectos",
        ex_opt_effects_desc = "Apaga luces, resaltados y efectos de pantalla (bloom, desenfoque, rayos de sol...)",
        ex_opt_graphics = "Gráficos bajos",
        ex_opt_graphics_desc = "Calidad mínima, sin sombras, materiales lisos y calcomanías ocultas",
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

        st_select_player = "Seleccionar jugador",
        st_player_stats = "Estadísticas del jugador",
        st_strength = "Fuerza",
        st_gems = "Gemas",
        st_agility = "Agilidad",
        st_rebirths = "Rebirths",
        st_durability = "Durabilidad",
        st_kills = "Kills",
        st_brawls = "Brawls",
        st_mk_time = "Tiempo de Muscle King",
        st_map = "Mapa actual",
        st_evil = "Karma malo",
        st_good = "Karma bueno",
        st_advanced = "Estadísticas avanzadas",
        st_enemy_health = "Vida del enemigo",
        st_your_damage = "Tu daño",
        st_hits = "Golpes para matar",
        st_not_found = "Jugador no encontrado",
        st_no_data = "Sin datos",
        st_fake_section = "Fake Stats (Solo visuales)",
        st_fake_title = "Fake Stats",
        st_fake_desc = "Cambia visualmente las estadísticas elegidas. Deja una casilla vacía para restaurar esa estadística. Acepta sufijos como 5K, 2.5M, 1B.",
        st_fake_restore = "Restaurar Fake Stats",
        st_fake_restored = "Fake stats restauradas.",
        st_fake_invalid = "Valor inválido o estadística no encontrada.",
        st_info_section = "Webhook de información del jugador",
        st_info_send = "Enviar info del jugador",
        st_info_send_desc = "Envía tu info, stats y datos del servidor a tu webhook",
        st_notify_section = "Webhook de notificaciones",
        st_notify_minutes = "Minutos entre reportes",
        st_notify_toggle = "Activar notificaciones periódicas",
        st_notify_toggle_desc = "Envía un reporte completo de stats y farmeo cada X minutos hasta que lo apagues",
        st_notify_test = "Enviar reporte de prueba",
        st_notify_need_minutes = "Escribe primero los minutos (1 o más).",
        st_notify_started = "Reportes cada %s min iniciados.",
        st_notify_stopped = "Reportes periódicos detenidos.",
        st_hook_sent = "Webhook enviado correctamente.",
        st_hook_failed = "No se pudo enviar el webhook.",

        tp_work_section = "Ubicaciones de ejercicio",
        tp_select_workout = "Seleccionar ejercicio",
        tp_select_location = "Seleccionar ubicación",
        tp_tp_workout = "Teletransportar al ejercicio",
        tp_treadmill_section = "Ubicaciones de cinta",
        tp_select_treadmill = "Seleccionar cinta",
        tp_tp_treadmill = "Teletransportar a la cinta",
        tp_island_section = "Islas",
        tp_select_island = "Seleccionar isla",
        tp_tp_island = "Teletransportar a la isla",
        tp_brawl_section = "Islas de peleas",
        tp_select_brawl = "Seleccionar isla de peleas",
        tp_tp_brawl = "Teletransportar a la isla de peleas",
        tp_failed = "No se pudo teletransportar: no se encontró el personaje.",
        tp_no_location = "Esa ubicación no está disponible para este ejercicio.",

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

function Util.notify(title, content, icon)
    pcall(function()
        WindUI:Notify({
            Title = title,
            Content = content,
            Duration = 3,
            Icon = icon or "check",
        })
    end)
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
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if ok and type(info) == "table" and info.Name then
        return tostring(info.Name)
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
                    url = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Logger%20Imagen.png"
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

local blacklistEntry = findUser(fetchUsers(Config.BlacklistUrl), LocalPlayer.UserId)
local isWhitelisted = findUser(fetchUsers(Config.WhitelistUrl), LocalPlayer.UserId) ~= nil

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
    local idleConnection
    idleConnection = LocalPlayer.Idled:Connect(function()
        if not isAlive() then
            idleConnection:Disconnect()
            return
        end
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.zero)
        end)
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
    Author = "Made By Sherya - Isabella",
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
            { Key = "Packs", Title = L("tab_packs"), Icon = "package" },
        },
    },
    {
        Title = L("sec_misc"),
        Tabs = {
            { Key = "Extras", Title = L("tab_extras"), Icon = "folders" },
            { Key = "Snacks", Title = L("tab_snacks"), Icon = "popcorn" },
            { Key = "Data", Title = L("tab_data"), Icon = "calculator" },
        },
    },
    {
        Title = L("sec_player"),
        Tabs = {
            { Key = "Stats", Title = L("tab_stats"), Icon = "users" },
            { Key = "Killer", Title = L("tab_killer"), Icon = "skull" },
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

do
    local Farm = Tabs.Farm

    local Brawl = nil
    pcall(function()
        local node = ReplicatedStorage
        for _, name in ipairs({ "shared", "state", "Brawl" }) do
            node = node:WaitForChild(name, 5)
            if not node then
                return
            end
        end
        Brawl = node
    end)

    local autoFarmBrawls = false
    local autoJoinBrawls = false
    local lastJoinAttempt = 0
    local promptShownAt = nil

    local function getCharacter(player)
        local character = player.Character
        if not character or not character.Parent then
            return nil
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root or humanoid.Health <= 0 then
            return nil
        end
        return character, humanoid, root
    end

    local function getPunch()
        local character = LocalPlayer.Character
        return character and character:FindFirstChild("Punch") or LocalPlayer.Backpack:FindFirstChild("Punch")
    end

    local function equipPunch()
        local character, humanoid = getCharacter(LocalPlayer)
        if not character then
            return nil
        end
        local punch = getPunch()
        if punch and punch.Parent ~= character then
            pcall(function()
                humanoid:EquipTool(punch)
            end)
        end
        return punch
    end

    local function isBrawler(player)
        local character, humanoid, root = getCharacter(player)
        if not character
            or character:GetAttribute("LastMapCFrame") == nil
            or character:GetAttribute("InBattle") ~= true then
            return false
        end
        return true, character, humanoid, root
    end

    local function clickBrawlYes()
        local gameGui = LocalPlayer.PlayerGui:FindFirstChild("gameGui")
        if not gameGui then
            return false
        end

        local choiceMenu = gameGui:FindFirstChild("baseChoiceMenu")
        local choiceText = choiceMenu and choiceMenu:FindFirstChild("Text", true)
        local choiceButtons = choiceMenu and choiceMenu:FindFirstChild("Buttons", true)
        local choiceYes = choiceButtons and choiceButtons:FindFirstChild("yesButton")

        if choiceMenu and choiceMenu.Visible
            and choiceText
            and string.find(string.lower(choiceText.Text), "brawl", 1, true)
            and choiceYes
            and choiceYes:IsA("GuiButton") then
            pcall(function()
                firesignal(choiceYes.Activated)
            end)
            return true
        end

        local legacyPrompt = gameGui:FindFirstChild("brawlJoinLabel")
        local legacyYes = legacyPrompt and legacyPrompt:FindFirstChild("yesButton")

        if legacyPrompt and legacyPrompt.Visible
            and legacyYes
            and legacyYes:IsA("GuiButton") then
            pcall(function()
                firesignal(legacyYes.Activated)
            end)
            return true
        end

        return false
    end

    local function isBrawlPromptVisible()
        local gameGui = LocalPlayer.PlayerGui:FindFirstChild("gameGui")
        if not gameGui then
            return false
        end

        local choiceMenu = gameGui:FindFirstChild("baseChoiceMenu")
        local choiceText = choiceMenu and choiceMenu:FindFirstChild("Text", true)
        if choiceMenu and choiceMenu.Visible
            and choiceText
            and string.find(string.lower(choiceText.Text), "brawl", 1, true) then
            return true
        end

        local legacyPrompt = gameGui:FindFirstChild("brawlJoinLabel")
        return legacyPrompt ~= nil and legacyPrompt.Visible
    end

    local function tryJoinBrawl()
        local character = LocalPlayer.Character
        local inProgress = Brawl:GetAttribute("BrawlInProgress") == true
        local started = Brawl:GetAttribute("BrawlStarted") == true
        local joined = character and character:GetAttribute("LastMapCFrame") ~= nil

        if inProgress and not started and not joined then
            if isBrawlPromptVisible() then
                promptShownAt = promptShownAt or os.clock()
                if os.clock() - promptShownAt >= 0.75 and os.clock() - lastJoinAttempt >= 0.75 then
                    lastJoinAttempt = os.clock()
                    clickBrawlYes()
                end
            else
                promptShownAt = nil
            end
        else
            promptShownAt = nil
        end
    end

    local function attackPlayer(player)
        local started = os.clock()
        local nextAttack = 0

        while autoFarmBrawls and isAlive() and os.clock() - started < 8 do
            local localCharacter, localHumanoid, localRoot = getCharacter(LocalPlayer)
            local valid, targetCharacter, targetHumanoid, targetRoot = isBrawler(player)

            if not localCharacter or not valid or Brawl:GetAttribute("BrawlStarted") ~= true then
                break
            end
            if localCharacter:GetAttribute("InBattle") ~= true then
                break
            end

            pcall(function()
                localRoot.AssemblyLinearVelocity = targetRoot.AssemblyLinearVelocity
                localRoot.AssemblyAngularVelocity = Vector3.zero
                localRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 0.35)
            end)

            local now = os.clock()
            if now >= nextAttack then
                local punch = equipPunch()
                if punch then
                    local attackTime = punch:FindFirstChild("attackTime")
                    nextAttack = now + (attackTime and math.max(0.1, attackTime.Value) or 0.35)
                    pcall(function()
                        punch:Activate()
                    end)
                else
                    nextAttack = now + 0.35
                end
            end
            RunService.Heartbeat:Wait()
        end
    end

    Farm:Section({ Title = L("farm_brawls") })

    local AutoJoinBrawlsToggle = Farm:Toggle({
        Title = L("farm_autojoin"),
        Desc = L("farm_autojoin_desc"),
        Value = false,
        Callback = function(state)
            autoJoinBrawls = state
        end,
    })
    Util.register("autojoin_brawls", AutoJoinBrawlsToggle)

    local AutoFarmBrawlsToggle = Farm:Toggle({
        Title = L("farm_autowin"),
        Desc = L("farm_autowin_desc"),
        Value = false,
        Callback = function(state)
            autoFarmBrawls = state
        end,
    })
    Util.register("autofarm_brawls", AutoFarmBrawlsToggle)

    task.spawn(function()
        while task.wait(0.2) and isAlive() and Brawl do
            if autoJoinBrawls or autoFarmBrawls then
                pcall(tryJoinBrawl)
            else
                promptShownAt = nil
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.2) and isAlive() and Brawl do
            if autoFarmBrawls then
                local character = LocalPlayer.Character
                local inProgress = Brawl:GetAttribute("BrawlInProgress") == true
                local started = Brawl:GetAttribute("BrawlStarted") == true
                local joined = character and character:GetAttribute("LastMapCFrame") ~= nil

                if inProgress and started and joined and character:GetAttribute("InBattle") == true then
                    equipPunch()

                    local targets = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and isBrawler(player) then
                            table.insert(targets, player)
                        end
                    end

                    table.sort(targets, function(a, b)
                        local aCharacter = a.Character
                        local bCharacter = b.Character
                        return aCharacter and aCharacter:GetAttribute("InBattle") == true
                            and not (bCharacter and bCharacter:GetAttribute("InBattle") == true)
                    end)

                    for _, player in ipairs(targets) do
                        if not autoFarmBrawls then
                            break
                        end
                        attackPlayer(player)
                    end
                end
            end
        end
    end)

    local rockList = {
        { name = "Tiny Island Rock", durability = 0 },
        { name = "Starter Island Rock", durability = 100 },
        { name = "Legend Beach Rock", durability = 5000 },
        { name = "Frost Gym Rock", durability = 150000 },
        { name = "Mythical Gym Rock", durability = 400000 },
        { name = "Eternal Gym Rock", durability = 750000 },
        { name = "Legend Gym Rock", durability = 1000000 },
        { name = "Muscle King Gym Rock", durability = 5000000 },
        { name = "Ancient Jungle Rock", durability = 10000000 },
        { name = "Industrial Rock", durability = 25000000 },
    }

    local rockNames = {}
    for _, rock in ipairs(rockList) do
        table.insert(rockNames, rock.name)
    end

    local selectedRock = ""
    local autoRock = false
    local rockTime = 0
    local rockSession = 0
    local rockParts = {}
    local scannedRock = nil
    local lastRockScan = 0

    local function getRockDurability(name)
        for _, rock in ipairs(rockList) do
            if rock.name == name then
                return rock.durability
            end
        end
        return nil
    end

    local function safeTouch(rockPart, hand)
        if not firetouchinterest then
            return
        end
        pcall(function()
            firetouchinterest(hand, rockPart, 0)
            firetouchinterest(hand, rockPart, 1)
        end)
    end

    local function scanRocks(durability)
        local found = {}
        local machines = workspace:FindFirstChild("machinesFolder")
        if not machines then
            return found
        end
        for _, object in ipairs(machines:GetDescendants()) do
            if object.Name == "neededDurability" and object:IsA("ValueBase") and object.Value == durability then
                local rockPart = object.Parent and object.Parent:FindFirstChild("Rock")
                if rockPart then
                    table.insert(found, rockPart)
                end
            end
        end
        return found
    end

    local function rockStep()
        local character = getCharacter(LocalPlayer)
        if not character or character:GetAttribute("InBattle") == true then
            return
        end

        local punch = equipPunch()
        if punch then
            local attackTime = punch:FindFirstChild("attackTime")
            if attackTime then
                attackTime.Value = 0
            end
            punch:Activate()
        end

        local leftHand = character:FindFirstChild("LeftHand")
        local rightHand = character:FindFirstChild("RightHand")
        if not leftHand or not rightHand then
            return
        end

        local durability = getRockDurability(selectedRock)
        if not durability then
            return
        end

        local okDur, durValue = pcall(function()
            return LocalPlayer.Durability.Value
        end)
        if not okDur or type(durValue) ~= "number" or durValue < durability then
            return
        end

        local now = os.clock()
        if scannedRock ~= selectedRock or now - lastRockScan >= 5 then
            rockParts = scanRocks(durability)
            scannedRock = selectedRock
            lastRockScan = now
        end

        for _, rockPart in ipairs(rockParts) do
            if rockPart.Parent then
                safeTouch(rockPart, rightHand)
                safeTouch(rockPart, leftHand)
            end
        end
    end

    Farm:Section({ Title = L("farm_rocks") })

    local RockTimerParagraph = Farm:Paragraph({
        Title = L("farm_timer"),
        Desc = L("farm_time") .. ": 00:00:00",
    })

    Farm:Button({
        Title = L("farm_reset_timer"),
        Icon = "rotate-ccw",
        Callback = function()
            rockTime = 0
            pcall(function()
                RockTimerParagraph:SetDesc(L("farm_time") .. ": " .. Util.formatTime(rockTime))
            end)
        end,
    })

    local RockDropdown = Farm:Dropdown({
        Title = L("farm_select_rock"),
        Values = rockNames,
        Value = nil,
        AllowNone = true,
        Callback = function(option)
            selectedRock = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_rock", RockDropdown)

    local AutoRockToggle = Farm:Toggle({
        Title = L("farm_autorock"),
        Desc = L("farm_autorock_desc"),
        Value = false,
        Callback = function(state)
            autoRock = state
            rockSession = rockSession + 1
            if not state then
                return
            end

            if not firetouchinterest then
                Util.notify(L("farm_rocks"), L("farm_no_touch"), "triangle-alert")
            end

            local session = rockSession
            rockParts = {}
            scannedRock = nil

            task.spawn(function()
                while autoRock and isAlive() and rockSession == session do
                    pcall(rockStep)
                    task.wait()
                end
            end)
        end,
    })
    Util.register("autofarm_rock", AutoRockToggle)

    task.spawn(function()
        while task.wait(1) and isAlive() do
            if autoRock then
                rockTime = rockTime + 1
                pcall(function()
                    RockTimerParagraph:SetDesc(L("farm_time") .. ": " .. Util.formatTime(rockTime))
                end)
            end
        end
    end)
    local loopGen = { tool = 0, train = 0, combo = 0, rebirth = 0 }

    local toolList = {
        { "Weight", "repTime", 1 },
        { "Pushups", "repTime", 1 },
        { "Situps", "repTime", 1 },
        { "Handstands", "repTime", 1 },
        { "Punch", "attackTime", 0.35 },
    }
    local toolNames = {}
    for _, t in ipairs(toolList) do
        table.insert(toolNames, t[1])
    end

    local selectedTool = ""
    local autoTool = false
    local fastTools = false
    local autoTrain = false

    local function fireMuscle(action, hand)
        pcall(function()
            if hand then
                LocalPlayer.muscleEvent:FireServer(action, hand)
            else
                LocalPlayer.muscleEvent:FireServer(action)
            end
        end)
    end

    local function toolEquip(toolName)
        local character, humanoid = getCharacter(LocalPlayer)
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not character or not backpack or not toolName or toolName == "" then
            return
        end
        local tool = backpack:FindFirstChild(toolName)
        if tool and not character:FindFirstChild(toolName) then
            pcall(function()
                humanoid:EquipTool(tool)
            end)
        end
    end

    local function toolUnequip(toolName)
        local character = LocalPlayer.Character
        if not character or not toolName or toolName == "" then
            return
        end
        local tool = character:FindFirstChild(toolName)
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end
    end

    local function punchLoop(condition)
        task.spawn(function()
            while condition() and isAlive() do
                local punch = equipPunch()
                if punch then
                    local attackTime = punch:FindFirstChild("attackTime")
                    if attackTime then
                        attackTime.Value = 0
                    end
                    pcall(function()
                        punch:Activate()
                    end)
                end
                task.wait()
            end
        end)
    end

    local function touchRock(rockPart, hand, delay)
        if not firetouchinterest then
            return
        end
        pcall(function()
            firetouchinterest(hand, rockPart, 0)
            if delay and delay > 0 then
                task.wait(delay)
            end
            firetouchinterest(hand, rockPart, 1)
        end)
    end

    Farm:Section({ Title = L("farm_tools") })

    local ToolDropdown = Farm:Dropdown({
        Title = L("farm_select_tool"),
        Values = toolNames,
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            selectedTool = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_tool", ToolDropdown)

    local AutoToolToggle = Farm:Toggle({
        Title = L("farm_autotool"),
        Value = false,
        Callback = function(state)
            autoTool = state
            loopGen.tool = loopGen.tool + 1
            local gen = loopGen.tool

            if not state then
                toolUnequip(selectedTool)
                return
            end
            if selectedTool == "" then
                return
            end

            if selectedTool == "Punch" then
                punchLoop(function()
                    return autoTool and selectedTool == "Punch" and loopGen.tool == gen
                end)
            else
                toolEquip(selectedTool)
                task.spawn(function()
                    while autoTool and isAlive() and loopGen.tool == gen do
                        local character = LocalPlayer.Character
                        if character and selectedTool ~= "" and not character:FindFirstChild(selectedTool) then
                            toolEquip(selectedTool)
                        end
                        fireMuscle("rep")
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    Util.register("auto_tool", AutoToolToggle)

    local fastToolsConn = nil

    local function applyFastTools(state)
        for _, t in ipairs(toolList) do
            local speed = state and 0 or t[3]
            for _, container in ipairs({ LocalPlayer.Backpack, LocalPlayer.Character }) do
                local tool = container and container:FindFirstChild(t[1])
                local value = tool and tool:FindFirstChild(t[2])
                if value then
                    value.Value = speed
                end
            end
        end
    end

    local FastToolsToggle = Farm:Toggle({
        Title = L("farm_fasttools"),
        Value = false,
        Callback = function(state)
            fastTools = state
            if fastToolsConn then
                fastToolsConn:Disconnect()
                fastToolsConn = nil
            end
            applyFastTools(state)
            if state then
                fastToolsConn = LocalPlayer.CharacterAdded:Connect(function()
                    task.wait(1)
                    if fastTools and isAlive() then
                        applyFastTools(true)
                    end
                end)
            end
        end,
    })
    Util.register("fast_tools", FastToolsToggle)

    local AutoTrainToggle = Farm:Toggle({
        Title = L("farm_autotrain"),
        Desc = L("farm_autotrain_desc"),
        Value = false,
        Callback = function(state)
            autoTrain = state
            loopGen.train = loopGen.train + 1
            local gen = loopGen.train
            if not state then
                return
            end
            task.spawn(function()
                while autoTrain and isAlive() and loopGen.train == gen do
                    local character, humanoid = getCharacter(LocalPlayer)
                    if character then
                        local trained = false

                        for _, name in ipairs(toolNames) do
                            local tool = character:FindFirstChild(name)
                            if tool and tool:IsA("Tool") then
                                if name == "Punch" then
                                    local attackTime = tool:FindFirstChild("attackTime")
                                    if attackTime and fastTools then
                                        attackTime.Value = 0
                                    end
                                    pcall(function()
                                        tool:Activate()
                                    end)
                                else
                                    fireMuscle("rep")
                                end
                                trained = true
                                break
                            end
                        end

                        if not trained and humanoid and (humanoid.SeatPart or humanoid.Sit) then
                            fireMuscle("rep")
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end,
    })
    Util.register("auto_train", AutoTrainToggle)

    local comboList = {
        { "Auto Pushup + Punch Rock", "Pushups", "Industrial Rock", 0.0001 },
        { "Auto Situp + Punch Rock", "Situps", "Industrial Rock", 0.0001 },
        { "Auto Handstands + Punch Rock", "Handstands", "Industrial Rock", 0.0001 },
        { "Auto Weight + Punch Rock", "Weight", "Industrial Rock", 0.0001 },
    }
    local comboNames = {}
    for _, c in ipairs(comboList) do
        table.insert(comboNames, c[1])
    end

    local selectedCombo = ""
    local autoCombo = false

    local function runCombo(toolName, rockName, delay)
        local character = LocalPlayer.Character
        if not character or not character.Parent then
            return
        end
        fireMuscle("rep")
        local machines = workspace:FindFirstChild("machinesFolder")
        local rock = machines and machines:FindFirstChild(rockName)
        local leftHand = character:FindFirstChild("LeftHand")
        if rock and leftHand and rock:FindFirstChild("Rock") then
            touchRock(rock.Rock, leftHand, delay)
        end
        toolEquip(toolName)
    end

    Farm:Paragraph({
        Title = L("farm_combo_title"),
        Desc = L("farm_combo_desc"),
    })

    local ComboDropdown = Farm:Dropdown({
        Title = L("farm_select_combo"),
        Values = comboNames,
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            selectedCombo = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_combo", ComboDropdown)

    local AutoComboToggle = Farm:Toggle({
        Title = L("farm_autocombo"),
        Value = false,
        Callback = function(state)
            autoCombo = state
            loopGen.combo = loopGen.combo + 1
            local gen = loopGen.combo

            if not state then
                for _, c in ipairs(comboList) do
                    if c[1] == selectedCombo then
                        toolUnequip(c[2])
                        break
                    end
                end
                return
            end
            if selectedCombo == "" then
                return
            end

            punchLoop(function()
                return autoCombo and loopGen.combo == gen
            end)

            task.spawn(function()
                while autoCombo and isAlive() and loopGen.combo == gen do
                    local character = LocalPlayer.Character
                    if character and character.Parent then
                        for _, c in ipairs(comboList) do
                            if c[1] == selectedCombo then
                                runCombo(c[2], c[3], c[4])
                                break
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end,
    })
    Util.register("auto_combo", AutoComboToggle)

    local rebirthTarget = 0
    local autoRebirthTarget = false
    local autoRebirthInfinite = false
    local rebirthLock = false
    local rebirthLockConn = nil
    local rebirthLockCharConn = nil
    local antiRebirthHooked = false
    local rebirthLockSaved = nil
    local AutoRebirthTargetToggle, AutoRebirthInfiniteToggle

    local function rebirthUnequip()
        pcall(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end)
    end

    local function rebirthLoop(isRunning)
        task.spawn(function()
            while isRunning() and isAlive() do
                pcall(function()
                    local character = LocalPlayer.Character
                    local backpack = LocalPlayer:FindFirstChild("Backpack")
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    if character and backpack and humanoid then
                        local weight = character:FindFirstChild("Weight") or backpack:FindFirstChild("Weight")
                        if weight and weight.Parent ~= character then
                            humanoid:EquipTool(weight)
                        end
                    end
                end)

                fireMuscle("rep")
                task.wait(0.05)

                if not isRunning() then
                    break
                end

                if not autoRebirthInfinite then
                    local ok, current = pcall(function()
                        return LocalPlayer.leaderstats.Rebirths.Value
                    end)
                    if ok and current >= rebirthTarget then
                        autoRebirthTarget = false
                        pcall(function()
                            AutoRebirthTargetToggle:Set(false)
                        end)
                        rebirthUnequip()
                        break
                    end
                end

                pcall(function()
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                end)
            end
        end)
    end

    Farm:Section({ Title = L("farm_rebirths") })

    Farm:Input({
        Title = L("farm_rebirth_target"),
        Placeholder = L("farm_rebirth_ph"),
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                rebirthTarget = n
            end
        end,
    })

    AutoRebirthTargetToggle = Farm:Toggle({
        Title = L("farm_autorebirth_target"),
        Value = false,
        Callback = function(state)
            autoRebirthTarget = state
            if state then
                if autoRebirthInfinite then
                    autoRebirthInfinite = false
                    pcall(function()
                        AutoRebirthInfiniteToggle:Set(false)
                    end)
                end
                if rebirthTarget <= 0 then
                    autoRebirthTarget = false
                    pcall(function()
                        AutoRebirthTargetToggle:Set(false)
                    end)
                    return
                end
                loopGen.rebirth = loopGen.rebirth + 1
                local gen = loopGen.rebirth
                rebirthLoop(function()
                    return autoRebirthTarget and loopGen.rebirth == gen
                end)
            elseif not autoRebirthInfinite then
                rebirthUnequip()
            end
        end,
    })

    AutoRebirthInfiniteToggle = Farm:Toggle({
        Title = L("farm_autorebirth_inf"),
        Value = false,
        Callback = function(state)
            autoRebirthInfinite = state
            if state then
                if autoRebirthTarget then
                    autoRebirthTarget = false
                    pcall(function()
                        AutoRebirthTargetToggle:Set(false)
                    end)
                end
                loopGen.rebirth = loopGen.rebirth + 1
                local gen = loopGen.rebirth
                rebirthLoop(function()
                    return autoRebirthInfinite and loopGen.rebirth == gen
                end)
            elseif not autoRebirthTarget then
                rebirthUnequip()
            end
        end,
    })

    Farm:Paragraph({
        Title = L("farm_rebirth_info_title"),
        Desc = L("farm_rebirth_info"),
    })

    local function applyLock(character)
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then
            return
        end

        if rebirthLockConn then
            rebirthLockConn:Disconnect()
            rebirthLockConn = nil
        end

        if rebirthLock then
            if not rebirthLockSaved then
                rebirthLockSaved = {
                    walkSpeed = humanoid.WalkSpeed,
                    jumpPower = humanoid.JumpPower,
                }
            end
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid.AutoRotate = false
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            local savedCFrame = root.CFrame

            rebirthLockConn = RunService.Heartbeat:Connect(function()
                if not rebirthLock then
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
                else
            if rebirthLockSaved then
                humanoid.WalkSpeed = rebirthLockSaved.walkSpeed
                humanoid.JumpPower = rebirthLockSaved.jumpPower
                rebirthLockSaved = nil
            end
            humanoid.AutoRotate = true
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end

    local RebirthLockToggle = Farm:Toggle({
        Title = L("farm_lockpos"),
        Value = false,
        Callback = function(state)
            rebirthLock = state

            if rebirthLockConn then
                rebirthLockConn:Disconnect()
                rebirthLockConn = nil
            end
            if rebirthLockCharConn then
                rebirthLockCharConn:Disconnect()
                rebirthLockCharConn = nil
            end

            if LocalPlayer.Character then
                applyLock(LocalPlayer.Character)
            end

            if state then
                rebirthLockCharConn = LocalPlayer.CharacterAdded:Connect(function(character)
                    if rebirthLock then
                        task.wait(1)
                        applyLock(character)
                    end
                end)
            end
        end,
    })
    Util.register("rebirth_lock", RebirthLockToggle)

    Farm:Button({
        Title = L("farm_tpking"),
        Icon = "crown",
        Callback = function()
            local character = LocalPlayer.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")
            if root then
                local base = Vector3.new(-8636, 17, -5759)
                root.CFrame = CFrame.new(base + Vector3.new(
                    (math.random() * 2 - 1) * 0.3, 0, (math.random() * 2 - 1) * 0.3
                ))
            end
        end,
    })

    Farm:Button({
        Title = L("farm_antirebirth"),
        Callback = function()
            if not hookmetamethod or not newcclosure then
                Util.notify(L("farm_antirebirth"), L("farm_antirebirth_unsup"), "triangle-alert")
                return
            end
            if antiRebirthHooked then
                Util.notify(L("farm_antirebirth"), L("farm_antirebirth_already"), "info")
                return
            end
            antiRebirthHooked = true

            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                local method = getnamecallmethod()
                local ok, name = pcall(function()
                    return self.Name
                end)
                if ok and name
                    and not (checkcaller and checkcaller())
                    and (method == "InvokeServer" or method == "FireServer")
                    and string.find(string.lower(name), "rebirth") then
                    return nil
                end
                return oldNamecall(self, ...)
            end))

            Util.notify(L("farm_antirebirth"), L("farm_antirebirth_done"), "check")
        end,
    })
        task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        rebirthLock = false
        autoRebirthTarget = false
        autoRebirthInfinite = false
        autoRock = false
        autoTool = false
        autoTrain = false
        autoCombo = false
        autoFarmBrawls = false
        autoJoinBrawls = false
        fastTools = false
        if rebirthLockConn then
            rebirthLockConn:Disconnect()
            rebirthLockConn = nil
        end
        if rebirthLockCharConn then
            rebirthLockCharConn:Disconnect()
            rebirthLockCharConn = nil
        end
        if fastToolsConn then
            fastToolsConn:Disconnect()
            fastToolsConn = nil
        end
    end)
end

do
    local Farm = Tabs.Farm
    local CollectionService = game:GetService("CollectionService")

    local connections = {}

    local ORBIT = {
        speed = 95,
        maxAngularSpeed = 26,
        padding = 0.25,
        minPadding = -2,
        minRadius = 1.1,
        maxRadius = 4.2,
        heights = { 0.5, 0.45, 0.55 },
        stallTime = 2.5,
    }

    local function getChar()
        return LocalPlayer.Character
    end

    local function getHum()
        local char = getChar()
        return char and char:FindFirstChildOfClass("Humanoid")
    end

    local function getRoot()
        local char = getChar()
        return char and char:FindFirstChild("HumanoidRootPart")
    end

    local function getDurability()
        local durability = LocalPlayer:FindFirstChild("Durability")
        return durability and tonumber(durability.Value) or 0
    end

    local function getBossHealth()
        return math.max(0, tonumber(workspace:GetAttribute("BossHealth")) or 0)
    end

    local function firePunch()
        local event = LocalPlayer:FindFirstChild("muscleEvent")
        if event then
            pcall(function()
                event:FireServer("punch", "leftHand")
                event:FireServer("punch", "rightHand")
            end)
        end
    end

    local function parseNumber(text)
        text = tostring(text):gsub(",", ""):gsub("%s+", "")
        local number, suffix = text:match("([%d%.]+)([KkMmBbTt]?)")
        number = tonumber(number)
        if not number then
            return 0
        end
        local multipliers = { K = 1e3, M = 1e6, B = 1e9, T = 1e12 }
        return number * (multipliers[string.upper(suffix or "")] or 1)
    end

    local function resolveBossParts(boss)
        local part = boss:FindFirstChild("BossDamageHitbox", true)
            or boss.PrimaryPart
            or boss:FindFirstChild("Boss", true)
            or boss:FindFirstChild("Head", true)
            or boss:FindFirstChildWhichIsA("BasePart", true)

        if not part or not part:IsA("BasePart") then
            return nil
        end

        local target = boss:FindFirstChild("Boss")
            or boss:FindFirstChild("Head", true)
            or boss.PrimaryPart
            or part
        if not target:IsA("BasePart") then
            target = part
        end

        return part, target
    end

    local function findBoss()
        for _, boss in ipairs(CollectionService:GetTagged("BossEventBoss")) do
            if boss and boss.Parent then
                local part, target = resolveBossParts(boss)
                if part then
                    return boss, part, target
                end
            end
        end
        return nil
    end

    local function setCharacterSize(size)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        local remote = events and events:FindFirstChild("changeSpeedSizeRemote")
        if not remote then
            return false
        end

        size = math.clamp(math.floor((tonumber(size) or 2) + 0.5), 1, 100)

        if remote:IsA("RemoteEvent") then
            return pcall(remote.FireServer, remote, "changeSize", size)
        elseif remote:IsA("RemoteFunction") then
            return pcall(remote.InvokeServer, remote, "changeSize", size)
        end
        return false
    end

    local function getCharacterSize()
        local humanoid = getHum()
        local scale = humanoid and humanoid:FindFirstChild("BodyHeightScale")
        return math.clamp(math.floor(((scale and scale.Value) or 2) + 0.5), 1, 100)
    end

    local function equipBossPunch()
        local char = getChar()
        local humanoid = getHum()
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local punch = (char and char:FindFirstChild("Punch")) or (backpack and backpack:FindFirstChild("Punch"))

        if punch and humanoid and punch.Parent ~= char then
            pcall(humanoid.EquipTool, humanoid, punch)
            RunService.Heartbeat:Wait()
        end

        local attackTime = punch and punch:FindFirstChild("attackTime")
        if attackTime and attackTime:IsA("ValueBase") then
            attackTime.Value = 0
        end
        return punch
    end

    local function getBestRock()
        local folder = workspace:FindFirstChild("machinesFolder")
        if not folder then
            return nil
        end

        local durability = getDurability()
        local bestRock = nil
        local bestRequirement = -math.huge

        for _, machine in ipairs(folder:GetChildren()) do
            local needed = machine:FindFirstChild("neededDurability", true)
            local rock = machine:FindFirstChild("Rock", true)

            if needed and rock and rock:IsA("BasePart") then
                local requirement = tonumber(needed.Value) or 0
                if requirement <= durability and requirement > bestRequirement then
                    bestRequirement = requirement
                    bestRock = { machine = machine, rock = rock, durability = requirement }
                end
            end
        end

        return bestRock
    end

    local function orbitPosition(owner, part, angle)
        local size = part.Size
        local center = part.Position

        local baseRadius = math.min(size.X, size.Z) * 0.14
        local radius = math.clamp(
            baseRadius + owner.padding,
            ORBIT.minRadius,
            ORBIT.maxRadius
        )

        local fraction = ORBIT.heights[owner.heightIndex] or 0.5
        local verticalRange = math.min(math.max(0, size.Y - 2), 4)
        local y = center.Y + (fraction - 0.5) * verticalRange

        local position = Vector3.new(
            center.X + math.cos(angle) * radius,
            y,
            center.Z + math.sin(angle) * radius
        )
        local aim = Vector3.new(center.X, center.Y, center.Z)

        return position, aim, radius
    end

    local function touchBoss(character, part, target)
        if not firetouchinterest then
            return
        end

        local hands = {}
        local left = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm")
        local right = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
        if left then
            table.insert(hands, left)
        end
        if right then
            table.insert(hands, right)
        end

        local targets = { part }
        if target and target ~= part then
            table.insert(targets, target)
        end

        for _, hand in ipairs(hands) do
            for _, victim in ipairs(targets) do
                pcall(function()
                    firetouchinterest(hand, victim, 0)
                    firetouchinterest(hand, victim, 1)
                end)
            end
        end
    end

    local function updateStall(owner, tracker, health, now)
        if health == nil then
            return
        end

        if health < tracker.lastHealth then
            tracker.lastDamageAt = now
        end
        tracker.lastHealth = health

        if now - tracker.lastDamageAt >= ORBIT.stallTime then
            tracker.lastDamageAt = now
            owner.heightIndex = owner.heightIndex % #ORBIT.heights + 1
            owner.padding = math.max(ORBIT.minPadding, owner.padding - 1)
        end
    end

    local function startDurability(owner)
        owner.durabilityRunning = true
        owner.durabilityGeneration = owner.durabilityGeneration + 1
        local generation = owner.durabilityGeneration

        task.spawn(function()
            while isAlive()
                and owner.active
                and owner.durabilityRunning
                and owner.durabilityGeneration == generation do

                local character = getChar()
                local root = getRoot()
                local humanoid = getHum()
                local rockData = nil

                if character and root and humanoid and humanoid.Health > 0 then
                    rockData = getBestRock()
                end

                if not rockData then
                    task.wait(0.15)
                else
                    local rock = rockData.rock
                    local leftHand = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm")
                    local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
                    local punch = equipBossPunch()

                    if not leftHand or not rightHand or not punch then
                        task.wait(0.1)
                    else
                        firePunch()

                        pcall(punch.Activate, punch)

                        if firetouchinterest then
                            pcall(function()
                                firetouchinterest(rightHand, rock, 0)
                                firetouchinterest(leftHand, rock, 0)
                            end)
                            task.wait(0.04)
                            pcall(function()
                                firetouchinterest(rightHand, rock, 1)
                                firetouchinterest(leftHand, rock, 1)
                            end)
                        end

                        task.wait(0.08)
                    end
                end
            end
        end)
    end

    local AutoBossToggle

    local BossFarm = {
        active = false,
        generation = 0,
        engagedBoss = nil,
        originalCharacter = nil,
        originalPivot = nil,
        originalSize = nil,
        originalRootAnchored = nil,
        lastPlayerHealth = nil,
        cameraSaved = nil,
        cameraFocusPosition = nil,
        cameraStableCFrame = nil,
        cameraOffset = Vector3.new(0, 34, 48),
        cameraRenderName = "MysteryHubBossCamera",
        antiLag = false,
        antiLagOriginals = setmetatable({}, { __mode = "k" }),
        antiLagConnection = nil,
        hitInterval = 0.31,
        attacks = 0,
        confirmedDamage = 0,
        durabilityRunning = false,
        durabilityGeneration = 0,
        safetyTriggered = false,
        padding = ORBIT.padding,
        heightIndex = 1,
    }

    function BossFarm:ApplyAntiLagObject(object)
        if not self.antiLag or not object then
            return
        end

        local property = nil
        if object:IsA("ParticleEmitter") or object:IsA("Trail")
            or object:IsA("Beam") or object:IsA("Fire")
            or object:IsA("Smoke") or object:IsA("Sparkles")
            or object:IsA("PointLight") or object:IsA("SpotLight")
            or object:IsA("SurfaceLight") or object:IsA("Highlight") then
            property = "Enabled"
        elseif object:IsA("BasePart") then
            property = "CastShadow"
        end

        if property and self.antiLagOriginals[object] == nil then
            self.antiLagOriginals[object] = { property = property, value = object[property] }
            pcall(function()
                object[property] = false
            end)
        end
    end

    function BossFarm:SetAntiLag(enabled)
        self.antiLag = enabled == true

        if self.antiLagConnection then
            self.antiLagConnection:Disconnect()
            self.antiLagConnection = nil
        end

        if not self.antiLag then
            for object, saved in pairs(self.antiLagOriginals) do
                if object and object.Parent then
                    pcall(function()
                        object[saved.property] = saved.value
                    end)
                end
                self.antiLagOriginals[object] = nil
            end
            return true
        end

        local events = workspace:FindFirstChild("Events")
        local arena = events and events:FindFirstChild("BossArena")
        if not arena then
            self.antiLag = false
            return false
        end

        for _, object in ipairs(arena:GetDescendants()) do
            self:ApplyAntiLagObject(object)
        end

        self.antiLagConnection = arena.DescendantAdded:Connect(function(object)
            task.defer(function()
                self:ApplyAntiLagObject(object)
            end)
        end)

        return true
    end

    function BossFarm:StopCamera()
        pcall(RunService.UnbindFromRenderStep, RunService, self.cameraRenderName)

        local camera = workspace.CurrentCamera
        local saved = self.cameraSaved

        if camera and saved then
            pcall(function()
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = saved.cframe
                camera.Focus = saved.focus
                if saved.subject and saved.subject.Parent then
                    camera.CameraSubject = saved.subject
                end
                camera.CameraType = saved.cameraType
            end)
        end

        self.cameraSaved = nil
        self.cameraFocusPosition = nil
        self.cameraStableCFrame = nil
        self.cameraOffset = Vector3.new(0, 34, 48)
    end

    function BossFarm:StartCamera()
        self:StopCamera()
        local camera = workspace.CurrentCamera
        if not camera then
            return
        end

        self.cameraSaved = {
            cameraType = camera.CameraType,
            subject = camera.CameraSubject,
            cframe = camera.CFrame,
            focus = camera.Focus,
        }

        camera.CameraType = Enum.CameraType.Scriptable

        RunService:BindToRenderStep(self.cameraRenderName, Enum.RenderPriority.Camera.Value + 50, function(delta)
            local focus = self.cameraFocusPosition
            local currentCamera = workspace.CurrentCamera
            if not self.engagedBoss or not focus or not currentCamera then
                return
            end

            local desired = CFrame.lookAt(
                focus + self.cameraOffset,
                focus + Vector3.new(0, -5, 0)
            )

            if self.cameraStableCFrame then
                self.cameraStableCFrame = self.cameraStableCFrame:Lerp(desired, math.clamp(delta * 4, 0.04, 0.22))
            else
                self.cameraStableCFrame = desired
            end

            currentCamera.CameraType = Enum.CameraType.Scriptable
            currentCamera.CFrame = self.cameraStableCFrame
            currentCamera.Focus = CFrame.new(focus)
        end)
    end

    function BossFarm:WaitForReadyCharacter(timeout)
        local deadline = os.clock() + (tonumber(timeout) or 8)
        local stableCharacter, stableRoot, stableAt = nil, nil, nil

        while self.active and isAlive() and os.clock() < deadline do
            local character = getChar()
            local root = character and character:FindFirstChild("HumanoidRootPart")
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local machine = LocalPlayer:FindFirstChild("machineInUse")
            local mounted = (machine and machine.Value ~= nil) or (humanoid and humanoid.SeatPart ~= nil)

            if character and root and humanoid and humanoid.Health > 0 and not mounted then
                if character ~= stableCharacter or root ~= stableRoot then
                    stableCharacter = character
                    stableRoot = root
                    stableAt = os.clock()
                elseif os.clock() - stableAt >= 0.18 then
                    return character, root, humanoid
                end
            else
                stableCharacter, stableRoot, stableAt = nil, nil, nil
            end

            task.wait(0.05)
        end
        return nil
    end

    function BossFarm:StopDurability()
        self.durabilityRunning = false
        self.durabilityGeneration = self.durabilityGeneration + 1
    end

    function BossFarm:StartDurability()
        startDurability(self)
    end

    function BossFarm:BeginBattle(boss)
        if self.engagedBoss == boss then
            return true
        end

        local character, root, humanoid = self:WaitForReadyCharacter(8)

        if not character or not root or not humanoid
            or not boss.Parent or workspace:GetAttribute("BossActive") ~= true then
            return false
        end

        self.originalCharacter = character
        self.originalPivot = character:GetPivot()
        self.originalSize = getCharacterSize()
        self.originalRootAnchored = root.Anchored
        self.engagedBoss = boss
        self.confirmedDamage = 0
        self.attacks = 0
        self.safetyTriggered = false
        self.lastPlayerHealth = humanoid.Health
        self.padding = ORBIT.padding
        self.heightIndex = 1

        self:StartCamera()
        setCharacterSize(1)
        task.wait(0.55)

        humanoid = getHum()
        if humanoid then
            self.lastPlayerHealth = humanoid.Health
        end

        self:StartDurability()
        return true
    end

    function BossFarm:RestoreBattle()
        self:StopDurability()

        local character = getChar()
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if character and character == self.originalCharacter and root and self.originalPivot then
            character:PivotTo(self.originalPivot)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            if self.originalRootAnchored ~= nil then
                root.Anchored = self.originalRootAnchored
            end
        end

        if self.originalSize then
            setCharacterSize(self.originalSize)
        end
        self:StopCamera()

        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local punch = character and character:FindFirstChild("Punch")
        if punch and backpack then
            punch.Parent = backpack
        end

        self.originalCharacter = nil
        self.originalPivot = nil
        self.originalSize = nil
        self.originalRootAnchored = nil
        self.engagedBoss = nil
        self.lastPlayerHealth = nil
    end

    function BossFarm:CollectChest(timeout)
        if type(fireproximityprompt) ~= "function" then
            return false
        end

        local opened = false
        local connection = nil
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        local openedEvent = events and events:FindFirstChild("bossChestOpenedEvent")

        if openedEvent and openedEvent:IsA("RemoteEvent") then
            connection = openedEvent.OnClientEvent:Connect(function()
                opened = true
            end)
        end

        local deadline = os.clock() + (tonumber(timeout) or 12)
        local pendingWasSeen = false
        local attempted = false
        local lastAttempt = 0

        while self.active and isAlive() and os.clock() < deadline do
            if opened then
                if connection then connection:Disconnect() end
                return true
            end

            local chestModel, prompt = nil, nil

            for _, candidate in ipairs(CollectionService:GetTagged("BossEventChest")) do
                prompt = candidate:FindFirstChild("bossChestPrompt", true)
                if prompt then
                    chestModel = candidate
                    break
                end
            end

            if not prompt then
                local ev = workspace:FindFirstChild("Events")
                prompt = ev and ev:FindFirstChild("bossChestPrompt", true)
                chestModel = prompt and prompt:FindFirstAncestorOfClass("Model")
            end

            local eligible = LocalPlayer:GetAttribute("BossChestEligible") == true
            local pending = LocalPlayer:GetAttribute("BossChestPending") == true

            if pending then
                pendingWasSeen = true
            elseif attempted and pendingWasSeen then
                if connection then connection:Disconnect() end
                return true
            end

            local emerging = chestModel and chestModel:GetAttribute("BossChestEmerging") == true

            if prompt and prompt:IsA("ProximityPrompt") and eligible and pending and not emerging then
                local character = getChar()
                local root = getRoot()
                local parent = prompt.Parent

                if character and root and parent and parent:IsA("BasePart") then
                    character:PivotTo(parent.CFrame * CFrame.new(0, math.max(4, parent.Size.Y * 0.5 + 3), 0))
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.12)
                end

                if prompt.Enabled and os.clock() - lastAttempt >= 0.45 then
                    lastAttempt = os.clock()
                    attempted = pcall(fireproximityprompt, prompt) or attempted
                end
            end

            task.wait(0.1)
        end

        if connection then connection:Disconnect() end

        return opened or (
            attempted and pendingWasSeen
            and LocalPlayer:GetAttribute("BossChestPending") ~= true
        )
    end

    function BossFarm:Fight(boss, generation)
        if not self:BeginBattle(boss) then
            return
        end

        local lastHealth = getBossHealth()
        local lastAttack = 0
        local angle = math.random() * math.pi * 2
        local lastFrame = os.clock()
        local tracker = { lastHealth = lastHealth, lastDamageAt = os.clock() }
        local lastCharacter = self.originalCharacter

        while self.active and isAlive() and self.generation == generation
            and boss.Parent and workspace:GetAttribute("BossActive") == true do
            local currentBoss, part, target = findBoss()
            if currentBoss ~= boss or not part or not target then
                break
            end

            local character = getChar()
            local root = getRoot()
            local humanoid = getHum()

            if not character or not root or not humanoid or humanoid.Health <= 0 then
                task.wait(0.25)
                lastFrame = os.clock()

            elseif character ~= lastCharacter then
                task.wait(0.6)
                local newChar, newRoot = self:WaitForReadyCharacter(8)
                if newChar and newRoot then
                    lastCharacter = newChar
                    self.originalCharacter = newChar
                    self.originalPivot = newChar:GetPivot()
                    self.originalRootAnchored = newRoot.Anchored
                    setCharacterSize(1)
                    task.wait(0.55)
                    lastFrame = os.clock()
                end

            else
                local punch = equipBossPunch()

                if not punch then
                   task.wait(0.1)
                   lastFrame = os.clock()
                else
                   local now = os.clock()
                    local delta = math.min(now - lastFrame, 0.1)
                    lastFrame = now

                    local attackPosition, aimPosition, radius = orbitPosition(self, part, angle)
                    angle = angle + math.clamp(
                        ORBIT.speed / math.max(radius, 0.5),
                        0.4,
                        ORBIT.maxAngularSpeed
                    ) * delta

                    self.cameraOffset = Vector3.new(0, 30 + radius * 0.6, 40 + radius * 1.1)
                    if self.cameraFocusPosition then
                        self.cameraFocusPosition = self.cameraFocusPosition:Lerp(aimPosition, 0.1)
                    else
                        self.cameraFocusPosition = aimPosition
                    end

                    character:PivotTo(CFrame.lookAt(attackPosition, aimPosition))
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero

                    if now - lastAttack >= self.hitInterval then
                        lastAttack = now
                        pcall(punch.Deactivate, punch)
                        pcall(punch.Activate, punch)

                        local attackTime = punch:FindFirstChild("attackTime")
                        if attackTime and attackTime:IsA("ValueBase") then
                            attackTime.Value = 0
                        end

                        touchBoss(character, part, target)
                        self.attacks = self.attacks + 1
                    end

                    local health = getBossHealth()
                    if health < lastHealth then
                        self.confirmedDamage = self.confirmedDamage + (lastHealth - health)
                    end
                    lastHealth = health

                    updateStall(self, tracker, health, now)

                    RunService.Heartbeat:Wait()
                end
            end
        end

        if self.generation ~= generation then
            return
        end

            local defeated = workspace:GetAttribute("BossActive") ~= true or getBossHealth() <= 0
            if defeated and self.active then
                self:CollectChest(25)
            end
            self:RestoreBattle()
        end

    function BossFarm:Set(enabled)
        enabled = enabled == true
        self.generation = self.generation + 1
        local generation = self.generation
        self.active = enabled

        if not enabled then
            self:RestoreBattle()
            self:SetAntiLag(false)
            return true
        end

        local config = ReplicatedStorage:FindFirstChild("shared")
        config = config and config:FindFirstChild("config")
        config = config and config:FindFirstChild("BossEventConfig")

        local ok, values = pcall(function()
            return config and require(config)
        end)

        if not ok or type(values) ~= "table" or values.ENABLED ~= true then
            self.active = false
            self:SetAntiLag(false)
            return false
        end

        self:SetAntiLag(true)
        self.hitInterval = math.max(0.31, (tonumber(values.MIN_HIT_INTERVAL) or 0.3) + 0.01)

        task.spawn(function()
            while self.active and isAlive() and self.generation == generation do
                local boss = findBoss()

                if boss and workspace:GetAttribute("BossActive") == true then
                    self:Fight(boss, generation)
                else
                    self.engagedBoss = nil
                    task.wait(0.4)
                end
            end

            if self.generation == generation then
                self:RestoreBattle()
            end
        end)

        return true
    end

    Farm:Section({ Title = L("boss_section") })

    local BossStatus = Farm:Paragraph({
        Title = L("boss_status_title"),
        Desc = table.concat({
            L("boss_status") .. ": " .. L("boss_inactive"),
            L("boss_boss") .. ": " .. L("boss_none"),
            L("boss_health") .. ": 0/0",
            L("boss_health") .. ": 0%",
            L("boss_next") .. ": " .. L("boss_now"),
        }, "\n"),
    })

    local function updateBossStatus()
        local active = workspace:GetAttribute("BossActive") == true
        local health = math.max(0, tonumber(workspace:GetAttribute("BossHealth")) or 0)
        local maxHealth = math.max(0, tonumber(workspace:GetAttribute("BossMaxHealth")) or 0)
        local rarity = workspace:GetAttribute("BossRarityName") or L("boss_none")
        local spawnTime = tonumber(workspace:GetAttribute("BossSpawnNextTime"))

        local percent = 0
        if maxHealth > 0 then
            percent = math.floor(math.clamp(health / maxHealth * 100, 0, 100) + 0.5)
        end

        local nextBoss
        if active then
            nextBoss = L("boss_now")
        else
            health = 0
            rarity = L("boss_none")

            if spawnTime then
                local remaining = math.max(0, spawnTime - workspace:GetServerTimeNow())
                if remaining > 0 then
                    local minutes = math.floor(remaining / 60)
                    local seconds = math.floor(remaining % 60)
                    nextBoss = L("boss_spawn_in", string.format("%dm %02ds", minutes, seconds))
                else
                    nextBoss = L("boss_now")
                end
            else
                nextBoss = L("boss_now")
            end
        end

        BossStatus:SetDesc(table.concat({
            L("boss_status") .. ": " .. (active and L("boss_active") or L("boss_inactive")),
            L("boss_boss") .. ": " .. tostring(rarity),
            L("boss_health") .. ": " .. math.floor(health) .. "/" .. math.floor(maxHealth),
            L("boss_health") .. ": " .. percent .. "%",
            L("boss_next") .. ": " .. nextBoss,
        }, "\n"))
    end

    task.spawn(function()
        while isAlive() do
            pcall(updateBossStatus)
            task.wait(0.2)
        end
    end)

    AutoBossToggle = Farm:Toggle({
        Title = L("boss_autoboss"),
        Value = false,
        Callback = function(state)
            if state then
                if not BossFarm:Set(true) then
                    Util.notify(L("boss_section"), L("boss_unavailable"), "triangle-alert")
                    task.defer(function()
                        pcall(function()
                            AutoBossToggle:Set(false)
                        end)
                    end)
                end
            else
                BossFarm:Set(false)
            end
        end,
    })
    Util.register("auto_boss", AutoBossToggle)

    local HalloweenFarm = {
        active = false,
        generation = 0,
        selectedBoss = "Frankenbrute",
        engagedBoss = nil,
        originalCharacter = nil,
        originalPivot = nil,
        originalSize = nil,
        originalRootAnchored = nil,
        attacks = 0,
        durabilityRunning = false,
        durabilityGeneration = 0,
        status = "Idle",
        hitInterval = 0.31,
        padding = ORBIT.padding,
        heightIndex = 1,
    }

    local HalloweenBossNames = {
        "Frankenbrute",
        "Grim Reaper",
        "Pumpkin Titan",
        "Scarecrow Colossus",
    }

    local HalloweenBossCache = {}
    local HalloweenHealthCache = {}
    for _, name in ipairs(HalloweenBossNames) do
        HalloweenBossCache[name] = { boss = nil, part = nil, target = nil }
        HalloweenHealthCache[name] = { boss = nil, label = nil }
    end

    local function halloweenFindBoss(name)
        local cached = HalloweenBossCache[name]
        if not cached then
            return nil
        end
        local boss = cached.boss

        if boss and boss.Parent == workspace
            and cached.part and cached.part.Parent
            and cached.target and cached.target.Parent then
            return boss, cached.part, cached.target
        end

        boss = workspace:FindFirstChild(name)
        if not boss or not boss:IsA("Model") then
            cached.boss, cached.part, cached.target = nil, nil, nil
            return nil
        end

        local part, target = resolveBossParts(boss)
        if not part then
            return nil
        end

        cached.boss, cached.part, cached.target = boss, part, target
        return boss, part, target
    end

    local function halloweenGetHealthLabel(name)
        local cached = HalloweenHealthCache[name]
        local boss = workspace:FindFirstChild(name)

        if not boss then
            cached.boss, cached.label = nil, nil
            return nil
        end

        if cached.boss == boss and cached.label and cached.label.Parent then
            return cached.label
        end

        local folder = boss:FindFirstChild("halloweenBossHealth")
        local bar = folder and folder:FindFirstChild("Bar")
        local label = bar and bar:FindFirstChild("Health")

        cached.boss = boss
        if label and label:IsA("TextLabel") then
            cached.label = label
        else
            cached.label = nil
        end
        return cached.label
    end

    local function halloweenHealthValue(name)
        local label = halloweenGetHealthLabel(name)
        if not label then
            return nil
        end
        local current = label.Text:match("^%s*(.-)%s*/")
        if not current then
            return nil
        end
        return parseNumber(current)
    end

    local function clearHalloweenCache(child)
        local cached = HalloweenBossCache[child.Name]
        if cached then
            cached.boss, cached.part, cached.target = nil, nil, nil
        end
        local health = HalloweenHealthCache[child.Name]
        if health then
            health.boss, health.label = nil, nil
        end
    end

    table.insert(connections, workspace.ChildAdded:Connect(clearHalloweenCache))
    table.insert(connections, workspace.ChildRemoved:Connect(clearHalloweenCache))

    function HalloweenFarm:StopDurability()
        self.durabilityRunning = false
        self.durabilityGeneration = self.durabilityGeneration + 1
    end

    function HalloweenFarm:StartDurability()
        startDurability(self)
    end

    function HalloweenFarm:WaitForReadyCharacter(timeout)
        local deadline = os.clock() + (tonumber(timeout) or 15)

        while self.active and isAlive() and os.clock() < deadline do
            local character = getChar()
            local root = character and character:FindFirstChild("HumanoidRootPart")
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local machine = LocalPlayer:FindFirstChild("machineInUse")
            local mounted = (machine and machine.Value ~= nil) or (humanoid and humanoid.SeatPart ~= nil)

            if character and root and humanoid and humanoid.Health > 0 and not mounted then
                return character, root, humanoid
            end

            task.wait(0.1)
        end
        return nil
    end

    function HalloweenFarm:BeginBattle(boss)
        if self.engagedBoss == boss then
            return true
        end

        local character, root, humanoid = self:WaitForReadyCharacter(15)
        if not character or not root or not humanoid or not boss or not boss.Parent then
            return false
        end

        self.originalCharacter = character
        self.originalPivot = character:GetPivot()
        self.originalSize = getCharacterSize()
        self.originalRootAnchored = root.Anchored
        self.engagedBoss = boss
        self.attacks = 0
        self.padding = ORBIT.padding
        self.heightIndex = 1

        setCharacterSize(1)
        task.wait(0.55)
        self:StartDurability()

        return true
    end

    function HalloweenFarm:RestoreBattle()
        self:StopDurability()

        local character = getChar()
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")

        if character and character == self.originalCharacter
            and root and self.originalPivot
            and humanoid and humanoid.Health > 0 then
            pcall(function()
                character:PivotTo(self.originalPivot)
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                if self.originalRootAnchored ~= nil then
                    root.Anchored = self.originalRootAnchored
                end
            end)
        end

        if self.originalSize and humanoid and humanoid.Health > 0 then
            setCharacterSize(self.originalSize)
        end

        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local punch = character and character:FindFirstChild("Punch")
        if punch and backpack then
            pcall(function()
                punch.Parent = backpack
            end)
        end

        self.originalCharacter = nil
        self.originalPivot = nil
        self.originalSize = nil
        self.originalRootAnchored = nil
        self.engagedBoss = nil
    end

    function HalloweenFarm:Fight(boss, generation)
        local lastAttack = 0
        local angle = math.random() * math.pi * 2
        local lastFrame = os.clock()
        local tracker = { lastHealth = math.huge, lastDamageAt = os.clock() }

        while self.active and isAlive() and self.generation == generation do
            local currentBoss, part, target = halloweenFindBoss(self.selectedBoss)

            if not currentBoss or not part or not target then
                self.status = "Waiting for " .. self.selectedBoss
                self:StopDurability()
                self.engagedBoss = nil
                task.wait(0.25)
            else
                if self.engagedBoss ~= currentBoss then
                    if self:BeginBattle(currentBoss) then
                        self.status = "Attacking " .. self.selectedBoss
                        lastAttack = 0
                        lastFrame = os.clock()
                        tracker.lastHealth = math.huge
                        tracker.lastDamageAt = os.clock()
                    else
                        task.wait(0.5)
                    end
                end

                if self.engagedBoss == currentBoss then
                    local character = getChar()
                    local root = getRoot()
                    local humanoid = getHum()

                    if not character or not root or not humanoid or humanoid.Health <= 0 then
                        self.status = "Waiting for respawn"
                        self:StopDurability()
                        self.engagedBoss = nil
                        self.originalCharacter = nil
                        self.originalPivot = nil
                        self.originalSize = nil
                        self.originalRootAnchored = nil
                        task.wait(0.25)
                    else
                        local punch = equipBossPunch()

                        if punch then
                            local now = os.clock()
                            local delta = math.min(now - lastFrame, 0.1)
                            lastFrame = now

                            local attackPosition, aimPosition, radius = orbitPosition(self, part, angle)
                            angle = angle + math.clamp(
                    ORBIT.speed / math.max(radius, 0.5),
                    0.4,
                    ORBIT.maxAngularSpeed
                ) * delta

                            character:PivotTo(CFrame.lookAt(attackPosition, aimPosition))
                            root.AssemblyLinearVelocity = Vector3.zero
                            root.AssemblyAngularVelocity = Vector3.zero

                            if now - lastAttack >= self.hitInterval then
                                lastAttack = now

                                pcall(punch.Deactivate, punch)
                                pcall(punch.Activate, punch)

                                local attackTime = punch:FindFirstChild("attackTime")
                                if attackTime and attackTime:IsA("ValueBase") then
                                    attackTime.Value = 0
                                end

                                firePunch()

                                touchBoss(character, part, target)
                                self.attacks = self.attacks + 1
                            end

                            updateStall(self, tracker, halloweenHealthValue(self.selectedBoss), now)

                            RunService.Heartbeat:Wait()
                        else
                            task.wait(0.1)
                        end
                    end
                end
            end
        end

        if self.generation == generation then
            self:RestoreBattle()
        end
    end

    function HalloweenFarm:Set(enabled)
        enabled = enabled == true

        self.generation = self.generation + 1
        local generation = self.generation
        self.active = enabled

        if not enabled then
            self.status = "Idle"
            self:RestoreBattle()
            return true
        end

        self.status = "Searching for " .. self.selectedBoss

        task.spawn(function()
            while self.active and isAlive() and self.generation == generation do
                local boss = halloweenFindBoss(self.selectedBoss)

                if boss then
                    self.status = "Attacking " .. self.selectedBoss
                    self:Fight(boss, generation)
                else
                    self.status = "Waiting for " .. self.selectedBoss
                    task.wait(0.4)
                end
            end

            if self.generation == generation then
                self:RestoreBattle()
            end
        end)

        return true
    end

    Farm:Section({ Title = L("hw_section") })

    local HalloweenStatus = Farm:Paragraph({
        Title = L("hw_health_title"),
        Desc = table.concat({
            "Frankenbrute = " .. L("boss_health") .. ": N/A",
            "Grim Reaper = " .. L("boss_health") .. ": N/A",
            "Pumpkin Titan = " .. L("boss_health") .. ": N/A",
            "Scarecrow Colossus = " .. L("boss_health") .. ": N/A",
        }, "\n"),
    })

    local HalloweenBossDropdown = Farm:Dropdown({
        Title = L("hw_select"),
        Values = HalloweenBossNames,
        Value = "Frankenbrute",
        Callback = function(value)
            if type(value) ~= "string" then
                return
            end
            HalloweenFarm.selectedBoss = value

            if HalloweenFarm.active then
                HalloweenFarm:Set(false)
                task.wait(0.1)
                HalloweenFarm:Set(true)
            end
        end,
    })
    Util.register("halloween_boss", HalloweenBossDropdown)

    local HalloweenToggle = Farm:Toggle({
        Title = L("hw_attack"),
        Value = false,
        Callback = function(state)
            HalloweenFarm:Set(state)
        end,
    })
    Util.register("halloween_attack", HalloweenToggle)

    task.spawn(function()
        while isAlive() do
            local lines = {}

            for _, name in ipairs(HalloweenBossNames) do
                local label = halloweenGetHealthLabel(name)
                local healthText = "N/A"

                if label then
                    local current, maximum = label.Text:match("^%s*(.-)%s*/%s*(.-)%s*$")
                    if current and maximum then
                        local health = parseNumber(current)
                        local maxHealth = parseNumber(maximum)
                        if maxHealth > 0 then
                            local percent = math.floor(math.clamp(health / maxHealth * 100, 0, 100) + 0.5)
                            healthText = string.format("%s (%d%%)", label.Text, percent)
                        end
                    end
                end

                table.insert(lines, name .. " = " .. L("boss_health") .. ": " .. healthText)
            end

            pcall(function()
                HalloweenStatus:SetDesc(table.concat(lines, "\n"))
            end)

            task.wait(0.5)
        end
    end)

    local Webhook = {
        url = "",
        enabled = false,
        lastSent = {},
    }

    local WebhookHosts = {
        ["discord.com"] = true,
        ["discordapp.com"] = true,
        ["ptb.discord.com"] = true,
        ["canary.discord.com"] = true,
    }

    local function isValidWebhook(url)
        if type(url) ~= "string" then
            return false
        end
        local host = url:match("^https://([%w%.]+)/api/webhooks/%d+/[%w_%-]+$")
        return host ~= nil and WebhookHosts[host] == true
    end

    local function clip(text, limit)
        text = tostring(text)
        if #text > limit then
            return string.sub(text, 1, limit - 3) .. "..."
        end
        return text
    end

    local function attributeLines(instance, prefix)
        local lines = {}
        local ok, attributes = pcall(function()
            return instance:GetAttributes()
        end)
        if not ok or type(attributes) ~= "table" then
            return lines
        end

        local names = {}
        for name in pairs(attributes) do
            if not prefix or string.sub(name, 1, #prefix) == prefix then
                table.insert(names, name)
            end
        end
        table.sort(names)

        for _, name in ipairs(names) do
            table.insert(lines, "`" .. name .. "`: " .. tostring(attributes[name]))
        end
        return lines
    end

    local function serverField()
        local playerCount = #Players:GetPlayers()
        local maxPlayers = tonumber(Players.MaxPlayers) or 0
        local privateServerId = tostring(game.PrivateServerId or "")
        local privateOwnerId = tonumber(game.PrivateServerOwnerId) or 0

        local serverType = (privateServerId == "") and "Public" or "Private"
        local serverStatus

        if privateServerId ~= "" then
            if privateOwnerId == 0 then
                serverStatus = "No — reserved server"
            else
                serverStatus = "Unknown — private server permissions cannot be verified"
            end
        elseif maxPlayers > 0 and playerCount < maxPlayers then
            serverStatus = "Yes — public server has free slots"
        else
            serverStatus = "No — server is full"
        end

        return {
            name = "Information",
            value = clip(table.concat({
                "Server: " .. serverType,
                "Players: " .. playerCount .. "/" .. maxPlayers,
                "Server Status: " .. serverStatus,
                "Place ID: " .. tostring(game.PlaceId),
                "Game ID: " .. tostring(game.GameId),
                "Server ID: `" .. tostring(game.JobId) .. "`",
            }, "\n"), 1000),
            inline = false,
        }
    end

    local function joinField()
        local placeId = tostring(game.PlaceId)
        local serverId = tostring(game.JobId or "")
        local joinUrl = "https://www.roblox.com/games/start?placeId="
            .. placeId .. "&gameInstanceId=" .. serverId

        return {
            name = "Link Join Server",
            value = "[Click To Join](" .. joinUrl .. ")",
            inline = false,
        }
    end

    local function postWebhook(embed)
        local request = Logger.getRequest()
        if not request or not isValidWebhook(Webhook.url) then
            return false
        end

        local encodeOk, body = pcall(function()
            return HttpService:JSONEncode({
                username = Config.HubName,
                embeds = { embed },
            })
        end)
        if not encodeOk then
            return false
        end

        local ok, response = pcall(request, {
            Url = Webhook.url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body,
        })
        if not ok then
            return false
        end

        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    local function canSend(key)
        local now = os.clock()
        local last = Webhook.lastSent[key]
        if last and now - last < 3 then
            return false
        end
        Webhook.lastSent[key] = now
        return true
    end

    local function notifyMainBoss()
        if not Webhook.enabled or not canSend("boss") then
            return
        end

        for _ = 1, 10 do
            if workspace:GetAttribute("BossRarityName") and findBoss() then
                break
            end
            task.wait(0.3)
        end

        local rarity = tostring(workspace:GetAttribute("BossRarityName") or "Unknown")
        local fields = {
            {
                name = "Rarity",
                value = "**" .. clip(rarity, 200) .. "**",
                inline = false,
            },
            serverField(),
            joinField(),
        }

        postWebhook({
            title = "Boss Spawned",
            color = 0x7C3AED,
            image = {
                url = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notification%20Imagen.png"
            },
            fields = fields,
            footer = { text = Config.HubName },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        })
    end

    local function notifyHalloweenBoss(name)
        if not Webhook.enabled or not canSend("halloween_" .. name) then
            return
        end

        task.wait(1)

        local boss = workspace:FindFirstChild(name)
        local label = halloweenGetHealthLabel(name)

        local info = {
            "Boss: **" .. name .. "**",
            "Health: " .. (label and label.Text or "N/A"),
        }

        local extra = {}
        if boss and boss:IsA("Model") then
            local okBox, _, size = pcall(function()
                return boss:GetBoundingBox()
            end)
            if okBox and size then
                table.insert(info, string.format("Size: %.0f x %.0f x %.0f", size.X, size.Y, size.Z))
            end
            local okPivot, pivot = pcall(function()
                return boss:GetPivot()
            end)
            if okPivot and pivot then
                local position = pivot.Position
                table.insert(info, string.format("Position: %.0f, %.0f, %.0f", position.X, position.Y, position.Z))
            end
            extra = attributeLines(boss)
        end

        local fields = {
            { name = "Halloween boss", value = clip(table.concat(info, "\n"), 1000), inline = false },
        }
        if #extra > 0 then
            table.insert(fields, { name = "Attributes", value = clip(table.concat(extra, "\n"), 1000), inline = false })
        end
        table.insert(fields, serverField())
        table.insert(fields, joinField())

        postWebhook({
            title = "Halloween boss spawned: " .. name,
            color = 0xF97316,
            image = {
                url = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notification%20Imagen.png"
            },
            fields = fields,
            footer = { text = Config.HubName },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        })
    end

    table.insert(connections, workspace:GetAttributeChangedSignal("BossActive"):Connect(function()
        if workspace:GetAttribute("BossActive") == true then
            task.spawn(notifyMainBoss)
        end
    end))

    table.insert(connections, workspace.ChildAdded:Connect(function(child)
        if HalloweenBossCache[child.Name] ~= nil then
            task.spawn(notifyHalloweenBoss, child.Name)
        end
    end))

    Farm:Section({ Title = L("bw_section") })

    local WebhookInput = Farm:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            Webhook.url = clean
        end,
    })
    Util.register("boss_webhook_url", WebhookInput)

    local WebhookToggle = Farm:Toggle({
        Title = L("bw_toggle"),
        Desc = L("bw_toggle_desc"),
        Value = false,
        Callback = function(state)
            Webhook.enabled = state
        end,
    })
    Util.register("boss_webhook", WebhookToggle)

    Farm:Button({
        Title = L("bw_test"),
        Icon = "send",
        Callback = function()
            if not Logger.getRequest() then
                Util.notify(L("bw_section"), L("bw_no_http"), "triangle-alert")
                return
            end
            if not isValidWebhook(Webhook.url) then
                Util.notify(L("bw_section"), L("bw_invalid"), "triangle-alert")
                return
            end

            task.spawn(function()
                local sent = postWebhook({
                    title = "Webhook test",
                    description = "Boss notifications are working.",
                    color = 0x22C55E,
                    fields = { serverField() },
                    footer = { text = Config.HubName },
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                })
                if sent then
                    Util.notify(L("bw_section"), L("bw_test_ok"), "check")
                else
                    Util.notify(L("bw_section"), L("bw_test_fail"), "triangle-alert")
                end
            end)
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        pcall(function()
            HalloweenFarm:Set(false)
        end)
        pcall(function()
            BossFarm.active = false
            BossFarm.generation = BossFarm.generation + 1
            BossFarm:StopDurability()
            BossFarm:RestoreBattle()
            BossFarm:SetAntiLag(false)
        end)
        for _, connection in ipairs(connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
    end)
end

do
    local Packs = Tabs.Packs

    local REBIRTH_CYCLE = 6
    local REBIRTH_TOLERANCE = 0.75

    local function remote(name)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        return events and events:FindFirstChild(name)
    end

    local function getStat(parentName, statName)
        local parent = parentName and LocalPlayer:FindFirstChild(parentName) or LocalPlayer
        local stat = parent and parent:FindFirstChild(statName)
        return stat and tonumber(stat.Value) or 0
    end

    local function getStrength()
        return getStat("leaderstats", "Strength")
    end

    local function getDurability()
        return getStat(nil, "Durability")
    end

    local function getRebirths()
        return getStat("leaderstats", "Rebirths")
    end

    local function formatNumber(n)
        n = tonumber(n) or 0
        local sign = ""
        if n < 0 then
            sign = "-"
        end
        n = math.abs(n)

        if n >= 1e15 then
            return sign .. string.format("%.2fQA", n / 1e15)
        elseif n >= 1e12 then
            return sign .. string.format("%.2fT", n / 1e12)
        elseif n >= 1e9 then
            return sign .. string.format("%.2fB", n / 1e9)
        elseif n >= 1e6 then
            return sign .. string.format("%.2fM", n / 1e6)
        elseif n >= 1e3 then
            return sign .. string.format("%.2fK", n / 1e3)
        end
        return sign .. string.format("%.0f", n)
    end

    local function formatRaw(n)
        local text = string.format("%.0f", math.floor(tonumber(n) or 0))
        local sign = ""
        if text:sub(1, 1) == "-" then
            sign = "-"
            text = text:sub(2)
        end
        local reversed = text:reverse()
        reversed = reversed:gsub("(%d%d%d)", "%1,")
        local result = reversed:reverse()
        result = result:gsub("^,", "")
        return sign .. result
    end

    local function formatBoth(n)
        n = tonumber(n) or 0
        local raw = formatRaw(n)
        if math.abs(n) < 1000 then
            return raw
        end
        return raw .. " [" .. formatNumber(n) .. "]"
    end

    local function formatDuration(seconds)
        seconds = math.max(0, math.floor(seconds))
        return string.format(
            "%dd %dh %dm %ds",
            math.floor(seconds / 86400),
            math.floor(seconds % 86400 / 3600),
            math.floor(seconds % 3600 / 60),
            seconds % 60
        )
    end

    local function rateList(perSecond, formatter)
        local hourly = math.max(0, tonumber(perSecond) or 0) * 3600
        return table.concat({
            L("pk_hour") .. " = " .. formatter(hourly),
            L("pk_day") .. " = " .. formatter(hourly * 24),
            L("pk_week") .. " = " .. formatter(hourly * 168),
            L("pk_month") .. " = " .. formatter(hourly * 720),
        }, "\n")
    end

    local function setDesc(paragraph, text)
        pcall(function()
            paragraph:SetDesc(text)
        end)
    end

    local repsPerTick = 1
    local fastRepEnabled = false
    local fastRepRunning = false

    local track = {
        startTime = 0,
        paused = 0,
        running = false,
        initStrength = 0,
        initDurability = 0,
        strengthHistory = {},
        durabilityHistory = {},
        interval = 10,
    }

    Packs:Paragraph({
        Title = L("pk_recommended"),
        Desc = "",
    })

    local RepsInput = Packs:Input({
        Title = L("pk_reps_speed"),
        Placeholder = "40",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                repsPerTick = math.floor(n)
            end
        end,
    })
    Util.register("reps_speed", RepsInput)

    local function fastRepLoop()
        while fastRepEnabled and isAlive() do
            if Util.getPing() < 3000 then
                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    for _ = 1, repsPerTick do
                        muscleEvent:FireServer("rep")
                    end
                end
            end
            task.wait()
        end
        fastRepRunning = false
    end

    local StartToggle = Packs:Toggle({
        Title = L("pk_start"),
        Value = false,
        Callback = function(state)
            fastRepEnabled = state

            if state then
                local now = os.clock()
                if track.paused == 0 then
                    track.initStrength = getStrength()
                    track.initDurability = getDurability()
                    track.strengthHistory = {}
                    track.durabilityHistory = {}
                end
                track.startTime = now
                track.running = true

                if not fastRepRunning then
                    fastRepRunning = true
                    task.spawn(fastRepLoop)
                end
            elseif track.running then
                track.paused = track.paused + (os.clock() - track.startTime)
                track.running = false
            end
        end,
    })
    Util.register("fast_reps", StartToggle)

    local autoEgg = false
    local eggRunning = false

        local function eatProteinEgg()
        local char = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if not char or not backpack or not humanoid then
            return
        end

        local egg = char:FindFirstChild("Protein Egg") or backpack:FindFirstChild("Protein Egg")
        if not egg then
            return
        end

        if egg.Parent ~= char then
            pcall(humanoid.EquipTool, humanoid, egg)
            task.wait(0.15)
        end

        local held = char:FindFirstChild("Protein Egg")
        local event = held and (held:IsA("RemoteEvent") and held or held:FindFirstChildWhichIsA("RemoteEvent", true))
        if event then
            pcall(function()
                event:FireServer()
            end)
        end
    end

    local EggToggle = Packs:Toggle({
        Title = L("pk_egg"),
        Value = false,
        Callback = function(state)
            autoEgg = state

            if state and not eggRunning then
                eggRunning = true
                task.spawn(function()
                    while autoEgg and isAlive() do
                        pcall(eatProteinEgg)
                        for _ = 1, 1800 do
                            if not autoEgg or not isAlive() then
                                break
                            end
                            task.wait(1)
                        end
                    end
                    eggRunning = false
                end)
            end
        end,
    })
    Util.register("auto_egg", EggToggle)

    local autoSpin = false
    local spinRunning = false

    local SpinToggle = Packs:Toggle({
        Title = L("pk_spin"),
        Value = false,
        Callback = function(state)
            autoSpin = state

            if state and not spinRunning then
                spinRunning = true
                task.spawn(function()
                    while autoSpin and isAlive() do
                        local wheel = remote("openFortuneWheelRemote")
                        local sharedFolder = ReplicatedStorage:FindFirstChild("shared")
                        local catalogs = sharedFolder and sharedFolder:FindFirstChild("catalogs")
                        local chancesFolder = catalogs and catalogs:FindFirstChild("fortuneWheelChances")
                        local chances = chancesFolder and chancesFolder:FindFirstChild("Fortune Wheel")
                        if wheel and chances then
                            pcall(function()
                                wheel:InvokeServer("openFortuneWheel", chances)
                            end)
                        end
                        task.wait(1)
                    end
                    spinRunning = false
                end)
            end
        end,
    })
    Util.register("auto_spin", SpinToggle)

    local function teleportAndUseMachine(cf, machineName)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then
            return
        end

        root.CFrame = cf
        task.wait(0.2)

        local folder = workspace:FindFirstChild("machinesFolder")
        local machine = folder and folder:FindFirstChild(machineName)
        local interact = remote("machineInteractRemote")
        local seat = machine and machine:FindFirstChild("interactSeat")

        if interact and seat then
            pcall(function()
                interact:InvokeServer("useMachine", seat)
            end)
        end
    end

    Packs:Button({
        Title = L("pk_ind_squat"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(-5219.5, 59, 5419.8), "Industrial Squat")
        end,
    })

    Packs:Button({
        Title = L("pk_hal_squat"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(4812.03, 83.21, 5839.05), "Hallowed Squat")
        end,
    })

    local function forEachPet(folder, callback)
        if not folder then
            return
        end
        for _, group in ipairs(folder:GetChildren()) do
            if group:IsA("Folder") then
                for _, pet in ipairs(group:GetChildren()) do
                    callback(pet)
                end
            end
        end
    end

    local function petAction(action, pet)
        local equipEvent = remote("equipPetEvent")
        if equipEvent then
            pcall(function()
                equipEvent:FireServer(action, pet)
            end)
        end
    end

    local function unequipAllPets()
        local folder = LocalPlayer:FindFirstChild("petsFolder")
        forEachPet(folder, function(pet)
            petAction("unequipPet", pet)
        end)
        task.wait(0.1)
    end

    local function equipPriorityPets(names)
        local folder = LocalPlayer:FindFirstChild("petsFolder")
        if not folder then
            return
        end

        local equipped = 0
        for _, name in ipairs(names) do
            if equipped >= 12 then
                break
            end
            forEachPet(folder, function(pet)
                if equipped < 12 and pet.Name == name then
                    petAction("equipPet", pet)
                    equipped = equipped + 1
                end
            end)
        end
    end

    Packs:Button({
        Title = L("pk_best_pets"),
        Callback = function()
            task.spawn(function()
                local folder = LocalPlayer:FindFirstChild("petsFolder")
                if not folder then
                    return
                end

                local petsByName = {}
                forEachPet(folder, function(pet)
                    petsByName[pet.Name] = petsByName[pet.Name] or {}
                    table.insert(petsByName[pet.Name], pet)
                end)

                local infernoCount = #(petsByName["Inferno Drake"] or {})

                local omegaCount = 5
                if infernoCount == 1 then
                    omegaCount = 3
                elseif infernoCount == 2 then
                    omegaCount = 1
                elseif infernoCount >= 3 then
                    omegaCount = 0
                end

                local powercoreCount = 7
                if infernoCount == 1 then
                    powercoreCount = 8
                elseif infernoCount >= 2 then
                    powercoreCount = 9
                end

                forEachPet(folder, function(pet)
                    petAction("unequipPet", pet)
                    task.wait(0.1)
                end)

                local equipped = 0
                local target = 12

                local function equip(name, amount)
                    local pool = petsByName[name] or {}
                    local count = math.min(amount, #pool, target - equipped)

                    for i = 1, count do
                        petAction("equipPet", pool[i])
                        task.wait(0.1)
                        equipped = equipped + 1
                    end
                end

                equip("Inferno Drake", infernoCount)
                equip("Omega Overlord", omegaCount)
                equip("Powercore Hound", powercoreCount)

                for _, name in ipairs({
                    "Omega Overlord",
                    "Swift Samurai",
                    "Mythic Boss Pet",
                    "Legendary Boss Pet",
                    "Rainbow Boss Pet",
                    "Epic Boss Pet",
                    "Rare Boss Pet",
                    "Common Boss Pet",
                }) do
                    if equipped >= target then
                        break
                    end
                    equip(name, target - equipped)
                end
            end)
        end,
    })

    Packs:Divider()

    local zeroRates = rateList(0, formatBoth)

    local InfoParagraph = Packs:Paragraph({
        Title = L("pk_time_title"),
        Desc = L("pk_time") .. ": 0d 0h 0m 0s\n"
            .. L("pk_fastreps") .. ": " .. L("pk_off") .. "\n"
            .. L("pk_ping") .. ": 0 ms",
    })

    local StrengthParagraph = Packs:Paragraph({
        Title = L("pk_str_calc"),
        Desc = zeroRates,
    })

    local DurabilityParagraph = Packs:Paragraph({
        Title = L("pk_dur_calc"),
        Desc = zeroRates,
    })

    local TotalsParagraph = Packs:Paragraph({
        Title = L("pk_totals"),
        Desc = L("pk_strength") .. ": 0\n"
            .. L("pk_gained") .. ": 0\n\n"
            .. L("pk_durability") .. ": 0\n"
            .. L("pk_gained") .. ": 0",
    })

    task.spawn(function()
        local lastCalc = os.clock()
        local strengthRates = zeroRates
        local durabilityRates = zeroRates

        local function render(elapsed, statusText, ping, strength, durability)
            setDesc(InfoParagraph, table.concat({
                L("pk_time") .. ": " .. formatDuration(elapsed),
                L("pk_fastreps") .. ": " .. statusText,
                L("pk_ping") .. ": " .. ping .. " ms",
            }, "\n"))

            setDesc(StrengthParagraph, strengthRates)
            setDesc(DurabilityParagraph, durabilityRates)

            setDesc(TotalsParagraph, table.concat({
                L("pk_strength") .. ": " .. formatBoth(strength),
                L("pk_gained") .. ": " .. formatBoth(strength - track.initStrength),
                "",
                L("pk_durability") .. ": " .. formatBoth(durability),
                L("pk_gained") .. ": " .. formatBoth(durability - track.initDurability),
            }, "\n"))
        end

        while isAlive() do
            task.wait(0.5)

            local now = os.clock()
            local strength = getStrength()
            local durability = getDurability()
            local ping = Util.getPing()

            if track.running then
                local elapsed = track.paused + (now - track.startTime)

                table.insert(track.strengthHistory, { time = now, value = strength })
                table.insert(track.durabilityHistory, { time = now, value = durability })

                while track.strengthHistory[1]
                    and now - track.strengthHistory[1].time > track.interval do
                    table.remove(track.strengthHistory, 1)
                end
                while track.durabilityHistory[1]
                    and now - track.durabilityHistory[1].time > track.interval do
                    table.remove(track.durabilityHistory, 1)
                end

                if now - lastCalc >= track.interval then
                    lastCalc = now

                    local sh = track.strengthHistory
                    local dh = track.durabilityHistory

                    if #sh >= 2 and sh[#sh].time > sh[1].time then
                        strengthRates = rateList(
                            (sh[#sh].value - sh[1].value) / (sh[#sh].time - sh[1].time),
                            formatBoth
                        )
                    end

                    if #dh >= 2 and dh[#dh].time > dh[1].time then
                        durabilityRates = rateList(
                            (dh[#dh].value - dh[1].value) / (dh[#dh].time - dh[1].time),
                            formatBoth
                        )
                    end
                end

                render(elapsed, L("pk_running"), ping, strength, durability)
            elseif track.paused > 0 then
                render(track.paused, L("pk_stopped"), ping, strength, durability)
            else
                render(0, L("pk_off"), ping, strength, durability)
            end
        end
    end)

    local RebirthFolder = Packs:Section({
        Title = L("pk_rebirth_section"),
        Icon = "repeat",
        Opened = true,
    })

    RebirthFolder:Paragraph({
        Title = L("pk_important_title"),
        Desc = L("pk_important"),
    })

    local zeroRebirths = rateList(0, formatBoth)

    local RebirthInfoParagraph = RebirthFolder:Paragraph({
        Title = L("pk_rebirth_title"),
        Desc = L("pk_time") .. ": 0d 0h 0m 0s\n"
            .. L("pk_rebirths") .. ": 0\n"
            .. L("pk_rebirths_gained") .. ": 0\n"
            .. L("pk_status") .. ": " .. L("pk_inactive"),
    })

    local RebirthRateParagraph = RebirthFolder:Paragraph({
        Title = L("pk_rb_calc"),
        Desc = zeroRebirths,
    })

    local fastRebirth = false
    local rbGen = 0

    local rbTrack = {
        startTime = 0,
        paused = 0,
        tracking = false,
        initial = 0,
        events = {},
    }

    local function renderRebirthInfo()
        local current = getRebirths()
        local elapsed = rbTrack.paused
        local status = L("pk_inactive")

        if rbTrack.tracking then
            elapsed = rbTrack.paused + (os.clock() - rbTrack.startTime)
            status = L("pk_active")
        end

        setDesc(RebirthInfoParagraph, table.concat({
            L("pk_time") .. ": " .. formatDuration(elapsed),
            L("pk_rebirths") .. ": " .. formatBoth(current),
            L("pk_rebirths_gained") .. ": " .. formatBoth(current - rbTrack.initial),
            L("pk_status") .. ": " .. status,
        }, "\n"))
    end

    task.spawn(function()
        while isAlive() do
            task.wait(1)
            renderRebirthInfo()
        end
    end)

    local function updateRebirthRate()
        local events = rbTrack.events
        if #events < 2 then
            return
        end

        local first = events[1]
        local last = events[#events]
        local span = last.time - first.time
        local gained = last.count - first.count

        if span <= 0 or gained <= 0 then
            return
        end

        local interval = span / gained
        if math.abs(interval - REBIRTH_CYCLE) <= REBIRTH_TOLERANCE then
            interval = REBIRTH_CYCLE
        end

        setDesc(RebirthRateParagraph, rateList(1 / interval, formatBoth))
    end

    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    local rebirthValue = leaderstats and leaderstats:FindFirstChild("Rebirths")

    if rebirthValue then
        local rebirthConnection = nil
        rebirthConnection = rebirthValue:GetPropertyChangedSignal("Value"):Connect(function()
            if not isAlive() then
                rebirthConnection:Disconnect()
                return
            end
            if not rbTrack.tracking then
                return
            end

            table.insert(rbTrack.events, { time = os.clock(), count = tonumber(rebirthValue.Value) or 0 })
            while #rbTrack.events > 10 do
                table.remove(rbTrack.events, 1)
            end

            updateRebirthRate()
        end)
    end

    local function getStrengthRequiredForRebirth()
        local rebirths = getRebirths()

        local golden = 0
        local ultimates = LocalPlayer:FindFirstChild("ultimatesFolder")
        local goldenValue = ultimates and ultimates:FindFirstChild("Golden Rebirth")
        if goldenValue then
            golden = tonumber(goldenValue.Value) or 0
        end

        local base = 10000 + 2500 * rebirths
        if golden >= 1 and golden <= 5 then
            base = base * (1 - golden * 0.1)
        end

        return math.floor(base)
    end

    local FastRebirthToggle = RebirthFolder:Toggle({
        Title = L("pk_fast_rebirths"),
        Value = false,
        Callback = function(state)
            fastRebirth = state
            rbGen = rbGen + 1
            local gen = rbGen

            if not state then
                if rbTrack.tracking then
                    rbTrack.paused = rbTrack.paused + (os.clock() - rbTrack.startTime)
                    rbTrack.tracking = false
                end

                renderRebirthInfo()
                setDesc(RebirthRateParagraph, zeroRebirths)
                return
            end

            local now = os.clock()
            local current = getRebirths()

            rbTrack.startTime = now
            rbTrack.paused = 0
            rbTrack.tracking = true
            rbTrack.initial = current
            rbTrack.events = { { time = now, count = current } }

            renderRebirthInfo()
            setDesc(RebirthRateParagraph, zeroRebirths)

            task.spawn(function()
                while fastRebirth and isAlive() and rbGen == gen do
                    local requiredStrength = getStrengthRequiredForRebirth()

                    unequipAllPets()
                    equipPriorityPets({
                        "Omega Overlord",
                        "Swift Samurai",
                        "Mythic Boss Pet",
                        "Legendary Boss Pet",
                        "Rainbow Boss Pet",
                        "Epic Boss Pet",
                        "Rare Boss Pet",
                        "Common Boss Pet",
                    })

                    while getStrength() < requiredStrength and fastRebirth and isAlive() and rbGen == gen do
                        local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                        if muscleEvent then
                            for _ = 1, 10 do
                                muscleEvent:FireServer("rep")
                            end
                        end
                        task.wait()
                    end

                    if fastRebirth and isAlive() and rbGen == gen then
                        unequipAllPets()
                        equipPriorityPets({ "Titanium Hydra", "Tribal Overlord" })

                        local oldRebirths = getRebirths()
                        local rebirthRemote = remote("rebirthRemote")

                        repeat
                            if rebirthRemote then
                                pcall(function()
                                    rebirthRemote:InvokeServer("rebirthRequest")
                                end)
                            end
                            task.wait(0.1)
                        until getRebirths() > oldRebirths or not fastRebirth or not isAlive() or rbGen ~= gen
                    end

                    task.wait()
                end
            end)
        end,
    })
    Util.register("fast_rebirth", FastRebirthToggle)

    RebirthFolder:Button({
        Title = L("pk_ind_lift"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(-5491.4, 59, 4644.6), "Industrial Lift")
        end,
    })

    RebirthFolder:Button({
        Title = L("pk_hal_lift"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(5740.17, 83.79, 6415.02), "Hallowed Bar Lift")
        end,
    })
end

do
    local Extras = Tabs.Extras
    local Lighting = game:GetService("Lighting")

    local function remote(name)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        return events and events:FindFirstChild(name)
    end

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

    local autoSpin = false
    local spinRunning = false
    local AutoSpinToggle

    local function getFortuneChances()
        local shared = ReplicatedStorage:FindFirstChild("shared")
        local catalogs = shared and shared:FindFirstChild("catalogs")
        local chances = catalogs and catalogs:FindFirstChild("fortuneWheelChances")
        return chances and chances:FindFirstChild("Fortune Wheel")
    end

    AutoSpinToggle = Extras:Toggle({
        Title = L("ex_autospin"),
        Desc = L("ex_autospin_desc"),
        Value = false,
        Callback = function(state)
            autoSpin = state

            if state and not spinRunning then
                spinRunning = true

                task.spawn(function()
                    while autoSpin and isAlive() do
                        local wheel = remote("openFortuneWheelRemote")
                        local chances = getFortuneChances()

                        if not wheel or not chances then
                            autoSpin = false
                            Util.notify(L("ex_autospin"), L("ex_spin_missing"), "triangle-alert")
                            task.defer(function()
                                pcall(function()
                                    AutoSpinToggle:Set(false)
                                end)
                            end)
                            break
                        end

                        pcall(function()
                            wheel:InvokeServer("openFortuneWheel", chances)
                        end)
                        task.wait(1)
                    end
                    spinRunning = false
                end)
            end
        end,
    })
    Util.register("ex_auto_spin", AutoSpinToggle)

    local HidePetsToggle = Extras:Toggle({
        Title = L("ex_hidepets"),
        Desc = L("ex_hidepets_desc"),
        Value = false,
        Callback = function(state)
            local event = remote("showPetsEvent")
            if event then
                pcall(function()
                    event:FireServer(state and "hidePets" or "showPets")
                end)
            end
        end,
    })
    Util.register("ex_hide_pets", HidePetsToggle)

    Extras:Toggle({
        Title = L("ex_hidepopups"),
        Desc = L("ex_hidepopups_desc"),
        Value = false,
        Callback = function()
            local event = remote("savePlayerSizeEvent")
            if event then
                pcall(function()
                    event:FireServer("showPopupsOption")
                end)
            end
        end,
    })

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
        autoSpin = false

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
    local Snacks = Tabs.Snacks
end

do
    local Data = Tabs.Data
end

do
    local Stats = Tabs.Stats

    local Spy = {
        selectedName = "",
        lastText = "",
        connections = {},
    }

    local SPY_UNITS = {
        { 1e33, "DC" },
        { 1e30, "NO" },
        { 1e27, "OC" },
        { 1e24, "SP" },
        { 1e21, "SX" },
        { 1e18, "QI" },
        { 1e15, "QA" },
        { 1e12, "T" },
        { 1e9, "B" },
        { 1e6, "M" },
        { 1e3, "K" },
    }

    local function formatSpy(value)
        value = tonumber(value) or 0

        local digits = string.format("%.0f", value)
        local grouped = digits:reverse():gsub("(%d%d%d)", "%1,")
        grouped = grouped:reverse()
        grouped = grouped:gsub("^,", "")

        local short = tostring(math.floor(value))
        for _, unit in ipairs(SPY_UNITS) do
            if value >= unit[1] then
                short = string.format("%.2f%s", value / unit[1], unit[2])
                break
            end
        end

        return "[ " .. grouped .. " | " .. short .. " ]"
    end

    local function buildPlayerList()
        local list = {}
        for _, player in ipairs(Players:GetPlayers()) do
            table.insert(list, player.Name .. " - " .. player.DisplayName)
        end
        return list
    end

    local PlayerDropdown = Stats:Dropdown({
        Title = L("st_select_player"),
        Values = buildPlayerList(),
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            if type(option) == "string" and option ~= "" then
                Spy.selectedName = option:match("^(%S+)") or ""
            else
                Spy.selectedName = ""
            end
        end,
    })

    local function refreshPlayers()
        pcall(function()
            PlayerDropdown:Refresh(buildPlayerList())
        end)
    end

    table.insert(Spy.connections, Players.PlayerAdded:Connect(refreshPlayers))
    table.insert(Spy.connections, Players.PlayerRemoving:Connect(function(player)
        if player.Name == Spy.selectedName then
            Spy.selectedName = ""
        end
        task.delay(0.5, refreshPlayers)
    end))

    local spyFields = {
        { obj = "Strength", label = "st_strength", leader = true },
        { obj = "Gems", label = "st_gems" },
        { obj = "Agility", label = "st_agility" },
        { obj = "Rebirths", label = "st_rebirths", leader = true },
        { obj = "Durability", label = "st_durability" },
        { obj = "Kills", label = "st_kills", leader = true },
        { obj = "muscleKingTime", label = "st_mk_time" },
        { obj = "currentMap", label = "st_map", raw = true },
        { obj = "evilKarma", label = "st_evil" },
        { obj = "goodKarma", label = "st_good" },
    }

    local function countPets(entity, a, b)
        local pets = entity and entity:FindFirstChild("equippedPets")
        if not pets then
            return 0
        end

        local count = 0
        for _, pet in ipairs(pets:GetChildren()) do
            local ref = pet:FindFirstChild("petReference")
            local name = ref and tostring(ref.Value):lower()
            if name and name:match(a) and name:match(b) then
                count = count + 1
            end
        end
        return count
    end

    local function getPlayerHealth(entity)
        local character = entity and entity.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        return humanoid and humanoid.MaxHealth or 0
    end

    local function getMyDamage()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        local strength = leaderstats and leaderstats:FindFirstChild("Strength")
        if not strength then
            return 0
        end
        return strength.Value * 0.1 * (1 + countPets(LocalPlayer, "wild", "wizard") / 3)
    end

    local function hitsToKill(health, damage)
        if damage <= 0 then
            return "∞"
        end
        local hits = math.ceil(health / damage)
        if hits > 50 then
            return "∞"
        end
        return tostring(math.max(hits, 1))
    end

    local function buildText()
        local selected = Spy.selectedName
        local target = nil
        if selected ~= "" then
            target = Players:FindFirstChild(selected)
        end

        local lines = {}

        for _, field in ipairs(spyFields) do
            local value

            if selected == "" then
                value = field.raw and "N/A" or "0"
            elseif not target then
                value = L("st_not_found")
            else
                local source = target
                if field.leader then
                    source = target:FindFirstChild("leaderstats")
                end

                local object = source and source:FindFirstChild(field.obj)
                if not object then
                    value = field.raw and L("st_no_data") or "N/A"
                elseif field.raw then
                    value = tostring(object.Value)
                else
                    value = formatSpy(object.Value)
                end
            end

            table.insert(lines, L(field.label) .. ": " .. value)
        end

        local enemyHealth, yourDamage, hits = "N/A", "N/A", "N/A"
        if target then
            local health = getPlayerHealth(target)
            local damage = getMyDamage()
            enemyHealth = formatSpy(health)
            yourDamage = formatSpy(damage)
            hits = hitsToKill(health, damage)
        end

        table.insert(lines, "")
        table.insert(lines, L("st_advanced"))
        table.insert(lines, L("st_enemy_health") .. ": " .. enemyHealth)
        table.insert(lines, L("st_your_damage") .. ": " .. yourDamage)
        table.insert(lines, L("st_hits") .. ": " .. hits)

        return table.concat(lines, "\n")
    end

    local SpyParagraph = Stats:Paragraph({
        Title = L("st_player_stats"),
        Desc = L("home_loading"),
    })

    task.spawn(function()
        while isAlive() do
            local ok, text = pcall(buildText)
            if ok and text ~= Spy.lastText then
                Spy.lastText = text
                pcall(function()
                    SpyParagraph:SetDesc(text)
                end)
            end
            task.wait(0.25)
        end
    end)

    local Fake = {
        records = {},
        originals = setmetatable({}, { __mode = "k" }),
        applying = false,
        presenting = false,
        inputs = {},
    }

    local fakeDefinitions = {
        { key = "Strength", names = { "Strength", "Fuerza" }, title = "st_strength" },
        { key = "Rebirths", names = { "Rebirths", "Rebirth" }, title = "st_rebirths" },
        { key = "Kills", names = { "Kills" }, title = "st_kills" },
        { key = "Fights", names = { "Brawls", "Fights", "Fight" }, title = "st_brawls" },
        { key = "Durability", names = { "Durability", "Durabilidad" }, title = "st_durability" },
        { key = "Gems", names = { "Gems", "Gemas" }, title = "st_gems" },
    }

    local FAKE_MULTIPLIERS = {
        K = 1e3,
        M = 1e6,
        B = 1e9,
        T = 1e12,
        QA = 1e15,
        QI = 1e18,
        SX = 1e21,
        SP = 1e24,
        OC = 1e27,
        NO = 1e30,
        DC = 1e33,
    }

    local FAKE_UNITS = {
        { 1e33, "DC" },
        { 1e30, "NO" },
        { 1e27, "OC" },
        { 1e24, "SP" },
        { 1e21, "SX" },
        { 1e18, "QI" },
        { 1e15, "QA" },
        { 1e12, "T" },
        { 1e9, "B" },
        { 1e6, "M" },
        { 1e3, "K" },
    }

    local function parseFakeNumber(text)
        text = tostring(text or ""):upper():gsub("%s+", "")

        local number, suffix = text:match("^([%d%.]+)(%a*)$")
        number = tonumber(number)
        if not number or number < 0 or number ~= number then
            return nil
        end

        local multiplier = 1
        if suffix ~= "" then
            multiplier = FAKE_MULTIPLIERS[suffix]
        end
        if not multiplier then
            return nil
        end

        return math.floor(number * multiplier + 0.5)
    end

    local function formatFakeNumber(value)
        value = tonumber(value) or 0

        for _, unit in ipairs(FAKE_UNITS) do
            if value >= unit[1] then
                local n = value / unit[1]
                local pattern = "%.2f%s"
                if n >= 100 then
                    pattern = "%.0f%s"
                elseif n >= 10 then
                    pattern = "%.1f%s"
                end
                return string.format(pattern, n, unit[2])
            end
        end

        return string.format("%.0f", value)
    end

    local function findFakeStat(names)
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")

        for _, name in ipairs(names) do
            local stat = leaderstats and leaderstats:FindFirstChild(name)
            if stat and (stat:IsA("IntValue") or stat:IsA("NumberValue")) then
                return stat
            end
        end

        for _, name in ipairs(names) do
            local stat = LocalPlayer:FindFirstChild(name)
            if stat and (stat:IsA("IntValue") or stat:IsA("NumberValue")) then
                return stat
            end
        end

        return nil
    end

    local function captureLabels(key, record)
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        local gameGui = playerGui and playerGui:FindFirstChild("gameGui")
        if not gameGui then
            return
        end

        local currencyRoot = gameGui:FindFirstChild("currencyFrameGui")
        local currency = currencyRoot and currencyRoot:FindFirstChild("currencyFrame")
        local statsMenu = gameGui:FindFirstChild("statsMenu")
        local statsList = statsMenu and statsMenu:FindFirstChild("statsList")
        local bottom = statsMenu and statsMenu:FindFirstChild("bottomStatList")
        local hud = gameGui:FindFirstChild("hudNewMenu")
        local top = hud and hud:FindFirstChild("Top")
        local slots = top and top:FindFirstChild("InfoSlots")

        local specs = {
            Strength = {
                { statsList, "strengthFrame", "amountLabel" },
                { currency, "strengthFrame", "amountLabel" },
                { slots, "StrengthSlot", "Amnt" },
            },
            Gems = {
                { currency, "gemsFrame", "amountLabel" },
                { slots, "GemSlot", "Amnt" },
            },
            Rebirths = { { bottom, "rebirthsFrame", "statLabel" } },
            Fights = { { bottom, "brawlsFrame", "statLabel" } },
            Kills = { { bottom, "killsFrame", "statLabel" } },
            Durability = {
                { statsList, "durabilityFrame", "amountLabel" },
                { currency, "durabilityFrame", "amountLabel" },
                { slots, "DurabilitySlot", "Amnt" },
            },
        }

        for _, spec in ipairs(specs[key] or {}) do
            local holder = spec[1] and spec[1]:FindFirstChild(spec[2])
            local label = holder and holder:FindFirstChild(spec[3])

            if label and label:IsA("TextLabel") then
                if not Fake.originals[label] then
                    Fake.originals[label] = {
                        Text = label.Text,
                        TextTransparency = label.TextTransparency,
                        TextStrokeTransparency = label.TextStrokeTransparency,
                    }
                end
                if not table.find(record.labels, label) then
                    table.insert(record.labels, label)
                end
            end
        end
    end

    local function restoreLabel(label)
        local original = Fake.originals[label]
        if label and label.Parent and original then
            label.Text = original.Text
            label.TextTransparency = original.TextTransparency
            label.TextStrokeTransparency = original.TextStrokeTransparency
        end
        Fake.originals[label] = nil
    end

    local function applyLabels()
        for key, record in pairs(Fake.records) do
            local text = formatFakeNumber(record.value)

            if key == "Fights" then
                text = "Brawls - " .. text
            elseif key == "Kills" then
                text = "KOs - " .. text
            elseif key == "Rebirths" then
                text = "Rebirths - " .. text
            end

            for _, label in ipairs(record.labels) do
                if label and label.Parent then
                    label.Text = text
                end
            end
        end
    end

    local function startPresentation()
        if Fake.presenting then
            return
        end
        Fake.presenting = true

        task.spawn(function()
            while isAlive() and next(Fake.records) ~= nil do
                if not Fake.applying then
                    for key, record in pairs(Fake.records) do
                        captureLabels(key, record)
                    end
                    applyLabels()
                end
                task.wait(0.5)
            end
            Fake.presenting = false
        end)
    end

    local function clearStat(key)
        local record = Fake.records[key]
        if not record then
            return
        end
        Fake.records[key] = nil

        if record.connection then
            record.connection:Disconnect()
        end

        if record.object and record.object.Parent then
            Fake.applying = true
            pcall(function()
                record.object.Value = record.realValue
            end)
            Fake.applying = false
        end

        for _, label in ipairs(record.labels) do
            restoreLabel(label)
        end
    end

    local function changeStat(definition, text)
        if not text or tostring(text):match("^%s*$") then
            clearStat(definition.key)
            return
        end

        local value = parseFakeNumber(text)
        local stat = findFakeStat(definition.names)
        if not value or not stat then
            Util.notify(L("error"), L("st_fake_invalid"), "triangle-alert")
            return
        end

        clearStat(definition.key)

        local record = {
            object = stat,
            realValue = stat.Value,
            value = value,
            labels = {},
        }
        Fake.records[definition.key] = record

        captureLabels(definition.key, record)

        record.connection = stat:GetPropertyChangedSignal("Value"):Connect(function()
            if Fake.applying or not isAlive() or Fake.records[definition.key] ~= record then
                return
            end
            if stat.Value ~= value then
                record.realValue = stat.Value
                Fake.applying = true
                pcall(function()
                    stat.Value = value
                end)
                Fake.applying = false
            end
        end)

        Fake.applying = true
        pcall(function()
            stat.Value = value
        end)
        Fake.applying = false

        applyLabels()
        startPresentation()
    end

    local function restoreAll()
        for key in pairs(Fake.records) do
            clearStat(key)
        end
        for label in pairs(Fake.originals) do
            restoreLabel(label)
        end
    end

    Stats:Section({ Title = L("st_fake_section") })

    Stats:Paragraph({
        Title = L("st_fake_title"),
        Desc = L("st_fake_desc"),
    })

    for _, definition in ipairs(fakeDefinitions) do
        Fake.inputs[definition.key] = Stats:Input({
            Title = L(definition.title),
            Placeholder = "",
            Value = "",
            Callback = function(text)
                changeStat(definition, text)
            end,
        })
    end

    Stats:Button({
        Title = L("st_fake_restore"),
        Icon = "rotate-ccw",
        Callback = function()
            restoreAll()
            for _, input in pairs(Fake.inputs) do
                pcall(function()
                    input:Set("")
                end)
            end
            Util.notify(L("st_fake_title"), L("st_fake_restored"), "check")
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        for _, connection in ipairs(Spy.connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        pcall(restoreAll)
    end)

        local NOTIFY_COLOR = 0x170158
    local NOTIFY_NAME = "Mystery Notification"
    local NOTIFY_IMAGE = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notification%20Imagen.png"

    local hubStart = os.clock()

    local hookHosts = {
        ["discord.com"] = true,
        ["discordapp.com"] = true,
        ["ptb.discord.com"] = true,
        ["canary.discord.com"] = true,
    }

    local function isValidHook(url)
        if type(url) ~= "string" then
            return false
        end
        local host = url:match("^https://([%w%.]+)/api/webhooks/%d+/[%w_%-]+$")
        return host ~= nil and hookHosts[host] == true
    end

    local function clip(text, limit)
        text = tostring(text)
        if #text > limit then
            return string.sub(text, 1, limit - 3) .. "..."
        end
        return text
    end

    local function shortNumber(value)
        value = tonumber(value) or 0
        for _, unit in ipairs(SPY_UNITS) do
            if value >= unit[1] then
                return string.format("%.2f%s", value / unit[1], unit[2])
            end
        end
        return string.format("%.0f", value)
    end

    local avatarCache = nil

    local function getAvatarUrl()
        if not avatarCache then
            avatarCache = Logger.getAvatar(LocalPlayer.UserId)
        end
        return avatarCache
    end

    local function postHook(url, embed)
        local request = Logger.getRequest()
        if not request or not isValidHook(url) then
            return false
        end

        local encodeOk, body = pcall(function()
            return HttpService:JSONEncode({
                username = NOTIFY_NAME,
                embeds = { embed },
            })
        end)
        if not encodeOk then
            return false
        end

        local ok, response = pcall(request, {
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body,
        })
        if not ok then
            return false
        end

        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    local reportFields = {
        { names = { "Strength", "Fuerza" }, name = "Strength", track = true },
        { names = { "Durability", "Durabilidad" }, name = "Durability", track = true },
        { names = { "Gems", "Gemas" }, name = "Gems", track = true },
        { names = { "Agility" }, name = "Agility", track = true },
        { names = { "Rebirths", "Rebirth" }, name = "Rebirths", track = true },
        { names = { "Kills" }, name = "Kills", track = true },
        { names = { "Brawls", "Fights", "Fight" }, name = "Brawls", track = true },
        { names = { "muscleKingTime" }, name = "Muscle King Time" },
        { names = { "evilKarma" }, name = "Evil Karma" },
        { names = { "goodKarma" }, name = "Good Karma" },
    }

    local function readReal(object)
        for _, record in pairs(Fake.records) do
            if record.object == object then
                return tonumber(record.realValue) or 0
            end
        end
        return tonumber(object.Value) or 0
    end

    local function collectStats()
        local list = {}
        for _, field in ipairs(reportFields) do
            local object = findFakeStat(field.names)
            if object then
                table.insert(list, {
                    name = field.name,
                    value = readReal(object),
                    track = field.track,
                })
            end
        end
        return list
    end

    local function statsText(list)
        local lines = {}
        for _, stat in ipairs(list) do
            table.insert(lines, "**" .. stat.name .. ":** " .. formatSpy(stat.value))
        end
        local map = LocalPlayer:FindFirstChild("currentMap")
        if map then
            table.insert(lines, "**Current Map:** " .. tostring(map.Value))
        end
        return table.concat(lines, "\n")
    end

    local function petsText()
        local pets = LocalPlayer:FindFirstChild("equippedPets")
        if not pets then
            return nil
        end

        local counts = {}
        local order = {}
        for _, pet in ipairs(pets:GetChildren()) do
            local ref = pet:FindFirstChild("petReference")
            local name = ref and tostring(ref.Value) or pet.Name
            if not counts[name] then
                counts[name] = 0
                table.insert(order, name)
            end
            counts[name] = counts[name] + 1
        end

        if #order == 0 then
            return nil
        end

        table.sort(order)
        local lines = {}
        for _, name in ipairs(order) do
            table.insert(lines, "• " .. name .. " x" .. counts[name])
        end
        return table.concat(lines, "\n")
    end

    local function playerText()
        local executor, version = Util.getExecutor("Unknown")
        local membership = LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Premium" or "No Premium"
        local profile = "https://www.roblox.com/users/" .. LocalPlayer.UserId .. "/profile"

        return table.concat({
            "**Username:** [`" .. LocalPlayer.Name .. "`](" .. profile .. ")",
            "**Display Name:** " .. LocalPlayer.DisplayName,
            "**User ID:** `" .. LocalPlayer.UserId .. "`",
            "**Account Age:** " .. Logger.formatAge(LocalPlayer.AccountAge),
            "**Membership:** " .. membership,
            "**Platform:** " .. Logger.getPlatform(),
            "**Executor:** " .. executor .. " (" .. version .. ")",
        }, "\n")
    end

    local function serverText()
        local jobId = tostring(game.JobId)
        local joinUrl = "https://www.roblox.com/games/start?placeId=" .. game.PlaceId
            .. "&gameInstanceId=" .. jobId

        return table.concat({
            "Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers,
            "Ping: " .. Util.getPing() .. " ms",
            "Memory: " .. math.floor(StatsService:GetTotalMemoryUsageMb()) .. " MB",
            "Place ID: " .. game.PlaceId,
            "Server ID: `" .. jobId .. "`",
            "[Click To Join](" .. joinUrl .. ")",
        }, "\n")
    end

    local function baseEmbed(title)
        return {
            title = title,
            color = NOTIFY_COLOR,
            image = { url = NOTIFY_IMAGE },
            thumbnail = { url = getAvatarUrl() },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }
    end

    local function buildInfoEmbed()
        local embed = baseEmbed("Player Report")
        embed.footer = { text = NOTIFY_NAME .. " • " .. Config.HubName }

        local gameUrl = "https://www.roblox.com/games/" .. game.PlaceId
        local gameText = "[" .. Util.getGameName("Unknown") .. "](" .. gameUrl .. ")\nGame ID: " .. game.GameId

        embed.fields = {
            { name = "Player Info", value = clip(playerText(), 1024), inline = false },
            { name = "Stats", value = clip(statsText(collectStats()), 1024), inline = false },
        }

        local pets = petsText()
        if pets then
            table.insert(embed.fields, { name = "Equipped Pets", value = clip(pets, 1024), inline = false })
        end

        table.insert(embed.fields, { name = "Game", value = clip(gameText, 1024), inline = false })
        table.insert(embed.fields, { name = "Server", value = clip(serverText(), 1024), inline = false })

        return embed
    end

    local Notify = {
        url = "",
        minutes = 0,
        enabled = false,
        generation = 0,
        startTime = 0,
        sent = 0,
        gains = {},
        last = {},
    }

    local function sampleGains()
        for _, stat in ipairs(collectStats()) do
            if stat.track then
                local last = Notify.last[stat.name]
                if last ~= nil and stat.value > last then
                    Notify.gains[stat.name] = (Notify.gains[stat.name] or 0) + (stat.value - last)
                end
                Notify.last[stat.name] = stat.value
            end
        end
    end

    local function buildNotifyEmbed(isTest)
        local list = collectStats()
        local running = Notify.enabled
        local elapsed = 0
        if running then
            elapsed = os.clock() - Notify.startTime
        end

        local embed = baseEmbed(isTest and "Test Report" or "Farm Report")
        embed.description = "[`" .. LocalPlayer.Name .. "`](https://www.roblox.com/users/"
            .. LocalPlayer.UserId .. "/profile) • ID `" .. LocalPlayer.UserId .. "`"

        local footer = NOTIFY_NAME
        if not isTest then
            footer = footer .. " • Report #" .. Notify.sent
        end
        embed.footer = { text = footer }

        local timeLines = {
            "**Farming Time:** " .. (running and Util.formatTime(elapsed) or "Not running"),
            "**Hub Session:** " .. Util.formatTime(os.clock() - hubStart),
        }
        if running then
            table.insert(timeLines, "**Interval:** every " .. Notify.minutes .. " min")
        end

        local gainLines = {}
        local rateLines = {}
        if running then
            for _, stat in ipairs(list) do
                if stat.track then
                    local gained = Notify.gains[stat.name] or 0
                    table.insert(gainLines, "**" .. stat.name .. ":** +" .. shortNumber(gained))
                    if elapsed >= 60 and gained > 0 then
                        table.insert(
                            rateLines,
                            "**" .. stat.name .. ":** " .. shortNumber(gained / (elapsed / 3600)) .. "/h"
                        )
                    end
                end
            end
        end

        embed.fields = {
            { name = "Farm Time", value = clip(table.concat(timeLines, "\n"), 1024), inline = false },
            { name = "Stats", value = clip(statsText(list), 1024), inline = false },
        }

        if #gainLines > 0 then
            table.insert(embed.fields, { name = "Gained Since Start", value = clip(table.concat(gainLines, "\n"), 1024), inline = true })
        end
        if #rateLines > 0 then
            table.insert(embed.fields, { name = "Per Hour", value = clip(table.concat(rateLines, "\n"), 1024), inline = true })
        end

        local pets = petsText()
        if pets then
            table.insert(embed.fields, { name = "Equipped Pets", value = clip(pets, 1024), inline = false })
        end

        table.insert(embed.fields, { name = "Server", value = clip(serverText(), 1024), inline = false })

        return embed
    end

    local function sendWithNotice(url, builder, section)
        if not Logger.getRequest() then
            Util.notify(section, L("bw_no_http"), "triangle-alert")
            return
        end
        if not isValidHook(url) then
            Util.notify(section, L("bw_invalid"), "triangle-alert")
            return
        end

        task.spawn(function()
            local ok, embed = pcall(builder)
            local sent = ok and postHook(url, embed)
            if sent then
                Util.notify(section, L("st_hook_sent"), "check")
            else
                Util.notify(section, L("st_hook_failed"), "triangle-alert")
            end
        end)
    end

    Stats:Section({ Title = L("st_info_section") })

    local infoUrl = ""

    local InfoUrlInput = Stats:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            infoUrl = clean
        end,
    })
    Util.register("stats_info_webhook_url", InfoUrlInput)

    Stats:Button({
        Title = L("st_info_send"),
        Desc = L("st_info_send_desc"),
        Icon = "send",
        Callback = function()
            sendWithNotice(infoUrl, buildInfoEmbed, L("st_info_section"))
        end,
    })

    Stats:Section({ Title = L("st_notify_section") })

    local NotifyUrlInput = Stats:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            Notify.url = clean
        end,
    })
    Util.register("stats_notify_webhook_url", NotifyUrlInput)

    local NotifyMinutesInput = Stats:Input({
        Title = L("st_notify_minutes"),
        Placeholder = "10",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                Notify.minutes = math.clamp(n, 1, 1440)
            end
        end,
    })
    Util.register("stats_notify_minutes", NotifyMinutesInput)

    local NotifyToggle

    local function rejectNotify(message)
        Notify.enabled = false
        Util.notify(L("st_notify_section"), message, "triangle-alert")
        task.defer(function()
            pcall(function()
                NotifyToggle:Set(false)
            end)
        end)
    end

    local function startNotify()
        Notify.generation = Notify.generation + 1
        local generation = Notify.generation

        Notify.startTime = os.clock()
        Notify.sent = 0
        Notify.gains = {}
        Notify.last = {}

        task.spawn(function()
            local lastSent = os.clock()

            while Notify.enabled and isAlive() and Notify.generation == generation do
                pcall(sampleGains)

                if os.clock() - lastSent >= Notify.minutes * 60 then
                    lastSent = os.clock()
                    Notify.sent = Notify.sent + 1

                    task.spawn(function()
                        local ok, embed = pcall(buildNotifyEmbed, false)
                        if not (ok and postHook(Notify.url, embed)) then
                            Util.notify(L("st_notify_section"), L("st_hook_failed"), "triangle-alert")
                        end
                    end)
                end

                task.wait(1)
            end
        end)
    end

    NotifyToggle = Stats:Toggle({
        Title = L("st_notify_toggle"),
        Desc = L("st_notify_toggle_desc"),
        Value = false,
        Callback = function(state)
            if not state then
                if Notify.enabled then
                    Notify.enabled = false
                    Notify.generation = Notify.generation + 1
                    Util.notify(L("st_notify_section"), L("st_notify_stopped"), "check")
                end
                return
            end

            if not Logger.getRequest() then
                rejectNotify(L("bw_no_http"))
            elseif not isValidHook(Notify.url) then
                rejectNotify(L("bw_invalid"))
            elseif Notify.minutes < 1 then
                rejectNotify(L("st_notify_need_minutes"))
            else
                Notify.enabled = true
                startNotify()
                Util.notify(L("st_notify_section"), L("st_notify_started", Notify.minutes), "check")
            end
        end,
    })

    Stats:Button({
        Title = L("st_notify_test"),
        Icon = "send",
        Callback = function()
            sendWithNotice(Notify.url, function()
                return buildNotifyEmbed(true)
            end, L("st_notify_section"))
        end,
    })
end

do
    local Killer = Tabs.Killer
end

do
    local Teleport = Tabs.Teleport

    local workoutTypes = { "Bench Press", "Squat", "Deadlift", "Pull Up", "Boulder" }

    local locationOrder = {
        "Starter Island",
        "Legend Beach",
        "Frost Gym",
        "Mythical Gym",
        "Eternal Gym",
        "Legend Gym",
        "Muscle King Gym",
        "Jungle Gym",
    }

    local workoutPositions = {
        ["Bench Press"] = {
            ["Starter Island"] = CFrame.new(-17.0609932, 3.31417918, -2.48164988),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-3013.24194, 39.2158546, -335.036926),
            ["Mythical Gym"] = CFrame.new(2371.7356, 39.2158546, 1246.31555),
            ["Legend Gym"] = CFrame.new(4111.91748, 1020.46674, -3799.97217),
            ["Muscle King Gym"] = CFrame.new(-8590.06152, 46.0167427, -6043.34717),
            ["Jungle Gym"] = CFrame.new(-8173, 64, 1898),
        },
        ["Squat"] = {
            ["Starter Island"] = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8352, 34, 2878),
        },
        ["Deadlift"] = {
            ["Starter Island"] = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
        },
        ["Pull Up"] = {
            ["Starter Island"] = CFrame.new(-33.3047485, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8666, 34, 2070),
        },
        ["Boulder"] = {
            ["Starter Island"] = CFrame.new(-33.3047485, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8621, 34, 2684),
        },
    }

    local treadmillOrder = {
        "Tiny Island",
        "Starter Island",
        "Legend Beach",
        "Frost Gym",
        "Mythical Gym",
        "Eternal Gym",
        "Legend Gym",
        "Jungle Gym",
    }

    local treadmillPositions = {
        ["Tiny Island"] = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682),
        ["Starter Island"] = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145),
        ["Legend Beach"] = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441),
        ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155),
        ["Mythical Gym"] = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881),
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287),
        ["Legend Gym"] = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317),
        ["Jungle Gym"] = CFrame.new(-8137, 28, 2820),
    }

    local islandList = {
        { name = "Spawn", cf = CFrame.new(2, 8, 115) },
        { name = "Secret Area", cf = CFrame.new(1947, 2, 6191) },
        { name = "Tiny Island", cf = CFrame.new(-34, 7, 1903) },
        { name = "Frozen Island", cf = CFrame.new(-2600.00244, 3.67686558, -403.884369, 0.0873617008, 1.0482899e-09, 0.99617666, 3.07204253e-08, 1, -3.7464023e-09, -0.99617666, 3.09302628e-08, 0.0873617008) },
        { name = "Mythical Island", cf = CFrame.new(2255, 7, 1071) },
        { name = "Hell Island", cf = CFrame.new(-6768, 7, -1287) },
        { name = "Legend Island", cf = CFrame.new(4604, 991, -3887) },
        { name = "Muscle King Island", cf = CFrame.new(-8646, 17, -5738) },
        { name = "Jungle Island", cf = CFrame.new(-8659, 6, 2384) },
        { name = "Industrial Gym", cf = CFrame.new(-5563.2, 58.31, 4942.44) },
        { name = "Halloween Gym", cf = CFrame.new(5558.16, 83.79, 5838.37) },
    }

    local brawlList = {
        { name = "Brawl Lava", cf = CFrame.new(4471, 119, -8836) },
        { name = "Brawl Desert", cf = CFrame.new(960, 17, -7398) },
        { name = "Brawl Regular", cf = CFrame.new(-1849, 20, -6335) },
    }

    local function namesOf(list)
        local names = {}
        for _, entry in ipairs(list) do
            table.insert(names, entry.name)
        end
        return names
    end

    local function findByName(list, name)
        for _, entry in ipairs(list) do
            if entry.name == name then
                return entry.cf
            end
        end
        return nil
    end

    local function getWorkoutLocations(workout)
        local positions = workoutPositions[workout]
        local list = {}
        if positions then
            for _, name in ipairs(locationOrder) do
                if positions[name] then
                    table.insert(list, name)
                end
            end
        end
        return list
    end

    local function teleportTo(cf)
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not root then
            Util.notify(L("error"), L("tp_failed"), "triangle-alert")
            return false
        end
        root.AssemblyLinearVelocity = Vector3.zero
        root.CFrame = cf
        return true
    end

    local selectedWorkout = workoutTypes[1]
    local selectedLocation = "Starter Island"
    local selectedTreadmill = treadmillOrder[1]
    local islandNames = namesOf(islandList)
    local brawlNames = namesOf(brawlList)
    local selectedIsland = islandNames[1]
    local selectedBrawl = brawlNames[1]

    Teleport:Section({ Title = L("tp_work_section") })

    local LocationDropdown

    Teleport:Dropdown({
        Title = L("tp_select_workout"),
        Values = workoutTypes,
        Value = selectedWorkout,
        SearchBarEnabled = false,
        AllowNone = false,
        Callback = function(option)
            if type(option) ~= "string" then
                return
            end
            selectedWorkout = option

            local locations = getWorkoutLocations(option)
            if not table.find(locations, selectedLocation) then
                selectedLocation = locations[1] or ""
            end

            pcall(function()
                LocationDropdown:Refresh(locations)
            end)
            if selectedLocation ~= "" then
                pcall(function()
                    LocationDropdown:Select(selectedLocation)
                end)
            end
        end,
    })

    LocationDropdown = Teleport:Dropdown({
        Title = L("tp_select_location"),
        Values = getWorkoutLocations(selectedWorkout),
        Value = selectedLocation,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedLocation = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_workout"),
        Icon = "dumbbell",
        Callback = function()
            local positions = workoutPositions[selectedWorkout]
            local cf = positions and positions[selectedLocation]
            if cf then
                teleportTo(cf)
            else
                Util.notify(L("error"), L("tp_no_location"), "triangle-alert")
            end
        end,
    })

    Teleport:Section({ Title = L("tp_treadmill_section") })

    Teleport:Dropdown({
        Title = L("tp_select_treadmill"),
        Values = treadmillOrder,
        Value = selectedTreadmill,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedTreadmill = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_treadmill"),
        Icon = "footprints",
        Callback = function()
            local cf = treadmillPositions[selectedTreadmill]
            if cf then
                teleportTo(cf)
            end
        end,
    })

    Teleport:Section({ Title = L("tp_island_section") })

    Teleport:Dropdown({
        Title = L("tp_select_island"),
        Values = islandNames,
        Value = selectedIsland,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedIsland = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_island"),
        Icon = "map-pin",
        Callback = function()
            local cf = findByName(islandList, selectedIsland)
            if cf then
                teleportTo(cf)
            end
        end,
    })

    Teleport:Section({ Title = L("tp_brawl_section") })

    Teleport:Dropdown({
        Title = L("tp_select_brawl"),
        Values = brawlNames,
        Value = selectedBrawl,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedBrawl = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_brawl"),
        Icon = "swords",
        Callback = function()
            local cf = findByName(brawlList, selectedBrawl)
            if cf then
                teleportTo(cf)
            end
        end,
    })
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

    task.spawn(function()
        while task.wait(5) and isAlive() do
            if autoSaveEnabled then
                runConfig("Save", currentConfig)
            end
        end
    end)

    function Util.autoLoad()
        runConfig("Load", currentConfig)
    end
end

if Util.autoLoad then
    Util.autoLoad()
end

pcall(function()
    Tabs.Home:Select()
end)

