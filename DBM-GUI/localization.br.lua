if GetLocale() ~= "ptBR" then return end

if not DBM_GUI_L then DBM_GUI_L = {} end

local L = DBM_GUI_L

L.MainFrame = "Deadly Boss Mods"

L.TranslationByPrefix		= "Traduzido por "
L.TranslationBy 			= "GlitterStorm @ Azralon"
L.Website					= "Visita nosso canal Discord: |cFF73C2FBhttps://discord.gg/deadlybossmods|r."
L.WebsiteButton				= "Pagina web"

L.OTabBosses	= "Chefes"
L.OTabRaids		= "Raide"--Raids & PVP
L.OTabDungeons	= "Party/Só"--1-5 person content (Dungeons, MoP Scenarios, World Events, Brawlers, Proving Grounds, Visions, Torghast, etc)
L.OTabPlugins	= "Core Plugins"
L.OTabOptions	= "Opções"
L.OTabAbout		= "Sobre"

L.TabCategory_Options	 	= "Opções Gerais"
L.TabCategory_OTHER    		= "Outros módulos"

L.BossModLoaded 			= "%s estatísticas"
L.BossModLoad_now 			= [[Esse módulo não está carregado.
Ele será carregado quando você entrar na instância.
Você também pode clicar no botão para carregar o módulo manualmente.]]

L.PosX						= "Posição X"
L.PosY						= "Posição Y"

L.MoveMe 					= "Mova-me"
L.Button_OK 				= "OK"
L.Button_Cancel 			= "Cancelar"
L.Button_LoadMod 			= "Carregar AddOn"
L.Mod_Enabled				= "Habilitar módulo"
L.Mod_Reset					= "Carregar opções padrão"
L.Reset 					= "Resetar"

L.Enable  					= "Habilitar"
L.Disable					= "Desabilitar"

L.NoSound					= "Sem som"

L.IconsInUse				= "Ícones utilizados por esse módulo"

-- Tab: Boss Statistics
L.BossStatistics			= "Estatísticas do Chefe"
L.Statistic_Kills			= "Vitórias:"
L.Statistic_Wipes			= "Derrotas:"
L.Statistic_Incompletes		= "Incompletos:"--Para cenários, TODO, encontrar um jeito limpo de substituir derrotas por estatística incompleto para mods de cenário
L.Statistic_BestKill		= "Melhor tempo:"
L.Statistic_BestRank		= "Melhor classificação:"

-- Tab: General Core Options
L.TabCategory_Options	 	= "Opções gerais"
L.Area_BasicSetup			= "Dicas iniciais de configuração do DBM"
L.Area_ModulesForYou		= "Quais módulos DBM são adequados para você?"
L.Area_ProfilesSetup		= "Guia de uso de perfis DBM"
-- Panel: Core & GUI
L.Core_GUI 					= "Core e GUI"
L.General 					= "Opções gerais do DBM"
L.EnableMiniMapIcon			= "Exibir botão no mini-mapa"
L.UseSoundChannel			= "Definir o canal de áudio usado pelo DBM para reproduzir sons de alerta"
L.UseMasterChannel			= "Canal de áudio principal."
L.UseDialogChannel			= "Canal de áudio de diálogo."
L.UseSFXChannel				= "Canal de áudio Efeitos Sonoros (SFX)."
L.Latency_Text				= "Definir latência máxima de sincronização: %d"

L.Button_RangeFrame			= "Exibir/esconder quadro de distância"
L.Button_InfoFrame			= "Exibir/esconder quadro de informações"
L.Button_TestBars			= "Iniciar barras de teste"
L.Button_ResetInfoRange		= "Redefinir quadros de informações/alcance"

L.ModelOptions				= "Opções do Visualizador de Modelos 3D"
L.EnableModels				= "Habilitar modelos 3D nas opções de chefe"
L.ModelSoundOptions			= "Definir opção de som para o visualizador de modelos"
L.ModelSoundShort			= "Curto"
L.ModelSoundLong			= "Longo"

L.ResizeOptions			 	= "Opções de redimensionamento"
L.Button_ResetWindowSize	= "Redefinir o tamanho da janela da GUI"
L.Editbox_WindowWidth		= "Largura da janela da GUI"
L.Editbox_WindowHeight		= "Altura da janela da GUI"

-- Tab: Extra Features
L.Panel_ExtraFeatures		= "Características Extra"
L.Area_SoundAlerts			= "Opções de Som de Alerta"
L.LFDEnhance				= "Tocar o som de TodosProntos para checagem de papéis &amp; CB/LDG no canal de áudio principal(I.E. sons funcionam mesmo que os efeitos sonoros estejam desligados e são geralmente mais altos)"
L.WorldBossNearAlert		= "Tocar o som de TodosProntos quando chefes do mundo perto de você que você precisa estiverem sendo atacados (Sobrepõe opção específica de chefe)"
L.RLReadyCheckSound			= "Quando uma verificação pronta for executada, reproduza o som através do canal de áudio Mestre ou Diálogo e do ícone do aplicativo flash."
L.AFKHealthWarning			= "Tocar som de alerta quando você estiver perdendo vida enquanto estiver LDT"
--
L.TimerGeneral 				= "Opções gerais do cronômetro do DBM"
L.SKT_Enabled				= "Sempre Exibir um cronômetro de sua vitória recorde (Sobrepõe a opção do chefe específico)"
L.ShowRespawn				= "Exibir o cronômetro de reaparecimento do chefe após uma wipe"
L.ShowQueuePop				= "Exibir tempo restante para aceitar um pop de fila (BG, etc)"
--
L.Area_AutoLogging			= "Opções de relatórios automáticos"
L.AutologBosses				= "Gravar automaticamente o relatório de encontro com os chefes utilizando o relatório de combate da Blizzard(Requer que seja usado /dbm pull antes do chefe <a href=\"http://www.warcraftlogs.com\">|cff3588ffwarcraftlogs.com|r</a> compatibilidade)"
L.AdvancedAutologBosses		= "Gravar automaticamente o encontro com o chefe utilizando o Transcritor"
L.RecordOnlyBosses			= "Gravar apenas Chefes (Exclui todo o lixo. Use '/dbm pull' antes dos chefes para capturar potes pré-pull &amp; ENCOUNTER_START)"
L.LogOnlyNonTrivial			= "Só gravar encontros com chefes de raid (exclui Localizador de Raides/Grupos/Cenários)"
--
--L.Area_3rdParty				= "Opções de addons de terceiros"
--L.ShowBBOnCombatStart		= "Fazer checagem de Buff com Big Brother no início do combate"
--L.BigBrotherAnnounceToRaid	= "Anunciar resultados do Big Brother para a raid"
L.Area_Invite				= "Opções de convite"
L.AutoAcceptFriendInvite	= "Aceitar convites de amigos automaticamente"
L.AutoAcceptGuildInvite		= "Aceitar convites de membros da guilda automaticamente"
L.Area_Advanced				= "Opções avançadas"
L.FakeBW					= "Fingir ser BigWigs em checagens de versão ao invés de ser DBM ( útil para guildas que forçam o uso de BigWigs )"
L.AITimer					= "Gerar cronômetros automaticamente para lutas nunca antes vistas usando o timer AI incorporado do DBM (útil para atrair um chefe de teste pela primeira vez, como beta ou PTR). É recomendável sempre deixar isso ativado"

-- Tab: Profiles
L.Panel_Profile				= "Perfil"
L.Area_CreateProfile		= "Criação de perfil"
L.EnterProfileName			= "Entre com o nome do perfil"
L.CreateProfile				= "Criar perfil para opções do núcleo do BDM"
L.Area_ApplyProfile			= "Definir o perfil ativo para o núcleo do DBM"
L.SelectProfileToApply		= "Selecionar o perfil a aplicar"
L.Area_CopyProfile			= "Copiar o perfil de opções do núcleo do DBM"
L.SelectProfileToCopy		= "Escolha o perfil à ser copiado"
L.Area_DeleteProfile		= "Remover o perfil de opções do núcleo do DBM"
L.SelectProfileToDelete		= "Escolha o perfil à ser removido"
L.Area_DualProfile			= "Opções de perfil da mod de chefes"
L.DualProfile				= "Habilite suporte para outras mods de chefes de acordo com a especialização. (O gerenciamento de perfis de mods de chefes é feito da tela de mods de chefes carregados)"

L.Area_ModProfile			= "Copia as preferencias da mod para outros personagens/ especializações ou deleta a customização efetuada"
L.ModAllReset				= "Reseta todas as opções da mod"
L.ModAllStatReset			= "Reseta todos os stats da mod"
L.SelectModProfileCopy		= "Copia todas as preferencias de"
L.SelectModProfileCopySound	= "Copia apenas as preferencias sonoras de"
L.SelectModProfileCopyNote	= "Copia apenas a configuração de nota de"
L.SelectModProfileDelete	= "Apaga as opções da mod de"

-- Tab: Alerts
L.TabCategory_Alerts	 	= "Avisos"
L.Area_SpecAnnounceConfig	= "Visuais e guia de som do anúncio especial"
L.Area_SpecAnnounceNotes	= "Guia de notas de anúncio especial"
L.Area_VoicePackInfo		= "Informações sobre pacotes de voz DBM"
-- Panel: Raidwarning
L.Tab_RaidWarning 			= "Avisos de Raide"
L.RaidWarning_Header		= "Opções de Avisos de Raide"
L.RaidWarnColors 			= "Cores dos Avisos de Raide"
L.RaidWarnColor_1 			= "Cor 1"
L.RaidWarnColor_2 			= "Cor 2"
L.RaidWarnColor_3		 	= "Cor 3"
L.RaidWarnColor_4 			= "Cor 4"
L.InfoRaidWarning			= [[Você pode especificar a cor e posição do quadro de avisos de raide.
Esse quadro é utilizado para mensagens como "Jogador X está sob efeito de Y".]]
L.ColorResetted 			= "As opções de cor desse campo foram resetadas."
L.ShowWarningsInChat 		= "Exibir avisos na janela de chat."
L.WarningIconLeft 			= "Exibir ícone do lado esquerdo."
L.WarningIconRight 			= "Exibir ícone do lado direito."
L.WarningIconChat 			= "Exibir ícones no chat"
L.WarningAlphabetical		= "Classificar nomes em ordem alfabética"
L.Warn_Duration				= "duração do aviso: %0.1f seg"
L.None						= "nada"
L.Outline					= "Contorno"
L.ThickOutline				= "Espessura do contorno"
L.MonochromeOutline			= "Contorno Monocromático"
L.MonochromeThickOutline	= "Espessura do contorno Monocromático"
L.RaidWarnSound				= "Tocar som no aviso de raide"

-- Tab: Spec Warn Frame
L.Panel_SpecWarnFrame		= "Avisos Raide Especiais"
L.Area_SpecWarn				= "Opções de Avisos Especiais"
L.ShowSWarningsInChat 		= "Exibir avisos especiais no quadro de chat"
L.SWarnNameInNote			= "Usa as opções SW5 se uma nota personalizada contiver seu nome"
L.SpecialWarningIcon		= "Exibir ícones em anúncios especiais"
L.ShortTextSpellname		= "Usar texto mais curto para o nome do feitiço (quando disponível)"
L.SpecWarn_FlashFrameRepeat	= "Repetir %d vezes (se habilitado)"
L.SpecWarn_Flash			= "Piscada"
L.SpecWarn_FlashRepeat		= "Repetir piscada"
L.SpecWarn_FlashColor		= "Cor pisca"
L.SpecWarn_FlashDur			= "Duração da piscada: %0.1f"
L.SpecWarn_FlashAlpha		= "Alfa da piscada: %0.1f"
L.SpecWarn_DemoButton		= "Exibir exemplo"
L.SpecWarn_ResetMe			= "Redefinir padrões"
L.SpecialWarnSoundOption	= "Definir som padrão"
L.SpecialWarnHeader1		= "Tipo 1: defina opções para anúncios de prioridade normais que afetam você ou suas ações"
L.SpecialWarnHeader2		= "Tipo 2: defina opções para anúncios de prioridade normais que afetam todos"
L.SpecialWarnHeader3		= "Tipo 3: defina opções para anúncios de alta prioridade"
L.SpecialWarnHeader4		= "Tipo 4: defina opções para anúncios especiais de fuga de alta prioridade"
L.SpecialWarnHeader5		= "Tipo 5: defina opções para anúncios com notas contendo o nome do seu jogador"

-- Panel: Generalwarnings
L.Tab_GeneralMessages 		= "Mensagens em geral"
L.CoreMessages				= "Opções de mensagens principais"
L.ShowPizzaMessage 			= "Exibir mensagens ao receber cronógrafos no quadro de chat"
L.ShowAllVersions	 		= "Exibir a versão da mod para todos os membros no chat"
L.ShowReminders				= "Exibir lembretes para recomendações, mods ausentes ou mensagens de hotfix"

L.CombatMessages			= "Opções de mensagens de combate"
L.ShowEngageMessage 		= "Exibir mensagens ao iniciar combate no quadro de chat"
L.ShowDefeatMessage 		= "Exibir mensagens ao vencer chefes no quadro de chat"
L.ShowGuildMessages 		= "Exibir mensagens de puxada/vitória/derrota no quadro de chat"

L.Area_ChatAlerts			= "Opções adicionais de alerta"
L.WorldBossAlert			= "Exibir mensagem de alerta quando chefes mundiais podem estar envolvidos em seu reino por guildas ou amigos"
L.WorldBuffAlert			= "Exibir mensagem de alerta e cronômetro quando o RP do buff mundial foi iniciado em seu reino"

L.Area_BugAlerts			= "Opções de alerta de relatório de bug"
L.BadTimerAlert				= "Exibir mensagem de bate-papo quando o DBM detectar um cronômetro ruim com pelo menos 1 segundo de erro"
L.BadIDAlert				= "Exibir mensagem de bate-papo quando o DBM detectar um feitiço inválido ou ID de diário em uso"

-- Panel: Spoken Alerts Frame
L.Panel_SpokenAlerts		= "Avisos falados"
L.Area_VoiceSelection		= "Seleção de vozes"
L.CountdownVoice			= "Definir voz primaria para sons de contagem"
L.CountdownVoice2			= "Definir voz secundaria para sons de contagem"
L.CountdownVoice3			= "Definir voz terciária para sons de contagem"
L.VoicePackChoice			= "Definir pacote de vozes para avisos falados"
L.Area_CountdownOptions		= "Opções de contagens"
L.Area_VoicePackOptions		= "Opções de pacotes de vozes (Pacotes de vozes de terceiros)"
L.SpecWarn_NoSoundsWVoice	= "Filtrar avisos sonoros especiais para avisos que contem avisos falados ..."
L.SWFNever					= "Nunca"
L.SWFDefaultOnly			= "Quando avisos especiais usarem som padrão ( permitir que sons customizados ainda toquem)."
L.SWFAll					= "Quando sons especiais usarem qualquer som"
L.SpecWarn_AlwaysVoice		= "Sempre tocar todos os avisos falados (Substitui opções especificas dos chefes. Útil para lideres de raides)"
--TODO, maybe add URLS right to GUI panel on where to acquire 3rd party voice packs? talvez ...
L.Area_GetVEM				= "Obtenha o pacote de voz VEM"
L.VEMDownload				= "|cFF73C2FBhttps://curseforge.com/wow/addons/dbm-voicepack-vem|r"
L.Area_BrowseOtherVP		= "Procure outros pacotes de voz em curse"
L.BrowseOtherVPs			= "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+voice|r"
L.Area_BrowseOtherCT		= "Procure outros pacotes de voz em curse"
L.BrowseOtherCTs			= "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+count+pack|r"

-- Tab: Event Sounds
L.Panel_EventSounds			= "Soms do evento"
L.Area_SoundSelection		= "Seleções de som (menus de seleção de rolagem com roda do mouse)"
L.EventVictorySound			= "Definir o som tocado para a vitória do encontro"
L.EventWipeSound			= "Definir som reproduzido para wipe de encontro"
L.EventEngageSound			= "Definir o som reproduzido para o encontro"
L.EventDungeonMusic			= "Definir música tocada dentro de masmorras/raides"
L.EventEngageMusic			= "Definir música tocada durante os encontros"
L.Area_EventSoundsExtras	= "Opções de som do evento"
L.EventMusicCombined		= "Permitir todas as opções de música nas masmorras e encontrar seleções (alterar essa opção requer recarregar a interface do usuário para refletir as alterações)"
L.Area_EventSoundsFilters	= "Condições do filtro de som do evento"

-- Tab: Timers
L.TabCategory_Timers		= "Cronômetros"
L.Area_ColorBytype			= "Guia por barras de cores por tipo"
-- Panel: Color by Type
L.Panel_ColorByType	 		= "Cor por tipo"
L.AreaTitle_BarColors		= "Cores da barra por tipo de cronômetro"
L.BarTexture 				= "Textura da barra"
L.BarStyle					= "Estilo da barra"
L.BarDBM					= "Clássico (pequena barra existente desliza para âncora ampliada)"
L.BarSimple					= "Simple (sem animação)"
L.BarStartColor				= "Cor inicial"
L.BarEndColor 				= "Cor final"
L.Bar_Height				= "Altura da barra: %d"
L.Slider_BarOffSetX 		= "Deslocamento X: %d"
L.Slider_BarOffSetY 		= "Deslocamento Y: %d"
L.Slider_BarWidth 			= "Largura da barra: %d"
L.Slider_BarScale 			= "Escala da barra: %0.2f"
--Types
L.BarStartColorAdd			= "Cor inicial (Lacaio)"
L.BarEndColorAdd			= "Cor final (Add)"
L.BarStartColorAOE			= "Cor inicial (AOE)"
L.BarEndColorAOE			= "Cor final (AOE)"
L.BarStartColorDebuff		= "Cor inicial (Alvo)"
L.BarEndColorDebuff			= "Cor final (Alvo)"
L.BarStartColorInterrupt	= "Cor inicial (Interromper)"
L.BarEndColorInterrupt		= "Cor final (Interromper)"
L.BarStartColorRole			= "Cor inicial (Função)"
L.BarEndColorRole			= "Cor final (Função)"
L.BarStartColorPhase		= "Cor inicial (Fase)"
L.BarEndColorPhase			= "Cor final (Fase)"
L.BarStartColorUI			= "Cor inicial (Usuário)"
L.BarEndColorUI				= "Cor final (Usuário)"
--Type 7 options
L.Bar7Header				= "Opções da barra de usuário"
L.Bar7ForceLarge			= "Sempre use barra grande"
L.Bar7CustomInline			= "Use ícone '!' personalizado embutido"
--Dropdown Options
L.CBTGeneric				= "Genérico"
L.CBTAdd					= "Lacaio"
L.CBTAOE					= "AOE"
L.CBTTargeted				= "Alvo"
L.CBTInterrupt				= "Interromper"
L.CBTRole					= "Função"
L.CBTPhase					= "Fase"
L.CBTImportant				= "Importante (Usuário)"
L.CVoiceOne					= "Voz de contagem 1"
L.CVoiceTwo					= "Voz de contagem 2"
L.CVoiceThree				= "Voz de contagem 3"

-- Panel: Timers
L.Panel_Appearance	 		= "Aparência de barra"
L.Panel_Behavior	 		= "Comportamento da barra"
L.AreaTitle_BarSetup		= "Opções gerais de barra"
L.AreaTitle_BarSetupSmall 	= "Opções da barra pequena"
L.AreaTitle_BarSetupHuge	= "Opções da barra grande"
L.EnableHugeBar 			= "Habilitar barra grande (aka Barra 2)"
L.BarIconLeft 				= "Ícone da esq."
L.BarIconRight 				= "Ícone da dir."
L.ExpandUpwards				= "Expandir para cima"
L.FillUpBars				= "Barras enchem"
L.ClickThrough				= "Desabilitar eventos de mouse (permite clicar através das barras)"
L.Bar_Decimal				= "Exibir porcentagens abaixo do cronômetro: %d"
L.Bar_Alpha					= "Alfa: %0.1f"
L.Bar_EnlargeTime			= "Barras aumentam abaixo deste tempo: %d"
L.BarSpark					= "Barra faísca"
L.BarFlash					= "Barra pisca quando estiver para expirar"
L.BarSort					= "selecionar pelo tempo restante"
L.BarColorByType			= "Cor por tipo"
L.NoBarFade					= "Usa cores de início/fim como cores pequenas/grandes em vez de mudança gradual de cor"
L.BarInlineIcons			= "Exibir ícones embutidos"
L.ShortTimerText			= "Usa texto breve do timer (quando disponível)"
L.StripTimerText			= "Strip recarga/próximo fora de cronômetros"
L.KeepBar					= "Mantenha o cronômetro ativo até a habilidade ser lançada"
L.KeepBar2					= "(quando suportado pelo mod)"
L.FadeBar					= "Cronômetros de desbotamento para habilidades fora do alcance"

-- Tab: Global Disables & Filters
L.TabCategory_Filters	 	= "Filtros Global e de Spam"
L.Area_DBMFiltersSetup		= "Guia de filtros DBM"
L.Area_BlizzFiltersSetup	= "Guia de filtros Blizzard"
-- Panel: DBM Features
L.Panel_SpamFilter			= "Características DBM"
L.Area_SpamFilter_Anounces	= "Anunciar as opções globais de desativação e filtro"
L.SpamBlockNoShowAnnounce	= "Não exibir anúncios ou tocar avisos sonoros"
L.SpamBlockNoShowTgtAnnounce= "Não Exibir texto ou reproduzir som para anúncios gerais do ALVO (o filtro acima substitui este)"
L.SpamBlockNoSpecWarnText	= "Não Exibir texto de anúncio especial"
L.SpamBlockNoSpecWarnFlash	= "Não Exibir piscada de tela de anúncio especial"
L.SpamBlockNoSpecWarnSound	= "Não reproduzir soms especiais de anúncio (ainda permite pacotes de voz, se um estiver ativado no painel Alertas falados)"

L.Area_SpamFilter_Timers	= "Opções globais de desativação e filtro do cronômetro"
L.SpamBlockNoShowTimers		= "Não Exibir cronômetros de modificação (Mod do Chefe/Respawn)"
L.SpamBlockNoShowUTimers	= "Não Exibir cronômetros enviados pelo usuário (Personalizado/Puxar/Quebrar)"
L.SpamBlockNoCountdowns		= "Não reproduzir sons de contagem regressiva"

L.Area_SpamFilter_Misc		= "Opções globais diversas de desativação e filtro"
L.SpamBlockNoSetIcon		= "Não marcar jogadores com ícones"
L.SpamBlockNoRangeFrame		= "Não exibir quadro de distancia"
L.SpamBlockNoInfoFrame		= "Não exibir quadro de informação"
L.SpamBlockNoHudMap			= "Não Exibir mapas HudMap"
L.SpamBlockNoNameplate		= "Não mostrar auras da placa de identificação"
L.SpamBlockNoYells			= "Não envie gritos de bate-papo"
L.SpamBlockNoNoteSync		= "Não aceite notas compartilhadas"

L.Area_Restore				= "Opções de restauração do DBM (se o DBM restaura o estado anterior do usuário quando os mods terminam)"
L.SpamBlockNoIconRestore	= "Não guardar estado dos ícones e restaura-los ao fim do combate"
L.SpamBlockNoRangeRestore	= "Não restaurar o quadro de distancia para o estado anterior ( show/hide ) quando a mod pedir hide'"

L.Area_SpamFilter			= "Opções do filtro Global"
L.DontShowFarWarnings		= "Não exibir anúncios/cronômetros para eventos que estão longe"
L.StripServerName			= "Tira com nome do reino em avisos e cronômetros"

L.Area_SpecFilter			= "Opções de especialização"
L.FilterTankSpec			= "Filtrar mensagens designadas para tank role quando não for tank. (Nota: Desabilitar esta função não é recomendado para a maioria dos usuários já que avisos de 'taunt' ( insultos ) estão habilitados por definição.)"
L.FilterInterruptsHeader	= "Filtrar anúncios para feitiços interrompíveis com base na preferência de comportamento."
L.FilterInterrupts			= "Filtrar avisos para habilidades passivas de cortes ( interrupts ) se o alvo não for o seu target ou focus ( Não se aplica para magias criticas que resultaram em derrota caso não seja interrompida)"
L.FilterInterrupts2			= "Se o lançador não for o alvo atual (Sempre) ou interromper o CD (Somente Chefe)"
L.FilterInterrupts3			= "Se o lançador não for o alvo atual (sempre) ou interromper o CD (chefe e lixeira)"
L.FilterInterrupts4			= "Filtrar sempre anúncios de interrupção"
L.FilterInterruptNoteName	= "Filtrar anúncios para feitiços interrompíveis (com contagem) se o anúncio não contiver seu nome na nota personalizada"
L.FilterDispels				= "Filtrar avisos para magias dissipáveis se a seu dissipar estiver em recarga."
L.FilterTrashWarnings		= "Filtrar todos os anúncios de lixo nas masmorras"

L.Area_PullTimer			= "Opções de Filtros de Puxada, pausa, Combate, & cronômetro customizados"
L.DontShowPTNoID			= "Bloquear o cronômetro de Puxada se não foi enviado na mesma zona que você"
L.DontShowPT				= "Não exibir a barra de puxada"
L.DontShowPTText			= "Não exibir texto de anúncio do cronômetro de puxada"
L.DontPlayPTCountdown		= "Não tocar o áudio da contagem regressiva de puxada/combate/customizado"
L.PT_Threshold				= "Não exibir o texto da contagem regressiva de puxada/combate/customizado acima de: %d"

-- Panel: Blizzard Features
L.Panel_HideBlizzard		= "Esconder Blizzard"
L.Area_HideBlizzard			= "Esconder Opções da Blizzard"
L.HideBossEmoteFrame		= "Esconder o quadro de emote do chefe de raid durante as lutas"
L.HideWatchFrame			= "Esconder/acompanhar quadros (de objetivos) durante as lutas contra os chefes, caso nenhuma conquista esteja sendo acompanhada. No modo desafio, cria uma medalha temporária na luta de chefes enquanto o quadro estiver escondido"
L.HideTooltips				= "Esconder as dicas durante as lutas contra os chefes"
L.DisableSFX				= "Desativa o canal de efeitos sonoros durante lutas contra chefes"
L.Always					= "Sempre"
L.CombatOnly				= "Desativar em combate (qualquer)"
L.RaidCombat				= "Desativar em combate (apenas chefes)"

-- Tab: Privacy
L.Tab_Privacy 				= "Privacidade"
L.Area_WhisperMessages		= "Opções de resposta automática/compartilhamento de mensagens"
L.AutoRespond 				= "Resposta automática a sussurros enquanto luta"
L.WhisperStats 				= "Incluir estatísticas nas respostas sussurros"
L.DisableStatusWhisper 		= "Desativar os sussurros de status para todo o grupo (requer Líder do grupo). Aplica-se apenas a raides"
L.Area_SyncMessages			= "Opções de sincronização"
L.EnableWBSharing 			= "Compartilhe quando você puxa/derrota um chefe mundial ou ativa um buff mundial com seus amigos do battle.net que estão no mesmo reino. (Esta informação será sempre compartilhada com sua guilda)"
L.DisableGuildStatus 		= "Desativar o envio de mensagens de progressão para a guilda de todo o grupo (requer Líder do grupo)."

-- Tab: Frames & Integrations
L.TabCategory_Frames		= "Quadros e integrações"
L.Area_NamelateInfo			= "Informações sobre auras da placa de identificação do DBM"
-- Panel: InfoFrame
L.Panel_InfoFrame			= "Quadro de informações"

-- Panel: Range
L.Panel_Range				= "Quadro de alcance"

-- Panel: Nameplate
L.Panel_Nameplates			= "Placa de identificação"
L.UseNameplateHandoff		= "Transferir solicitações de aura de placa de identificação para addons de placa de identificação compatíveis (KuiNameplates, Threat Plates, Plater) em vez de lidar internamente. Esta é a opção recomendada, pois permite que recursos e configuração mais vantajosos sejam feitos por meio do addon da placa de identificação"
L.Area_NPStyle				= "Estilo (Observação: somente configura o estilo quando o DBM está lidando com placas de identificação.)"
L.NPAuraSize				= "Tamanho do pixel da Aura (ao quadrado): %d"

-- Misc
L.Area_General				= "Geral"
L.Area_Position				= "Posição"
L.Area_Style				= "Estilo"

L.FontType					= "Escolha fonte"
L.FontStyle					= "Bandeira de fonte"
L.FontColor					= "Cor da fonte"
L.FontShadow				= "Sombra da fonte"
L.FontSize					= "Tamanho da fonte: %d"

L.FontHeight	= 16
