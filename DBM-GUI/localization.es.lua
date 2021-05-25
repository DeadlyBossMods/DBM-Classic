if GetLocale() ~= "esES" and GetLocale() ~= "esMX" then return end

if not DBM_GUI_L then DBM_GUI_L = {} end
local L = DBM_GUI_L

L.MainFrame = "Deadly Boss Mods"

L.TranslationByPrefix		= "Traducido por "
L.TranslationBy 			= "Saispai, Woopy"
L.Website					= "Visita nuestro canal de Discord: |cFF73C2FBhttps://discord.gg/deadlybossmods|r."
L.WebsiteButton				= "Página web"

L.OTabBosses	= "Jefes"
L.OTabRaids		= "Banda"--Raids & PVP
L.OTabDungeons	= "Grupo/Solo"--1-5 person content (Dungeons, MoP Scenarios, World Events, Brawlers, Proving Grounds, Visions, Torghast, etc)
L.OTabPlugins	= "Plugins del núcleo"
L.OTabOptions	= GAMEOPTIONS_MENU
L.OTabAbout		= "Sobre"


L.TabCategory_Options	 	= "Opciones generales"
L.TabCategory_OTHER    		= "Otros módulos"

L.BossModLoaded 			= "Estadísticas de %s"
L.BossModLoad_now 			= [[Este módulo no está cargado.
Se cargará al entrar en la estancia.
También puedes hacer clic en el botón para cargar el módulo manualmente.]]

L.PosX 						= "Posición X"
L.PosY 						= "Posición Y"

L.MoveMe 					= "Posición"
L.Button_OK 				= "Aceptar"
L.Button_Cancel 			= "Cancelar"
L.Button_LoadMod 			= "Cargar módulo"
L.Mod_Enabled				= "Habilitar módulo"
L.Mod_Reset					= "Cargar opciones por defecto"
L.Reset 					= "Restaurar"

L.Enable  					= "Activar"
L.Disable					= "Desactivar"

L.NoSound					= "Sin sonido"

L.IconsInUse				= "Iconos usados por este módulo"

-- Tab: Boss Statistics
L.BossStatistics			= "Estadísticas"
L.Statistic_Kills			= "Victorias:"
L.Statistic_Wipes			= "Derrotas:"
L.Statistic_Incompletes		= "Inacabados:"--For scenarios, TODO, figure out a clean way to replace any Statistic_Wipes with Statistic_Incompletes for scenario mods
L.Statistic_BestKill		= "Mejor victoria:"
L.Statistic_BestRank		= "Mejor nivel:"--Maybe not get used, not sure yet, localize anyways

-- Tab: General Options
L.TabCategory_Options	 	= "Opciones generales"
L.Area_BasicSetup			= "Sugerencias de configuración inicial de DBM"
L.Area_ModulesForYou		= "¿Qué módulos DBM son adecuados para ti?"
L.Area_ProfilesSetup		= "Guía de uso de perfiles de DBM"
-- Panel: Core & GUI
L.Core_GUI 					= "Core y GUI"
L.General 					= "Opciones generales de DBM"
L.EnableMiniMapIcon			= "Mostrar botón junto al minimapa"
L.UseSoundChannel			= "Canal de audio para alertas"
L.UseMasterChannel			= "Canal de audio principal"
L.UseDialogChannel			= "Canal de audio de diálogo"
L.UseSFXChannel				= "Canal de audio de efectos de sonido"
L.Latency_Text				= "Latencia máxima para sincronización: %d"

L.ModelOptions				= "Opciones del visualizador de modelos 3D"
L.EnableModels				= "Mostrar modelos 3D en opciones de jefe"
L.ModelSoundOptions			= "Sonido"
L.ModelSoundShort			= "Corto"
L.ModelSoundLong			= "Duración grande"

L.ptions			 	= "Opciones de redimensionamiento"
L.Button_ResetWindowSize	= "Restablecer el tamaño de la ventana"
L.Editbox_WindowWidth		= "Anchura de la ventana"
L.Editbox_WindowHeight		= "Altura de la ventana"

L.Button_RangeFrame			= "Mostrar/ocultar\nmarco de distancia"
L.Button_InfoFrame			= "Mostrar/ocultar\nmarco de información"
L.Button_TestBars			= "Comprobar barras"
L.Button_ResetInfoRange		= "Restaurar posiciones por defecto"

-- Tab: Alerts
L.TabCategory_Alerts	 	= "Alertas"
L.Area_SpecAnnounceConfig	= "Guía de alertas especial de imágenes y sonido"
L.Area_SpecAnnounceNotes	= "Guía de notas especiales de alerta"
L.Area_VoicePackInfo		= "Información sobre los paquetes de voz DBM"
-- Panel: Raidwarning
L.Tab_RaidWarning 			= "Avisos de banda"
L.RaidWarning_Header		= "Opciones de avisos de banda"
L.RaidWarnColors 			= "Colores de avisos de banda"
L.RaidWarnColor_1 			= "Color 1"
L.RaidWarnColor_2 			= "Color 2"
L.RaidWarnColor_3		 	= "Color 3"
L.RaidWarnColor_4 			= "Color 4"
L.InfoRaidWarning			= [[Puedes especificar la posición y colores del marco de avisos de banda.
Este marco se usa para mensajes como "Jugador X afectado por Y".]]
L.ColorResetted 			= "Se ha reiniciado la configuración de colores de este campo."
L.ShowWarningsInChat 		= "Mostrar avisos en el chat"
L.WarningIconLeft 			= "Mostrar iconos a la izquierda"
L.WarningIconRight 			= "Mostrar iconos a la derecha"
L.WarningIconChat 			= "Mostrar iconos en el chat"
L.WarningAlphabetical		= "Ordenar nombres alfabéticamente"
L.Warn_Duration				= "Duración: %0.1f s"
L.None						= "Ninguno"
L.Random					= "Aleatorio"
L.Outline					= "Contorno"
L.ThickOutline				= "Contorno grueso"
L.MonochromeOutline			= "Contorno monocromo"
L.MonochromeThickOutline	= "Contorno monocromo grueso"
L.RaidWarnSound				= "Sonido de avisos de banda"

-- Tab: Generalwarnings
L.Tab_GeneralMessages 		= "Mensajes generales"
L.CoreMessages				= "Opciones de mensajes del módulo general"
L.ShowPizzaMessage 			= "Mostrar avisos de temporizadores en el chat"
L.ShowAllVersions	 		= "Mostrar versión de DBM de cada miembro del grupo en el chat al hacer comprobaciones de versión. Si se deshabilita seguirá mostrando quién lo tiene desactualizado."
L.ShowReminders             = "Mostrar mensajes recordatorios para recomendaciones, mods faltantes o mensajes de revisión"
L.CombatMessages			= "Opciones de mensajes de combate"
L.ShowEngageMessage 		= "Mostrar mensajes de inicio de encuentro en el chat"
L.ShowDefeatMessage 		= "Mostrar mensajes de victoria y derrota en el chat"
L.ShowGuildMessages 		= "Mostrar mensajes de inicio de encuentro, victoria y derrota de banda de hermandad en el chat"
L.ShowGuildMessagesPlus		= "Mostrar también mensajes de inicio, victoria y derrota de Mítica+ de grupos de hermandad (requiere que la opción anterior esté activada)"

-- Tab: Privacy
L.Tab_Privacy 				= "Controles de privacidad"
L.Area_WhisperMessages		= "Opciones de susurros"
L.AutoRespond 				= "Responder automáticamente a susurros en encuentro"
L.WhisperStats 				= "Incluir estadísticas de victoria y derrota en las respuestas automáticas a susurros"
L.DisableStatusWhisper 		= "Desactivar susurros automáticos de estado de encuentro del grupo o banda para todos los jugadores (requiere ser el líder). Solo se aplica a bandas en dificultad normal, heroica y mítica, y a mazmorras de piedra angular."

L.Area_SyncMessages			= "Opciones de sincronización"
L.DisableGuildStatus 		= "Desactivar mensajes de hermandad de estado de encuentro del grupo o banda para todos los jugadores (requiere ser el líder)."
L.EnableWBSharing 			= "Comparte cuando sacas/derrotas a un jefe mundial o activas un buff mundial con tus amigos de battle.net que están en el mismo reino. (Esta información siempre se compartirá con tu hermandad)"

-- Tab: Frames & Integrations
L.TabCategory_Frames		= "Marcos e integraciones"
L.Area_NamelateInfo			= "Información sobre las Auras de la placa identificativa de DBM"
-- Panel: InfoFrame
L.Panel_InfoFrame			= "Marco de información"

-- Panel: Range
L.Panel_Range				= "Marco de distancia"

-- Panel: Nameplate
L.Panel_Nameplates			= "Placas identificativas"
L.UseNameplateHandoff		= "Pasa las solicitudes de aura de la placa identificativa a los addons de la placa identificativa admitidos (KuiNameplates, Threat Plates, Plater) en lugar de manejarlos internamente. Esta es la opción recomendada ya que permite realizar más funciones y configuraciones avanzadas a través del addon de la placa identificativa"
L.Area_NPStyle				= "Estilo (Nota: Solo configura el estilo cuando DBM está manejando placas identificativas.)"
L.NPAuraSize				= "Tamaño de píxel de aura (cuadrado): %d"

-- Tab: Barsetup
L.BarSetup					= "Configuración de barras"
L.BarTexture				= "Textura de barras"
L.BarStyle					= "Estilo de barras"
L.BarDBM					= "DBM (con animaciones)"
L.BarSimple					= "Simple (sin animaciones)"
L.BarStartColor				= "Color inicial"
L.BarEndColor 				= "Color final"
L.Bar_Height				= "Altura de barras: %d"
L.Slider_BarOffSetX 		= "Posición X: %d"
L.Slider_BarOffSetY 		= "Posición Y: %d"
L.Slider_BarWidth 			= "Ancho de barras: %d"
L.Slider_BarScale 			= "Escala de barras: %0.2f"
--Types
L.BarStartColorAdd			= "Color inicial (esbirros)"
L.BarEndColorAdd			= "Color final (esbirros)"
L.BarStartColorAOE			= "Color inicial (áreas)"
L.BarEndColorAOE			= "Color final (áreas)"
L.BarStartColorDebuff		= "Color inicial (dirigido)"
L.BarEndColorDebuff			= "Color final (dirigido)"
L.BarStartColorInterrupt	= "Color inicial (interrumpir)"
L.BarEndColorInterrupt		= "Color final (interrumpir)"
L.BarStartColorRole			= "Color inicial (rol)"
L.BarEndColorRole			= "Color final (rol)"
L.BarStartColorPhase		= "Color inicial (fase)"
L.BarEndColorPhase			= "Color final (fase)"
L.BarStartColorUI			= "Color inicial (usuario)"
L.BarEndColorUI				= "Color final (usuario)"
--Type 7 options
L.Bar7Header				= "Opciones de barras de usuario"
L.Bar7ForceLarge			= "Usar siempre barras grandes"
L.Bar7CustomInline			= "Usar icono '!' personalizado"
L.Bar7Footer				= "(la barra de muestra no se\nactualiza en vivo)"
--Dropdown Options
L.CBTGeneric				= "Genérico"
L.CBTAdd					= "Esbirro"
L.CBTAOE					= "Áreas"
L.CBTTargeted				= "Dirigido"
L.CBTInterrupt				= "Interrumpir"
L.CBTRole					= "Rol"
L.CBTPhase					= "Fase"
L.CBTImportant				= "Importante (Usuario)"
L.CVoiceOne					= "Voz de Cuenta 1"
L.CVoiceTwo					= "Voz de Cuenta 2"
L.CVoiceThree				= "Voz de Cuenta 3"

-- Tab: Timers
L.TabCategory_Timers		= "Temporizadores"
L.Area_ColorBytype			= "Guía de barras de color por tipo"
-- Panel: Color by Type
L.Panel_ColorByType	 		= "Color por tipo"
L.AreaTitle_BarColors		= "Colores de barras por tipo de temporizador"
L.Panel_Appearance	 		= "Apariencia de barra"
L.Panel_Behavior	 		= "Comportamiento de barra"
L.AreaTitle_BarSetup		= "Opciones generales de barras"
L.AreaTitle_Behavior		= "Opciones de comportamiento de barra"
L.AreaTitle_BarSetupSmall 	= "Opciones de barras pequeñas"
L.AreaTitle_BarSetupHuge	= "Opciones de barras grandes"
L.EnableHugeBar 			= "Habilitar barra grande (o 'Barra 2')"
L.BarIconLeft 				= "Icono izquierdo"
L.BarIconRight 				= "Icono derecho"
L.ExpandUpwards				= "Expandir arriba"
L.FillUpBars				= "Rellenar"
L.ClickThrough				= "Deshabilitar clic en barras"
L.Bar_Decimal				= "Mostrar decimales bajo: %d s"
L.Bar_Alpha					= "Transparencia: %0.1f"
L.Bar_EnlargeTime			= "Agrandar barras bajo tiempo: %d s"
L.BarSpark					= "Destello de barras"
L.BarFlash					= "Iluminar barras a punto de expirar"
L.BarSort					= "Ordenar por tiempo restante"
L.BarColorByType			= "Color por tipo"
L.NoBarFade					= "Use colores de inicio/fin como colores pequeños/grandes en lugar de un cambio gradual de color"
L.BarInlineIcons			= "Iconos en barras"
L.ShortTimerText			= "Texto de temporizador breve"
L.StripTimerText			= "Eliminar reutilización/próximo de los temporizadores"
L.KeepBar					= "Mantener hasta que se lance la habilidad"
L.KeepBar2					= "(siempre que el módulo lo permita)"
L.FadeBar					= "Desteñir barras de habilidades lejanas"

-- Tab: Spec Warn Frame
L.Panel_SpecWarnFrame		= "Avisos especiales de banda"
L.Area_SpecWarn				= "Opciones de avisos especiales"
L.SpecWarn_ClassColor		= "Usar colores de clase para avisos especiales"
L.ShowSWarningsInChat 		= "Mostrar avisos especiales en el chat"
L.SWarnNameInNote			= "Usar Destello 5 si una nota personalizada contiene tu nombre"
L.SpecialWarningIcon		= "Mostrar iconos en avisos especiales"
L.ShortTextSpellname		= "Usar texto de hechizos corto (si disponible)"
L.SpecWarn_FlashFrameRepeat	= "Repetir %d veces (si está habilitado)"
L.SpecWarn_Flash			= "Destello de pantalla"
L.SpecWarn_FlashRepeat		= "Repetir destello"
L.SpecWarn_FlashColor		= "Destello %d"
L.SpecWarn_FlashDur			= "Duración: %0.1f s"
L.SpecWarn_FlashAlpha		= "Transparencia: %0.1f"
L.SpecWarn_DemoButton		= "Mostrar ejemplo"
L.SpecWarn_ResetMe			= "Restaurar valores por defecto"
L.SpecialWarnSoundOption	= "Sonido por defecto"
L.SpecialWarnHeader1		= "Tipo 1: Establecer opciones para las advertencias de prioridad normal que lo afectan a ti o tus acciones"
L.SpecialWarnHeader2		= "Tipo 2: Establecer opciones para advertencias de prioridad normal que afectan a todos"
L.SpecialWarnHeader3		= "Tipo 3: Establecer opciones para advertencias de ALTA prioridad"
L.SpecialWarnHeader4		= "Tipo 4: Establecer opciones para advertencias especiales de ALTA prioridad"
L.SpecialWarnHeader5		= "Tipo 5: Establecer opciones para advertencias con notas que contengan los nombres de sus jugadores"

-- Tab: Spoken Alerts Frame
L.Panel_SpokenAlerts		= "Alertas de voz"
L.Area_VoiceSelection		= "Selección de voces"
L.CountdownVoice			= "Voz principal para cuentas atrás"
L.CountdownVoice2			= "Voz secundaria para cuentas atrás"
L.CountdownVoice3			= "Voz terciaria para cuentas atrás"
L.VoicePackChoice			= "Paquete de voz para alertas de voz"
L.Area_CountdownOptions		= "Opciones de cuenta atrás"
L.Area_VoicePackOptions		= "Opciones de paquetes de voz (archivos de terceros)"
L.SpecWarn_NoSoundsWVoice	= "Filtrar sonidos de avisos especiales para avisos que también tienen alertas de voz"
L.SWFNever					= "Nunca"
L.SWFDefaultOnly			= "Cuando los avisos especiales usen sonidos por defecto"
L.SWFAll					= "Cuando los avisos especiales usen cualquier sonido"
L.SpecWarn_AlwaysVoice		= "Reproducir siempre todas las alertas de voz (ignora las opciones de jefe; útil para líderes de banda)"
--TODO, maybe add URLS right to GUI panel on where to acquire 3rd party voice packs?
L.Area_GetVEM				= "Descargar VEM Voice Pack"
L.VEMDownload				= "|cFF73C2FBhttps://curseforge.com/wow/addons/dbm-voicepack-vem|r"
L.Area_BrowseOtherVP		= "Explorar otros paquetes de voz en Curse"
L.BrowseOtherVPs			= "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+voice|r"
L.Area_BrowseOtherCT		= "Explorar otros paquetes de voz de cuenta atrás en Curse"
L.BrowseOtherCTs			= "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+count+pack|r"

-- Tab: Event Sounds
L.Panel_EventSounds			= "Sonidos de eventos"
L.Area_SoundSelection		= "Selección de sonidos"
L.EventVictorySound			= "Sonido de victoria de encuentro"
L.EventWipeSound			= "Sonido de derrota de encuentro"
L.EventEngageSound			= "Sonido de inicio de encuentro"
L.EventDungeonMusic			= "Música de fondo en mazmorras y bandas"
L.EventEngageMusic			= "Música de fondo en encuentros"
L.Area_EventSoundsExtras	= "Opciones de sonidos de eventos"
L.EventMusicCombined		= "Mostrar toda la selección de música (escribe /reload en el chat para que esta opción surta efecto)"
L.Area_EventSoundsFilters	= "Filtros de sonidos de evento"
L.EventFilterDungMythicMusic= "Desactivar música personalizada de mazmorra en dificultad Mítica/M+."
L.EventFilterMythicMusic	= "Desactivar música personalizada de encuentros en dificultad Mítica/M+."

-- Tab: Global Disables & Filters
L.TabCategory_Filters	 	= "Filtros globales"
L.Area_DBMFiltersSetup		= "Guía de filtros de DBM"
L.Area_BlizzFiltersSetup	= "Guía de filtros de Blizzard"
-- Panel: DBM Features
L.Panel_SpamFilter			= "Filtros globales"
L.Area_SpamFilter_Anounces	= "Anunciar opciones globales de desactivación y filtro"
L.SpamBlockNoShowAnnounce	= "Ocultar anuncios generales y desactivar los sonidos asociados"
L.SpamBlockNoShowTgtAnnounce= "Ocultar anuncios generales de objetivos y desactivar los sonidos asociados (la opción anterior anula esta)"
L.SpamBlockNoSpecWarnText	= "Ocultar avisos especiales pero sí reproducir sonidos de paquetes de voces (la opción anterior anula esta)"
L.SpamBlockNoSpecWarnFlash	= "Ocultar avisos especiales de iluminación de pantalla"
L.SpamBlockNoSpecWarnSound	= "Ocultar sonidos especiales (todavía permite paquetes de voz, si uno está habilitado en el panel Alertas de voz)"

L.Area_SpamFilter_Timers	= "Desactivación global y opciones de filtro de temporizadores"
L.SpamBlockNoShowTimers		= "Ocultar temporizadores de módulos"
L.SpamBlockNoShowUTimers	= "Ocultar temporizadores de usuario"
L.Area_SpamFilter_Misc		= "Diversas opciones globales de desactivación y filtro"
L.SpamBlockNoSetIcon		= "Desactivar asignación automática de iconos"
L.SpamBlockNoRangeFrame		= "Ocultar marcos de distancia"
L.SpamBlockNoInfoFrame		= "Ocultar marcos de información"
L.SpamBlockNoHudMap			= "Ocultar indicadores"
L.SpamBlockNoNameplate		= "Ocultar auras de placas de nombres"
L.SpamBlockNoCountdowns		= "Desactivar sonidos de cuenta atrás"
L.SpamBlockNoYells			= "Desactivar envío automático de mensajes en el chat"
L.SpamBlockNoNoteSync		= "Rechazar automáticamente notas compartidas"

L.Area_Restore				= "Opciones de restauración"
L.SpamBlockNoIconRestore	= "Restaurar iconos al acabar el encuentro"
L.SpamBlockNoRangeRestore	= "Mantener los marcos de distancia cuando los módulos intenten esconderlos"

L.Area_SpamFilter			= "Opciones de filtros de avisos"
L.DontShowFarWarnings		= "Ocultar anuncios y temporizadores de eventos que estén demasiado lejos"
L.StripServerName			= "Omitir nombre del reino en avisos y temporizadores"

L.Area_SpecFilter			= "Opciones de filtros de rol"
L.FilterTankSpec			= "Ocultar avisos designados para tanques cuando no sea tu rol"
L.FilterInterruptsHeader	= "Patrón para ocultar avisos de facultades interrumpibles"
L.FilterInterrupts			= "Si no es tu objetivo o foco (siempre)"
L.FilterInterrupts2			= "Si no es tu objetivo o foco (siempre) o no puedes interrumpir (solo jefes)"
L.FilterInterrupts3			= "Si no es tu objetivo o foco (siempre) o no puedes interrumpir (todos los enemigos)"
L.FilterInterruptNoteName	= "Ocultar avisos de facultades interrumpibles con orden de interrupciones si el aviso no contiene tu nombre en la nota"
L.FilterDispels				= "Ocular avisos de facultades disipables si tu disipación no está disponible"
L.FilterTrashWarnings		= "Ocultar todos los avisos de enemigos menores en mazmorras normales y heroicas"
L.FilterSelfHud				= "Excluirte de los indicadores (los indicadores de distancia no te tendrán en cuenta)"

L.Area_PullTimer			= "Opciones de filtros de inicio de encuentro, descanso, combate y personalizados"
L.DontShowPTNoID			= "Ocultar temporizadores de inicio de encuentro que se inicien en zonas distintas"
L.DontShowPT				= "Ocultar barras de temporizadores de inicio de encuentro y descanso"
L.DontShowPTText			= "Ocultar anuncios de temporizadores de inicio de encuentro y descanso"
L.DontPlayPTCountdown		= "Desactivar sonidos de cuenta atrás de temporizadores de inicio de encuentro, descanso, combate y personalizados"
L.PT_Threshold				= "Ocultar temporizadores por encima de: %d s"

L.Panel_HideBlizzard		= "Interfaz y funciones de Blizzard"
L.Area_HideBlizzard			= "Opciones de interfaz y funciones de Blizzard"
L.HideBossEmoteFrame		= "Ocultar avisos de encuentro de mazmorra y banda"
L.HideWatchFrame			= "Ocultar seguimiento de objetivos (misiones, logros, etc.) en encuentros si no se está siguiendo un logro relacionado. En modo desafío muestra el tiempo restante."
L.HideGarrisonUpdates		= "Ocultar botón de ciudadela en jefes"
L.HideGuildChallengeUpdates	= "Ocultar botón de desafíos de hermandad en jefes"
--L.HideQuestTooltips		= "Ocultar objetivos de misión en en descripciones emergentes durante Hide quest objectives from tooltips during boss fights"
L.HideTooltips				= "Ocultar por completo las descripciones emergentes en encuentros"
L.DisableSFX				= "Desactivar el canal de efectos de sonido en encuentros"
--L.DisableCinematics		= "Saltar cinemáticas automáticamente"
--L.OnlyFight				= "Solo en combate, tras haber visto la cinemática por primera vez"
--L.AfterFirst				= "Tras haber visto la cinemática por primera vez"
L.Always					= "Siempre"
L.CombatOnly				= "En combate"
L.RaidCombat				= "En combate (solo en jefes)"
L.TrivialContent			= "Mazmorras no míticas"
L.NormalRaider				= "LFR y mazmorras míticas inferiores a +5"
L.HeroicRaider				= "Bandas inferiores a heroico, mazmorras míticas inferiores a +10 y jefes de mundo (<400)"
L.MythicRaider				= "Todo lo inferior a banda mítica"

L.Panel_ExtraFeatures		= "Funciones adicionales"
--
L.Area_ChatAlerts			= "Opciones de alertas de texto"
--L.CheckGear				= "Mostrar mensaje de alerta al iniciar un encuentro cuando tu nivel de equipo sea como mínimo 40 niveles menor que el de tu inventario o no tengas equipada un arma principal"
L.WorldBossAlert			= "Mostrar mensaje de alerta cuando un amigo o miembro de hermandad inicie un encuentro contra un jefe de mundo (impreciso si el jugador en combate está en otro reino)"
L.WorldBuffAlert			= "Mostrar mensaje de alerta y el temporizador cuando se haya iniciado buff mundial en tu reino"

L.Area_BugAlerts			= "Opciones de alerta de informes de errores"
L.BadTimerAlert				= "Mostrar mensaje de chat cuando DBM detecta un temporizador incorrecto con al menos 1 segundo de error"
L.BadIDAlert				= "Mostrar mensaje de chat cuando DBM detecta un hechizo o ID de diario no válido en uso"
--
L.Area_SoundAlerts			= "Opciones de alertas de sonido e iluminación del icono del juego"
L.LFDEnhance				= "Reproducir sonido de comprobación de banda e iluminar icono del juego para avisos del buscador de mazmorra/banda/grupo y campos de batalla por el canal de audio general o de diálogo (en otras palabras, reproduce el sonido aunque el canal de efectos de sonido esté desactivado, y en general suena más alto)"
L.WorldBossNearAlert		= "Reproducir sonido de comprobación de banda e iluminar icono del juego cuando haya un jefe de mundo cerca"
L.RLReadyCheckSound			= "Reproducir sonido por el canal de audio general o de diálogo e iluminar el icono del juego cuando se haga una comprobación de banda"
L.AFKHealthWarning			= "Reproducir sonido de alerta e iluminar el icono del juego si tu salud se reduce mientras estás ausente"
--
L.TimerGeneral 				= "Opciones de temporizadores"
L.SKT_Enabled				= "Mostrar temporizador para batir el récord de victoria del encuentro actual"
L.ShowRespawn				= "Mostrar temporizador para la reaparición de jefe tras cada derrota"
L.ShowQueuePop				= "Mostrar temporizador para eltiempo restante para aceptar avisos del buscador"
--
L.Area_AutoLogging			= "Opciones del registro automático"
L.AutologBosses				= "Registrar encuentros automáticamente con el registro de combate de Blizzard (usa '/dbm pull' antes de iniciar un encuentro para comenzar a grabar antes, de forma que tenga en cuenta la toma de pociones y otras acciones)"
L.AdvancedAutologBosses		= "Registrar encuentros automáticamente con Transcriptor"
L.RecordOnlyBosses			= "Registrar solo jefes (excluye los bichos. Usa '/dbm pull' antes del encuentro)"
L.LogOnlyNonTrivial			= "Registrar solo encuentros de jefe de banda de la expansión actual (excluye el buscador de bandas)"
--
--L.Area_3rdParty				= "Opciones de addons de terceros"
--L.ShowBBOnCombatStart		= "Realizar comprobación de beneficios de Big Brother al iniciar un encuentro"
--L.BigBrotherAnnounceToRaid	= "Anunciar resultados de Big Brother en el chat de banda"
L.Area_Invite				= "Opciones de invitación"
L.AutoAcceptFriendInvite	= "Aceptar automáticamente invitaciones a grupos de amigos"
L.AutoAcceptGuildInvite		= "Aceptar automáticamente invitaciones a grupos de miembros de la hermandad"
L.Area_Advanced				= "Opciones avanzadas"
L.FakeBW					= "Camuflar DBM como si fuera BigWigs en comprobaciones de versión (útil para hermandades que obligan a usar BigWigs)"
L.AITimer					= "Generar temporizadores automáticamente para encuentros no vistos anteriormente mediante la IA de temporizadores interna de DBM (útil para probar jefes por primera vez en el RPP). No funciona correctamente en encuentros con múltiples esbirros que comparten la misma facultad."

L.Panel_Profile				= "Perfiles"
L.Area_CreateProfile		= "Creación de perfiles para opciones generales de DBM"
L.EnterProfileName			= "Nombre del perfil"
L.CreateProfile				= "Crear con configuración por defecto"
L.Area_ApplyProfile			= "Perfil activo de opciones generales de DBM"
L.SelectProfileToApply		= "Perfil activo"
L.Area_CopyProfile			= "Copiar perfil de opciones generales de DBM"
L.SelectProfileToCopy		= "Copiar perfil"
L.Area_DeleteProfile		= "Borrar perfil de opciones generales de DBM"
L.SelectProfileToDelete		= "Borrar perfil"
L.Area_DualProfile			= "Opciones de perfil de DBM"
L.DualProfile				= "Permitir varias opciones de módulo de jefe por especialización (cada perfil se configura desde el menú de cada módulo)"

L.Area_ModProfile			= "Configuración de perfil"
L.ModAllReset				= "Restaurar configuración"
L.ModAllStatReset			= "Restaurar estadísticas"
L.SelectModProfileCopy		= "Copiar configuración de"
L.SelectModProfileCopySound	= "Copiar conf. de sonido de"
L.SelectModProfileCopyNote	= "Copiar notas de"
L.SelectModProfileDelete	= "Borrar configuración de"

-- Misc
L.Area_General				= "General"
L.Area_Position				= "Posición"
L.Area_Style				= "Estilo"

L.FontType					= "Fuente"
L.FontStyle					= "Contorno"
L.FontColor					= "Texto"
L.FontShadow				= "Sombra"
L.FontSize					= "Tamaño: %d"

L.FontHeight	= 16
