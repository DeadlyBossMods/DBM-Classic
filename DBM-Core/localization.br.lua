-- Last update by GlitterStorm @ Azralon on Feb,28th,2015
if GetLocale() ~= "ptBR" then return end

if not DBM_CORE_L then DBM_CORE_L = {} end

local L = DBM_CORE_L

L.DEADLY_BOSS_MODS					= "Deadly Boss Mods"
L.DBM								= "DBM"

L.HOW_TO_USE_MOD					= "Bem vindo ao DBM. Digite /dbm help para obter uma lista dos comandos disponíveis. Para acessar as opções, digite /dbm no seu chat para começar a configuração. Carregue zonas específicas manualmente para configurar opções específicas de cada chefe para o seu gosto pessoal. O DBM tenta fazer isso automaticamente para você, observando sua spec na primeira vez que é executado. De qualquer forma, você pode querer habilitar outras opções."
L.SILENT_REMINDER					= "Lembrete: " .. L.DBM .. " ainda está no modo silencioso."

L.LOAD_MOD_ERROR				= "Erro ao carregar módulo %s: %s "
L.LOAD_MOD_SUCCESS			= "Módulo '%s' carregado. Para mais opções, digite /dbm ou /dbm help no chat"
L.LOAD_MOD_COMBAT			= "Carregamento de '%s' adiado até que você saia de combate"
L.LOAD_GUI_ERROR				= "Não foi possível carregar interface gráfica: %s"
L.LOAD_GUI_COMBAT			= "A interface gráfica não pode ser carregada em combate e será assim que você o sair. Quando estiver carregada, você poderá chama-la em combate."
L.BAD_LOAD					= "DBM detectou que a sua mod desta área falhou ao tentar carregar por completo por estar em combate. Use o comando /reloadui assim que sair de combate para corrigir o problema."
L.LOAD_MOD_VER_MISMATCH		= "%s não foi carregado por não cumprir os requerimentos. Uma atualização da mod é necessária. Obrigado."
L.LOAD_MOD_EXP_MISMATCH				= "%s não pôde ser carregado porque foi projetado para uma expansão WoW que não está disponível no momento. Quando a expansão estiver disponível, este mod funcionará automaticamente."
L.LOAD_MOD_TOC_MISMATCH				= "%s não pôde ser carregado porque não foi projetado para o WoW clássico. Você provavelmente instalou uma versão comercial de um módulo. Remova este módulo e use apenas addons criados para o Classic World of Warcraft"
L.LOAD_MOD_DISABLED					= "%s está instalado, mas atualmente desativado. Este mod não será carregado, a menos que você o habilite."
L.LOAD_MOD_DISABLED_PLURAL			= "%s estão instalados, mas atualmente desativados. Esses mods não serão carregados, a menos que você os habilite."

L.COPY_URL_DIALOG					= "Copiar URL"

--Post Patch 7.1
L.NO_RANGE							= "O radar de alcance não pode ser usado em instâncias. Quadro de intervalo de texto herdado usado no lugar"
L.NO_ARROW							= "A seta não pode ser usada em instâncias"
L.NO_HUD							= "HUDMap não pode ser usada em instâncias"

L.DYNAMIC_DIFFICULTY_CLUMP	= "DBM desabilitou o quadro de alcance dinâmico nesta luta, por falta de informação sobre o numero de jogadores à ficarem amontoados para um grupo desse tamanho."
L.DYNAMIC_ADD_COUNT					= L.DBM .. " desativou adicionar avisos de contagem nesta luta a informações insuficientes sobre o número de adições que aparecem para um grupo do seu tamanho."
L.DYNAMIC_MULTIPLE					= L.DBM .. " desativou vários recursos dessa luta para obter informações insuficientes sobre determinadas mecânicas para um grupo do seu tamanho."

L.LOOT_SPEC_REMINDER				= "Sua especificação atual é %s. Sua escolha de saque atual é %s."

L.BIGWIGS_ICON_CONFLICT				= L.DBM .. " detectou que você tem ícones de ataque ativados no BigWigs e no " .. L.DBM .. ". Desative os ícones em um deles para evitar conflitos"

L.DYNAMIC_ADD_COUNT			= "DBM desabilitou aviso da contagem de adds nesta luta, por falta de informação da quantidade de adds para um grupo deste tamanho."
L.DYNAMIC_MULTIPLE			= "DBM desabilitou varias funções desta luta por causa da falta de informação sobre certas mecânicas para um grupo deste tamanho."

L.LOOT_SPEC_REMINDER			= "A sua especialização atual é %s. A sua escolha atual de loot é %s."

L.BIGWIGS_ICON_CONFLICT		= "DBM detectou que você tem ícones habilitados tanto no BigWigs quanto no DBM. Por favor desabilite um dos dois para evitar conflitos com o líder da raid"

L.MOD_AVAILABLE				= "%s esta disponível para este conteúdo. Esta disponível em |HDBM:forums|h|cff3588ffdeadlybossmods.com|r. Está mensagem só será exibida uma vez."

L.COMBAT_STARTED				= "%s na mira. Boa sorte e divirta-se! :)"
L.COMBAT_STARTED_IN_PROGRESS	= "Entrando em uma luta em progresso contra %s. Boa sorte e divirta-se! :)"
L.GUILD_COMBAT_STARTED		= "%s engrenou em combate com a Guild"
L.BOSS_DOWN					= "%s derrotado após %s!"
L.BOSS_DOWN_I				= "%s derrotado! você tem %d vitorias no total."
L.BOSS_DOWN_L				= "%s derrotado após %s! Sua última vitória levou %s, sua vitória mais rápida %s. Você tem um total de %d vitórias."
L.BOSS_DOWN_NR				= "%s derrotado após %s! Esse é um novo recorde! (Recorde antigo era %s). Você tem um total de %d vitórias."
L.GUILD_BOSS_DOWN			= "%s foi derrotado pela guild após %s!"
L.COMBAT_ENDED_AT			= "Combate contra %s (%s) encerrado após %s."
L.COMBAT_ENDED_AT_LONG		= "Combate contra %s (%s) encerrado após %s. Você tem um total de %d derrotas nessa dificuldade."
L.GUILD_COMBAT_ENDED_AT		= "Guild foi derrotada por %s (%s) após %s."
L.COMBAT_STATE_RECOVERED		= "Luta contra %s começou %s atrás, reajustando cronômetros..."
L.TRANSCRIPTOR_LOG_START		= "Gravação do Transcritor começou."
L.TRANSCRIPTOR_LOG_END		= "Gravação do Transcritor finalizado."

L.MOVIE_SKIPPED						= L.DBM .. " tentou pular uma cena cortada automaticamente."

L.AFK_WARNING						= "Você está AFK e em combate (d% de pontos de vida restantes), disparando um alerta sonoro. Se você não é AFK, limpe seu sinalizador AFK ou desative esta opção em 'recursos extras'."

L.COMBAT_STARTED_AI_TIMER			= "Minha CPU é um processador de rede neural; um computador de aprendizado. (Essa luta usará o novo recurso AI do cronômetro para gerar aproximações do cronômetro)"

L.PROFILE_NOT_FOUND			= "<DBM> Seu perfil atual esta corrompido. DBM carregara o perfil 'padrão/default'."
L.PROFILE_CREATED			= "'%s' perfil criado."
L.PROFILE_CREATE_ERROR		= "Falha ao criar perfil. nome de perfil invalido."
L.PROFILE_CREATE_ERROR_D		= "Falha ao criar perfil. '%s' perfil já existe."
L.PROFILE_APPLIED			= "'%s' perfil aplicado."
L.PROFILE_APPLY_ERROR		= "Falha ao aplicar perfil. '%s' perfil não existe."
L.PROFILE_COPIED				= "'%s' perfil copiado."
L.PROFILE_COPY_ERROR			= "Falha ao copiar perfil. '%s' perfil não existe."
L.PROFILE_COPY_ERROR_SELF	= "Falha ao copiar perfil, não é possível copiar a si mesmo."
L.PROFILE_DELETED			= "'%s' perfil deletado. Perfil 'padrão/default' será aplicado."
L.PROFILE_DELETE_ERROR		= "Falha ao deletar perfil. '%s' perfil não existe."
L.PROFILE_CANNOT_DELETE		= "Não é possível deletar o perfil 'padrão/Default'."
L.MPROFILE_COPY_SUCCESS		= "%s's (%d spec) preferencias da mod foram copiadas."
L.MPROFILE_COPY_SELF_ERROR	= "Não é possível copiar às preferencias do char para ele mesmo"
L.MPROFILE_COPY_S_ERROR		= "Origem esta corrompida. Preferencias não foram copias ou foram copiadas parcialmente. Falha ao copiar."
L.MPROFILE_COPYS_SUCCESS		= "%s's (%d spec) preferencias de sons da mod foram copiadas."
L.MPROFILE_COPYS_SELF_ERROR	= "Não é possível copiar as preferencias de sons do char para ele mesmo"
L.MPROFILE_COPYS_S_ERROR		= "Origem esta corrompida. Preferencias de sons não foram copiadas ou foram copiadas parcialmente. Falha ao copiar."
L.MPROFILE_DELETE_SUCCESS	= "%s's (%d spec) preferencias da mod deletadas."
L.MPROFILE_DELETE_SELF_ERROR	= "Não é possível deletar preferencias que estão em uso."
L.MPROFILE_DELETE_S_ERROR	= "Origem esta corrompida. Preferencias não foram deletadas ou foram deletadas parcialmente. Falha ao deletar."

L.ALLMOD_DEFAULT_LOADED		= "Foram carregadas preferencias padrões para todas as mods desta area."
L.ALLMOD_STATS_RESETED		= "Todas as estatísticas da mod foram apagadas."
L.MOD_DEFAULT_LOADED			= "Foram carregadas opções padrão para esta luta."

L.NOTE_SHARE_SUCCESS				= "%s compartilhou sua nota para %s"
L.NOTE_SHARE_FAIL					= "%s tentou compartilhar o texto da nota com você por %s. No entanto, o mod associado a essa capacidade não é desinstalado ou não é carregado. Se você precisar desta nota, carregue o mod para o qual estão compartilhando notas e peça para que compartilhem novamente"

L.NOTEHEADER						= "Digite o texto da sua nota aqui para %s. Incluir o nome de um jogador com >< pinta por classe. Para alertas com várias contagens, separe as notas com '/'"
L.NOTEFOOTER						= "Pressione 'OK' para aceitar as alterações ou 'Cancelar' para recusar as alterações"
L.NOTESHAREDHEADER					= "%s compartilhou o texto da nota abaixo para %s. Se você aceitar, ele substituirá sua nota existente"
L.NOTESHARED						= "Sua nota foi enviada ao grupo"
L.NOTESHAREERRORSOLO				= "Solitário? Não deveria estar passando notas para si mesmo"
L.NOTESHAREERRORBLANK				= "Não é possível compartilhar anotações em branco"
L.NOTESHAREERRORGROUPFINDER			= "As anotações não podem ser compartilhadas em BGs, LFR ou LFG"
L.NOTESHAREERRORALREADYOPEN			= "Não é possível abrir um link de nota compartilhada enquanto o editor de notas já está aberto, para impedir que você perca a nota que está editando no momento"

L.ALLMOD_DEFAULT_LOADED				= "As opções padrão para todos os mods nesta instância foram carregadas."
L.ALLMOD_STATS_RESETED				= "Todas as estatísticas de mod foram redefinidas."
L.MOD_DEFAULT_LOADED				= "As opções padrão para essa luta foram carregadas."
L.SOUNDKIT_MIGRATION				= "Um ou mais dos seus sons de aviso / aviso especiais foram redefinidos para os padrões por incompatibilidade com o patch 8.2 e posterior (o som deve residir na pasta da interface para reproduzir por caminho ou usar o SoundKit ID)"

L.WORLDBOSS_ENGAGED			= "%s foi possivelmente puxado no seu reino %s por cento de vida. (Enviado por %s)"
L.WORLDBOSS_DEFEATED			= "%s foi possivelmente derrotado no seu reino (Enviado por %s)."
L.WORLDBUFF_STARTED					= "%s buff começou em seu reino para a facção da %s (Enviado por %s)."

L.TIMER_FORMAT_SECS			= "%.2f |4segundo:segundos;"
L.TIMER_FORMAT_MINS			= "%d |4minuto:minutos;"
L.TIMER_FORMAT				= "%d |4minuto:minutos; e %.2f |4segundo:segundos;"

L.MIN						= "min"
L.MIN_FMT					= "%d min"
L.SEC						= "seg"
L.SEC_FMT					= "%s seg"
L.DEAD						= "morto"
L.OK							= "Ok"

L.GENERIC_WARNING_OTHERS		= "e mais um"
L.GENERIC_WARNING_OTHERS2	= "e %d outros"
L.GENERIC_WARNING_BERSERK	= "Frenético em %s %s"
L.GENERIC_TIMER_BERSERK		= "Frenético"
L.OPTION_TIMER_BERSERK		= "Exibir cronômetro para $spell:26662"
L.GENERIC_TIMER_COMBAT		= "Combate começou"
L.OPTION_TIMER_COMBAT		= "Exibir cronômetro para começo do combate"
L.BAD								= "Inválido"

L.OPTION_CATEGORY_TIMERS		= "Barras"
L.OPTION_CATEGORY_WARNINGS	= "Categoria de anúncios"
L.OPTION_CATEGORY_WARNINGS_YOU	= "Anúncios pessoais"
L.OPTION_CATEGORY_WARNINGS_OTHER	= "Anúncios de alvo"
L.OPTION_CATEGORY_WARNINGS_ROLE	= "Anúncios de função"

L.OPTION_CATEGORY_SOUNDS			= "Sons"
L.OPTION_CATEGORY_DROPDOWNS			= "Suspenso"--Still put in MISC sub grooup, just used for line separators since multiple of these on a fight (or even having on of these at all) is rare.
L.OPTION_CATEGORY_YELLS				= "Grita"
L.OPTION_CATEGORY_NAMEPLATES		= "Placas de identificação"
L.OPTION_CATEGORY_ICONS				= "Ícones"

L.AUTO_RESPONDED						= "Respondido automaticamente"
L.STATUS_WHISPER						= "%s: %s, %d/%d pessoas vivas"
--Chefes
L.AUTO_RESPOND_WHISPER				= "%s está ocupado lutando contra %s (%s, %d/%d pessoas vivas)"
L.WHISPER_COMBAT_END_KILL			= "%s derrotou %s!"
L.WHISPER_COMBAT_END_KILL_STATS		= "%s derrotou %s! Eles tem um total de %d vitórias."
L.WHISPER_COMBAT_END_WIPE_AT			= "%s foi derrotado por %s em %s"
L.WHISPER_COMBAT_END_WIPE_STATS_AT	= "%s foi derrotado por %s em %s. Eles tem um total de %d derrotas nessa dificuldade."

L.VERSIONCHECK_HEADER		= "Deadly Boss Mods - Versões"
L.VERSIONCHECK_ENTRY			= "%s: %s (%s)"
L.VERSIONCHECK_ENTRY_TWO		= "%s: %s (%s) & %s (%s)"--Two Boss mods
L.VERSIONCHECK_ENTRY_NO_DBM	= "%s: DBM não instalado"
L.VERSIONCHECK_FOOTER		= "Encontrados %d jogadores com DBM & %d jogadores com Bigwigs"
L.VERSIONCHECK_OUTDATED		= "Os seguintes %d jogadores estão com versões desatualizadas de boss mods: %s"
L.YOUR_VERSION_OUTDATED      = "Sua versão do Deadly Boss Mods está desatualizada. Por favor, acesse www.deadlybossmods.com para baixar a versão mais recente."
L.VOICE_PACK_OUTDATED		= "O pacote de vozes do seu DBM pode estar sem alguns dos sons suportados por esta versão do DBM. Filtro de aviso especial sonoro foi desativado. Por favor baixe a versão mais recente do pacote de vozes ou contate o autor para um pacote que contenha os sons aqui referidos."
L.VOICE_MISSING				= "Você tinha um pacote de vozes DBM selecionado que não pode ser encontrado. Sua seleção foi restaurada para 'Nenhum/None'. Caso seja um erro, certifique-se que o pacote esta instalado corretamente e habilitado em addons."
L.VOICE_COUNT_MISSING		= "Voz de contagem regressiva %d esta selecionada para um pacote de voz que não pode ser encontrado. Foi restaurada a configuração padrão."
L.BIG_WIGS							= "BigWigs"

L.UPDATEREMINDER_HEADER		= "Sua versão do Deadly Boss Mods está desatualizada.\n A versão %s (%s) está disponível para baixar no site da curse, WoWI ou aqui:"
L.UPDATEREMINDER_HEADER_ALPHA	= "A sua versão alpha do DBM está desatualizada.\n Você esta pelo menos %d versões de testes para trás. É recomendado que os usuários do DBM utilizem a versão mais recente do alpha ou a mais recente das versões estáveis. Versões alphas desatualizadas podem resultar em faltas de algumas funcionalidades ou totalmente inoperante."
L.UPDATEREMINDER_FOOTER		= "Pressione Ctrl+C para copiar o link de download para a área de transferência."
L.UPDATEREMINDER_FOOTER_GENERIC	= "Pressione Ctrl+C para copiar o link de download para a área de transferência."
L.UPDATEREMINDER_DISABLE			= "AVISO: O seu DBM foi desativado por estar drasticamente desatualizado (pelo menos %d revisões), atualize para utilizar novamente. Isso garante que versões antigas ou códigos incompatíveis não arruínem à experiência de jogo para você ou para os membros da raid."
L.UPDATEREMINDER_HOTFIX			= "A sua versão do DBM contem temporizadores ou avisos incorretos para este chefe. Isso foi corrigido em uma versão mais recente ( ou alpha caso não exista versão estável mais recente disponível)"
L.UPDATEREMINDER_HOTFIX_ALPHA	= L.DBM .. " A versão em que você está enfrentou problemas conhecidos durante esse encontro com os chefes, corrigidos em uma próxima versão (ou na versão alfa mais recente)"
L.UPDATEREMINDER_MAJORPATCH		= "AVISO: O seu DBM foi desativado por estar drasticamente desatualizado (pelo menos %d revisões), atualize para utilizar novamente. Isso garante que versões antigas ou códigos incompatíveis não arruínem à experiência de jogo para você ou para os membros da raid. Certifique-se de baixar a versão mais recente em deadlybossmods.com ou curse o mais breve possível."
L.UPDATEREMINDER_TESTVERSION		= "AVISO: Você esta usando uma versão do DBM que não foi criada para esta versão do jogo. Por favor, certifique-se de baixar a versão correta em deadlybossmods.com ou curse."
L.VEM				= "AVISO: Você esta usando DBM e Voice Encounter Mods. DBM não funcionara corretamente nesta configuração e portanto não será carregada."
L.OUTDATEDPROFILES				= "AVISO: DBM-Profiles não é compatível com esta versão de DBM. Deve ser removida antes de DBM continuar para evitar conflitos."
L.OUTDATEDSPELLTIMERS				= "AVISO: DBM-SpellTimers rompe " .. L.DBM .. "e deve ser desativado para " .. L.DBM .. " funciona corretamente."
L.OUTDATEDRLT						= "AVISO: DBM-RaidLeadTools rompe " .. L.DBM .. ". DBM-RaidLeadTools não é mais suportado e deve ser removido para " .. L.DBM .. " funciona corretamente."
L.VICTORYSOUND						= "AVISO: DBM-VictorySound não é compatível com esta versão do " .. L.DBM .. ". Deve ser removido antes de " .. L.DBM .. " pode prosseguir, para evitar conflitos."
L.DPMCORE							= "AVISO: Deadly PvP mods foi descontinuado e não é compatível com esta versão do " .. L.DBM .. ". Deve ser removido antes de " .. L.DBM .. " pode prosseguir, para evitar conflitos."
L.DBMLDB							= "AVISO: DBM-LDB agora está embutido DBM-Core. Embora não cause nenhum dano, é recomendável remover 'DBM-LDB' da sua pasta de addons"
L.UPDATE_REQUIRES_RELAUNCH		= "AVISO: Esta versão de DBM não funcionara corretamente até que você recomece o jogo por completo. Esta atualização contem novos arquivos ou mudanças no .toc que não podem ser carregadas via ReloadUI. Você pode encontrar funcionalidades quebradas ou erros caso continue sem recomeçar o jogo por completo."
L.OUT_OF_DATE_NAG					= "Sua versão de " .. L.DEADLY_BOSS_MODS .. " está desatualizado. É recomendável que você atualize para esta luta para não perder um alerta ou cronômetro importante, ou um grito restante da invasão espera ver de você."
L.CLASSIC_ONLY						= "AVISO: Esta versão do " .. L.DBM .. " destina-se apenas a ser usado com o World of Warcraft: Classic. Desinstale esta versão e instale a versão correta do " .. L.DBM .. " para Retail WoW."

L.UPDATEREMINDER_NOTAGAIN	= "Exibir pop-up quando houver uma nova versão disponível"

L.MOVABLE_BAR				= "Arraste-me!"

L.PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h te enviou um cronômetro do DBM: '%2$s'\n|HDBM:cancel:%2$s:nil|h|cff3588ff[Cancelar esse cronômetro]|r|h  |HDBM:ignore:%2$s:%1$s|h|cff3588ff[Ignorar cronômetros de %1$s]|r|h"
L.PIZZA_CONFIRM_IGNORE			= "Você tem certeza de que realmente deseja ignorar cronômetros de %s até o fim desta sessão?"
L.PIZZA_ERROR_USAGE				= "Uso: /dbm [broadcast] timer <tempo> <texto>"

--L.MINIMAP_TOOLTIP_HEADER (Same as English locales)
L.MINIMAP_TOOLTIP_FOOTER		= "Use shift+click ou clique com o botão direito para mover\nUse alt+shift+click para arrastar livremente"

L.RANGECHECK_HEADER			= "Medir distância: (%d m)"
L.RANGECHECK_HEADERT				= "Medir distância: (%d m-%dP)"
L.RANGECHECK_RHEADER				= "R-Medir distância (%d m)"
L.RANGECHECK_RHEADERT				= "R-Medir distância (%d m-%dP)"
L.RANGECHECK_SETRANGE		= "Definir distância"
L.RANGECHECK_SETTHRESHOLD	= "Definir limite para jogador"
L.RANGECHECK_SOUNDS			= "Sons"
L.RANGECHECK_SOUND_OPTION_1	= "Soar quando um jogador entrar na distância"
L.RANGECHECK_SOUND_OPTION_2	= "Soar quando mais de um jogador entrar na distância"
L.RANGECHECK_SOUND_0			= "Sem som"
L.RANGECHECK_SOUND_1			= "Som padrão"
L.RANGECHECK_SOUND_2			= "Bip irritante"
L.RANGECHECK_HIDE			= "Esconder"
L.RANGECHECK_SETRANGE_TO		= "%d m"
L.RANGECHECK_LOCK			= "Travar posição"
L.RANGECHECK_OPTION_FRAMES	= "Quadros"
L.RANGECHECK_OPTION_RADAR	= "Mostrar quadro do radar"
L.RANGECHECK_OPTION_TEXT		= "Mostrar quadro de texto"
L.RANGECHECK_OPTION_BOTH		= "Mostrar ambos"
L.RANGERADAR_HEADER					= "Distância:%d Jogadores:%d"
L.RANGERADAR_RHEADER				= "R-Distância:%d Jogadores:%d"
L.RANGERADAR_IN_RANGE_TEXT			= "%d em distância (%0.1fy)"--Multi
L.RANGECHECK_IN_RANGE_TEXT			= "%d em distância"--Text based doesn't need (%dyd), especially since it's not very accurate to the specific yard anyways
L.RANGERADAR_IN_RANGE_TEXTONE		= "%s (%0.1fy)"--One target

L.INFOFRAME_SHOW_SELF				= "Sempre mostre seu poder"		-- Always show your own power value even if you are below the threshold
L.INFOFRAME_SETLINES				= "Definir linhas máximas"
L.INFOFRAME_LINESDEFAULT			= "Definir por mod"
L.INFOFRAME_LINES_TO				= "%d linhas"
L.INFOFRAME_POWER					= "Poder"
L.INFOFRAME_AGGRO					= "Aggro"
L.INFOFRAME_MAIN					= "Principal:"--Main power
L.INFOFRAME_ALT						= "Alternativo:"--Alternate Power
L.INFOFRAME_LOCK				= "Travar posição"
L.INFOFRAME_HIDE				= "Esconder"
L.INFOFRAME_SHOW_SELF		= "Sempre exibir seu poder"		-- Always show your own power value even if you are below the threshold

L.LFG_INVITE						= "Aceitar convite"

L.SLASHCMD_HELP				= {
	"Comandos disponíveis:",
	"/dbm unlock: Exibe uma barra de cronômetro móvel. (ou: move).",
	"/range <number> or /distance <number>: Shows range frame. /rrange or /rdistance to reverse colors.",--Translate
	"/dbm timer: Starts a custom DBM timer, see '/dbm timer' for details.",--Translate
	"/dbm arrow: Exibe a seta do DBM, veja /dbm arrow help para detalhes.",
	"/dbm hud: Shows the DBM hud, see '/dbm hud' for details.",--Translate
	"/dbm help2: Shows raid management slash commands."--Translate
}
L.SLASHCMD_HELP2				= {
	"Comandos disponíveis:",
	"/dbm version: Realiza uma checagem de versão de toda a raid. (ou: ver).",
	"/dbm version2: Realiza uma checagem de versão de toda a raid e sussurra para avisando os membros que estão desatualizados (alias: ver2).",
	"/dbm break <min>: Inicia um cronômetro de intervalo de <min> minutos. Dá a todos os integrantes da raid um cronômetro de intervalo (requer status de líder/guia).",
	"/dbm pull <seg>: Dispara um cronômetro para iniciar a luta em <seg> segundos. Dá a todos os integrantes da raid um cronômetro para iniciar a luta (requer status de líder/guia).",
	"/dbm lockout: Pergunta a todos os membros da raid, por seus vínculos de raid (ou: lockouts, ids) (requer status de líder/guia).."
}
--Translate all of these
L.TIMER_USAGE	= {
	"DBM timer commands:",
	"/dbm timer <time> <text>: Starts a <x> second DBM Timer with the name <text>.",
	"/dbm ltimer <time> <text>: Starts a timer that also automatically loops until canceled.",
	"('Broadcast' in front of any timer also shares it with raid if leader/promoted)",
	"/dbm timer endloop: Stops any looping ltimer."
}

L.ERROR_NO_PERMISSION				= "Você não tem as permissões necessárias para fazer isso."

L.ALLIANCE					= "Aliança"
L.HORDE						= "Horda"

L.NEXT						= "Next %s"
L.COOLDOWN					= "%s CD"
L.UNKNOWN					= "desconhecido"
L.LEFT						= "Esquerda"
L.RIGHT						= "Direita"
L.BOTH						= "Ambas"
L.BEHIND					= "Atrás"
L.BACK						= "Atrás"
L.SIDE						= "Lado"
L.TOP						= "Topo"
L.BOTTOM					= "Inferior"
L.MIDDLE					= "Meio"
L.FRONT						= "A frente"
L.EAST						= "Leste"
L.WEST						= "Oeste"
L.NORTH						= "Norte"
L.SOUTH						= "Sul"
L.INTERMISSION				= "Intermissão"--No blizz global for this, and will probably be used in most end tier fights with intermission phases
L.ORB								= "Esfera"
L.CHEST								= "Baú "--As in Treasure 'Chest'. Not Chest as in body part.
L.NO_DEBUFF							= "Não %s"--For use in places like info frame where you put "Not Spellname"
L.ALLY								= "Aliado"--Such as "Move to Ally"
L.ADD								= "Lacaio"--A fight Add as in "boss spawned extra adds"
L.ADDS								= "Lacaios"
L.BIG_ADD							= "Lacaio grande"
L.BOSS								= "Chefe"
L.ROOM_EDGE							= "Borda da sala"
L.FAR_AWAY							= "Tão distante"
L.BREAK_LOS							= "Quebrar a visão"
L.SAFE								= "Seguro"
L.SHIELD							= "Escudo"
L.PILLAR							= "Pilar"
L.INCOMING							= "%s Entrada"

L.BREAK_USAGE						= "Intervalo não pode demorar mais de 60 minutos. Verifique se você está inserindo o tempo em minutos e não em segundos."
L.BREAK_START				= "Intervalo começando agora -- você tem %s!"
L.BREAK_MIN					= "Intervalo encerra-se em %s minuto(s)!"
L.BREAK_SEC					= "Intervalo encerra-se em %s segundos!"
L.TIMER_BREAK				= "Intervalo!"
L.ANNOUNCE_BREAK_OVER		= "O intervalo acabou"

L.TIMER_PULL					= "Puxando em"
L.ANNOUNCE_PULL				= "Puxando em %d seg. (Enviado por %s)"
L.ANNOUNCE_PULL_NOW			= "Puxando agora!"
L.ANNOUNCE_PULL_TARGET				= "Puxando %s em %d seg. (Enviado por %s)"
L.ANNOUNCE_PULL_NOW_TARGET			= "Puxando %s agora!"
L.GEAR_WARNING						= "Aviso: Verifique a engrenagem. O seu ilvl equipado é %d inferior ao saco ilvl"
L.GEAR_WARNING_WEAPON				= "Aviso: Verifique se sua arma está equipada corretamente."
L.GEAR_FISHING_POLE					= "Vara de pescar"

L.ACHIEVEMENT_TIMER_SPEED_KILL = "Vitória mais rápida."

-- Auto-generated Warning Localizations
L.AUTO_ANNOUNCE_TEXTS.you			= "%s em VOCÊ"
L.AUTO_ANNOUNCE_TEXTS.target		= "%s em >%%s<"
L.AUTO_ANNOUNCE_TEXTS.targetsource 	= ">%%s< lançar %s em >%%s<"
L.AUTO_ANNOUNCE_TEXTS.targetcount	= "%s (%%s) em >%%s<"
L.AUTO_ANNOUNCE_TEXTS.spell			= "%s"
L.AUTO_ANNOUNCE_TEXTS.ends			= "%s acaba" --Buff/Debuff/event on boss
L.AUTO_ANNOUNCE_TEXTS.endtarget		= "%s acaba: >%%s<"
L.AUTO_ANNOUNCE_TEXTS.fades			= "%s desvanece"
L.AUTO_ANNOUNCE_TEXTS.adds			= "%s restantes: %%d"
L.AUTO_ANNOUNCE_TEXTS.cast			= "Lançando %s: %.1f seg"
L.AUTO_ANNOUNCE_TEXTS.soon			= "%s em breve"
L.AUTO_ANNOUNCE_TEXTS.sooncount 	= "%s (%%s) em breve"
L.AUTO_ANNOUNCE_TEXTS.countdown		= "%s em %%ds"
L.AUTO_ANNOUNCE_TEXTS.prewarn		= "%s em %s"
L.AUTO_ANNOUNCE_TEXTS.bait			= "%s em breve - isca agora"
L.AUTO_ANNOUNCE_TEXTS.stage			= "Fase %s"
L.AUTO_ANNOUNCE_TEXTS.prestage		= "Fase %s em breve"
L.AUTO_ANNOUNCE_TEXTS.count			= "%s (%%s)"
L.AUTO_ANNOUNCE_TEXTS.stack			= "%s em >%%s< (%%d)"

local prewarnOption = "Exibir aviso antecipado para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.target		= "Anunciar alvos de $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.targetNF	= "Anunciar alvos de $spell:%s (ignora o filtro de alvo global)"
L.AUTO_ANNOUNCE_OPTIONS.targetsource = "Anunciar alvos de $spell:%s (com fonte)"
L.AUTO_ANNOUNCE_OPTIONS.targetcount	= "Anunciar alvos de $spell:%s (com contagem)"
L.AUTO_ANNOUNCE_OPTIONS.spell		= "Exibir aviso para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.ends		= "Exibir aviso quando $spell:%s terminou"
L.AUTO_ANNOUNCE_OPTIONS.endstarget 	= "Exibir aviso quando $spell:%s terminou"
L.AUTO_ANNOUNCE_OPTIONS.adds		= "Anunciar quantas $spell:%s restantes"
L.AUTO_ANNOUNCE_OPTIONS.cast		= "Exibir aviso quando $spell:%s está sendo lançado"
L.AUTO_ANNOUNCE_OPTIONS.soon		= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.sooncount	= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.countdown	= "Exibir spam de contagem regressiva antes do aviso para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.prewarn		= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.bait		= "Mostrar aviso antecipado (isca) para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.stage		= "Anunciar Fase %s"
L.AUTO_ANNOUNCE_OPTIONS.stagechange = "Anunciar mudanças de fase"
L.AUTO_ANNOUNCE_OPTIONS.prestage		= "Exibir aviso antecipado para a Fase %s"
L.AUTO_ANNOUNCE_OPTIONS.count		= "Exibir aviso para $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.stack		= "Anunciar empilhamento de $spell:%s"

L.AUTO_SPEC_WARN_TEXTS.spell		= "%s!"
L.AUTO_SPEC_WARN_TEXTS.ends			= "%s acaba"
L.AUTO_SPEC_WARN_TEXTS.fades		= "%s desvanece"
L.AUTO_SPEC_WARN_TEXTS.soon			= "%s em breve"
L.AUTO_SPEC_WARN_TEXTS.sooncount	= "%s (%%s) em breve"
L.AUTO_SPEC_WARN_TEXTS.bait			= "%s em breve - isca agora"
L.AUTO_SPEC_WARN_TEXTS.prewarn		= "%s em %s"
L.AUTO_SPEC_WARN_TEXTS.dispel		= "%s em >%%s< - remova agora"
L.AUTO_SPEC_WARN_TEXTS.interrupt	= "%s - interrompa >%%s<"
L.AUTO_SPEC_WARN_TEXTS.interruptcount	= "%s - interrompa >%%s< (%%d)"
L.AUTO_SPEC_WARN_TEXTS.you			= "%s em você"
L.AUTO_SPEC_WARN_TEXTS.youcount		= "%s (%%s) em você"
L.AUTO_SPEC_WARN_TEXTS.youpos		= "%s (Posição: %%s) em você"
L.AUTO_SPEC_WARN_TEXTS.soakpos		= "%s (Posição absorvente: %%s)"
L.AUTO_SPEC_WARN_TEXTS.target		= "%s em >%%s<"
L.AUTO_SPEC_WARN_TEXTS.targetcount 	= "%s (%%s) em >%%s< "
L.AUTO_SPEC_WARN_TEXTS.defensive 	= "%s - defensivo"
L.AUTO_SPEC_WARN_TEXTS.taunt		= "%s em >%%s< - Provocar agora"
L.AUTO_SPEC_WARN_TEXTS.close		= "%s em >%%s< perto de você"
L.AUTO_SPEC_WARN_TEXTS.move			= "%s - saia de perto"
L.AUTO_SPEC_WARN_TEXTS.keepmove		= "%s - continue andando"
L.AUTO_SPEC_WARN_TEXTS.stopmove		= "%s - pare de se mexer"
L.AUTO_SPEC_WARN_TEXTS.dodge 		= "%s - esquivar ataque"
L.AUTO_SPEC_WARN_TEXTS.dodgecount	= "%s (%%s) - esquivar ataque"
L.AUTO_SPEC_WARN_TEXTS.dodgeloc		= "%s - esquivar de %%s"
L.AUTO_SPEC_WARN_TEXTS.moveaway		= "%s - afaste-se dos outros"
L.AUTO_SPEC_WARN_TEXTS.moveawaycount = "%s (%%s) - afaste-se dos outros"
L.AUTO_SPEC_WARN_TEXTS.moveto		= "%s - mover para >%%s<"
L.AUTO_SPEC_WARN_TEXTS.soak			= "%s - absorva"
L.AUTO_SPEC_WARN_TEXTS.jump			= "%s - salte"
L.AUTO_SPEC_WARN_TEXTS.run			= "%s - corra para longe"
L.AUTO_SPEC_WARN_TEXTS.cast			= "%s - pare de lançar"
L.AUTO_SPEC_WARN_TEXTS.lookaway		= "%s em %%s - desviar o olhar"
L.AUTO_SPEC_WARN_TEXTS.reflect		= "%s em >%%s< - pare de atacar"
L.AUTO_SPEC_WARN_TEXTS.count		= "%s! (%%s)"
L.AUTO_SPEC_WARN_TEXTS.stack		= "%s (%%d)"
L.AUTO_SPEC_WARN_TEXTS.switch		= "%s - mude de alvo"
L.AUTO_SPEC_WARN_TEXTS.switchcount	= "%s - mude de alvo (%%s)"
L.AUTO_SPEC_WARN_TEXTS.gtfo			= "%%s debaixo de você - afaste-se"
L.AUTO_SPEC_WARN_TEXTS.adds			= "Lacaios em breve - mude de alvo"
L.AUTO_SPEC_WARN_TEXTS.addscustom	= "Lacaios em breve - %%s"
L.AUTO_SPEC_WARN_TEXTS.targetchange	= "Alteração de alvo - mude para %%s"

-- Auto-generated Special Warning Localizations
L.AUTO_SPEC_WARN_OPTIONS.spell 		= "Exibir aviso especial para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.ends		= "Exibir aviso especial quando $spell:%s terminou"
L.AUTO_SPEC_WARN_OPTIONS.fades		= "Exibir aviso especial quando $spell:%s desvanece"
L.AUTO_SPEC_WARN_OPTIONS.soon		= "Exibir aviso antecipado para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.sooncount	= "Exibir aviso antecipado (com contagem) para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.bait		= "Exibir aviso antecipado (para iscar) para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.prewarn	= "Exibir aviso antecipado %s segundos antes do $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dispel 	= "Exibir aviso especial para remover/roubar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.interrupt	= "Exibir aviso especial para interromper $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.interruptcount	= "Exibir aviso especial (com contagem) para interromper $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.you 		= "Exibir aviso especial quando você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.youcount 	= "Exibir aviso especial (com contagem) quando você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.youpos		= "Exibir aviso especial (com posição) quando você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.soakpos	= "Exibir aviso especial (com posição) para ajudar a absorver outras pessoas afetadas por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.target 	= "Exibir aviso especial quando alguém é afetador por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.targetcount = "Exibir aviso especial (com contagem) quando alguém é afetador por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.defensive	= "Exibir aviso especial para usar habilidades defensivas para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.taunt		= "Exibir aviso especial o provocar quando outro tanque afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.close 		= "Exibir aviso especial quando alguém próximo de você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.move 		= "Exibir aviso especial quando você é afetado por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.keepmove	= "Exibir aviso especial para continuar em movimento para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.stopmove	= "Exibir aviso especial para parar de se mover para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dodge 		= "Exibir aviso especial para se esquivar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dodgecount	= "Exibir aviso especial (com contagem) para se esquivar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dodgeloc	= "Exibir aviso especial (com posição) para se esquivar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.moveaway	= "Exibir aviso especial para se afastar de outras pessoas por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.moveawaycount = "Exibir aviso especial (com contagem) para se afastar de outras pessoas por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.moveto		= "Exibir aviso especial para mudar para alguém ou algum lugar por $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.soak		= "Exibir aviso especial para absorver $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.jump		= "Exibir aviso especial para mover para pular para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.run 		= "Exibir aviso especial para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.cast 		= "Exibir aviso especial para o lançamento de $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.lookaway	= "Exibir aviso especial para desviar o olhar para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.reflect	= "Exibir aviso especial para parar de atacar $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.count		= "Exibir aviso especial (com contagem) para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.stack 		= "Exibir aviso especial para pilha >=%d de $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.switch		= "Exibir aviso especial para mudar de alvo para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.switchcount = "Exibir aviso especial (com contagem) para mudar de alvo para $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.gtfo		= "Exibir aviso especial para sair de coisas ruins no chão"
L.AUTO_SPEC_WARN_OPTIONS.adds		= "Exibir aviso especial para mudar de alvo para lacaios entrantes"
L.AUTO_SPEC_WARN_OPTIONS.addscustom	= "Exibir aviso especial para lacaios entrantes"
L.AUTO_SPEC_WARN_OPTIONS.targetchange	= "Exibir aviso especial para alterações de alvo prioritário"

-- Auto-generated Timer Localizations
L.AUTO_TIMER_TEXTS.target		= "%s: >%%s<"
L.AUTO_TIMER_TEXTS.cast			= "%s"
L.AUTO_TIMER_TEXTS.castshort	= "%s "
L.AUTO_TIMER_TEXTS.castcountshort = "%s (%%s)"
L.AUTO_TIMER_TEXTS.castsource 	= "%s: %%s"
L.AUTO_TIMER_TEXTS.casesourceshort = "%s: %%s"
L.AUTO_TIMER_TEXTS.active		= "%s acaba"
L.AUTO_TIMER_TEXTS.fades		= "%s desvanece"
L.AUTO_TIMER_TEXTS.ai			= "%s AI"
L.AUTO_TIMER_TEXTS.cd			= "%s recarga"
L.AUTO_TIMER_TEXTS.cdshort		= "~%s (%%s)"
L.AUTO_TIMER_TEXTS.cdcount		= "%s recarga (%%s)"
L.AUTO_TIMER_TEXTS.cdcountshort	= "~%s (%%s)"
L.AUTO_TIMER_TEXTS.cdsource		= "%s recarga: >%%s<"
L.AUTO_TIMER_TEXTS.cdsourceshort = "~%s: >%%s<"
L.AUTO_TIMER_TEXTS.cdspecial	= "Recarga especial"
L.AUTO_TIMER_TEXTS.cdspecialshort "~Especial"
L.AUTO_TIMER_TEXTS.next			= "Próx. %s"
L.AUTO_TIMER_TEXTS.nextshort	= "%s"
L.AUTO_TIMER_TEXTS.nextcount	= "Próx. %s (%%s)"
L.AUTO_TIMER_TEXTS.nextcountshort = "%s (%%s)"
L.AUTO_TIMER_TEXTS.nextsource	= "Próx. %s: >%%s<"
L.AUTO_TIMER_TEXTS.nextsourceshort = "%s: %%s"
L.AUTO_TIMER_TEXTS.nextspecial	= "Próx. especial"
L.AUTO_TIMER_TEXTS.nextspecialshort = "Especial"
L.AUTO_TIMER_TEXTS.achievement	= "%s"
L.AUTO_TIMER_TEXTS.stage		= "Próx. Fase"
L.AUTO_TIMER_TEXTS.stageshort	= "Fase"
L.AUTO_TIMER_TEXTS.adds			= "Lacaios em breve"
L.AUTO_TIMER_TEXTS.addsshort	= "Lacaios"
L.AUTO_TIMER_TEXTS.addscustom	= "Lacaios em breve (%%s)"
L.AUTO_TIMER_TEXTS.addscustomshort = "Lacaios (%%s)"
L.AUTO_TIMER_TEXTS.roleplay		= "Encenação"

L.AUTO_TIMER_OPTIONS.target		= "Exibir cronômetro para a penalidade $spell:%s"
L.AUTO_TIMER_OPTIONS.cast		= "Exibir cronômetro para lançar $spell:%s"
L.AUTO_TIMER_OPTIONS.castcoun	= "Exibir cronômetro (com contagem) para lançar $spell:%s"
L.AUTO_TIMER_OPTIONS.castsource = "Exibir cronômetro (com fonte) para lançar $spell:%s"
L.AUTO_TIMER_OPTIONS.active		= "Exibir cronômetro para a duração de $spell:%s"
L.AUTO_TIMER_OPTIONS.fades		= "Exibir cronômetro para quando $spell:%s desvanecerá dos jogadores"
L.AUTO_TIMER_OPTIONS.ai			= "Exibir cronômetro AI para recarga de $spell:%s"
L.AUTO_TIMER_OPTIONS.cd			= "Exibir cronômetro para recarga de $spell:%s"
L.AUTO_TIMER_OPTIONS.cdcount	= "Exibir cronômetro para recarga de $spell:%s"
L.AUTO_TIMER_OPTIONS.cdsource	= "Exibir cronômetro para recarga de $spell:%s"
L.AUTO_TIMER_OPTIONS.cdspecial	= "Exibir cronômetro para recarga de habilidade especial"
L.AUTO_TIMER_OPTIONS.next		= "Exibir cronômetro para o próximo $spell:%s"
L.AUTO_TIMER_OPTIONS.nextcount	= "Exibir cronômetro para o próximo $spell:%s"
L.AUTO_TIMER_OPTIONS.nextsource	= "Exibir cronômetro para o próximo $spell:%s"
L.AUTO_TIMER_OPTIONS.nextspecial = "Exibir cronômetro para a próxima recarga de habilidade"
L.AUTO_TIMER_OPTIONS.stage		= "Exibir cronômetro para a próxima fase"
L.AUTO_TIMER_OPTIONS.adds		= "Exibir cronômetro para os lacaios em breve"
L.AUTO_TIMER_OPTIONS.addscustom	= "Exibir cronômetro para os lacaios em breve"
L.AUTO_TIMER_OPTIONS.roleplay	= "Exibir cronômetro para duração do encenação"

L.AUTO_ICONS_OPTION_TEXT			= "Colocar ícones nos alvos de $spell:%s"
L.AUTO_ICONS_OPTION_TEXT2			= "Set icons on $spell:%s"
L.AUTO_ARROW_OPTION_TEXT			= "Exibir a seta do " .. L.DBM .. " para avançar em direção ao alvo afetado por $spell:%s"
L.AUTO_ARROW_OPTION_TEXT2			= "Exibir a seta do " .. L.DBM .. " para afastar-se do alvo afetado por $spell:%s"
L.AUTO_ARROW_OPTION_TEXT3			= "Exibir a seta do " .. L.DBM .. " para avançar para um local específico para $spell:%s"
L.AUTO_VOICE_OPTION_TEXT			= "Reproduzir alertas falados para $spell:%s"
L.AUTO_VOICE2_OPTION_TEXT			= "Reproduzir alertas falados para mudanças de fase"
L.AUTO_VOICE3_OPTION_TEXT			= "Reproduzir alertas falados para lacaios em breve"
L.AUTO_VOICE4_OPTION_TEXT			= "Reproduzir alertas falados para coisas ruins no chão"
L.AUTO_COUNTDOWN_OPTION_TEXT		= "Tocar som de contagem regressiva para $spell:%s"
L.AUTO_COUNTDOWN_OPTION_TEXT2		= "Tocar som de contagem regressiva para quando $spell:%s desvanece"
L.AUTO_COUNTOUT_OPTION_TEXT			= "Tocar som de contagem regressiva para duração de $spell:%s"

L.AUTO_YELL_OPTION_TEXT.shortyell	= "Gritar quando você é afetado por $spell:%s"
L.AUTO_YELL_OPTION_TEXT.yell		= "Gritar (com nome do jogador) quando você é afetado por $spell:%s"
L.AUTO_YELL_OPTION_TEXT.count		= "Gritar (com contagem) quando você é afetado por $spell:%s"
L.AUTO_YELL_OPTION_TEXT.fade		= "Gritar (com contagem regressiva e nome do feitiço) quando $spell:%s desvanece"
L.AUTO_YELL_OPTION_TEXT.shortfade	= "Gritar (com contagem regressiva) quando $spell:%s desvanece"
L.AUTO_YELL_OPTION_TEXT.iconfade	= "Gritar (com contagem regressiva e ícone) quando $spell:%s desvanece"
L.AUTO_YELL_OPTION_TEXT.position	= "Gritar (com posição) quando você é afetado por $spell:%s"
L.AUTO_YELL_OPTION_TEXT.combo		= "Gritar (com texto personalizado) quando você é afetado por $spell:%s e outros feitiços ao mesmo tempo"

L.AUTO_YELL_ANNOUNCE_TEXT.shortyell	= "%s"
L.AUTO_YELL_ANNOUNCE_TEXT.yell		= "%s em " .. UnitName("player") .. "!"
L.AUTO_YELL_ANNOUNCE_TEXT.count		= "%s em " .. UnitName("player") .. " (%%d)"
L.AUTO_YELL_ANNOUNCE_TEXT.fade		= "%s desvanece em %%d"
L.AUTO_YELL_ANNOUNCE_TEXT.shortfade	= "%%d"
L.AUTO_YELL_ANNOUNCE_TEXT.iconfade	= "{rt%%2$d}%%1$d"
L.AUTO_YELL_ANNOUNCE_TEXT.position	= "%s %%s em {rt%%d}"..UnitName("player").."{rt%%d}"
L.AUTO_YELL_ANNOUNCE_TEXT.combo		= "%s e %%s"

L.AUTO_YELL_CUSTOM_POSITION			= "{rt%d}%s{"--Doesn't need translating. Has no strings
L.AUTO_YELL_CUSTOM_POSITION2		= "{rt%d}%s{rt%d}"--Doesn't need translating. Has no strings
L.AUTO_YELL_CUSTOM_FADE				= "%s desvanece"
L.AUTO_HUD_OPTION_TEXT				= "Exibir HudMap para $spell:%s (Retirado)"
L.AUTO_HUD_OPTION_TEXT_MULTI		= "Exibir HudMap para vários mecânicos (Retirado)"
L.AUTO_NAMEPLATE_OPTION_TEXT		= "Exibir auras da placa de identificação para $spell:%s"
L.AUTO_RANGE_OPTION_TEXT			= "Exibir quadro de alcance (%s) para $spell:%s"--string used for range so we can use things like "5/2" as a value for that field
L.AUTO_RANGE_OPTION_TEXT_SHORT		= "Exibir quadro de alcance (%s)"--For when a range frame is just used for more than one thing
L.AUTO_RRANGE_OPTION_TEXT			= "Exibir quadro reverso (%s) para $spell:%s"--Reverse range frame (green when players in range, red when not)
L.AUTO_RRANGE_OPTION_TEXT_SHORT		= "Exibir quadro reverso (%s)"
L.AUTO_INFO_FRAME_OPTION_TEXT		= "Exibir quadro de informações para $spell:%s"
L.AUTO_INFO_FRAME_OPTION_TEXT2		= "Exibir quadro de informações para a visão geral do encontro"
L.AUTO_READY_CHECK_OPTION_TEXT		= "Tocar som de verificação pronto quando o chefe é puxado (mesmo que não seja direcionado)"
L.AUTO_SPEEDCLEAR_OPTION_TEXT		= "Exibir cronômetro para uma limpeza mais rápida %s"

-- New special warnings
L.MOVE_WARNING_BAR					= "Anunciar móvel"
L.MOVE_WARNING_MESSAGE				= "Obrigado por usar " .. L.DEADLY_BOSS_MODS
L.MOVE_SPECIAL_WARNING_BAR	= "Aviso especial móvel"
L.MOVE_SPECIAL_WARNING_TEXT	= "Aviso especial"

L.HUD_INVALID_TYPE					= "Tipo de HUD inválido definido"
L.HUD_INVALID_TARGET				= "Nenhum alvo válido fornecido para o HUD"
L.HUD_INVALID_SELF					= "Não é possível usar-se como alvo para HUD"
L.HUD_INVALID_ICON					= "Não é possível usar o método icon para HUD em um alvo sem ícone"
L.HUD_SUCCESS						= "HUD bem sucedido iniciado com seus parâmetros. Isso será cancelado após %s, ou ligando '/dbm hud hide'."
L.HUD_USAGE	= {
	 L.DBM .. "-HudMap usage:",
	"-----------------",
	"/dbm hud <tipo> <alvo> <duração>: Cria um HUD que aponta para um jogador pela duração desejada",
	"Tipos válidos: seta, ponto, vermelho, azul, verde, amarelo, ícone (requer um alvo com ícone de ataque)",
	"Alvos válidos: alvo, foco, <jogador>",
	"Durações válidas: qualquer número (em segundos). Se deixado em branco, 20 minutos serão usados.",
	"/dbm hud hide: desativa objetos HUD gerados pelo usuário"
}

L.ARROW_MOVABLE					= "Seta móvel"
L.ARROW_ERROR_USAGE	= {
	"Uso da seta do DBM:",
	"/dbm arrow <x> <y>  cria uma seta que aponta para um local específico (0 < x/y < 100)",
	"/dbm arrow <jogador>  cria uma seta que aponta para um jogador específico no seu grupo",
	"/dbm arrow hide  esconde a seta",
	"/dbm arrow move  torna móvel a seta"
}

L.SPEED_KILL_TIMER_TEXT	= "Vitória em tempo recorde"
L.SPEED_CLEAR_TIMER_TEXT			= "Limpeza mais rápida"
L.COMBAT_RES_TIMER_TEXT				= "Próxima recarga CR"
L.TIMER_RESPAWN						= "%s Respawn"

L.REQ_INSTANCE_ID_PERMISSION		= "%s solicitou suas IDs de instância e progresso atuais.\nVocê deseja enviar essa informação para %s? Ele(a) poderá requisitar essa informação durante a sessão atual (i. e. até que você reconecte)."
L.ERROR_NO_RAID					= "Você precisa estar em um grupo de raide para utilizar essa funcionalidade."
L.INSTANCE_INFO_REQUESTED			= "Enviadas requisições de vínculos de raid para o grupo.\nPor favor, note que a permissão dos usuários será solicitada antes de os dados serem enviados para você, portanto pode levar um minuto para que você receba todas as respostas."
L.INSTANCE_INFO_STATUS_UPDATE		= "Recebidas respostas de %d jogadores de um total de %d usuários do DBM: %d enviaram os dados, %d negaram a solicitação. Esperando mais %d segundos pelas respostas restantes..."
L.INSTANCE_INFO_ALL_RESPONSES		= "Recebidas respostas de tosos os membros da raid"
L.INSTANCE_INFO_DETAIL_DEBUG		= "Sender: %s ResultType: %s InstanceName: %s InstanceID: %s Difficulty: %d Size: %d Progress: %s"
L.INSTANCE_INFO_DETAIL_HEADER		= "%s, dificuldade %s:"
L.INSTANCE_INFO_DETAIL_INSTANCE	= "    ID %s, progresso %d: %s"
L.INSTANCE_INFO_DETAIL_INSTANCE2	= "    progresso %d: %s"
L.INSTANCE_INFO_STATS_DENIED		= "Negou a solicitação: %s"
L.INSTANCE_INFO_STATS_AWAY		= "Ausente: %s"
L.INSTANCE_INFO_STATS_NO_RESPONSE	= "Não possui uma versão recente do DBM instalada: %s"
L.INSTANCE_INFO_RESULTS			= "Resultados da busca por  IDs de raid. Note que instâncias podem aparecer mais de uma vez, se houver jogadores com clientes de WoW em outra língua."
--L.INSTANCE_INFO_SHOW_RESULTS		= "Jogadores que ainda não responderam: %s\n|HDBM:showRaidIdResults|h|cff3588ff[Exibir resultados agora]|r|h"
L.INSTANCE_INFO_SHOW_RESULTS		= "Jogadores que ainda não responderam: %s"

L.LAG_CHECKING						= "Verificando a latência da raide..."
L.LAG_HEADER						= L.DEADLY_BOSS_MODS .. " - Resultados de latência"
L.LAG_ENTRY							= "%s: Latência mundial [%d ms] / Latência em casa [%d ms]"
L.LAG_FOOTER						= "Sem resposta: %s"

L.DUR_CHECKING						= "Verificando a durabilidade da raide..."
L.DUR_HEADER						= L.DEADLY_BOSS_MODS .. " - Resultados de durabilidade"
L.DUR_ENTRY							= "%s: Durabilidade [%d percent] / quebrada [%s]"
L.LAG_FOOTER						= "Sem resposta: %s"

--LDB
L.LDB_TOOLTIP_HELP1					= "Clique para abrir " .. L.DBM
L.LDB_TOOLTIP_HELP2					= "Alt-clique para alternar o modo silencioso"
L.SILENTMODE_IS                     = "Modo silencioso é "

L.LDB_LOAD_MODS						= "Carregar mods de chefe"

L.LDB_CAT_BFA						= "Battle for Azeroth"
L.LDB_CAT_LEG						= "Legion"
L.LDB_CAT_WOD						= "Warlords of Draenor"
L.LDB_CAT_MOP						= "Mists of Pandaria"
L.LDB_CAT_CATA						= "Cataclysm"
L.LDB_CAT_WOTLK						= "Wrath of the Lich King"
L.LDB_CAT_BC						= "Burning Crusade"
L.LDB_CAT_CLASSIC 					= "Clássico"
L.LDB_CAT_OTHER						= "Outros mods de chefe"

L.LDB_CAT_GENERAL					= "Geral"
L.LDB_ENABLE_BOSS_MOD				= "Ativar mods de chefe"

L.WORLD_BUFFS.hordeOny		= "Povo da Horda, cidadãos de Orgrimmar, venham! Vamos homenagear uma heroína da Horda"
L.WORLD_BUFFS.allianceOny	= "Cidadãos e aliados de Ventobravo, no dia de hoje, fez-se história."
L.WORLD_BUFFS.hordeNef		= "NEFARIAN ESTÁ MORTO! Povo de Orgrimmar"
L.WORLD_BUFFS.allianceNef	= "Cidadãos da Aliança, o Senhor da Rocha Negra foi derrubado!"
L.WORLD_BUFFS.zgHeart		= "Agora só falta um passo para nos livrarmos do Esfolador de Almas"
L.WORLD_BUFFS.zgHeartBooty	= "The Blood God, the Soulflayer, has been defeated!  We are imperiled no longer!"
L.WORLD_BUFFS.zgHeartYojamba	= "Iniciem o ritual, meus servos. Temos que banir o coração de Hakkar de volta para o vórtice!"
L.WORLD_BUFFS.rendHead		= "O falso Chefe Guerreiro, Laceral Mão Negra, caiu!"
