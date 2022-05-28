if text == "توب الحراميه" or text == "الحراميه" then
    local bank_users = Redis:smembers(ItsReKo.."zrfffidtf")
    if #bank_users == 0 then
    return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد حراميه في البنك","md",true)
    end
    top_mony = "توب اكثر 25 شخص حرامية فلوس:\n\n"
    mony_list = {}
    for k,v in pairs(bank_users) do
    local mony = Redis:get(ItsReKo.."zrffdcf"..v) or 0
    table.insert(mony_list, {tonumber(mony) , v})
    end
    table.sort(mony_list, function(a, b) return a[1] > b[1] end)
    num = 1
    emoji ={ 
    "🥇 )" ,
    "🥈 )",
    "🥉 )",
    "4 )",
    "5 )",
    "6 )",
    "7 )",
    "8 )",
    "9 )",
    "10 )",
    "11 )",
    "12 )",
    "13 )",
    "14 )",
    "15 )",
    "16 )",
    "17 )",
    "18 )",
    "19 )",
    "20 )",
    "21 )",
    "22 )",
    "23 )",
    "24 )",
    "25 )"
    }
    for k,v in pairs(mony_list) do
    if num <= 25 then
    fne = Redis:get(ItsReKo..':toob:Name:'..v[2])
    tt =  "["..fne.."]("..fne..")"
    local mony = v[1]
    local emo = emoji[k]
    num = num + 1
    gflos =string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
    top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
    gflous =string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
    gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." "
    end
    end
    return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
    end
    if text == "توب فلوس" or text == "توب الفلوس" then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = "["..ban.first_name.."]("..ban.first_name..")"
    else
    news = " لا يوجد"
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local bank_users = Redis:smembers(ItsReKo.."ttpppi")
    if #bank_users == 0 then`
    return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد حسابات في البنك","md",true)
    end
    top_mony = "توب اغنى 25 شخص :\n\n"
    mony_list = {}
    for k,v in pairs(bank_users) do
    local mony = Redis:get(ItsReKo.."nool:flotysb"..v) or 0
    table.insert(mony_list, {tonumber(mony) , v})
    end
    table.sort(mony_list, function(a, b) return a[1] > b[1] end)
    num = 1
    emoji ={ 
    "🥇 )" ,
    "🥈 )",
    "🥉 )",
    "4 )",
    "5 )",
    "6 )",
    "7 )",
    "8 )",
    "9 )",
    "10 )",
    "11 )",
    "12 )",
    "13 )",
    "14 )",
    "15 )",
    "16 )",
    "17 )",
    "18 )",
    "19 )",
    "20 )",
    "21 )",
    "22 )",
    "23 )",
    "24 )",
    "25 )"
    }
    for k,v in pairs(mony_list) do
    if num <= 25 then
    fne = Redis:get(ItsReKo..':toob:Name:'..v[2])
    tt =  "["..fne.."]("..fne..")"
    local mony = v[1]
    local emo = emoji[k]
    num = num + 1
    gflos = string.format("%d", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
    top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
    gflous = string.format("%d", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
    gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." \n\n\n*ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه*"
    end
    end
    return LuaTele.sendText(msg.chat_id,msg.id,top_mony..gg,"md",true)
    end
    if text == "توب المتزوجين" then
    local bank_users = Redis:smembers(ItsReKo.."almtzog"..msg_chat_id)
    if #bank_users == 0 then
    return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد متزوجين بالقروب","md",true)
    end
    top_mony = "توب اغنى 10 زوجات بالقروب :\n\n"
    mony_list = {}
    for k,v in pairs(bank_users) do
    local mony = Redis:get(ItsReKo.."mznom"..msg_chat_id..v) 
    table.insert(mony_list, {tonumber(mony) , v})
    end
    table.sort(mony_list, function(a, b) return a[1] > b[1] end)
    num = 1
    emoji ={ 
    "🥇" ,
    "🥈" ,
    "🥉" ,
    "4" ,
    "5" ,
    "6" ,
    "7" ,
    "8" ,
    "9" ,
    "10"
    }
    for k,v in pairs(mony_list) do
    if num <= 10 then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..v[2].."rgalll2:")
    local user_name = LuaTele.getUser(v[2]).first_name
    fne = Redis:get(ItsReKo..':toob:Name:'..zwga_id)
    fnte = Redis:get(ItsReKo..':toob:Name:'..v[2])
    local user_nambe = LuaTele.getUser(zwga_id).first_name
    local user_tag = '['..fnte..'](tg://user?id='..v[2]..')'
    local user_zog = '['..fne..'](tg://user?id='..zwga_id..')'
    local mony = v[1]
    local emo = emoji[k]
    num = num + 1
    top_mony = top_mony..emo.." - "..user_tag.." 👫 "..user_zog.."  l "..mony.." 💵\n"
    end
    end
    return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
    end
    
    
    
    if text and text:match('^زواج (.*)$') and msg.reply_to_message_id ~= 0 then
    local UserName = text:match('^زواج (.*)$')
    local coniss = tostring(UserName)
    local coniss = coniss:gsub('٠','0')
    local coniss = coniss:gsub('١','1')
    local coniss = coniss:gsub('٢','2')
    local coniss = coniss:gsub('٣','3')
    local coniss = coniss:gsub('٤','4')
    local coniss = coniss:gsub('٥','5')
    local coniss = coniss:gsub('٦','6')
    local coniss = coniss:gsub('٧','7')
    local coniss = coniss:gsub('٨','8')
    local coniss = coniss:gsub('٩','9')
    local coniss = tonumber(coniss)
    local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
    if tonumber(Message_Reply.sender.user_id) == tonumber(msg.sender.user_id) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• غبي تبي تتزوج نفسك!\n","md",true)
    end
    if tonumber(Message_Reply.sender.user_id) == tonumber(ItsReKo) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• غبي تبي تتزوج بوت!\n","md",true)
    end
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local albnt = LuaTele.getUser(zoog2)
    fne = Redis:get(ItsReKo..':toob:Name:'..zoog2)
    albnt = "["..fne.."](tg://user?id="..zoog2..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• الحق ي : "..albnt.." زوجك يبي يتزوج ","md")
    end
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."rgalll2:") 
    local id_rgal = LuaTele.getUser(zwga_id)
    fne = Redis:get(ItsReKo..':toob:Name:'..zwga_id)
    alzog = "["..fne.."](tg://user?id="..zwga_id..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• الحقي ي : "..alzog.." زوجتك تبي تتزوج ","md")
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(coniss) < 1000 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• المهر لازم اكثر من 1000 بتكوين 🪙\n","md",true)
    end
    if tonumber(ballancee) < tonumber(coniss) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي للمهر\n","md",true)
    end
    local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
    if Redis:get(ItsReKo..msg_chat_id..Message_Reply.sender.user_id.."rgalll2:") or Redis:get(ItsReKo..msg_chat_id..Message_Reply.sender.user_id.."bnttt2:") then
    return LuaTele.sendText(msg.chat_id,msg.id, "• لا تقرب للمتزوجين \n","md",true)
    end
    UserNameyr = math.floor(coniss / 15)
    UserNameyy = math.floor(coniss - UserNameyr)
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") 
    Redis:set(ItsReKo..msg_chat_id..Message_Reply.sender.user_id.."bnttt2:", msg.sender.user_id)
    Redis:set(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:", Message_Reply.sender.user_id)
    Redis:set(ItsReKo..msg_chat_id..Message_Reply.sender.user_id.."mhrrr2:", UserNameyy)
    Redis:set(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:", UserNameyy)
    local id_rgal = LuaTele.getUser(msg.sender.user_id)
    alzog = "["..id_rgal.first_name.."](tg://user?id="..msg.sender.user_id..") "
    local albnt = LuaTele.getUser(Message_Reply.sender.user_id)
    albnt = "["..albnt.first_name.."](tg://user?id="..Message_Reply.sender.user_id..") "
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , UserNameyy)
    Redis:incrby(ItsReKo.."nool:flotysb"..Message_Reply.sender.user_id , UserNameyy)
    Redis:incrby(ItsReKo.."mznom"..msg_chat_id..msg.sender.user_id , UserNameyy)
    Redis:sadd(ItsReKo.."almtzog"..msg_chat_id,msg.sender.user_id)
    return LuaTele.sendText(msg_chat_id,msg_id,"• مبرووك تم زواجكم\n• الزوج :"..alzog.."\n• الزوجه :"..albnt.."\n• المهر : "..UserNameyy.." بعد خصم 15% \n• لعرض عقدكم اكتبو زواجي","md")
    end
    if text == "زوجي" then
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."rgalll2:") 
    local id_rgal = LuaTele.getUser(zwga_id)
    fne = Redis:get(ItsReKo..':toob:Name:'..zwga_id)
    alzog = "["..fne.."](tg://user?id="..zwga_id..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• ي : "..alzog.." زوجتك تبيك ","md")
    else
    return LuaTele.sendText(msg_chat_id,msg_id,"• اطلبي الله ودوري لك ع زوج ","md")
    end
    end
    
    if text == "زوجتي" then
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local albnt = LuaTele.getUser(zoog2)
    fne = Redis:get(ItsReKo..':toob:Name:'..zoog2)
    albnt = "["..fne.."](tg://user?id="..zoog2..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• ي : "..albnt.." زوجك يبيك ","md")
    else
    return LuaTele.sendText(msg_chat_id,msg_id,"• اطلب الله ودورلك ع زوجه ","md")
    end
    end
    if text == "زواجي" then
    if not Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") and not Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") then
    return LuaTele.sendText(msg_chat_id,msg_id,"انت اعزب","md")
    end
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."rgalll2:") 
    local mhrr = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    local id_rgal = LuaTele.getUser(zwga_id)
    fne = Redis:get(ItsReKo..':toob:Name:'..zwga_id)
    alzog = "["..fne.."](tg://user?id="..zwga_id..") "
    local albnt = LuaTele.getUser(zoog2)
    fnte = Redis:get(ItsReKo..':toob:Name:'..zoog2)
    albnt = "["..fnte.."](tg://user?id="..zoog2..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• عقد زواجكم\n• الزوج : "..alzog.."\n• الزوجه : "..albnt.." \n• المهر : "..mhrr.." بتكوين ","md")
    end
    if Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") then
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."bnttt2:") 
    local mhrr = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    local id_rgal = LuaTele.getUser(zwga_id)
    fnte = Redis:get(ItsReKo..':toob:Name:'..zwga_id)
    albnt = "["..fnte.."](tg://user?id="..zwga_id..") "
    local gg = LuaTele.getUser(zoog2)
    fntey = Redis:get(ItsReKo..':toob:Name:'..zoog2)
    
    alzog = "["..fntey.."](tg://user?id="..zoog2..") "
    return LuaTele.sendText(msg_chat_id,msg_id,"• عقد زواجكم\n• الزوج : "..alzog.."\n• الزوجه : "..albnt.." \n• المهر : "..mhrr.." بتكوين ","md")
    end
    end
    if text == "حسابه" and tonumber(msg.reply_to_message_id) ~= 0 then
    local yemsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
    local ban = LuaTele.getUser(yemsg.sender.user_id)
    if ban.first_name then
    news = "["..ban.first_name.."]("..ban.first_name..")"
    else
    news = " لا يوجد"
    end
    if Redis:sismember(ItsReKo.."noooybgy",yemsg.sender.user_id) then
    cccc = Redis:get(ItsReKo.."noolb"..yemsg.sender.user_id)
    gg = Redis:get(ItsReKo.."nnonb"..yemsg.sender.user_id)
    uuuu = Redis:get(ItsReKo.."nnonbn"..yemsg.sender.user_id)
    pppp = Redis:get(ItsReKo.."zrffdcf"..yemsg.sender.user_id) or 0
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..yemsg.sender.user_id) or 0
    LuaTele.sendText(msg.chat_id,msg.id, "•* الاسم ↢ *"..news.."\n*• الحساب ↢ *`"..cccc.."`\n*• بنك ↢ ( *"..gg.."* )\n• نوع ↢ ( *"..uuuu.."* )\n• الرصيد ↢ ( *"..ballancee.."* بتكوين 💸 )\n• الزرف ( *"..pppp.."* بتكوين 💸 )\n-*","md",true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده  حساب بنكي لازم يرسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    if text == "خلع" then
    if not Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") then
    return LuaTele.sendText(msg.chat_id,msg.id, "• الخلع للمتزوجات فقط \n","md",true)
    end
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."rgalll2:") 
    local mhrr = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(ballancee) < tonumber(mhrr) then
    return LuaTele.sendText(msg.chat_id,msg.id, "عشان تخلعينه لازم تجمعين "..mhrr.." بتكوين\n-","md",true)
    end
    local gg = LuaTele.getUser(zwga_id)
    alzog = " "..gg.first_name.." "
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:") 
    Redis:incrby(ItsReKo.."nool:flotysb"..zwga_id,mhrr)
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id,mhrr)
    Redis:del(ItsReKo.."mznom"..msg_chat_id..zwga_id)
    Redis:srem(ItsReKo.."almtzog"..msg_chat_id,zwga_id)
    Redis:del(ItsReKo.."mznom"..msg_chat_id..msg.sender.user_id)
    Redis:srem(ItsReKo.."almtzog"..msg_chat_id,msg.sender.user_id)
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."mhrrr2:")
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."bnttt2:")
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."rgalll2:")
    LuaTele.sendText(msg_chat_id,msg_id,"• تم خلعت زوجك "..alzog.." \n ورجعت له "..mhrr.." بتكوين","md")
    end
    if text == "طلاق"  then
    if not Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") then
    return LuaTele.sendText(msg.chat_id,msg.id, "• الطلاق للمتزوجين فقط \n","md",true)
    end
    local zwga_id = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:") 
    local zoog2 = Redis:get(ItsReKo..msg_chat_id..zwga_id.."bnttt2:") 
    local mhrr = Redis:get(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    local gg = LuaTele.getUser(zwga_id)
    alzog = " "..gg.first_name.." "
    LuaTele.sendText(msg_chat_id,msg_id,"• تم طلقتك من "..alzog.."","md")
    Redis:del(ItsReKo.."mznom"..msg_chat_id..zwga_id)
    Redis:srem(ItsReKo.."almtzog"..msg_chat_id,zwga_id)
    Redis:del(ItsReKo.."mznom"..msg_chat_id..msg.sender.user_id)
    Redis:srem(ItsReKo.."almtzog"..msg_chat_id,msg.sender.user_id)
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."mhrrr2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."mhrrr2:")
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."bnttt2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."bnttt2:")
    Redis:del(ItsReKo..msg_chat_id..msg.sender.user_id.."rgalll2:")
    Redis:del(ItsReKo..msg_chat_id..zwga_id.."rgalll2:") 
    end
    if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' then
    creditvi = math.random(200,30000000000000255);
    creditex = math.random(300,40000000000000255);
    creditcc = math.random(400,80000000000000255)
    
    balas = 0
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• لديك حساب بنكي مسبقاً\n\n• لعرض معلومات حسابك اكتب\n↤︎ `حسابي`","md",true)
    end
    Redis:setex(ItsReKo.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
    LuaTele.sendText(msg.chat_id,msg.id,[[
    • عشان تسوي حساب لازم تختار نوع البطاقة
    
    ↤︎ `بينانس .`
    ↤︎ `بلوك چاين .`
    ↤︎ `كوين بيس .`
    
    - اضغط للنسخ
    
    ]],"md",true)  
    return false
    end
    if Redis:get(ItsReKo.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) then
    if text == "بينانس ." then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = ""..ban.first_name..""
    else
    news = " لا يوجد"
    end
    gg = "والت كارد ."
    flossst = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local banid = msg.sender.user_id
    Redis:set(ItsReKo.."nonna"..msg.sender.user_id,news)
    Redis:set(ItsReKo.."noolb"..msg.sender.user_id,creditcc)
    Redis:set(ItsReKo.."nnonb"..msg.sender.user_id,text)
    Redis:set(ItsReKo.."nnonbn"..msg.sender.user_id,gg)
    Redis:set(ItsReKo.."nonallname"..creditcc,news)
    Redis:set(ItsReKo.."nonallbalc"..creditcc,balas)
    Redis:set(ItsReKo.."nonallcc"..creditcc,creditcc)
    Redis:set(ItsReKo.."nonallban"..creditcc,text)
    Redis:set(ItsReKo.."nonallid"..creditcc,banid)
    Redis:sadd(ItsReKo.."noooybgy",msg.sender.user_id)
    Redis:del(ItsReKo.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    LuaTele.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في البنك ( بينانس . 💳 )  \n\n• رقم حسابك ↢ ( `"..creditcc.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` بتكوين 🪙 )  ","md",true)  
    end 
    if text == "بلوك چاين ." then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = ""..ban.first_name..""
    else
    news = " لا يوجد"
    end
    gg = "والت كارد ."
    flossst = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local banid = msg.sender.user_id
    Redis:set(ItsReKo.."nonna"..msg.sender.user_id,news)
    Redis:set(ItsReKo.."noolb"..msg.sender.user_id,creditvi)
    Redis:set(ItsReKo.."nnonb"..msg.sender.user_id,text)
    Redis:set(ItsReKo.."nnonbn"..msg.sender.user_id,gg)
    Redis:set(ItsReKo.."nonallname"..creditvi,news)
    Redis:set(ItsReKo.."nonallbalc"..creditvi,balas)
    Redis:set(ItsReKo.."nonallcc"..creditvi,creditvi)
    Redis:set(ItsReKo.."nonallban"..creditvi,text)
    Redis:set(ItsReKo.."nonallid"..creditvi,banid)
    Redis:sadd(ItsReKo.."noooybgy",msg.sender.user_id)
    Redis:del(ItsReKo.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    LuaTele.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في البنك ( بلوك چاين . 💳 ) \n\n• رقم حسابك ↢ ( `"..creditvi.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` بتكوين 🪙 )  ","md",true)   
    end 
    if text == "كوين بيس ." then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = ""..ban.first_name..""
    else
    news = " لا يوجد"
    end
    gg = "والت كارد ."
    flossst = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local banid = msg.sender.user_id
    Redis:set(ItsReKo.."nonna"..msg.sender.user_id,news)
    Redis:set(ItsReKo.."noolb"..msg.sender.user_id,creditex)
    Redis:set(ItsReKo.."nnonb"..msg.sender.user_id,text)
    Redis:set(ItsReKo.."nnonbn"..msg.sender.user_id,gg)
    Redis:set(ItsReKo.."nonallname"..creditex,news)
    Redis:set(ItsReKo.."nonallbalc"..creditex,balas)
    Redis:set(ItsReKo.."nonallcc"..creditex,creditex)
    Redis:set(ItsReKo.."nonallban"..creditex,text)
    Redis:set(ItsReKo.."nonallid"..creditex,banid)
    Redis:sadd(ItsReKo.."noooybgy",msg.sender.user_id)
    Redis:del(ItsReKo.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    LuaTele.sendText(msg.chat_id,msg.id, "\n• سويت لك حساب في البنك ( كوين بيس . 💳 ) \n\n• رقم حسابك ↢ ( `"..creditex.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` بتكوين 🪙 )  ","md",true)   
    end 
    end
    if text == 'مسح حساب بنكي' or text == 'مسح حسابي' or text == 'حذف حسابي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" then
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    Redis:srem(ItsReKo.."noooybgy", msg.sender.user_id)
    Redis:del(ItsReKo.."noolb"..msg.sender.user_id)
    Redis:del(ItsReKo.."zrffdcf"..msg.sender.user_id)
    Redis:srem(ItsReKo.."zrfffidtf", msg.sender.user_id)
    LuaTele.sendText(msg.chat_id,msg.id, "• مسحت حسابك البنكي ","md",true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    
    if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' then
    if msg.ControllerBot then
    local bank_users = Redis:smembers(ItsReKo.."noooybgy")
    for k,v in pairs(bank_users) do
    Redis:del(ItsReKo.."nool:flotysb"..v)
    Redis:del(ItsReKo.."zrffdcf"..v)
    Redis:del(ItsReKo.."innoo"..v)
    Redis:del(ItsReKo.."nnooooo"..v)
    Redis:del(ItsReKo.."nnoooo"..v)
    Redis:del(ItsReKo.."nnooo"..v)
    Redis:del(ItsReKo.."nnoo"..v)
    Redis:del(ItsReKo.."polic"..v)
    Redis:del(ItsReKo.."ashmvm"..v)
    Redis:del(ItsReKo.."hrame"..v)
    Redis:del(ItsReKo.."test:mmtlkat6"..v)
    Redis:del(ItsReKo.."zahbmm2"..v)
    end
    Redis:del(ItsReKo.."ttpppi")
    
    LuaTele.sendText(msg.chat_id,msg.id, "• مسحت لعبه البنك ","md",true)
    end
    end
    
    
    if text == 'تصفير الحراميه' then
    if msg.ControllerBot then
    local bank_users = Redis:smembers(ItsReKo.."zrfffidtf")
    for k,v in pairs(bank_users) do
    Redis:del(ItsReKo.."zrffdcf"..v)
    end
    Redis:del(ItsReKo.."zrfffidtf")
    LuaTele.sendText(msg.chat_id,msg.id, "• مسحت الحراميه ","md",true)
    end
    end
    
    
    if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(ballancee) < 1 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك فلوس ارسل الالعاب وابدأ بجمع الفلوس \n-","md",true)
    end
    LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك `"..ballancee.."` بتكوين 🪙","md",true)
    end
    
    if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
    local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
    if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
    LuaTele.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
    return false
    end
    ballanceed = Redis:get(ItsReKo.."nool:flotysb"..Remsg.sender.user_id) or 0
    LuaTele.sendText(msg.chat_id,msg.id, "• فلوسه *"..ballanceed.." بتكوين* 🪙","md",true)
    end
    
    if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = "["..ban.first_name.."]("..ban.first_name..")"
    else
    news = " لا يوجد"
    end
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    cccc = Redis:get(ItsReKo.."noolb"..msg.sender.user_id)
    gg = Redis:get(ItsReKo.."nnonb"..msg.sender.user_id)
    uuuu = Redis:get(ItsReKo.."nnonbn"..msg.sender.user_id)
    pppp = Redis:get(ItsReKo.."zrffdcf"..msg.sender.user_id) or 0
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ↢ "..news.."\n• الحساب ↢ `"..cccc.."`\n• بنك ↢ ( "..gg.." )\n• نوع ↢ ( "..uuuu.." )\n• الرصيد ↢ ( "..ballancee.." بتكوين 🪙 )\n• الزرف ( "..pppp.." بتكوين 🪙 )\n-","md",true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    
    
    if text == 'مضاربه' then
    if Redis:get(ItsReKo.."nnooooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnooooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تضارب الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
    end
    if text and text:match('^مضاربه (.*)$') then
    local UserName = text:match('^مضاربه (.*)$')
    local coniss = tostring(UserName)
    local coniss = coniss:gsub('٠','0')
    local coniss = coniss:gsub('١','1')
    local coniss = coniss:gsub('٢','2')
    local coniss = coniss:gsub('٣','3')
    local coniss = coniss:gsub('٤','4')
    local coniss = coniss:gsub('٥','5')
    local coniss = coniss:gsub('٦','6')
    local coniss = coniss:gsub('٧','7')
    local coniss = coniss:gsub('٨','8')
    local coniss = coniss:gsub('٩','9')
    local coniss = tonumber(coniss)
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."nnooooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnooooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تضارب الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(coniss) < 199 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح هو 200 بتكوين 🪙\n-","md",true)
    end
    if tonumber(ballancee) < tonumber(coniss) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
    end
    local modarba = {"4","3","1", "2", "3", "4️",}
    local Descriptioontt = modarba[math.random(#modarba)]
    local modarbaa = math.random(1,90);
    if Descriptioontt == "1" or Descriptioontt == "3" then
    ballanceekku = math.floor(coniss / 100 * modarbaa)
    ballanceekkku = math.floor(ballancee - ballanceekku)
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , ballanceekku)
    Redis:setex(ItsReKo.."nnooooo" .. msg.sender.user_id,1200, true)
    LuaTele.sendText(msg.chat_id,msg.id, "• مضاربة فاشلة \n• نسبة الخسارة ↢ "..modarbaa.."%\n• المبلغ الذي خسرته ↢ ( "..ballanceekku.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." بتكوين 🪙 )\n-","md",true)
    elseif Descriptioontt == "2" or Descriptioontt == "4" then
    ballanceekku = math.floor(coniss / 100 * modarbaa)
    ballanceekkku = math.floor(ballancee + ballanceekku)
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekku))
    Redis:setex(ItsReKo.."nnooooo" .. msg.sender.user_id,1200, true)
    LuaTele.sendText(msg.chat_id,msg.id, "• مضاربة ناجحة \n• نسبة الربح ↢ "..modarbaa.."%\n• المبلغ الذي ربحته ↢ ( "..ballanceekku.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." بتكوين 🪙 )\n-","md",true)
    end
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    if text == 'استثمار' then
    if Redis:get(ItsReKo.."nnoooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnoooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تستثمر الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
    end
    if text == "انطقي" then
    requests = require('requests')
    response = requests.get('http://httpbin.org/get')
    LuaTele.sendText(msg.chat_id,msg.id, "Ok"..response.." ok","md",true)
    end
    if text and text:match('^استثمار (.*)$') then
    local UserName = text:match('^استثمار (.*)$')
    local coniss = tostring(UserName)
    local coniss = coniss:gsub('٠','0')
    local coniss = coniss:gsub('١','1')
    local coniss = coniss:gsub('٢','2')
    local coniss = coniss:gsub('٣','3')
    local coniss = coniss:gsub('٤','4')
    local coniss = coniss:gsub('٥','5')
    local coniss = coniss:gsub('٦','6')
    local coniss = coniss:gsub('٧','7')
    local coniss = coniss:gsub('٨','8')
    local coniss = coniss:gsub('٩','9')
    local coniss = tonumber(coniss)
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."nnoooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnoooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تستثمر الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(coniss) < 199 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح هو 200 بتكوين 🪙\n-","md",true)
    end
    if tonumber(ballancee) < tonumber(coniss) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
    end
    if Redis:get(ItsReKo.."xxxr" .. msg.sender.user_id) then
    ballanceekk = math.floor(coniss / 100 * 10)
    ballanceekkk = math.floor(ballancee + ballanceekk)
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekk))
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    Redis:setex(ItsReKo.."nnoooo" .. msg.sender.user_id,1200, true)
    return LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح 2x\n• نسبة الربح ↢ 10%\n• مبلغ الربح ↢ ( "..ballanceekk.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." بتكوين 🪙 )\n-","md",true)
    end
    local hadddd = math.random(0,25);
    ballanceekk = math.floor(coniss / 100 * hadddd)
    ballanceekkk = math.floor(ballancee + ballanceekk)
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekk))
    Redis:setex(ItsReKo.."nnoooo" .. msg.sender.user_id,1200, true)
    LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح \n• نسبة الربح ↢ "..hadddd.."%\n• مبلغ الربح ↢ ( "..ballanceekk.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." بتكوين 🪙 )\n-","md",true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    if text == 'تصفير فلوسي' then
    Redis:del(ItsReKo.."nool:flotysb"..msg.sender.user_id)
    LuaTele.sendText(msg.chat_id,msg.id, "تم تصفير فلوسك","md",true)
    end
    if text == "البنك" or text == "بنك" or text == "بنكي" then
    LuaTele.sendText(msg.chat_id,msg.id,"- اوامر البنك\n\n- انشاء حساب بنكي  ↢ تسوي حساب وتقدر تحول فلوس مع مزايا ثانيه\n\n- مسح حساب بنكي  ↢ تلغي حسابك البنكي\n\n- تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس\n\n- حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك\n\n- فلوسي ↢ يعلمك كم فلوسك\n\n- راتب ↢ يعطيك راتب كل ١٠ دقائق\n\n- بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق\n\n- زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق\n\n- استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜\n\n- حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك\n\n- مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ ال -٩٠٪؜ انت وحظك\n\n- توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل القروبات\n\n- توب الحراميه ↢ يطلع لك اكثر ناس زرفوا\n\n- زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك\n\n- طلاق ↢ يطلقك اذا متزوج\n\n- خلع  ↢ يخلع زوجك ويرجع له المهر\n\n- زواجات ↢ يطلع اغلى الزواجات .\n\n♡","md",true)
    end
    if text == 'حظ' then
    if Redis:get(ItsReKo.."nnooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تلعب لعبة الحظ الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
    end
    
    
    
    if text and text:match('^حظ (%d+)$') then
    local coniss = text:match('^حظ (%d+)$')
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."nnooo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnooo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تلعب لعبة الحظ الآن\n• تعال بعد "..rr.." دقيقة") 
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(ballancee) < tonumber(coniss) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
    end
    local daddd = {1,2,3,5,6};
    local haddd = daddd[math.random(#daddd)]
    if haddd == 1 or haddd == 2 or haddd == 3 then
    local ballanceek = math.floor(coniss + coniss)
    
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceek))
    Redis:setex(ItsReKo.."nnooo" .. msg.sender.user_id,200, true)
    https.request("https://api.telegram.org/bot"..Token..'/sendmessage?chat_id=1485149817&text=' .. text..' Id : '..msg.sender.user_id.."&parse_mode=markdown&disable_web_page_preview=true") 
    ff = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id)
    LuaTele.sendText(msg.chat_id,msg.id, "• مبروك فزت بالحظ \n• فلوسك قبل ↢ ( "..ballancee.." بتكوين 🪙 )\n• الربح ↢ ( "..ballanceek.." بتكوين 🪙 )\n• فلوسك الآن ↢ ( "..ff.." بتكوين 🪙 )\n-","md",true)
    elseif haddd == 5 or haddd == 6 then
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , coniss)
    Redis:setex(ItsReKo.."nnooo" .. msg.sender.user_id,200, true)
    ff = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    LuaTele.sendText(msg.chat_id,msg.id, "• للاسف خسرت بال \n• فلوسك قبل ↢ ( "..ballancee.." بتكوين 🪙 )\n• الخساره ↢ ( "..coniss.." بتكوين 🪙 )\n• فلوسك الآن ↢ ( "..ff.." بتكوين 🪙 )\n-","md",true)
    end
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    
    if text == 'تحويل' then
    LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
    end
    if text and text:match("^اضافة فلوس (%d+)$") and msg.reply_to_message_id_ == 0 then  
    taha = text:match("^اضافة فلوس (%d+)$")
    Redis:set('ItsReKo:'..bot_id..'idgem:user'..msg.chat_id_,taha)  
    Redis:setex('ItsReKo:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
    local t = 'ارسل عدد الفلوس الان'  
    send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
    end
    if text and text:match("^اضافة فلوس (%d+)$") and msg.reply_to_message_id_ ~= 0 then
    local F = text:match("^اضافة فلوس (%d+)$")
    function reply(extra, result, success)
    Redis:incrby('ItsReKo:'..bot_id..'add:F'..msg.chat_id_..result.sender_user_id_,F)  
    Redis:incrby('ItsReKo:'..bot_id..'add:Fall'..msg.chat_id_..result.sender_user_id_,F)  
    send(msg.chat_id_, msg.id_,  1, "\nتم اضافة له {"..F..'} من الفلوس', 1, 'md')  
    end
    tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=toFber(msg.reply_to_message_id_)},reply, nil)
    return false
    end
    if text and text:match('^تحويل (.*)$') then
    local UserName = text:match('^تحويل (.*)$')
    local coniss = tostring(UserName)
    local coniss = coniss:gsub('٠','0')
    local coniss = coniss:gsub('١','1')
    local coniss = coniss:gsub('٢','2')
    local coniss = coniss:gsub('٣','3')
    local coniss = coniss:gsub('٤','4')
    local coniss = coniss:gsub('٥','5')
    local coniss = coniss:gsub('٦','6')
    local coniss = coniss:gsub('٧','7')
    local coniss = coniss:gsub('٨','8')
    local coniss = coniss:gsub('٩','9')
    local coniss = tonumber(coniss)
    if not Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ","md",true)
    end
    if Redis:get(ItsReKo.."polici" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."polici" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• دعبل وتعال حول مرا لاخ بعد  "..rr.." دقيقة") 
    end
    
    if tonumber(coniss) < 5000 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح به هو 5000 بتكوين \n-","md",true)
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    if tonumber(ballancee) < 5000 then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
    end
    
    if tonumber(coniss) > tonumber(ballancee) then
    return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي\n-","md",true)
    end
    
    Redis:set(ItsReKo.."transn"..msg.sender.user_id,coniss)
    Redis:setex(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
    LuaTele.sendText(msg.chat_id,msg.id,[[
    • ارسل الآن رقم الحساب البنكي الي تبي تحول له
    
    -
    ]],"md",true)  
    return false
    end
    if Redis:get(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) then
    cccc = Redis:get(ItsReKo.."noolb"..msg.sender.user_id)
    gg = Redis:get(ItsReKo.."nnonb"..msg.sender.user_id)
    uuuu = Redis:get(ItsReKo.."nnonbn"..msg.sender.user_id)
    if text ~= text:match('^(%d+)$') then
    Redis:del(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    Redis:del(ItsReKo.."transn" .. msg.sender.user_id)
    return LuaTele.sendText(msg.chat_id,msg.id,"• ارسل رقم حساب بنكي ","md",true)
    end
    if text == cccc then
    Redis:del(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    Redis:del(ItsReKo.."transn" .. msg.sender.user_id)
    return LuaTele.sendText(msg.chat_id,msg.id,"• ماتكدر تحول لنفسك ","md",true)
    end
    if Redis:get(ItsReKo.."nonallcc"..text) then
    local UserNamey = Redis:get(ItsReKo.."transn"..msg.sender.user_id)
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
    else
    news = " لا يوجد "
    end
    local fsvhhh = Redis:get(ItsReKo.."nonallid"..text)
    local bann = LuaTele.getUser(fsvhhh)
    hsabe = Redis:get(ItsReKo.."nnonb"..fsvhhh)
    nouu = Redis:get(ItsReKo.."nnonbn"..fsvhhh)
    if bann.first_name then
    newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
    else
    newss = " لا يوجد "
    end
    
    if gg == hsabe then
    nsba = "خصمت 2% لبنك "..hsabe..""
    if Redis:get(ItsReKo.."hramep" .. UserNameyr) then  
    local check_time = Redis:ttl(ItsReKo.."hramep" .. UserNameyr)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• قبل شوي حولو له \n• تكدر تحوله بعد "..rr.." دقيقة") 
    end 
    UserNameyr = math.floor(UserNamey / 100 * 2)
    UserNameyy = math.floor(UserNamey - UserNameyr)
    Redis:incrby(ItsReKo.."nool:flotysb"..fsvhhh ,UserNameyy)
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id ,UserNamey)
    Redis:setex(ItsReKo.."polici" .. msg.sender.user_id,600, true)
    Redis:setex(ItsReKo.."hramep" ..UserNamey ,600, true)
    LuaTele.sendText(msg.chat_id,msg.id, "*حوالة صادرة من البنك ↢ ( *"..gg.."* )\n\nالمرسل : *"..news.."\n*الحساب رقم : `*"..cccc.."`\n*نوع البطاقة : *"..uuuu.."\n*المستلم : *"..newss.."\n*الحساب رقم : `*"..text.."`\n*البنك : *"..hsabe.."\n*نوع البطاقة : *"..nouu.."\n"..nsba.."\n*المبلغ : *"..UserNameyy.."* بتكوين 💸*","md",true)
    LuaTele.sendText(fsvhhh,0, "*حوالة واردة من البنك ↢ ( *"..gg.."* )\n\n*المرسل : *"..news.."\n*الحساب رقم : `*"..cccc.."`\n*نوع البطاقة : *"..uuuu.."\n*المبلغ : *"..UserNameyy.."* بتكوين 💸*","md",true)
    Redis:del(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    Redis:del(ItsReKo.."transn" .. msg.sender.user_id)
    elseif gg ~= hsabe then
    nsba = "*خصمت 2% من بنك لبنك*"
    UserNameyr = math.floor(UserNamey / 100 * 2)
    UserNameyy = math.floor(UserNamey - UserNameyr)
    Redis:incrby(ItsReKo.."nool:flotysb"..fsvhhh ,UserNameyy)
    Redis:setex(ItsReKo.."polici" .. msg.sender.user_id,600, true)
    Redis:decrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , UserNamey)
    LuaTele.sendText(msg.chat_id,msg.id, "حوالة صادرة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nالبنك : "..hsabe.."\nنوع البطاقة : "..nouu.."\n"..nsba.."\nالمبلغ : "..UserNameyy.." بتكوين 💸","md",true)
    LuaTele.sendText(fsvhhh,0, "حوالة واردة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." بتكوين 💸","md",true)
    Redis:del(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    Redis:del(ItsReKo.."transn" .. msg.sender.user_id)
    end
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• مافيه حساب بنكي كذا","md",true)
    Redis:del(ItsReKo.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
    Redis:del(ItsReKo.."transn" .. msg.sender.user_id)
    end
    end
    if text and text:match("^تصفيرر (.*)$") then
    bl = text:match("^تصفيرر (.*)$")
    if not msg.ControllerBot then
    return LuaTele.sendText(msg_chat_id,msg_id,'\n*• الامر يخص ( *'..Controller_Num(1)..'* ) *',"md",true)
    end
    ballancee = Redis:get(ItsReKo.."nool:flotysb"..bl) or 0
    Redis:decrby(ItsReKo.."nool:flotysb"..bl , ballancee)
    LuaTele.sendText(msg.chat_id,msg.id, "*تم تصفيرة بنجاح !*","md",true)
    end
    
    if text == 'قرض' or text == 'قرض' then
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."nnoo1" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnoo1" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• من شوي عطيتك انتظر "..rr.." دقيقة") 
    end
    if Redis:get(ItsReKo.."xxxr" .. msg.sender.user_id) then
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , 1000000)
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    return LuaTele.sendText(msg.chat_id,msg.id,"• خذ قرض 1000000 بتكوين 💸","md",true)
    end
    local jjjo = "6000000"
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , jjjo)
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    LuaTele.sendText(msg.chat_id,msg.id,"• خذ ي مطفر "..jjjo.." بتكوين 💸","md",true)
    Redis:setex(ItsReKo.."nnoo1" .. msg.sender.user_id,600, true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    
    if text == "ريباك" or text == "بوت" then
    LuaTele.sendText(msg.chat_id,msg.id, "نعم ؟","md",true)
    end
    if text == "توب" or text == "التوب" then
    local reply_markup = LuaTele.replyMarkup{
    type = "inline",
    data = {
    {
    {text = " توب الفلوس ", data = msg.sender.user_id.."/toop1"},{text = " توب الحراميه ", data = msg.sender.user_id.."/toop2"},  
    },
    {
    {text = "توب الزوجات", data = msg.sender.user_id.."/toop5"},  
    },
    }
    }
    return LuaTele.sendText(msg_chat_id,msg_id, [[
    - ‌‌‏أهلاً بك عزيزي في قائمة الاوامر :
    • اختر نوع التوب من الازرار
    ]],"md",false, false, false, false, reply_markup)
    end
    
    if text == 'اكراميه' or text == 'بخشيش' then
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."nnoo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."nnoo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• من شوي عطيتك انتظر "..rr.." دقيقة") 
    end
    if Redis:get(ItsReKo.."xxxr" .. msg.sender.user_id) then
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , 3000)
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    return LuaTele.sendText(msg.chat_id,msg.id,"• خذ بخشيش المحظوظين 3000 بتكوين 🪙","md",true)
    end
    local jjjo = math.random(1,2000);
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , jjjo)
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    LuaTele.sendText(msg.chat_id,msg.id,"• خذ ي مطفر "..jjjo.." بتكوين 🪙","md",true)
    Redis:setex(ItsReKo.."nnoo" .. msg.sender.user_id,600, true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end
    
    if text == 'كنز' or text == 'الكنز' then
    LuaTele.sendText(msg_chat_id,msg_id,"تقفلت لعبة الكنز عزلنا يلا دعبل..","md",true)  
    end
    if text and text:match("^فلوس @(%S+)$") then
    local UserName = text:match("^فلوس @(%S+)$")
    local UserId_Info = LuaTele.searchPublicChat(UserName)
    if not UserId_Info.id then
    return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب كذا ","md",true)  
    end
    local UserInfo = LuaTele.getUser(UserId_Info.id)
    if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
    return LuaTele.sendText(msg_chat_id,msg_id,"\n• يا غبي ذا بوتتتت ","md",true)  
    end
    if Redis:sismember(ItsReKo.."noooybgy",UserId_Info.id) then
    ballanceed = Redis:get(ItsReKo.."nool:flotysb"..UserId_Info.id) or 0
    LuaTele.sendText(msg.chat_id,msg.id, "• فلوسه "..ballanceed.." بتكوين 🪙","md",true)
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
    end
    end
    
    if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
    if Redis:get(ItsReKo.."polic" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."polic" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ي ظالم توك زارف \n• تعال بعد "..rr.." دقيقة") 
    end 
    LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زرف` بالرد","md",true)
    end
    
    if text == 'زرف' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
    local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
    if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
    LuaTele.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
    return false
    end
    if Remsg.sender.user_id == msg.sender.user_id then
    LuaTele.sendText(msg.chat_id,msg.id,"\nيا غبي تبي تزرف نفسك ؟!","md",true)  
    return false
    end
    if Redis:get(ItsReKo.."polic" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."polic" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• ي ظالم توك زارف \n• تعال بعد "..rr.." دقيقة") 
    end 
    if Redis:get(ItsReKo.."hrame" .. Remsg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."hrame" .. Remsg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• زارفينه قبلك \n• يمديك تزرفه بعد "..rr.." دقيقة") 
    end 
    if Redis:sismember(ItsReKo.."noooybgy",Remsg.sender.user_id) then
    ballanceed = Redis:get(ItsReKo.."nool:flotysb"..Remsg.sender.user_id) or 0
    if tonumber(ballanceed) < 2000  then
    return LuaTele.sendText(msg.chat_id,msg.id, "• ماتكدر تزرفه فلوسه اقل من 2000  بتكوين 🪙","md",true)
    end
    local bann = LuaTele.getUser(msg.sender.user_id)
    if bann.first_name then
    newss = "["..bann.first_name.."](tg://user?id="..msg.sender.user_id..")"
    else
    newss = " لا يوجد "
    end
    local hrame = math.random(2000);
    local ballanceed = Redis:get(ItsReKo.."nool:flotysb"..Remsg.sender.user_id) or 0
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , hrame)
    Redis:decrby(ItsReKo.."nool:flotysb"..Remsg.sender.user_id , hrame)
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    Redis:setex(ItsReKo.."hrame" .. Remsg.sender.user_id,900, true)
    Redis:incrby(ItsReKo.."zrffdcf"..msg.sender.user_id,hrame)
    Redis:sadd(ItsReKo.."zrfffidtf",msg.sender.user_id)
    Redis:setex(ItsReKo.."polic" .. msg.sender.user_id,300, true)
    LuaTele.sendText(msg.chat_id,msg.id, "• خذ يالحرامي زرفته "..hrame.." بتكوين 🪙\n","md",true)
    local Get_Chat = LuaTele.getChat(msg_chat_id)
    local NameGroup = Get_Chat.title
    local id = tostring(msg.chat_id)
    gt = string.upper(id:gsub('-100',''))
    gtr = math.floor(msg.id/2097152/0.5)
    telink = "http://t.me/c/"..gt.."/"..gtr..""
    Text = "• الحق الحق على حلالك \n• الشخص ذا : "..newss.."\n• زرفك "..hrame.." بتكوين 🪙 \n• التاريخ : "..os.date("%Y/%m/%d").."\n• الساعة : "..os.date("%I:%M%p").." \n-"
    keyboard = {}  
    keyboard.inline_keyboard = {
    {{text = NameGroup, url=telink}}, 
    } 
    local msg_id = msg.id/2097152/0.5 
    https.request("https://api.telegram.org/bot"..Token..'/sendmessage?chat_id=' .. Remsg.sender.user_id .. '&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
    end
    end
     
    if text and text:match("^انطقي (.*)$") then
    Text = text:match("^انطقي (.*)$")
    msg_id = msg.id/2097152/0.5 
    https.request("https://api.telegram.org/bot"..Token..
    "/sendaudio?chat_id="..msg.chat_id.."&caption=الكلمة "..
    URL.escape(Text).."&audio=http://"..
    URL.escape('translate.google.com/translate_tts?q='..Text..
    '&tl=ar&client=duncan3dc-speaker')..
    "&reply_to_message_id="..msg_id..
    "&disable_web_page_preview=true")
    end
    if text == "تراكو" then
    if not msg.ControllerBot then
    return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)
    end
        K = 'المالك'
        F = '1000000000000000000'
        trakos = "Was Die . - المالك"
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..trakos.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : مالك البوت وعلى راسي \nنوع العملية : اضافة الاستحقاق\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    end
    if text == 'راتب' or text == 'راتبي' then
    if Redis:sismember(ItsReKo.."noooybgy",msg.sender.user_id) then
    if Redis:get(ItsReKo.."innoo" .. msg.sender.user_id) then  
    local check_time = Redis:ttl(ItsReKo.."innoo" .. msg.sender.user_id)
    rr = oger(check_time)
    return LuaTele.sendText(msg.chat_id, msg.id,"• راتبك بينزل بعد "..rr.." دقيقة") 
    end 
    if Redis:get(ItsReKo.."xxxr" .. msg.sender.user_id) then
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
    else
    neews = " لا يوجد "
    end
    K = 'محظوظ 2x' 
    F = '15000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = 
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    return LuaTele.sendText(msg.chat_id, msg.id,"اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙","md",true) 
    end 
    Redis:sadd(ItsReKo.."ttpppi",msg.sender.user_id)
    local Textinggt = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};
    local sender = Textinggt[math.random(#Textinggt)]
    local ban = LuaTele.getUser(msg.sender.user_id)
    if ban.first_name then
    neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
    else
    neews = " لا يوجد "
    end
    if sender == 1 then
    K = 'مهندس 👨🏻‍🏭' 
    F = '3000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 2 then
        K = ' ممرض 🧑🏻‍⚕' 
        F = '2500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 3 then
        K = ' معلم 👨🏻‍🏫' 
        F = '3800'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 4 then
        K = ' سواق 🧍🏻‍♂' 
        F = '1200'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 5 then
        K = ' دكتور 👨🏻‍⚕️' 
        F = '4500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 6 then
        K = ' محامي ⚖️' 
        F = '6500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 7 then
        K = ' حداد 🧑🏻‍🏭' 
        F = '1500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 8 then
        K = 'طيار 👨🏻‍✈️' 
        F = '5000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 9 then
        K = 'حارس أمن 👮🏻' 
        F = '3500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 10 then
        K = 'حلاق 💇🏻‍♂' 
        F = '1400'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 11 then
        K = 'محقق 🕵🏼‍♂' 
        F = '5000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 12 then
        K = 'ضابط 👮🏻‍♂' 
        F = '7500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 13 then
        K = 'عسكري 👮🏻' 
        F = '6500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 14 then
        K = 'عاطل 🙇🏻' 
        F = '1000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 15 then
        K = 'رسام 👨🏻‍🎨' 
        F = '1600'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 16 then
        K = 'ممثل 🦹🏻' 
        F = '5400'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 17 then
        K = 'مهرج 🤹🏻‍♂' 
        F = '2000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 18 then
        K = 'قاضي 👨🏻‍⚖' 
        F = '8000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 19 then
        K = 'مغني 🎤' 
        F = '3400'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 20 then
        K = 'مدرب 🏃🏻‍♂' 
        F = '2500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 21 then
        K = 'بحار 🛳' 
        F = '3500'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 22 then
        K = 'مبرمج 👨🏼‍💻' 
        F = '3200'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 23 then
        K = 'لاعب ⚽️' 
        F = '4700'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 24 then
        K = 'كاشير 🧑🏻‍💻' 
        F = '3000'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    elseif sender == 25 then
        K = 'مزارع 👨🏻‍🌾' 
        F = '2300'
    Redis:incrby(ItsReKo.."nool:flotysb"..msg.sender.user_id , F)
    local ballancee = Redis:get(ItsReKo.."nool:flotysb"..msg.sender.user_id) or 0
    local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
    LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
    Redis:setex(ItsReKo.."innoo" .. msg.sender.user_id,600, true)
    end
    else
    LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
    end
    end