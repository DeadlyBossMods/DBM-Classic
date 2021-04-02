if GetLocale() ~= "itIT" then return end

if not DBM_CORE_L then DBM_CORE_L = {} end

local L = DBM_CORE_L

L.HOW_TO_USE_MOD					= "Benvenuto in DBM. Scrivi /dbm help per avere una lista dei comandi supportati. Per accedere alle opzioni scrivi in chat /dbm. Carica le zone specifiche per configurare manualmente ogni settaggio di ogni boss. DBM prova a farlo per te controllando la tua specializzazione alla prima esecuzione, ma alcuni potrebbero volere alcune opzioni attivate."

L.LOAD_MOD_ERROR				= "Errore nel caricamento del Boss Mod per %s: %s"
L.LOAD_MOD_SUCCESS			= "Caricato '%s' mod. Per maggiori opzioni, scrivi /dbm o /dbm help in chat."
L.LOAD_GUI_ERROR				= "Non riesco a caricare la GUI: %s"

L.COMBAT_STARTED				= "%s ingaggiato. Buona fortuna e Divertiti! :)"
L.BOSS_DOWN					= "%s ucciso in %s!"
L.BOSS_DOWN_L				= "%s ucciso in %s! La tua ultima kill era durata %s, mentre la kill piu' veloce è di %s. Hai %d uccisioni in totale."
L.BOSS_DOWN_NR				= "%s ucciso in %s! NUOVO Record! (il vecchio era di %s). Hai %d uccisioni in totale."
L.COMBAT_ENDED_AT			= "Combattimento contro %s (%s) finito dopo %s."
L.COMBAT_ENDED_AT_LONG		= "Combattimento contro %s (%s) finito dopo %s. Hai %d sconfitte in questa difficolta'."
L.COMBAT_STATE_RECOVERED		= "%s e' stato ingaggiato %s fa, recupero dei timer..."

L.TIMER_FORMAT_SECS			= "%.2f |4secondo:secondi;"
L.TIMER_FORMAT_MINS			= "%d |4minuto:minuti;"
L.TIMER_FORMAT				= "%d |4minuto:minuti; e %.2f |4secondo:secondi;"

L.MIN						= "min"
L.MIN_FMT					= "%d min"
L.SEC						= "sec"
L.SEC_FMT					= "%s sec"
L.DEAD						= "Morto"
L.OK							= "Ok"

L.GENERIC_WARNING_BERSERK	= "Furia in %s %s"
L.GENERIC_TIMER_BERSERK		= "Furia"
L.OPTION_TIMER_BERSERK		= "Visualizza Timer per $spell:26662"

L.OPTION_CATEGORY_TIMERS		= "Barre"
L.OPTION_CATEGORY_WARNINGS	= "Annunci"
L.OPTION_CATEGORY_MISC		= "Varie"

L.AUTO_RESPONDED						= "Auto-Risposto."
L.STATUS_WHISPER						= "%s: %s, %d/%d Player vivi"
L.AUTO_RESPOND_WHISPER				= "%s e' occupato contro %s (%s, %d/%d player vivi)"
L.WHISPER_COMBAT_END_KILL			= "%s ha sconfitto %s!"
L.WHISPER_COMBAT_END_KILL_STATS		= "%s ha sconfitto %s! L'ha gia' ucciso %d volte."
L.WHISPER_COMBAT_END_WIPE_AT			= "%s e' stato ucciso da %s a %s"
L.WHISPER_COMBAT_END_WIPE_STATS_AT	= "%s e' stato ucciso da %s a %s. Ha %d sconfitte in questa difficolta'."

L.VERSIONCHECK_HEADER		= "Deadly Boss Mods - Versione"
L.VERSIONCHECK_ENTRY			= "%s: %s (%s)"
L.VERSIONCHECK_ENTRY_TWO		= "%s: %s (%s) & %s (%s)"--Two Boss mods
L.VERSIONCHECK_ENTRY_NO_DBM	= "%s: DBM non installato"
L.VERSIONCHECK_FOOTER		= "%d giocatori hanno Deadly Boss Mods"
L.YOUR_VERSION_OUTDATED      = "La tua versione di Deadly Boss Mods e' obsoleta. Visita www.deadlybossmods.com per scaricare l'ultima versione."

L.UPDATEREMINDER_HEADER		= "La tua versione di Deadly Boss Mods e' obsoleta.\n La Versione %s (%s) e' disponibile per il download:"
L.UPDATEREMINDER_FOOTER		= "Premi Ctrl-C per copiare il link."
L.UPDATEREMINDER_NOTAGAIN	= "Visualizza un pop-up quando e' disponibile una nuova versione."

L.MOVABLE_BAR				= "Trascinami!"

L.PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h ti ha mandato un Timer DBM: '%2$s'\n|HDBM:cancella:%2$s:nil|h|cff3588ff[Cancella questo Timer]|r|h  |HDBM:ignora:%2$s:%1$s|h|cff3588ff[Ignora timer da %1$s]|r|h"
L.PIZZA_CONFIRM_IGNORE			= "Sei sicuro di voler ignorare i Timer DMB da %s per questa sessione?"
L.PIZZA_ERROR_USAGE				= "Uso: /dbm [broadcast] timer <time> <text>"

--L.MINIMAP_TOOLTIP_HEADER (Same as English locales)
L.MINIMAP_TOOLTIP_FOOTER		= "Shift+click or right-click per muovere\nAlt+shift+click per trascinare liberamente"

L.RANGECHECK_HEADER			= "Monitor di Prossimita' (%d m)"
L.RANGECHECK_SETRANGE		= "Imposta distanza"
L.RANGECHECK_SOUNDS			= "Souni"
L.RANGECHECK_SOUND_OPTION_1	= "Souna quando un giocatore e' in prossimita'"
L.RANGECHECK_SOUND_OPTION_2	= "Souna quando piu' giocatori sono in prossimita'"
L.RANGECHECK_SOUND_0			= "Nessun suono"
L.RANGECHECK_SOUND_1			= "Suono Standard"
L.RANGECHECK_SOUND_2			= "Beep Noioso"
L.RANGECHECK_HIDE			= "Nascondi"
L.RANGECHECK_SETRANGE_TO		= "%d m"
L.RANGECHECK_LOCK			= "Blocca la Finestra"
L.RANGECHECK_OPTION_FRAMES	= "Finestre"
L.RANGECHECK_OPTION_RADAR	= "Visualizza il Radar"
L.RANGECHECK_OPTION_TEXT		= "Visualizza Finestra di Testo"
L.RANGECHECK_OPTION_BOTH		= "Visualizza entrambe le finestre"
L.RANGECHECK_OPTION_SPEED	= "Frequenza di Aggiornamento (Richiede Reload.)"
L.RANGECHECK_OPTION_SLOW		= "Lento (CPU Lente)"
L.RANGECHECK_OPTION_AVERAGE	= "Medio"
L.RANGECHECK_OPTION_FAST		= "Veloce (praticamente real-time)"
L.RANGERADAR_HEADER			= "Radar di Prossimita' (%d m)"

L.INFOFRAME_LOCK				= "Blocca Finestra"
L.INFOFRAME_HIDE				= "Nascondi"
L.INFOFRAME_SHOW_SELF		= "Visualizza sempre la tua forza"		-- Always show your own power value even if you are below the threshold

L.LFG_INVITE						= "Invito LFG"

L.SLASHCMD_HELP				= {
	"Comandi Disponibili:",
	"/dbm version: Controlla la versione di tutti i giocatori dell'Incursione (alias: ver).",
--	"/dbm version2: Performs a raid-wide version check and whispers members who are out of date (alias: ver2).",
	"/dbm unlock: Visualizza una finestra mobile dei timer (alias: move).",
	"/dbm timer <x> <text>: Lancia un timer DBM da <x> secondi con il nome <text>.",
	"/dbm broadcast timer <x> <text>: Invia a tutti un Timer DBM da <x> secondi con il nome <text> (richiede CapoIncursione o Assistente).",
	"/dbm break <min>: Lancia un Timer di Pausa di <min> minuti. Da a tutti i giocatori un Timer DBM di pausa (richiede CapoIncursione o Assistente).",
	"/dbm pull <sec>: Avvia un Timer di Pull di <sec> secondi. Da' a tutti i giocatori un Timer DBM di Pull (richiede CapoIncursione o Assistente).",
	"/dbm arrow: Visualizza le Frecce DBM, vedi anche /dbm arrow help per i dettagli.",
	"/dbm lockout: Chiede a tutti i giocatori di linkare l'ID dell'incursione in cui sono salvati (aliases: lockouts, ids) (richiede CapoIncursione o Assistente).",
	"/dbm help: Visualizza questo messaggio."
}

L.ERROR_NO_PERMISSION				= "Non hai i permessi per eseguire questo comando."

L.ALLIANCE					= "Alleanza"
L.HORDE						= "Orda"

L.UNKNOWN					= "sconosciuto"
L.LEFT						= "Left"--Translate
L.RIGHT						= "Right"--Translate
L.BACK						= "Back"--Translate
L.FRONT						= "Front"--Translate

L.BREAK_START				= "Pausa iniziata-- Hai %s!"
L.BREAK_MIN					= "La Pausa finisce tra %s minuto(i)!"
L.BREAK_SEC					= "La Pausa finisce tra %s secondi!"
L.TIMER_BREAK				= "Pausa!"
L.ANNOUNCE_BREAK_OVER		= "La Pausa e' Finita!"

L.TIMER_PULL					= "Inizio Combattimento"
L.ANNOUNCE_PULL				= "Inizio Combattimento in %d sec"
L.ANNOUNCE_PULL_NOW			= "Ingaggiare ORA!"

L.ACHIEVEMENT_TIMER_SPEED_KILL = "Uccisione Rapida"

-- Auto-generated Timer Localizations
L.AUTO_TIMER_TEXTS.target		= "%s: >%%s<"
L.AUTO_TIMER_TEXTS.cast			= "%s"
L.AUTO_TIMER_TEXTS.active		= "%s finisce" --Buff/Debuff/event on boss
L.AUTO_TIMER_TEXTS.fades			= "%s svanisce" --Buff/Debuff on players
L.AUTO_TIMER_TEXTS.cd			= "%s CD"
L.AUTO_TIMER_TEXTS.cdcount		= "%s CD (%%s)"
L.AUTO_TIMER_TEXTS.cdsource		= "%s CD: >%%s<"
L.AUTO_TIMER_TEXTS.next			= "Prossimo %s"
L.AUTO_TIMER_TEXTS.nextcount		= "Prossimo %s (%%s)"
L.AUTO_TIMER_TEXTS.nextsource	= "Prossimo %s: >%%s<"
L.AUTO_TIMER_TEXTS.achievement	= "%s"

L.AUTO_TIMER_OPTIONS.target		= "Visualizza Timer per il debuff $spell:%s"
L.AUTO_TIMER_OPTIONS.cast		= "Visualizza Timer per il lancio di $spell:%s "
L.AUTO_TIMER_OPTIONS.active		= "Visualizza Timer per la durata di $spell:%s"
L.AUTO_TIMER_OPTIONS.fades		= "Visualizza Timer quando $spell:%s svanisce dai Giocatori"
L.AUTO_TIMER_OPTIONS.cd			= "Visualizza Timer per il tempo di recupero di $spell:%s"
L.AUTO_TIMER_OPTIONS.cdcount		= "Visualizza Timer per il tempo di recupero di $spell:%s"
L.AUTO_TIMER_OPTIONS.cdsource	= "Visualizza Timer per il tempo di recupero di $spell:%s (con il caster)" --Maybe better wording?
L.AUTO_TIMER_OPTIONS.next		= "Visualizza Timer per il prossimo/a $spell:%s"
L.AUTO_TIMER_OPTIONS.nextcount	= "Visualizza Timer per il prossimo/a $spell:%s"
L.AUTO_TIMER_OPTIONS.nextsource	= "Visualizza Timer per il prossimo/a $spell:%s (con il caster)" --Maybe better wording?
L.AUTO_TIMER_OPTIONS.achievement	= "Visualizza Timer per %s"

-- Auto-generated Warning Localizations
L.AUTO_ANNOUNCE_TEXTS.target			= "%s su >%%s<"
L.AUTO_ANNOUNCE_TEXTS.targetcount	= "%s (%%s) su >%%s<"
L.AUTO_ANNOUNCE_TEXTS.spell			= "%s"
L.AUTO_ANNOUNCE_TEXTS.adds			= "%s rimanente: %%d"
L.AUTO_ANNOUNCE_TEXTS.cast			= "Lancio di %s: %.1f sec"
L.AUTO_ANNOUNCE_TEXTS.soon			= "%s imminente"
L.AUTO_ANNOUNCE_TEXTS.prewarn		= "%s in %s"
L.AUTO_ANNOUNCE_TEXTS.stage			= "Fase %s"
L.AUTO_ANNOUNCE_TEXTS.prestage		= "Fase %s imminente"
L.AUTO_ANNOUNCE_TEXTS.count			= "%s (%%s)"
L.AUTO_ANNOUNCE_TEXTS.stack			= "%s su >%%s< (%%d)"

local prewarnOption = "Visualizza un pre-Avvertimento per $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.target		= "Announcia i bersagli di $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.targetcount	= "Annuncia i bersagli di $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.spell		= "Visualizza avvertimento per $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.adds			= "Annuncia quanto rimane di $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.cast			= "Mostra un avviso quando sta per partire $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.soon			= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.prewarn 		= prewarnOption
L.AUTO_ANNOUNCE_OPTIONS.stage		= "Anuncia la fase %s"
L.AUTO_ANNOUNCE_OPTIONS.prestage		= "Mostra un pre-Avvertimento per la Fase %s"
L.AUTO_ANNOUNCE_OPTIONS.count		= "Mostra un Avviso per $spell:%s"
L.AUTO_ANNOUNCE_OPTIONS.stack		= "Annuncia l'accumulo di $spell:%s"

-- Auto-generated Special Warning Localizations
L.AUTO_SPEC_WARN_OPTIONS.spell 		= "Mostra un Avviso Speciale per $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dispel 		= "Mostra un Avviso Speciale per dissipare/rubare $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.interrupt	= "Mostra un Avviso Speciale per interrompere $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.you 		= "Mostra un Avviso Speciale quando sei afflitto da $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.youcount	= L.AUTO_SPEC_WARN_OPTIONS.you--Temp, translate correctly (with count)
L.AUTO_SPEC_WARN_OPTIONS.target 		= "Mostra un Avviso Speciale quando qualcuno e' afflitto da $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.close 		= "Mostra un Avviso Speciale quando qualcuno vicino a te e' afflitto da $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.move 		= "Mostra un Avviso Speciale quando sei afflitto da\n $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.dodge 		= L.AUTO_SPEC_WARN_OPTIONS.move--FIXME (this is a temp until localized properly as a dodge warning)
L.AUTO_SPEC_WARN_OPTIONS.run 		= "Mostra un Avviso Speciale per $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.cast 		= "Mostra un Avviso Speciale per il lancio di $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.stack 		= "Mostra un Avviso Speciale per Accumuli >=%d di $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.switch		= "Mostra un Avviso Speciale per cambiare Bersaglio per $spell:%s"
L.AUTO_SPEC_WARN_OPTIONS.switchcount = L.AUTO_SPEC_WARN_OPTIONS.switch--Temp, translate correctly (with count)
L.AUTO_SPEC_WARN_OPTIONS.interruptcount	= L.AUTO_SPEC_WARN_OPTIONS.interrupt--Temp, translate correctly (with count)

L.AUTO_SPEC_WARN_TEXTS.spell		= "%s!"
L.AUTO_SPEC_WARN_TEXTS.dispel	= "%s su >%%s< - rimuovilo ora!"
L.AUTO_SPEC_WARN_TEXTS.interrupt	= "%s - interrompi >%%s<!"
L.AUTO_SPEC_WARN_TEXTS.interruptcount	= "%s - interrompi >%%s<! (%%d)"
L.AUTO_SPEC_WARN_TEXTS.you		= "%s su di te"
L.AUTO_SPEC_WARN_TEXTS.youcount	= "%s (%%s) su di te"
L.AUTO_SPEC_WARN_TEXTS.target	= "%s su >%%s<"
L.AUTO_SPEC_WARN_TEXTS.close		= "%s su >%%s< vicino a te"
L.AUTO_SPEC_WARN_TEXTS.move		= "%s - Spostati"
L.AUTO_SPEC_WARN_TEXTS.dodge 	= L.AUTO_SPEC_WARN_TEXTS.move--FIXME (this is a temp until localized properly as a dodge warning)
L.AUTO_SPEC_WARN_TEXTS.run		= "%s - Corri Via!"
L.AUTO_SPEC_WARN_TEXTS.cast		= "%s - Smetti di Attaccare!"
L.AUTO_SPEC_WARN_TEXTS.stack		= "%s (%%d)"
L.AUTO_SPEC_WARN_TEXTS.switch	= "%s - Cambia Bersaglio"
L.AUTO_SPEC_WARN_TEXTS.switchcount	= "%s - Cambia Bersaglio (%%s)"


L.AUTO_ICONS_OPTION_TEXT			= "Imposta Icone sui bersagli di $spell:%s"
L.AUTO_SOUND_OPTION_TEXT			= "Fai il suono \"muoviti\" per $spell:%s"
L.AUTO_COUNTDOWN_OPTION_TEXT		= "Esegui il conto alla rovescia per $spell:%s"
L.AUTO_COUNTOUT_OPTION_TEXT		= "Esegui il conteggio per la durata di $spell:%s"
L.AUTO_YELL_OPTION_TEXT.yell		= "Urla quando sei afflitto da $spell:%s"
L.AUTO_YELL_ANNOUNCE_TEXT.yell	= "%s su di " .. UnitName("player") .. "!"


-- New special warnings
L.MOVE_SPECIAL_WARNING_BAR	= "Avvisi Speciali Mobili"
L.MOVE_SPECIAL_WARNING_TEXT	= "Avvisi Speciali"


L.RANGE_CHECK_ZONE_UNSUPPORTED	= "Un monitor di prossimita' di %d metri non e' supportato in questa zona.\nLe distanze supportate sono 10, 11, 15 e 28 metri."

L.ARROW_MOVABLE					= "Frecce Mobili"
L.ARROW_ERROR_USAGE	= {
	"Utilizzo di DBM-Arrow:",
	"/dbm arrow <x> <y>  crea una freccia che punta in una direzione specifica (0 < x/y < 100)",
	"/dbm arrow <player>  crea una freccia che punta verso un giocatore specifico",
	"/dbm arrow hide  nasconde la freccia",
	"/dbm arrow move  rende la freccia mobile"
}

L.SPEED_KILL_TIMER_TEXT	= "Miglior Uccisione"


L.REQ_INSTANCE_ID_PERMISSION		= "%s ha richiesto di vedere l'ID e il progress della tua incursione.\nVuoi inviare questa informazione a %s? Potra' richiederti quest'informazione per tutta questa sessione (finche' non rilogghi)."
L.ERROR_NO_RAID					= "Devi essere in un Incursione per usare questa funzione."
L.INSTANCE_INFO_REQUESTED			= "Mandala richiesta di informazioni sul lock del gruppo di Incursione.\nVerra' chiesto a tutti il permesso di inviare questa informazione, quindi potrebbero passare alcuni secondi."
L.INSTANCE_INFO_STATUS_UPDATE		= "Ricevute le risposte di %d giocatori of %d utenti DBM : %d Dati inviati, %d richieste negate. Attendo qualche secondo per le altre %d risposte..."
L.INSTANCE_INFO_ALL_RESPONSES		= "Ricevute le risposte da tutti."
L.INSTANCE_INFO_DETAIL_DEBUG		= "Mittente: %s Tipo di Risultato: %s Nome Incursione: %s ID: %s Difficulta': %d Dimensione: %d Progress: %s"
L.INSTANCE_INFO_DETAIL_HEADER		= "%s, difficulta' %s:"
L.INSTANCE_INFO_DETAIL_INSTANCE	= "    ID %s, progress %d: %s"
L.INSTANCE_INFO_DETAIL_INSTANCE2	= "    progress %d: %s"
L.INSTANCE_INFO_STATS_DENIED		= "Hanno rifiutato la richiesta: %s"
L.INSTANCE_INFO_STATS_AWAY		= "In pausa: %s"
L.INSTANCE_INFO_STATS_NO_RESPONSE	= "Nessuna versione di DBM installata: %s"
L.INSTANCE_INFO_RESULTS			= "Risultati della Scansione ID di Incursione. Guarda che le istanze potrebbero essere riportate piu' volte se ci sono dei client di gioco localizzati nella tua incursione."
L.INSTANCE_INFO_SHOW_RESULTS		= "Players yet to respond: %s\n|HDBM:showRaidIdResults|h|cff3588ff[Show results now]|r|h"

--LDB
L.LDB_TOOLTIP_HELP1	= "Click per aprire DBM"
L.LDB_TOOLTIP_HELP2	= "Click-DX per aprire il menu'"

L.LDB_LOAD_MODS		= "Carica i Moduli dei Boss"

L.LDB_ENABLE_BOSS_MOD	= "Abilita Modulo Boss"
