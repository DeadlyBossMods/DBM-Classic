if GetLocale() ~= "ruRU" then return end

if not DBM_GUI_L then DBM_GUI_L = {} end
local L = DBM_GUI_L

L.MainFrame = "Deadly Boss Mods"

L.TranslationByPrefix		= "Перевод на русский язык - "
L.TranslationBy 			= "Swix, TOM_RUS, Artur91425"
L.Website					= "Посетите наш дискорд |cFF73C2FBhttps://discord.gg/deadlybossmods|r. Подпишитесь на Twitter @deadlybossmods или @MysticalOS"
L.WebsiteButton				= "Сайт"

L.OTabBosses				= "Боссы"--Deprecated and will be deleted once tabs no longer use this
L.OTabRaids   = "Рейды"--Raids & PVP
L.OTabDungeons  = "Группа/Один"--1-5 person content (Dungeons, MoP Scenarios, World Events, Brawlers, Proving Grounds, Visions, Torghast, etc)
L.OTabPlugins = "Плагины"
L.OTabOptions = GAMEOPTIONS_MENU
L.OTabAbout   = "Об аддоне"

L.TabCategory_OTHER 		= "Другие модули"

L.BossModLoaded 			= "%s - статистика"
L.BossModLoad_now 			= [[Модуль для этих боссов не загружен.
Он будет загружен сразу после входа в подземелье.
Также вы можете нажать кнопку, чтобы загрузить модуль вручную.]]

L.PosX						= "Расположение по X"
L.PosY						= "Расположение по Y"

L.MoveMe 					= "Передвинь меня"
L.Button_OK 				= "ОК"
L.Button_Cancel 			= "Отмена"
L.Button_LoadMod			= "Загрузить модуль"
L.Mod_Enabled				= "Включить модуль"
L.Mod_Reset					= "Сброс настроек"
L.Reset 					= "Сброс"
L.Import          = "Импорт"

L.Enable            = ENABLE
L.Disable         = DISABLE

L.NoSound					= "Без звука"

L.IconsInUse				= "Метки, используемые этим модулем"

-- Tab: Boss Statistics
L.BossStatistics			= "Статистика босса"
L.Statistic_Kills			= "Победы:"
L.Statistic_Wipes			= "Поражения:"
L.Statistic_Incompletes		= "Не завершено:"--For scenarios, TODO, figure out a clean way to replace any Statistic_Wipes with Statistic_Incompletes for scenario mods
L.Statistic_BestKill		= "Лучшая победа:"
L.Statistic_BestRank		= "Лучший ранг:"--Maybe not get used, not sure yet, localize anyways

-- Tab: General Options
L.TabCategory_Options   = "Общие настройки"
L.Area_BasicSetup     = "Начальные советы по установке DBM"
L.Area_ModulesForYou    = "Какие модули DBM для вас подходят?"
L.Area_ProfilesSetup    = "Руководство по эксплуатации профилей DBM"
-- Panel: Core & GUI
L.Core_GUI          = "Ядро & Интерфейс"
L.General          = "Общие настройки ядра DBM"
L.EnableMiniMapIcon      = "Отображать кнопку на мини-карте"
L.UseSoundChannel      = "Выбор аудио канала для предупреждений DBM"
L.UseMasterChannel     = "Основной аудио канал (Master)"
L.UseDialogChannel     = "Аудио канал диалогов (Dialog)"
L.UseSFXChannel        = "Аудио канал эффектов (SFX)"
L.Latency_Text       = "Макс. задержка для синхронизации: %d"

L.Button_RangeFrame			= "Окно проверки дистанции"
L.Button_InfoFrame			= "Окно информации"
L.Button_TestBars			= "Проверка индикаторов"
L.Button_MoveBars     = "Переместить индикаторы"
L.Button_ResetInfoRange   = "Сбросить информ./дист. окна"

L.ModelOptions        = "Настройки 3D моделей боссов"
L.EnableModels        = "Показывать 3D модели в настройках боссов"
L.ModelSoundOptions     = "Звук для просмотра моделей"
L.ModelSoundShort     = SHORT
L.ModelSoundLong      = TOAST_DURATION_LONG

L.ResizeOptions       = "Настройки изменения размера"
L.ResizeInfo        = "Вы можете изменить размер интерфейса, нажав нижний правый угол, и перетаскивая."
L.Button_ResetWindowSize  = "Сбросить размер окна интерфейса"
L.Editbox_WindowWidth   = "Ширина окна интерфейса"
L.Editbox_WindowHeight    = "Высота окна интерфейса"

-- Panel: Extra Features
L.Panel_ExtraFeatures   = "Дополнительные возможности"
L.Area_SoundAlerts      = "Настройки оповещений звуком/вспышкой"
L.LFDEnhance            = "Воспроизводить звук проверки готовности и мигать иконкой приложения для проверки ролей и приглашений на поле боя через аудио канал Master или Dialog (т.е. звук работает даже если аудио канал SFX выключен, и, как правило, громче)"
L.WorldBossNearAlert    = "Воспроизводить звук проверки готовности и мигать иконкой приложения, когда неподалеку начинают бой с нужным вам мировым боссом"
L.RLReadyCheckSound     = "Воспроизводить звук проверки готовности и мигать иконкой приложения при проверке готовности через аудио канал Master или Dialog."
L.AFKHealthWarning      = "Звуковое оповещение и мигать иконкой приложения, если вы теряете здоровье во время АФК"
--
L.TimerGeneral        = "Настройки таймера"
L.SKT_Enabled       = "Отображать таймер рекордной победы для текущего боя, если доступно"
L.ShowRespawn       = "Отображать таймер до появления босса после вайпа"
L.ShowQueuePop        = "Отображать оставшееся время до принятия очереди (поле боя и т.д.)"
--
L.Area_AutoLogging      = "Настройки автоматического логирования"
L.AutologBosses       = "Автоматически записывать подземелья/рейды, используя журнал боя Blizzard "
L.AdvancedAutologBosses   = "Автоматически записывать подземелья/рейды, используя Transcriptor"
L.RecordOnlyBosses      = "Записывать только боссов (Исключая весь треш. Используйте '/dbm pull' перед началом боя с боссами для захвата использованной химии и события ENCOUNTER_START)"
L.LogOnlyNonTrivial     = "Записывать только нетривиальные контент (исключая подземелья)"
--
--L.Area_3rdParty       = "Настройки аддонов третих лиц"
--L.ShowBBOnCombatStart   = "Выполнять проверку баффов Big Brother в начале боя"
--L.BigBrotherAnnounceToRaid  = "Объявлять результаты проверки Big Brother в рейд"
L.Area_Invite       = "Настройки приглашений"
L.AutoAcceptFriendInvite  = "Автоматически принимать приглашения в группу от друзей"
L.AutoAcceptGuildInvite   = "Автоматически принимать приглашения в группу от членов гильдии"
L.Area_Advanced       = "Расширенные настройки"
L.FakeBW          = "Притворяться BigWigs вместо DBM при проверке версий (Полезно для гильдий, которые заставляют использовать BigWigs)"
L.AITimer         = "Автоматически генерировать таймеры для боев, которые вы никогда раньше не видели, используя встроенный в DBM искусственный интеллект таймера (Полезно для тестового боя с боссом в самый первый раз, таких как beta или PTR). Рекомендуется всегда оставлять это включенным"

-- Panel: Profiles
L.Panel_Profile       = "Профили"
L.Area_CreateProfile    = "Создание профиля настроек ядра DBM"
L.EnterProfileName      = "Введите имя профиля"
L.CreateProfile       = "Создать новый профиль с настройками по умолчанию"
L.Area_ApplyProfile     = "Выбор активного профиля для настроек ядра DBM"
L.SelectProfileToApply    = "Выберите профиль для применения"
L.Area_CopyProfile      = "Копирование профиля настроек ядра DBM"
L.SelectProfileToCopy   = "Выберите профиль для копирования"
L.Area_DeleteProfile    = "Удаление профиля настроек ядра DBM"
L.SelectProfileToDelete   = "Выберите профиль для удаления"
L.Area_DualProfile      = "Настройки профиля для модулей боссов"
L.DualProfile       = "Включить поддержку разных настроек модулей боссов для специализаций. (Управление профилями модулей боссов производится с экрана статистики загруженного модуля)"

L.Area_ModProfile     = "Копирование настроек модуля с другого персонажа/специализации или удаление настроек модуля"
L.ModAllReset       = "Сбросить все настройки модуля"
L.ModAllStatReset     = "Сбросить всю статистику модуля"
L.SelectModProfileCopy    = "Скопировать все настройки из"
L.SelectModProfileCopySound = "Скопировать настройки звука из"
L.SelectModProfileCopyNote  = "Скопировать заметки из"
L.SelectModProfileDelete  = "Удалить настройки модуля для"

L.Area_ImportExportProfile  = "Импорт/Экспорт профилей"
L.ImportExportInfo      = "Импорт перезапишет ваш текущий профиль, делайте на свой риск."
L.ButtonImportProfile   = "Импортировать профиль"
L.ButtonExportProfile   = "Экспортировать профиль"

L.ImportErrorOn       = "Пользовательские звуки отсутствуют для настройки: %s"

-- Tab: Alerts
L.TabCategory_Alerts    = "Предупреждения"
L.Area_SpecAnnounceConfig = "Визуальное и звуковое руководство специальных предупреждений"
L.Area_SpecAnnounceNotes  = "Текстовое руководство специальных предупреждений"
L.Area_VoicePackInfo    = "Информация о голосовых пакетах DBM"
-- Panel: Raidwarning
L.Tab_RaidWarning       = "Предупреждения"
L.RaidWarning_Header    = "Настройки предупреждений"
L.RaidWarnColors      = "Цвета предупреждений"
L.RaidWarnColor_1       = "Цвет 1"
L.RaidWarnColor_2       = "Цвет 2"
L.RaidWarnColor_3     = "Цвет 3"
L.RaidWarnColor_4       = "Цвет 4"
L.InfoRaidWarning     = [[Вы можете указать расположение и цвет для окна предупреждений для рейда.
Это окно используется для сообщений таких как "Игрок X под воздействием Y".]]
L.ColorResetted       = "Настройки цвета этого поля были сброшены."
L.ShowWarningsInChat    = "Показывать предупреждения в окне чата"
L.WarningIconLeft       = "Отображать иконку с левой стороны"
L.WarningIconRight      = "Отображать иконку с правой стороны"
L.WarningIconChat       = "Отображать иконки в окне чата"
L.WarningAlphabetical   = "Сортировать имена по алфавиту"
L.Warn_Duration       = "Длительность предупреждения: %0.1f сек."
L.None            = "Нет"
L.Random          = "Случайно"
L.Outline         = "Контур"
L.ThickOutline        = "Толстый контур"
L.MonochromeOutline     = "Монохромный контур"
L.MonochromeThickOutline  = "Монохромный толстый контур"
L.RaidWarnSound       = "Звук предупреждений для рейда"

-- Panel: Spec Warn Frame
L.Panel_SpecWarnFrame   = "Специальные предупреждения"
L.Area_SpecWarn       = "Настройка специальных предупреждений"
L.SpecWarn_ClassColor   = "Использовать цвета классов для специальных предупреждений"
L.ShowSWarningsInChat     = "Показывать специальные предупреждения в окне чата"
L.SWarnNameInNote     = "Использовать настройки типа 5, если пользовательская заметка содержит ваше имя"
L.SpecialWarningIcon    = "Показывать иконки на специальных предупреждениях"
L.ShortTextSpellname    = "Использовать короткий текст spellname (когда доступно)"
L.SpecWarn_FlashFrameRepeat = "Мигать %d раз"
L.SpecWarn_Flash      = "Мигание экрана"
L.SpecWarn_FlashRepeat    = "Повторять мигание"
L.SpecWarn_FlashColor   = "Цвет мигания %d"
L.SpecWarn_FlashDur     = "Длительности мигания: %0.1f"
L.SpecWarn_FlashAlpha   = "Прозрачность мигания: %0.1f"
L.SpecWarn_DemoButton   = "Показать пример"
L.SpecWarn_ResetMe      = "Сбросить до значений по умолчанию"
L.SpecialWarnSoundOption  = "Звук по умолчанию"
L.SpecialWarnHeader1    = "Тип 1: настройки для предупреждений обычного приоритета, влияющих на вас или ваши действия"
L.SpecialWarnHeader2    = "Тип 2: настройки для предупреждений обычного приоритета, влияющих на всех"
L.SpecialWarnHeader3    = "Тип 3: настройки для предупреждений ВЫСОКОГО приоритета"
L.SpecialWarnHeader4    = "Тип 4: настройки для предупреждений утратившим ВЫСОКИЙ приоритет" -- not sure
L.SpecialWarnHeader5    = "Тип 5: настройки для предупреждений с заметками, содержащими ваше имя"

-- Panel: Generalwarnings
L.Tab_GeneralMessages 		= "Сообщения окна чата"
L.CoreMessages				= "Настройки сообщений ядра"
L.ShowPizzaMessage 			= "Показывать сообщения транслируемых таймеров в окне чата"
L.ShowAllVersions	 		= "Показывать версии модулей боссов для всех членов группы в окне чата при проверки версии. (Если отключено, все еще имеет данные/текущую сводку)"
L.ShowReminders       = "Показать сообщения напоминания о рекомендациях, отсутствующих модах или сообщениях исправления"

L.CombatMessages			= "Настройки сообщений боя"
L.ShowEngageMessage 		= "Показывать сообщения о начале боя в окне чата"
L.ShowDefeatMessage 		= "Показывать сообщения об убийстве/вайпе в окне чата"
L.ShowGuildMessages 		= "Показывать сообщения о начале боя/убийстве/вайпе для членов гильдии в окне чата"

L.Area_ChatAlerts     = "Дополнительные настройки предупреждений"
L.WorldBossAlert      = "Показывать предупреждающее сообщение, когда в вашем игровом мире ваши друзья или члены гильдии возможно начинают бой с мировыми боссами"
L.WorldBuffAlert      = "Показывать предупреждающее сообщение и таймер, когда начался мировой бафф на вашем игровом мире"

L.Area_BugAlerts      = "Настройки предупреждений об ошибках"
L.BadTimerAlert       = "Показывать сообщение в чате, когда DBM обнаруживает плохой таймер с не менее 1 секундой некорректности"
L.BadIDAlert        = "Показывать сообщение в чате, когда DBM обнаруживает некорректное заклинание или ID журнала при использовании"

-- Panel: Spoken Alerts Frame
L.Panel_SpokenAlerts    = "Голосовые предупреждения"
L.Area_VoiceSelection   = "Выбор голоса"
L.CountdownVoice      = "Основной голос для звуков обратного отсчета"
L.CountdownVoice2     = "Запасной голос для звуков обратного отсчета"
L.CountdownVoice3     = "Второй запасной голос для звуков обратного отсчета"
L.VoicePackChoice     = "Голосовой пакет для предупреждений"
L.Area_CountdownOptions   = "Настройки обратного отсчета"
L.Area_VoicePackOptions   = "Настройки голосового пакета (голосовые пакеты третих лиц)"
L.SpecWarn_NoSoundsWVoice = "Фильтровать звуки специальных предупреждений, которые также имеют голосовую настройку"
L.SWFNever          = "Никогда"
L.SWFDefaultOnly      = "когда специальные предупреждения используют звуки по умолчанию. (Позволяет воспроизводить пользовательские звуки)"
L.SWFAll          = "когда специальные предупреждения используют любые звуки"
L.SpecWarn_AlwaysVoice    = "Всегда воспроизводить все голосовые предупреждения (Даже если специальные предупреждения отключены. Полезно для рейд лидера, иначе не рекомендуется)"
--TODO, maybe add URLS right to GUI panel on where to acquire 3rd party voice packs?
L.Area_GetVEM       = "Получить голосовой пакет VEM"
L.VEMDownload       = "|cFF73C2FBhttps://curseforge.com/wow/addons/dbm-voicepack-vem|r"
L.Area_BrowseOtherVP    = "Посмотреть другие голосовые пакеты на Curse"
L.BrowseOtherVPs      = "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+voice|r"
L.Area_BrowseOtherCT    = "Посмотреть пакеты обратного отсчета на Curse"
L.BrowseOtherCTs      = "|cFF73C2FBhttps://curseforge.com/wow/addons/search?search=dbm+count+pack|r"

-- Tab: Event Sounds
L.Panel_EventSounds     = "Звуки событий"
L.Area_SoundSelection   = "Выбор звука (прокрутите меню выбора колесом мыши)"
L.EventVictorySound     = "Звук, воспроизводимый при победе в бою"
L.EventWipeSound      = "Звук, воспроизводимый при поражении в бою"
L.EventEngageSound      = "Звук, воспроизводимый при начале боя"
L.EventDungeonMusic     = "Музыка, воспроизводимая в подземельях/рейдах"
L.EventEngageMusic      = "Музыка, воспроизводимая во время боя"
L.Area_EventSoundsExtras  = "Настройки звуков событий"
L.EventMusicCombined    = "Разрешить все варианты выбора музыки для подземелий и боя (изменение этой настройки требует перезагрузки интерфейса, чтобы увидеть изменения)"
L.Area_EventSoundsFilters = "Условия фильтра звуков событий"

-- Tab: Timers
L.TabCategory_Timers    = "Таймеры"
L.Area_ColorBytype      = "Color bars by type guide"--Translate
-- Panel: Color by Type
L.Panel_ColorByType     = "Цвет по типу"
L.AreaTitle_BarColors   = "Цвета индикатора по типу таймера"
L.BarTexture        = "Текстура индикатора"
L.BarStyle          = "Поведение индикатора"
L.BarDBM          = "Классический (existing small bar slides to Enlarged anchor)"--Translate
L.BarSimple         = "Простой (маленький индикатор исчезает и создается новый большой индикатор)"
L.BarStartColor       = "Начальный цвет"
L.BarEndColor         = "Конечный цвет"
L.Bar_Height        = "Высота индикатора: %d"
L.Slider_BarOffSetX     = "Сдвиг по X: %d"
L.Slider_BarOffSetY     = "Сдвиг по Y: %d"
L.Slider_BarWidth       = "Ширина индикатора: %d"
L.Slider_BarScale       = "Масштаб индикатора: %0.2f"
--Types
L.BarStartColorAdd      = "Начальный цвет (Помощник)"
L.BarEndColorAdd      = "Конечный цвет (Помощник)"
L.BarStartColorAOE      = "Начальный цвет (Урон по области)"
L.BarEndColorAOE      = "Конечный цвет (Урон по области)"
L.BarStartColorDebuff   = "Начальный цвет (Цель)"
L.BarEndColorDebuff     = "Конечный цвет (Цель)"
L.BarStartColorInterrupt  = "Начальный цвет (Прерывание)"
L.BarEndColorInterrupt    = "Конечный цвет (Прерывание)"
L.BarStartColorRole     = "Начальный цвет (Роль)"
L.BarEndColorRole     = "Конечный цвет (Роль)"
L.BarStartColorPhase    = "Начальный цвет (Фаза)"
L.BarEndColorPhase      = "Конечный цвет (Фаза)"
L.BarStartColorUI     = "Начальный цвет (Польз.)"
L.BarEndColorUI       = "Конечный цвет (Польз.)"
--Type 7 options
L.Bar7Header        = "Настройки пользовательского индикатора"
L.Bar7ForceLarge      = "Всегда использовать большой индикатор"
L.Bar7CustomInline      = "Использовать пользовательскую '!' встроенную иконку"
--Dropdown Options
L.CBTGeneric        = "Общий"
L.CBTAdd          = "Помощник"
L.CBTAOE          = "Урон по области"
L.CBTTargeted       = "Цель"
L.CBTInterrupt        = "Прерывание"
L.CBTRole         = "Роль"
L.CBTPhase          = "Фаза"
L.CBTImportant        = "Важно (Польз.)"
L.CVoiceOne         = "Голос отсчета 1"
L.CVoiceTwo         = "Голос отсчета 2"
L.CVoiceThree       = "Голос отсчета 3"

-- Panel: Timers
L.Panel_Appearance      = "Внешний вид индикатора"
L.Panel_Behavior      = "Поведение индикатора"
L.AreaTitle_BarSetup    = "Настройки внешнего вида индикатора"
L.AreaTitle_Behavior    = "Настройки поведения индикатора"
L.AreaTitle_BarSetupSmall   = "Настройки маленького индикатора"
L.AreaTitle_BarSetupHuge  = "Настройки большого индикатора"
L.EnableHugeBar       = "Включить большой индикатор (он же Индикатор 2)"
L.BarIconLeft         = "Иконка слева"
L.BarIconRight        = "Иконка справа"
L.ExpandUpwards       = "Расширяться вверх"
L.FillUpBars        = "Заполнять вверх"
L.ClickThrough        = "Отключить события мыши (щелчок сквозь)"
L.Bar_Decimal       = "Отображать десятые, когда время меньше: %d"
L.Bar_Alpha         = "Прозрачность: %0.1f"
L.Bar_EnlargeTime     = "Увеличивать, когда время меньше: %d"
L.BarSpark          = "Искра индикатора"
L.BarFlash          = "Мигающий индикатор при истечении"
L.BarSort         = "Сортировать по ставшемуся времени"
L.BarColorByType      = "Цвет по типу"
L.NoBarFade         = "Использовать начальный/конечный цвета как маленький/большой цвета вместо градиентного изменения цвета"
L.BarInlineIcons      = "Показывать встроенные иконки"
L.ShortTimerText      = "Использовать короткий текст таймера (когда доступен)"
L.StripTimerText      = "Strip CD/Next out of timers"--Translate
L.KeepBar         = "Оставить таймер активным до применения способности"
L.KeepBar2          = "(когда поддерживается модулем)"
L.FadeBar         = "Затухающие таймеры для способностей вне зоны действия"
L.BarSkin         = "Оболочка индикатора"

-- Tab: Global Disables & Filters
L.TabCategory_Filters   = "Глобальные отключения и фильтры"
L.Area_DBMFiltersSetup    = "Руководство по фильтрам DBM"
L.Area_BlizzFiltersSetup  = "Руководство по фильтрам Blizzard"
-- Panel: DBM Features
L.Panel_SpamFilter      = "Функции DBM"
L.Area_SpamFilter_Anounces      = "Настройки глобального отключения предупреждений и фильтры"
L.SpamBlockNoShowAnnounce = "Не показывать текст или воспроизводить звук для ЛЮБЫХ общих предупреждений"
L.SpamBlockNoShowTgtAnnounce= "Не показывать текст или воспроизводить звук для общих предупреждений ЦЕЛИ (фильтр выше переопределяет этот)"
L.SpamBlockNoSpecWarnText = "Не показывать текст специальных предупреждений"
L.SpamBlockNoSpecWarnFlash      = "Не показывать специальные предупреждения миганием экрана"
L.SpamBlockNoSpecWarnSound      = "Не воспроизводить звук специальных предупреждений (по-прежнему разрешает голосовые пакеты, если он включен в голосовых предупреждениях)"
L.SpamBlockNoTrivialSpecWarnSound = "Не воспроизводить звук специальных предупреждений или не мигать экраном для тривиального контента на вашем уровне (вместо воспроизведения выбранного пользователем обычного предупреждения)"

L.Area_SpamFilter_Timers  = "Настройки глобального отключения таймера и фильтры"
L.SpamBlockNoShowTimers   = "Не показывать таймеры модулей"
L.SpamBlockNoShowUTimers  = "Не показывать таймеры, отправленные пользователями (Пользовательские/Начало боя/Перерыв)"
L.SpamBlockNoCountdowns   = "Не воспроизводить звуки обратного отсчета"

L.Area_SpamFilter_Misc    = "Настройки различных глобальных отключений и фильтры"
L.SpamBlockNoSetIcon    = "Не устанавливать метки на цели"
L.SpamBlockNoRangeFrame   = "Не показывать окно проверки дистанции"
L.SpamBlockNoInfoFrame    = "Не показывать информационное окно"
L.SpamBlockNoHudMap     = "Не показывать HudMap"
L.SpamBlockNoNameplate    = "Не показывать Nameplate Auras"
L.SpamBlockNoYells      = "Не отправлять крики в чат"
L.SpamBlockNoNoteSync   = "Не принимать предложенные заметки"

L.Area_Restore        = "Настройки восстановления DBM (восстанавливать ли предыдущее пользовательское состояние по окончании работы модулей)"
L.SpamBlockNoIconRestore  = "Не сохранять состояние меток и восстанавливать их после боя"
L.SpamBlockNoRangeRestore = "Не восстанавливать окно проверки дистанции в предыдущее состояние при скрытии модулями"

L.Area_SpamFilter     = "Настройки фильтра спама"
L.DontShowFarWarnings   = "Не отображать предупреждения/таймеры для событий, которые далеко"
L.StripServerName     = "Удалять имя сервера в предупреждениях и таймерах"

L.Area_SpecFilter     = "Настройки фильтра ролей"
L.FilterTankSpec      = "Фильтровать предупреждения для роли танка, когда не в специализации танка. (Примечание: Отключение этого не рекомендуется для большинства пользователей, так как предупреждения 'таунт' теперь все по умолчанию.)"
L.FilterInterruptsHeader  = "Фильтровать предупреждения для прерываемых спеллов на основе предпочтений поведения."
L.FilterInterrupts      = "если кастер не является вашей текущей целью (Всегда)."
L.FilterInterrupts2     = "если кастер не является вашей текущей целью (Всегда) или прерывание на кд (только босс)"
L.FilterInterrupts3     = "если кастер не является вашей текущей целью (Всегда) или прерывание на кд (босс и трэш)"
L.FilterInterrupts4     = "Фильтр 'Всегда' прерывает предупреждения (вы не хотите их видеть периодически)"
L.FilterInterruptNoteName = "Фильтровать предупреждения для прерываемых спеллов (со счетчиком), если предупреждение не содержит ваше имя в пользовательской заметке"
L.FilterDispels       = "Фильтровать предупреждения для рассеиваемых спеллов, если ваш диспел на кд."
L.FilterTrashWarnings   = "Фильтровать предупреждения для трэша в подземельях"--normal &amp; heroic

L.Area_PullTimer      = "Настройки фильтра таймеров Начала боя, Перерыва, Боя, Пользовательских"
L.DontShowPTNoID      = "Блокировать таймеры DBM начала боя, отправленные из другой зоны (никогда не заблокирует таймеры Bigwigs, которые отправляются без ID зоны)"
L.DontShowPT        = "Не отображать индикатор таймера начала боя/перерыва"
L.DontShowPTText      = "Не отображать текст предупреждения для таймера начала боя/перерыва"
L.DontPlayPTCountdown   = "Не воспроизводить звук обратного отсчета для всех таймеров начала боя/перерыва/боя/пользовательских"
L.PT_Threshold        = "Не воспроизводить звук обратного отсчета для таймеров начала боя/перерыва/боя/пользовательских, которые больше: %d"

-- Panel: Blizzard Features
L.Panel_HideBlizzard    = "Функции Blizzard"
L.Area_HideBlizzard     = "Настройки отключения и скрытия Blizzard"
L.HideBossEmoteFrame    = "Скрывать окно эмоций рейдового босса во время боя с боссом"
L.HideWatchFrame      = "Скрывать окно отслеживания заданий во время боя с боссом"
--L.HideQuestTooltips     = "Скрывать цели заданий в подсказках во время боя с боссами"
L.HideTooltips        = "Полностью скрывать всплывающие подсказки во время боя с боссом"
L.DisableSFX        = "Отключить канал звуковых эффектов во время боя с боссами"
--L.DisableCinematics     = "Отключить внутриигровые ролики"
--L.OnlyFight         = "Только во время боя, после того как ролик был показан один раз"
--L.AfterFirst        = "В подземелье, после того как ролик был показан один раз"
L.Always          = ALWAYS
L.CombatOnly        = "Отключить в бою (любом)"
L.RaidCombat        = "Отключить в бою (только боссы)"

-- Panel: Privacy
L.Tab_Privacy         = "Управление конфиденциальностью"
L.Area_WhisperMessages    = "Настройки автоответчика/пересылки сообщений"
L.AutoRespond         = "Авто-ответ на шепот пока в бою"
L.WhisperStats        = "Добавлять статистику убийств/вайпов в ответ шепотом"
L.DisableStatusWhisper    = "Отключить ответы на запрос статуса боя шепотом для всей группы (требуется лидер группы). Применяется только для рейдов"
L.Area_SyncMessages     = "Настройки синхронизации аддона"
L.EnableWBSharing       = "Поделиться, когда вы начали бой/потерпели поражение с мировым боссом или активируете мировой бафф, с друзьями Battle.net, которые находятся на одном и том же сервере. (Эта информация всегда будет передана с вашей гильдией)"
L.DisableGuildStatus    = "Отключить отправку гильдии сообщений о прогрессе для всей группы (требуется лидер группы)."

-- Tab: Frames & Integrations
L.TabCategory_Frames    = "Окна и интеграция"
L.Area_NamelateInfo     = "DBM Nameplate Auras Info"--Translate
-- Panel: InfoFrame
L.Panel_InfoFrame     = "Infoframe" -- Frame name! DO NOT TRANSLATE!

-- Panel: Range
L.Panel_Range       = "Rangeframe" -- Frame name! DO NOT TRANSLATE!

-- Panel: Nameplate
L.Panel_Nameplates      = "Nameplates"--Translate
L.UseNameplateHandoff   = "Hand off nameplate aura requests to supported nameplate addons (KuiNameplates, Threat Plates, Plater) instead of handling internally. This is recommended option as it allows more advanted features and configuration to be done via nameplate addon"--Translate
L.Area_NPStyle        = "Стиль (Примечание: настраивает стиль только когда DBM обрабатывает нейплейты.)"
L.NPAuraSize        = "Размер пикселя ауры (в квадрате): %d"

-- Misc
L.Area_General        = "Общее"
L.Area_Position       = "Расположение"
L.Area_Style        = "Стиль"

L.FontSize					= "Размер шрифта: %d"
L.FontStyle					= "Флаги шрифта"
L.FontColor					= "Цвет шрифта"
L.FontShadow				= "Тень шрифта"
L.FontType					= "Выбор шрифта"

L.FontHeight	= 16
