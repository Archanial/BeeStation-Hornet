/datum/world_topic/d_ooc_send
    keyword = "discord_send"
    require_comms_key = TRUE

/datum/world_topic/news_report/Run(list/input)
    var/msg = input["message"]
    var/unm = input["user"]
    msg = copytext(sanitize(msg), 1, MAX_MESSAGE_LEN)
    unm = copytext(sanitize(unm), 1, MAX_MESSAGE_LEN)
    msg = emoji_parse(msg)
    log_ooc("DISCORD: [unm]: [msg]")
    for(var/client/C in GLOB.clients)
        if(C.prefs.chat_toggles & CHAT_OOC)
            if(!("discord-[unm]" in C.prefs.ignoring))
                if(GLOB.OOC_COLOR)
                    to_chat(C, "<font color='[GLOB.OOC_COLOR]'><b><span class='prefix'>OOC: DISCORD: </span> <EM>[unm]:</EM> <span class='message linkify'>[msg]</span></b></font>")
                else
                    to_chat(C, "<span class='ooc'><span class='prefix'>OOC: DISCORD: </span> <EM>[unm]:</EM> <span class='message linkify'>[msg]</span></span>")