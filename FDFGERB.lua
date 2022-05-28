--[[
قناة السورس
----
dev: @trprogram
dev2: @trprogram
ch: @trprogram
--]]
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua FDFGERB.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف Dev🎖 الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف Dev🎖 \nDeveloper UserName saved \n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف Dev🎖 \nDeveloper UserName not saved\n')
end 
os.execute('lua FDFGERB.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي Dev🎖 الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي Dev🎖 \nDeveloper ID saved \n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي Dev🎖 \nDeveloper ID not saved\n')
end 
os.execute('lua FDFGERB.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local FDFGERB = io.open("FDFGERB", 'w')
FDFGERB:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 FDFGERB.lua
done
]])
FDFGERB:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S FDFGERB -X kill
screen -S FDFGERB ./FDFGERB
done
]])
Run:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x FDFGERB;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
FDFGERB = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..FDFGERB)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=FDFGERB,token=Token}
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..Token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id 
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url) 
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={Sudo_Id,373906612}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
if UserId == 1605449126 then
Status = true
elseif UserId == 1605449126 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1485149817 then
Status = 'Ace🎖'
elseif UserId == 1485149817 then
Status = 'Ace🎖'
elseif UserId == Sudo_Id then  
Status = 'Dev🎖'
elseif UserId == FDFGERB then
Status = 'البوت'
elseif DevelopersQ then
Status = 'Myth🎖️'
elseif Developers then
Status = Redis:get(FDFGERB.."FDFGERB:Developer:Bot:Reply"..ChatId) or 'Myth'
elseif TheBasics then
Status = Redis:get(FDFGERB.."FDFGERB:President:Group:Reply"..ChatId) or 'المنشى الاساسي'
elseif Originators then
Status = Redis:get(FDFGERB.."FDFGERB:Constructor:Group:Reply"..ChatId) or 'المنشى'
elseif Managers then
Status = Redis:get(FDFGERB.."FDFGERB:Manager:Group:Reply"..ChatId) or 'المدير'
elseif Addictive then
Status = Redis:get(FDFGERB.."FDFGERB:Admin:Group:Reply"..ChatId) or 'الادمن'
elseif Distinguished then
Status = Redis:get(FDFGERB.."FDFGERB:Vip:Group:Reply"..ChatId) or 'المميز'
else
Status = Redis:get(FDFGERB.."FDFGERB:Mempar:Group:Reply"..ChatId) or 'العضو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'Dev 🎖'
elseif tonumber(Num) == 2 then  
Status = 'Myth🎖️'
elseif tonumber(Num) == 3 then  
Status = 'Myth'
elseif tonumber(Num) == 4 then  
Status = 'المنشى الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشى'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
else
Status = 'المميز'
end  
return Status
end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local reply_markupp = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات المجموعه : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"• صلاحيات الادمن • ", 'md', false, false, reply_markupp)
end
function oger(Message)
year = math.floor(Message / 31536000)
byear = Message % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
minx = math.floor(bhours / 60)
sec = math.floor(bhours % 3600) % 60
return string.format("%02d:%02d", minx, sec)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(FDFGERB.."FDFGERB:lockpin"..ChatId) then    
lock_pin = "✔️"
else 
lock_pin = "❌"    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId) then    
lock_tagservr = "✔️"
else 
lock_tagservr = "❌"
end
if Redis:get(FDFGERB.."FDFGERB:Lock:text"..ChatId) then    
lock_text = "✔️"
else 
lock_text = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✔️"
else 
lock_add = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Join"..ChatId) == "kick" then
lock_join = "✔️"
else 
lock_join = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:edit"..ChatId) then    
lock_edit = "✔️"
else 
lock_edit = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Chek:Welcome"..ChatId) then
welcome = "✔️"
else 
welcome = "❌ "    
end
if Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقيد "     
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✔️"
else     
flood = "❌ "     
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "del" then
lock_photo = "✔️" 
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقيد "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "del" then
lock_phon = "✔️" 
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "del" then
lock_links = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "del" then
lock_user = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "del" then
lock_hash = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "del" then
lock_muse = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "del" then
lock_ved = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "del" then
lock_gif = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "del" then
lock_ste = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "del" then
lock_geam = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "del" then
lock_vico = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقيد "
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "del" then
lock_fwd = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "del" then
lock_file = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "del" then
lock_self = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقيد "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "del" then    
lock_spam = "✔️"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'ماش' 
elseif tonumber(Message) < 200 then 
MsgText = 'تفاعلك ضعيف'
elseif tonumber(Message) < 400 then 
MsgText = 'شد حيلك شوي' 
elseif tonumber(Message) < 700 then 
MsgText = 'مشي حالك' 
elseif tonumber(Message) < 1200 then 
MsgText = 'يجي منك' 
elseif tonumber(Message) < 2000 then 
MsgText = 'ياقوتك' 
elseif tonumber(Message) < 3500 then 
MsgText = 'ابووي يالقوه'  
elseif tonumber(Message) < 4000 then 
MsgText = 'كنق التيلي بكبره' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(Message) < 5500 then 
MsgText = 'استمر يابطل بالتفاعل' 
elseif tonumber(Message) < 7000 then 
MsgText = 'حيييك يالتفاعل' 
elseif tonumber(Message) < 9500 then 
MsgText = 'تاج راس التيلي' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'حييك يالتفاعل البطل'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات المجموعه : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. '/delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"• صلاحيات المجموعه • ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
kkytmAll = Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) ,
BanAll = Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')'
end
return {
Lock     = '\n• بواسطة ↤ '..UserInfousername..'\n'..TextMsg..'\n ',
unLock  = '\n• بواسطة ↤ '..UserInfousername..'\n'..TextMsg..'\n ',
lockKtm  = '\n• بوسطة ↤ '..UserInfousername..'\n'..TextMsg..'\n ',
lockKid  = '\n• بواسطة ↤ '..UserInfousername..' \n'..TextMsg..'\n ',
lockKick = '\n• بواسطة ↤ '..UserInfousername..'\n'..TextMsg..'\n ',
Reply    = '\n「 '..UserInfousername..' 」\n'..TextMsg..'\n '
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1605449126 then
Status = true
elseif UserId == 1605449126 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId,UserId_Info)
Status = nil
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
channelis = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1605449126 then
Status = true
elseif UserId == 1605449126 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,FDFGERB).status
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoin(msg)
JoinChannel = true
local Channel = Redis:get(FDFGERB..'FDFGERB:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function File_Bot_Run(msg,data)  
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender.user_id
local msg_id = msg.id
if data.sender.luatele == "messageSenderChat" and Redis:get(FDFGERB.."Lock:channell"..msg_chat_id) and not msg.channelis then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
Redis:incr(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) 
if msg.date and msg.date < tonumber(os.time() - 15) then
print("->> Old Message End <<-")
return false
end
if data.content.text then
text = data.content.text.text
end
if tonumber(msg.sender.user_id) == tonumber(FDFGERB) then
print('This is reply for Bot')
return false
end
if Statusrestricted(msg.chat_id,msg.sender.user_id).BanAll == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).kkytmAll == true then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).BanGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).SilentGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if tonumber(msg.sender.user_id) == 1605449126 then
msg.Name_Controller = 'Ace🎖 '
msg.The_Controller = 1
elseif tonumber(msg.sender.user_id) == 1605449126 then
msg.Name_Controller = 'Ace🎖'
msg.The_Controller = 1
elseif The_ControllerAll(msg.sender.user_id) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'Dev🎖'
elseif Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",msg.sender.user_id) == true then
msg.The_Controller = 2
msg.Name_Controller = 'Myth🎖️'
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",msg.sender.user_id) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id) or 'Myth'
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id) or 'المنشى الاساسي'
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id) or 'المنشى '
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id) or 'المدير '
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id) or 'الادمن '
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id) or 'المميز '
elseif tonumber(msg.sender.user_id) == tonumber(FDFGERB) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id) or 'العضو '
end  
if msg.The_Controller == 1 then  
msg.ControllerBot = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.DevelopersQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Developers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.TheBasics = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Originators = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Managers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Addictive = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Distinguished = true
end
if Redis:get(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id) and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Welcome = Redis:get(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{name}',UserInfo.first_name) 
Welcome = Welcome:gsub('{user}',UserInfousername) 
Welcome = Welcome:gsub('{NameCh}',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md")  
else
return LuaTele.sendText(msg_chat_id,msg_id,' • اطلق دخول ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n • نورت القروب {'..Get_Chat.title..'}',"md")  
end
end
end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender.user_id) == tonumber(FDFGERB) then
return false
end
local floods = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(FDFGERB.."FDFGERB:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• قام بالتكرار في المجموعه وتم طرده").Reply,"md",true)
end
if type == "del" then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• قام بالتكرار في المجموعه وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• قام بالتكرار في المجموعه وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(FDFGERB.."FDFGERB:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if msg.forward_info and not msg.Distinguished then -- التوجيه
local Fwd_Group = Redis:get(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Fwd_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is forward')
return false
end 

if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  -- الكيبورد
local Keyboard_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Keyboard_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
print('This is reply_markup')
end 

if msg.content.location and not msg.Distinguished then  -- الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
print('This is location')
end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  -- الماركداون
local Markduan_Gtoup = Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is textEntityTypeUrl')
end 

if msg.content.game and not msg.Distinguished then  -- الالعاب
local Games_Group = Redis:get(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Games_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is games')
end 
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(FDFGERB.."FDFGERB:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• التثبيت معطل من قبل المدراء ","md",true)
end
print('This is message Pin')
end 

if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end

if msg.content.luatele == "messageChatAddMembers" then -- اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(FDFGERB.."FDFGERB:Num:Add:Memp"..msg_chat_id..":"..msg.sender.user_id) 
local AddMembrs = Redis:get(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) 
if AddMembrs == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 
if msg then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
if UserInfo.first_name then
NameLUser = UserInfo.first_name
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
local data = LuaTele.getChat(msg.chat_id)
Redis:set(FDFGERB..':toob:Name:'..msg.sender.user_id,NameLUser)
end
end
if msg.content.luatele == "messageContact" and not msg.Distinguished then  -- الجهات
local Contact_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Contact_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Contact')
end 

if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  -- بصمه الفيديو
local Videonote_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Videonote_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is video Note')
end 

if msg.content.luatele == "messageDocument" and not msg.Distinguished then  -- الملفات
local Document_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id)
if Document_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Document_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Document')
end 

if msg.content.luatele == "messageAudio" and not msg.Distinguished then  -- الملفات الصوتيه
local Audio_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Audio_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Audio')
end 

if msg.content.luatele == "messageVideo" and not msg.Distinguished then  -- الفيديو
local Video_Grouo = Redis:get(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Video_Grouo == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Video')
end 

if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  -- البصمات
local Voice_Group = Redis:get(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Voice_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Voice')
end 

if msg.content.luatele == "messageSticker" and not msg.Distinguished then  -- الملصقات
local Sticker_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Sticker_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Sticker')
end 

if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  -- انلاين
local Inlen_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Inlen_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is viabot')
end

if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  -- المتحركات
local Gif_group = Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Gif_group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Animation')
end 

if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  -- الصور
local Photo_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Photo_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Photo delete')
end
if msg.content.photo and Redis:get(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• لا استطيع تغيير صوره المجموعه لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير صوره المجموعه المجموعه الى ","md",true)    
end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif link_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is link ')
return false
end
end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif UserName_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is username ')
end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Hashtak_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Hashtak_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Hashtak_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is hashtak ')
end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif comd_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif comd_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif comd_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
if (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, text)  
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true1') then
local Text_Filter = Redis:get(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(FDFGERB.."FDFGERB:Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(FDFGERB.."FDFGERB:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
Redis:del(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم اضافه رد التحذير","md",true)  
end
if text and (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(FDFGERB.."FDFGERB:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg_chat_id,msg_id,"• لقد تم منع هذه ( "..statusfilter.." ) هنا\n• "..ReplyFilters,"md",true)   
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id) == "true" then
local NewCmmd = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة هاذا ↢ ( "..text.." ) ","md",true)
else
LuaTele.sendText(msg_chat_id,msg_id,"• لايوجد امر اسمه كذا ","md",true)
end
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id)
return false
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id)
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الامر الجديد ليتم وضعه مكان القديم ","md",true)  
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id) == "true1" then
local NewCmd = Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id)
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id,text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الامر باسم ↢ ( "..text..' ) ',"md",true)
end
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,text)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(FDFGERB..'FDFGERB:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true) 
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
if text and Redis:get(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender.user_id) then
if text == 'الغاء' or text == 'الغاء الامر' then 
Redis:del(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• اهلا عزيزي , تم الغاء تغيير كليشه Dev🎖')
end
Redis:set(FDFGERB..'FDFGERB:Texting:DevFDFGERB',text)
Redis:del(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حفظ كليشة Dev🎖')
end
if Redis:get(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء تعيين الايدي عام ","md",true)  
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(FDFGERB.."FDFGERB:Set:Id:all",text:match("(.*)"))
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الايدي عام', data = msg.sender.user_id..'/chenidam'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعين الايدي عام الجديد',"md",true, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء تعيين الايدي ","md",true)  
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(FDFGERB.."FDFGERB:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الايدي', data = msg.sender.user_id..'/chenid'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعين الايدي الجديد',"md",true, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء اسم البوت ","md",true)  
end 
Redis:del(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender.user_id) 
Redis:set(FDFGERB.."FDFGERB:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "• تم تغيير اسم البوت الى • "..text,"md",true)    
end 
if Redis:get(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• اهلا عزيزي , تم الغاء تغيير كليشه start","md",true)  
end 
Redis:del(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender.user_id) 
Redis:set(FDFGERB.."FDFGERB:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "• تم تغيير كليشه start • "..text,"md",true)    
end 
if Redis:get(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender.user_id) then
if text == "الغاء" then
Redis:del(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , تم الغاء الرابط","md",true)         
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
Redis:set(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id,LinkGroup)
Redis:del(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(FDFGERB.."FDFGERB:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , تم الغاء الترحيب ","md",true)   
end 
Redis:del(FDFGERB.."FDFGERB:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
Redis:set(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ ترحيب المجموعه","md",true)     
end
if Redis:get(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , تم الغاء القوانين","md",true)   
end 
Redis:set(FDFGERB.."FDFGERB:Group:Rules" .. msg_chat_id,text) 
Redis:del(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ قوانين المجموعه","md",true)  
end  
if Redis:get(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , تم الغاء الوصف","md",true)   
end 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ وصف المجموعه","md",true)  
end 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , تم الغاء الرد","md",true)   
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(FDFGERB.."FDFGERB:Text:Manager"..msg.sender.user_id..":"..msg_chat_id.."")
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
print(idPhoto)
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return LuaTele.sendText(msg_chat_id,msg_id,"• اضفت الرد بنجاح \n• ارسل ( "..test.." ) لتشوف الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true1")
Redis:set(FDFGERB.."FDFGERB:Text:Manager"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '', data = msg.sender.user_id..'/chengreplyg'},
},
{
{text = '', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url='https://t.me/trprogram'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
• اهلا عزيزي , ارسل لي الرد الأن 
• ( ملف,ملصق,متحركه,صوره,فيديو,بصمه فيديو,بصمه,صوت, رساله )
• يُمكنك اضافة الى النص 
━━━━━
• `#اليوزر` ↢ يوزر المستخدم
• `#الرسائل` ↢ رسائل المستخدم
• `#الاسم` ↢ اسم المستخدم
• `#الرتبه` ↢ رتبه المستخدم
• `#الايدي` ↢ ايدي المستخدم
]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الرد من الردود ","md",true)  
return false
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..text)
local document = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..text)
local audio = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Text = Text:gsub('#اليوزر',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#الاسم',UserInfo.first_name)
local Text = Text:gsub('#الايدي',msg.sender.user_id)
local Text = Text:gsub('#التعديل',NumMessageEdit)
local Text = Text:gsub('#الرسائل',NumMsg)
local Text = Text:gsub('#الرتبه',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Text..']',"md",false, false, false, false, reply_markup)  
  end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Texingt = Texingt:gsub('#اليوزر',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#الاسم',UserInfo.first_name)
local Texingt = Texingt:gsub('#الايدي',msg.sender.user_id)
local Texingt = Texingt:gsub('#التعديل',NumMessageEdit)
local Texingt = Texingt:gsub('#الرسائل',NumMsg)
local Texingt = Texingt:gsub('#الرتبه',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)  
  end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(FDFGERB.."FDFGERB:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id)
if Redis:get(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..test, idPhoto)  
end
LuaTele.sendText(msg_chat_id,msg_id,"• اضفت الرد بنجاح \n• ارسل ( "..test.." ) لتشوف الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id, "true1")
Redis:set(FDFGERB.."FDFGERB:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:sadd(FDFGERB.."FDFGERB:List:Rd:Sudo", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender.user_id..'/chengreplys'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
‎• اهلا عزيزي , ارسل لي الرد الأن 
‎• ( ملف,ملصق,متحركه,صوره,فيديو,بصمه فيديو,بصمه,صوت, رساله )
‎• يُمكنك اضافة الى النص 
━━━━━
‎• `#اليوزر` ↢ يوزر المستخدم
‎• `#الرسائل` ↢ رسائل المستخدم
‎• `#الاسم` ↢ اسم المستخدم
‎• `#الرتبه` ↢ رتبه المستخدم
‎• `#الايدي` ↢ ايدي المستخدم

]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:On"..msg.sender.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(FDFGERB..'FDFGERB:'..v..text)
end
Redis:del(FDFGERB.."FDFGERB:Set:On"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الرد من الردود العامه","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Estimate"..msg.chat_id..msg.sender.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return LuaTele.sendText(msg_chat_id,msg_id,"• عذرآ لا يمكنك تخمين عدد اكبر من ال  20  خمن رقم ما بين ال 1 و 20 \n","md",true)  
end 
local GETNUM = Redis:get(FDFGERB.."FDFGERB:Game:Estimate"..msg.chat_id..msg.sender.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(FDFGERB.."FDFGERB:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(FDFGERB.."FDFGERB:Game:Estimate"..msg.chat_id..msg.sender.user_id)
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id,5)  
return LuaTele.sendText(msg_chat_id,msg_id,"• مبروك فزت معنا وخمنت الرقم الصحيح\n• تم اضافة  5  من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(FDFGERB.."FDFGERB:SADD:NUM"..msg.chat_id..msg.sender.user_id,1)
if tonumber(Redis:get(FDFGERB.."FDFGERB:SADD:NUM"..msg.chat_id..msg.sender.user_id)) >= 3 then
Redis:del(FDFGERB.."FDFGERB:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(FDFGERB.."FDFGERB:Game:Estimate"..msg.chat_id..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اوبس لقد خسرت في اللعبه \n• حظآ اوفر في المره القادمه \n• كان الرقم الذي تم تخمينه  "..GETNUM.." ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"• اوبس تخمينك غلط \n• ارسل رقم تخمنه مره اخرى ","md",true)  
end
end
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اجابتك صحيحة كفو عليك ","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اجابتك صحيحة كفو عليك ","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اجابتك صحيحة كفو عليك ","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اجابتك صحيحة كفو عليك ","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اجابتك صحيحة كفو عليك ","md",true)  
end
end
if text then
local NewCmmd = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then
return LuaTele.sendText(msg_chat_id,msg_id,'• عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(FDFGERB) ~= tonumber(FilesJson.BotId) then
return LuaTele.sendText(msg_chat_id,msg_id,'• عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
LuaTele.sendText(msg_chat_id,msg_id,'• جاري استرجاع المشتركين والقروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(FDFGERB..'FDFGERB:Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..GroupId,v)
end
end 
end
return LuaTele.sendText(msg_chat_id,msg_id,'• تم استرجاع {'..X..'} مجموعه \n• واسترجاع {'..Y..'} مشترك في البوت')
end
end
if text == 'رفع نسخه قديمه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(FDFGERB) then 
return LuaTele.sendText(msg_chat_id,msg_id,'• عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..idg,idASAS)
end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'• تم استرجاع المجموعات من نسخه قديمه')
else
return LuaTele.sendText(msg_chat_id,msg_id,'• الملف لا يدعم هاذا البوت')
end
end
end
if (Redis:get(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر' then 
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• تم الغاء حفظ قناة الاشتراك')
end
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,FDFGERB).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Join',ChannelUser) 
Redis:set(FDFGERB..'FDFGERB:Channel:Join:Name',UserId_Info.title) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تعيين الاشتراك الاجباري على قناة : [ @"..ChannelUser..' ]',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هاذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [ @"..ChannelUser..' ]',"md",true)  
end
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
Redis:del(FDFGERB..'FDFGERB:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري' or text == 'تغيير الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == 'الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local Channel = Redis:get(FDFGERB..'FDFGERB:Channel:Join')
if Channel then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• الاشتراك الاجباري مفعل على : [ @"..Channel..' ]',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end
if text == 'تحديث السورس' or text == 'تحديث سورس' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
os.execute('rm -rf FDFGERB.lua')
download('https://raw.githubusercontent.com/Fawazz77/Rhps/blob/main/FDFGERB.lua','FDFGERB.lua')
return LuaTele.sendText(msg_chat_id,msg_id,'\n• تم تحديث السورس ',"md",true)  
end
if text == 'جلب النسخه الاحتياطيه' or text == 'جلب نسخه احتياطيه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Groups = Redis:smembers(FDFGERB..'FDFGERB:ChekBotAdd')  
local UsersBot = Redis:smembers(FDFGERB..'FDFGERB:Num:User:Pv')  
local Get_Json = '{"BotId": '..FDFGERB..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":('   
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..' ]'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(FDFGERB.."FDFGERB:TheBasics:Group"..v)
local Constructor = Redis:smembers(FDFGERB.."FDFGERB:Originators:Group"..v)
local Manager = Redis:smembers(FDFGERB.."FDFGERB:Managers:Group"..v)
local Admin = Redis:smembers(FDFGERB.."FDFGERB:Addictive:Group"..v)
local Vips = Redis:smembers(FDFGERB.."FDFGERB:Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":(' 
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":(' 
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":(' 
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":(' 
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":(' 
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..''
end
Get_Json = Get_Json..'}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json', '• تم جلب النسخه الاحتياطيه\n• تحتوي على {'..#Groups..'} مجموعه \n• وتحتوي على {'..#UsersBot..'} مشترك \n', 'md')
end
if text == 'جلب نسخه الردود' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local Get_Json = '{"BotId": '..FDFGERB..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(FDFGERB..'FDFGERB:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"orab":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.orab == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(FDFGERB.."FDFGERB:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• تم استرجاع ردود المجموعات',"md",true)  
end
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو ',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'• عدد احصائيات البوت الكامله \n━━━━━\n• عدد المجموعات : '..(Redis:scard(FDFGERB..'FDFGERB:ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(FDFGERB..'FDFGERB:Num:User:Pv') or 0)..'',"md",true)  
end
if text == 'تفعيل' and msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل المجموعه  يجب ان يكوم اكثر من :'..Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تفعيلها مسبقا ',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},
},
}
}
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تفعيل مجموعه جديده \n• من قام بتفعيلها :  [' ..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)

Redis:set(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تفعيل المجموعه ','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرا انته لست ادمن او مالك المجموعه ","md",true)  
end
if not Redis:get(FDFGERB.."FDFGERB:BotFree") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• الوضع الخدمي تم تعطيله من قبل Dev🎖 البوت ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل المجموعه  يجب ان يكوم اكثر من :'..Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تفعيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تفعيل مجموعه جديده \n• من قام بتفعيلها : ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},
},
}
}
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
Redis:set(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تفعيل المجموعه ','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تعطيل مجموعه جديده \n• من قام بتعطيلها : ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها بنجاح ','md',true)
end
end
if text == 'تعطيل' and not msg.Developers then
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرا انته لست ادمن او مالك المجموعه ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
aLuaTele.sendText(Sudo_Id,0,'\n• تم تعطيل مجموعه جديده \n• من قام بتعطيلها : ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها بنجاح ','md',true)
end
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if text == "ايدي" and msg.reply_to_message_id == 0 then
if not Redis:get(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id) then
return false
end
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
local NumAdd = Redis:get(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0
local Texting = {""}
local InfoUser = LuaTele.getUserFullInfo(UserId)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(FDFGERB.."FDFGERB:Set:Id:all") or Redis:get(FDFGERB.."FDFGERB:Set:Id:Group"..msg_chat_id)
if Redis:get(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#الجهات',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#الايدي',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#اليوزر',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#الرسائل',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#التعديل',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#الرتبه',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#البايو',Bio) 
local Get_Is_Id = Get_Is_Id:gsub('#التفاعل',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#التعليق',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#المجوهرات',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#عدد الصور',TotalPhoto) 
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n'..Description..
'\n[• ID 𖦹 '..UserId..
'\n• UserName 𖦹 '..UserInfousername..
'\n• Rank 𖦹 '..RinkBot..
'\n• Photo 𖦹 '..TotalPhoto..
'\n• Msg 𖦹 '..TotalMsg..
'\n• Edit 𖦹 '..TotalEdit..
'\n• Bio 𖦹 '..Bio..
']', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ID 𖦹 '..UserId..
'\n• UserName 𖦹 '..UserInfousername..
'\n• Rank 𖦹 '..RinkBot..
'\n• Msg 𖦹 '..TotalMsg..
'\n• Edit 𖦹 '..TotalEdit..
'\n• Bio 𖦹 '..Bio..
']',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#الجهات',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#الايدي',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#اليوزر',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#الرسائل',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#التعديل',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#الرتبه',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#البايو',Bio) 
local Get_Is_Id = Get_Is_Id:gsub('#التفاعل',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#التعليق',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#المجوهرات',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#عدد الصور',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ID 𖦹 '..UserId..
'\n• UserName 𖦹 '..UserInfousername..
'\n• Rank 𖦹 '..RinkBot..
'\n• Msg 𖦹 '..TotalMsg..
'\n• Edit 𖦹 '..TotalEdit..
'\n• Bio 𖦹 '..Bio..
']',"md",true) 
end
end
end
if text == 'كشف' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.username then
UserInfousername = '@['..UserInfo.username..']'
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender.user_id
local InfoUser = LuaTele.getUserFullInfo(UserId)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local RinkBot = Controller(msg_chat_id,Message_Reply.sender.user_id)
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender.user_id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..Message_Reply.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n• ايديه ↢ '..UserId..
'\n• معرفه ↢ '..UserInfousername..
'\n• رتبته ↢ '..RinkBot..
'\n• رسائله ↢ '..TotalMsg..
'\n• تعديلاته ↢ '..TotalEdit..
'\n• رتبته المجموعه ↢ '..StatusMemberChat..
'',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local InfoUser = LuaTele.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ايديه ↢ '..UserId..
'\n• معرفه ↢ @'..UserName..
'\n• رتبته ↢ '..RinkBot..
'\n• رسائله ↢ '..TotalMsg..
'\n• تعديلاته ↢ '..TotalEdit..
'\n• رتبته المجموعه ↢ '..StatusMemberChat..
']',"md",true) 
end
if (Redis:get(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير Dev🎖","md",true)    
end 
Redis:del(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او مجموعه ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم نقل Dev🎖 الى : [ @"..text:gsub('@','').."]","md",true)  
end
end
if text == 'تغيير Dev🎖' or text == 'تغيير م' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*• هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل معرف Dev🎖 مع @","md",true)
end
if text == 'رتبتي' then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• رتبتك ↢ '..msg.Name_Controller,"md",true)  
end
if text == 'معلوماتي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك المجموعه'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف المجموعه'
else
StatusMemberChat = 'عضو في المجموعه'
end
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
if UserInfo.username then
UserInfousername = '@['..UserInfo.username..']'
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف المجموعه' then 
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status
if GetMemberStatus.can_change_info then
change_info = '〖 ✔️ 〗' else change_info = '〖 ✖️ 〗'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '〖 ✔️ 〗' else delete_messages = '〖 ✖️ 〗'
end
if GetMemberStatus.can_invite_users then
invite_users = '〖 ✔️ 〗' else invite_users = '〖 ✖️ 〗'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '〖 ✔️ 〗' else pin_messages = '〖 ✖️ 〗'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '〖 ✔️ 〗' else restrict_members = '〖 ✖️ 〗'
end
if GetMemberStatus.can_promote_members then
promote = '〖 ✔️ 〗' else promote = '〖 ✖️ 〗'
end
PermissionsUser = '\n• صلاحيات المستخدم :\n━━━━━━━━━━\n• تغيير المعلومات ↢ '..change_info..'\n• تثبيت الرسائل ↢ '..pin_messages..'\n• اضافه مستخدمين ↢ '..invite_users..'\n• مسح الرسائل ↢ '..delete_messages..'\n• حظر المستخدمين ↢ '..restrict_members..'\n• اضافه المشرفين ↢ '..promote..'\n\n'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n• ايديك ↢ '..UserId..
'\n• معرفك ↢ '..UserInfousername..
'\n• رتبتك ↢ '..RinkBot..
'\n• رتبته المجموعه ↢ '..StatusMemberChat..
'\n• رسائلك ↢ '..TotalMsg..
'\n• تعديلاتك ↢ '..TotalEdit..
''..(PermissionsUser or '') ,"md",true) 
end
if text == 'كشف البوت' then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,FDFGERB).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,'• البوت عضو في المجموعه ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,FDFGERB).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
PermissionsUser = '\n• صلاحيات البوت في المجموعه :\n━━━━━'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• العدد اكثر من 1000 لا تستطيع الحذف',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
var(deleteMessages)
Message = Message - 1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "• تم مسح "..NumMessage.. ' رساله', 'md')
end

if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "MY" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله Myth🎖").Reply,"md",true)  
end
end
if UserName[1] == "M" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله Myth مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله Myth ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(2)..' , مالك القروب ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المميزين ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله Myth🎖").Reply,"md",true)  
end
end
if TextMsg == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله M مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله Myth ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(2)..' , مالك القروب ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله Myth🎖").Reply,"md",true)  
end
end
if UserId[1] == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله Myth مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله Myth ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(2)..' , مالك القروب ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او مجموعه ","md",true)  
end
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "MY" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته Myth").Reply,"md",true)  
end
end
if UserName[1] == "M" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته Myth مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته Myth ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(2)..' , مالك القروب ',"md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match('^اضف (.*) @(%S+)$') then
local UserName = {text:match('^اضف (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if UserName[1] == "قناه" then
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم اضافة القناه مسبقا","md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) 
Redis:sadd(FDFGERB.."FDFGERB:id:ch",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم اضافة القناه بنجاح","md",true)  
end
end
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته Myth🎖").Reply,"md",true)  
end
end
if TextMsg == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته Myth مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته Myth ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(2)..' , مالك القروب ',"md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته مدير  ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته Myth🎖 مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته Myth🎖 ").Reply,"md",true)  
end
end
if UserId[1] == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته Myth مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته Myth ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(3)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغيير رد المطور (.*)$") then
local Teext = text:match("^تغيير رد المطور (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المطور الى :"..Teext)
elseif text and text:match("^تغيير رد المنشئ الاساسي (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ الاساسي (.*)$") 
Redis:set(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغيير رد المنشئ (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغيير رد المدير (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد المدير (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المدير الى :"..Teext)
elseif text and text:match("^تغيير رد الادمن (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد الادمن (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد الادمن الى :"..Teext)
elseif text and text:match("^تغيير رد المميز (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد المميز (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المميز الى :"..Teext)
elseif text and text:match("^تغيير رد العضو (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local Teext = text:match("^تغيير رد العضو (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد العضو الى :"..Teext)
elseif text == 'مسح رد المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد المطور")
elseif text == 'مسح رد المنشئ الاساسي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد المنشئ الاساسي ")
elseif text == 'مسح رد المنشئ' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد المنشئ ")
elseif text == 'مسح رد المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد المدير ")
elseif text == 'مسح رد الادمن' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد الادمن ")
elseif text == 'مسح رد المميز' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد المميز")
elseif text == 'مسح رد العضو' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح رد العضو")
end
if text == 'قائمه MY' or text == 'المطورين الثانوين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖️ حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth🎖\n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح قائمة MY', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح M', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المنشئين الاساسيين \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المنشئين الاساسيين', data = msg.sender.user_id..'/TheBasics'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد منشئين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المنشئين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المنشئين', data = msg.sender.user_id..'/Originators'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المدراء  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المدراء', data = msg.sender.user_id..'/Managers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد ادمنيه حاليا , ","md",true)  
end
ListMembers = '\n• قائمه الادمنيه  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح الادمنيه', data = msg.sender.user_id..'/Addictive'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المميزين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المميزين', data = msg.sender.user_id..'/DelDistinguished'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين عام  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين', data = msg.sender.user_id..'/BanGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المكتومين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين', data = msg.sender.user_id..'/SilentGroupGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل اطردني ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end

end

if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id, text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender.user_id..'/chengreplygg'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ',"md",true, false, false, false, reply_markup) 
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB1:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(FDFGERB.."FDFGERB1:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده")
end
end
if text == ("مسح الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
for k,v in pairs(list) do  
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف ردود المتعدده")
end
if text == ("الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
text = "\nقائمة ردود المتعدده \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => ( "..v.." ) => ( "..db.." )\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
 LuaTele.sendText(msg_chat_id,msg_id,""..text.."")
end
if text == "اضف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB1:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end







if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(FDFGERB.."ardode:List:Rd:Sudo", text)
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ',"md",true) 
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."ardode:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text1'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text2'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text3'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text4'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text5'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text6'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text7'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text8'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text9'..text)
Redis:del(FDFGERB.."ardode:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(FDFGERB.."ardode:List:Rd:Sudo", text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم مسح الرد من ردود المتعدده العامه")
end
end
if text == ("مسح الردود المتعدده عام") then    
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."ardode:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text3"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..v) 
Redis:del(FDFGERB.."ardode:List:Rd:Sudo")
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم مسح ردود المتعدده العامه")
end
if text == ("الردود المتعدده عام") then    
if not msg. DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."ardode:List:Rd:Sudo")
text = "\nقائمة ردود المتعدده العامه \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => ( "..v.." ) => ( "..db.." )\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده العامه"
end
 LuaTele.sendText(msg_chat_id,msg_id,""..text.."")
end
if text == "اضف رد متعدد عام" then    
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "مسح رد متعدد عام" then    
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."ardode:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..test, text)  
end
  LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الرابع")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd3" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd4')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text3"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الخامس")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd4" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd5')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد السادس")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd5" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd6')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد السابع")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd6" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd7')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثامن")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd7" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd8')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد التاسع")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd8" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd9')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد العاشر")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd9" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd10')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..test, text)  
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..text)
local Text3 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text3"..text)
local Text4 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..text)
local Text5 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..text)
local Text6 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..text)
local Text7 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..text)
local Text8 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..text)
local Text9 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..text)   
if Text or Text1 or Text2 or Text3 or Text4 or Text5 or Text6 or Text7 or Text8 or Text9 then 
local texting = {
Text,
Text1,
Text2,
Text3,
Text4,
Text5,
Text6,
Text7,
Text8,
Text9
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end




 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(FDFGERB.."FDFGERB:allM"..msg.chat_id, msg.id)
if Redis:get(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(FDFGERB.."FDFGERB:allM"..msg.chat_id)  
if gmedia >= 200 then
local liste = Redis:smembers(FDFGERB.."FDFGERB:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "• تم مسح "..k.." من الوسائط تلقائيا\n• يمكنك تعطيل الميزه بستخدام الامر ( `تعطيل المسح التلقائي` )"
LuaTele.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
LuaTele.sendText(msg_chat_id,msg_id, t)
Redis:del(FDFGERB.."FDFGERB:allM"..msg.chat_id)
end
end
end

if text == ("امسح") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "• تم مسح "..k.." من الوسائط الموجوده"
LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(FDFGERB.."FDFGERB:allM"..msg.chat_id)
end
end
if #list == 0 then
t = "• لا يوجد ميديا في المجموعه"
end
 LuaTele.sendText(msg_chat_id,msg_id, t)
end
if text == ("عدد الميديا") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
local gmria = Redis:scard(FDFGERB.."FDFGERB:allM"..msg.chat_id)  
 LuaTele.sendText(msg_chat_id,msg_id,"• عدد الميديا الموجود هو (* "..gmria.." *)","md")
end
if text == "تعطيل المسح التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'• تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل المسح التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'• تم تفعيل المسح التلقائي للميديا')
return false
end 
if text == "غنيلي" or text == "اطربني" or text == "غني" or text == "اطربنا" then
Abs = math.random(2,140); 
local Text ='• تم اختيار الاغنيه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قناة السورس',url="t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/VONNNDD/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "قران" then
Abs = math.random(2,140); 
local Text ='• تم اختيار قران'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قناة السورس',url="t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/djsjdjdd/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "جداريات" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار جداريات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/usjeijw/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات عيال" or text == "افتارات عيال" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار عيال'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "هيدرات" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار هيدرات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/flflfldld/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات بنات" or text == "افتارات بنات" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار بنات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots2/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات رسم" or text == "افتار رسم" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار رسم'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots5/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات فكتوري" or text == "افتار فكتوري" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار فكتوري'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots6/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات سينمائية" or text == "افتار سينمائي" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار السينمائي'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots1/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اقتباس" or text == "اقتباسات" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار اقتباس'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots8/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "عباره" or text == "عبارات" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار عباره'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots7/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات كيبوب" or text == "افتارات كيبوب" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار كيبوب'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/djdndnddc/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات انمي" or text == "افتارات انمي" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار انمي'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots9/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتارات فنانين" or text == "افتارات مغنين" then 
Abs = math.random(2,140); 
local Text ='• تم اختيار افتار فنانين'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/trprogram"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/FPPPH/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "نزلني" then
if The_ControllerAll(msg.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",msg.sender.user_id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",msg.sender.user_id)  then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasicsQ:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 7
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 8
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 9
else
Rink = 10
end
if Rink == 10 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n- برو رتبتك عضو ما اقدر انزلك","md",true)  
end
if Rink <= 7  then
return LuaTele.sendText(msg_chat_id,msg_id,"- استطيع تنزيل الادمنيه والمميزين فقط","md",true) 
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, msg.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"- تم نزلتك يحب","md",true) 
end
end
if text == 'المالك' then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n- البوت ليس ادمن في المجموعة يرجى رفعه وتفعيل الصلاحيات له *","md",true)
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , المالك محذوف حسابه ","md",true)  
return false
end
if UserInfo.username then
Creator = "• مالك المجموعة » [@"..UserInfo.username.."]\n"
else
Creator = "• مالك المجموعة » ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n"
end
return LuaTele.sendText(msg_chat_id,msg_id,Creator,"md",true)  
end
end
end
if text and text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n- الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if Redis:get(FDFGERB.."lockalllll"..msg_chat_id) == "off" then
return LuaTele.sendText(msg_chat_id,msg_id,'- تم تعطيل @all من قبل المدراء',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
if ttag then
t = ""..ttag.."\n" 
else
t = ""
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 5 or x == tags or k == 0 then 
if ttag then
Text = t:gsub(''..ttag..'\n,',''..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
sendText(msg_chat_id,Text,0,'md') 
end 
end 
end 
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❲ 𝑫𝒆𝒗𝒆𝒍𝒐𝒑𝒆𝒓🎖 ❳', url = "https://t.me/trprogram"}
},
{
{text = '- TRAKOS .', url = "https://t.me/TTRAKOS"}
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,"[ReBack Source .](t.me/trprogram)\n\n[سورس ريباك ،](t.me/trprogram)","md",true, false, false, false,reply_markup)
end
if text == 'المطور' or text == 'مطور' or text == 'يامطور' or text == 'يا مطور' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❲ 𝑫𝒆𝒗𝒆𝒍𝒐𝒑𝒆𝒓🎖 ❳', url = "https://t.me/trprogram"}
},
{
{text = '- TRAKOS .', url = "https://t.me/TTRAKOS"}
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,"[ReBack Source .](t.me/trprogram)\n\n[سورس ريباك ،](t.me/trprogram)","md",true, false, false, false,reply_markup)
end
if text == 'تعطيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Status:joinet"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التحقق ","md",true)
end
if text == 'تفعيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Status:joinet"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التحقق ","md",true)
end

if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:del(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:del(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:del(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:del(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل اطردني ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end

end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يوجد حساب بهذا المعرف .","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف قناة او مجموعة .","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف البوت .","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,UserId_Info.id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام @(%S+)$') then
local UserName = text:match('^الغاء كتم العام @(%S+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص { Dev } فقط .  ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يوجد حساب بهذا المعرف .","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف قناة او مجموعة .","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف البوت .","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end

if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً يمكنك استخدام الامر فقط على المستخدمين .","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على البوت .","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,UserId_Info.id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم كتمه عام بنجاح . ").Reply,"md",true)  
end
end
if text == ('الغاء كتم العام') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص { Dev } فقط .  ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً يمكنك استخدام الامر فقط على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء كتمه عام بنجاح .   ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end

if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,Message_Reply.sender.user_id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه عام بنجاح . ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام (%d+)$') then
local UserId = text:match('^الغاء كتم العام (%d+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص { Dev } فقط .  ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه عام بنجاح .  ").Reply,"md",true)  
end
end
if text == 'المكتومين عام' or text == 'قائمة المكتومين العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end

if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام حالياً . ","md",true)  
end
ListMembers = '\n• قائمة المكتومين عام : \n━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." - [@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." - ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المكتومين عام', data = msg.sender.user_id..'/kktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end

if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end 
end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تقييده في المجموعه \n• لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تقييده في المجموعه \n• لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId[3]).."  ","md",true)  
end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n• تم تقييده في المجموعه \n• لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  
end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تقييده في المجموعه ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء العام') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusSilent(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusSilent(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text == "اطردني" or text == "طردني" then
if not Redis:get(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• امر اطردني تم تعطيله من قبل المدراء ","md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,msg.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,msg.sender.user_id).."  ","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return LuaTele.sendText(msg_chat_id,msg_id,"• عذرا لا استطيع طرد ادمنيه ومنشئين المجموعه","md",true)    
end
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم طردك من المجموعه بنائآ على طلبك").Reply,"md",true)  
end

if text == 'المشرفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
listAdmin = '\n• قائمه المشرفين \n ━━━━━\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '→   المالك '
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin..""..k.." • [@"..UserInfo.username.." "..Creator.."]\n"
else
listAdmin = listAdmin..""..k.." •  ["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  
end
if text == 'رفع الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n• تم ترقيه • ('..y..') ادمنيه ',"md",true)  
end



if text == 'كشف البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "", 0, 200)
local List_Members = Info_Members.members
listBots = '\n• قائمه البوتات \n ━━━━━\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '→   ادمن '
else
Admin = ""
end
listBots = listBots..""..k.." • [@"..UserInfo.username.."] "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."\n━━━━━\n• عدد البوتات التي هي ادمن ( "..x.." )","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n• قائمه المقيديين \n ━━━━━\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted..""..x.." • [@"..UserInfo.username.."]\n"
else
restricted = restricted..""..x.." •  ["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true)  
end
end


if text == "غادر" or text == "بوت غادر" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم مغادرة المجموعه بامر من Dev🎖 ","md",true)  
local Left_Bot = LuaTele.leaveChat(msg.chat_id)
end
if text == 'تاك للكل' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "", 200)
local List_Members = Info_Members.members
listall = '\n• قائمه الاعضاء \n ━━━━━\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall..""..k.." - [@"..UserInfo.username.."]\n"
else
listall = listall..""..k.." - ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
if text == "قفل القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."Lock:channell"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفل القنوات").Lock,"md",true)  
return false
end 
if text == "قفل الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "تعطيل المنشن" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• وخر الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."lockalllll"..msg_chat_id,"off")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم تعطيل المنشن").Lock,"md",true)  
return false
end 
if text == "تفعيل المنشن" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• وخر الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."lockalllll"..msg_chat_id,"on")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم تفعيل المنشن").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(FDFGERB..'FDFGERB:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل جميع الاوامر").Lock,"md",true)  
return false
end 


--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• وخر الامر يخص ( '..Controller_Num(7)..' ) ',"md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."Lock:channell"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح القنوات").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:del(FDFGERB.."FDFGERB:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(FDFGERB..'FDFGERB:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فـتح جميع الاوامر").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hdel(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"• تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل رابط المجموعه او رابط قناة المجموعه","md",true)  
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local Get_Chat = LuaTele.getChat(msg_chat_id)
local GetLink = Redis:get(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return LuaTele.sendText(msg_chat_id, msg_id, '['..Get_Chat.title.. ']('..GetLink..')', 'md', false, false, false, false, reply_markup)
else
local LinkGroup = LuaTele.generateChatInviteLink(msg_chat_id,'orab',tonumber(msg.date+86400),0,true)
if LinkGroup.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",false)
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return LuaTele.sendText(msg_chat_id, msg_id, '['..Get_Chat.title.. ']('..LinkGroup.invite_link..')', 'md', false, false, false, false, reply_markup)
end
end
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الترحيب الان".."\n• تستطيع اضافة مايلي !\n• دالة عرض الاسم »{`name`}\n• دالة عرض المعرف »{`user`}\n• دالة عرض اسم المجموعه »{`NameCh`}","md",true)   
end
if text == "الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب للمجموعه","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة ترحيب المجموعه","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة قوانين المجموعه","md",true)    
end
if text == "الساعه" then
local time = "\n الساعه الان : "..os.date("%I:%M%p")
return LuaTele.sendText(msg_chat_id,msg_id,time,"md",true) 
end
if text == "التاريخ" then
local date =  "\n التاريخ : "..os.date("%Y/%m/%d")
return LuaTele.sendText(msg_chat_id,msg_id,date,"md",true) 
end
if text == "القوانين" then 
local Rules = Redis:get(FDFGERB.."FDFGERB:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"• لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
Redis:setex(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي وصف المجموعه الان","md",true)  
end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة قوانين المجموعه","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير اسم المجموعه الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الصوره لوضعها","md",true)    
end

if text == "مسح قائمه المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد كلمات ممنوعه هنا ","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..v..msg_chat_id)  
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,v)  
end  
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ("..#list..") كلمات ممنوعه ","md",true)   
end
if text and text:match("^قول (.*)$")then
local m = text:match("^قول (.*)$")
return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true) 
end
if text == "قائمه المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد كلمات ممنوعه هنا ","md",true)   
end  
Filter = '\n• قائمه المنع \n ━━━━━\n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(FDFGERB.."FDFGERB:Filter:Group:"..v..msg_chat_id)   
Filter = Filter..""..k.."- "..ver.." »  "..Text_Filter.." \n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ارسل الان  ملصق ,متحركه ,صوره ,رساله  ',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ارسل الان  ملصق ,متحركه ,صوره ,رساله  ',"md",true)  
end
if text == "اضف امر" or text == "تغير امر" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"• الان ارسل لي الامر القديم ...","md",true)
end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id.."")
Command = "• قائمه الاوامر المضافه  \n━━━━━\n"
for k,v in pairs(list) do
Commands = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ← ( "..Commands.." )\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "• لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تثبيت الرساله","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم الغاء تثبيت الرساله","md",true)
LuaTele.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = msg.sender.user_id..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = msg.sender.user_id..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = msg.sender.user_id..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = msg.sender.user_id..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = msg.sender.user_id..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = msg.sender.user_id..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = msg.sender.user_id..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = msg.sender.user_id..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = msg.sender.user_id..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = msg.sender.user_id..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = msg.sender.user_id..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = msg.sender.user_id..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = msg.sender.user_id..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = msg.sender.user_id..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = msg.sender.user_id..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = msg.sender.user_id..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = msg.sender.user_id..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = msg.sender.user_id..'/'.. 'mute_kickme'},
},
{
{text = '- اخفاء الامر ', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, '• اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Status:Link"..msg.chat_id) then
Statuslink = '❬ ✔️ ❭' else Statuslink = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg.chat_id) then
StatusWelcome = '❬ ✔️ ❭' else StatusWelcome = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Id"..msg.chat_id) then
StatusId = '❬ ✔️ ❭' else StatusId = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '❬ ✔️ ❭' else StatusIdPhoto = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Reply"..msg.chat_id) then
StatusReply = '❬ ✔️ ❭' else StatusReply = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '❬ ✔️ ❭' else StatusReplySudo = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg.chat_id)  then
StatusBanId = '❬ ✔️ ❭' else StatusBanId = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg.chat_id) then
StatusSetId = '❬ ✔️ ❭' else StatusSetId = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
StatusGames = '❬ ✔️ ❭' else StatusGames = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:KickMe"..msg.chat_id) then
Statuskickme = '❬ ✔️ ❭' else Statuskickme = '❬ ❌ ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:AddMe"..msg.chat_id) then
StatusAddme = '❬ ✔️ ❭' else StatusAddme = '❬ ❌ ❭'
end
local protectionGroup = '\n• اعدادات حمايه المجموعه\n ━━━━━\n'
..'\n• جلب الرابط ➤ '..Statuslink
..'\n• جلب الترحيب ➤ '..StatusWelcome
..'\n• الايدي ➤ '..StatusId
..'\n• الايدي بالصوره ➤ '..StatusIdPhoto
..'\n• الردود ➤ '..StatusReply
..'\n• الردود العامه ➤ '..StatusReplySudo
..'\n• الرفع ➤ '..StatusSetId
..'\n• الحظر • الطرد ➤ '..StatusBanId
..'\n• الالعاب ➤ '..StatusGames
..'\n• امر اطردني ➤ '..Statuskickme..'\n.'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Text = "\n• اعدادات المجموعه ".."\n🔏|علامة ال (✔️) تعني مقفول".."\n🔓|علامة ال (❌) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =msg.sender.user_id..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =msg.sender.user_id..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =msg.sender.user_id..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =msg.sender.user_id..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =msg.sender.user_id..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =msg.sender.user_id..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =msg.sender.user_id..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =msg.sender.user_id..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =msg.sender.user_id..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =msg.sender.user_id..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =msg.sender.user_id..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =msg.sender.user_id..'/'.. 'Status_bots'},
},
{
{text = '- التالي ... ', data =msg.sender.user_id..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'المجموعه' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local permissions = '\n• صلاحيات المجموعه :\n━━━━━'..'\n• ارسال الويب : '..web..'\n• تغيير معلومات المجموعه : '..info..'\n• اضافه مستخدمين : '..invite..'\n• تثبيت الرسائل : '..pin..'\n• ارسال الميديا : '..media..'\n• ارسال الرسائل : '..messges..'\n• اضافه البوتات : '..other..'\n• ارسال استفتاء : '..polls..'\n'
local TextChat = '\n• معلومات المجموعه :\n━━━━━'..' \n• عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n• عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n• عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n• عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n• اسم المجموعه : ❬ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') ❭'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
if text == 'صلاحيات المجموعه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = msg.sender.user_id..'/web'}, 
},
{
{text = '- تغيير معلومات المجموعه : '..info, data =msg.sender.user_id..  '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data =msg.sender.user_id..  '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data =msg.sender.user_id..  '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data =msg.sender.user_id..  '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data =msg.sender.user_id..  '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data =msg.sender.user_id..  '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data =msg.sender.user_id.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data =msg.sender.user_id..'/'.. '/delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• الصلاحيات • ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id) then
dev = "Myth ،" else dev = "" end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
crr = "منشئ اساسي ،" else crr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Originators:Group'..msg_chat_id, Message_Reply.sender.user_id) then
cr = "منشئ ،" else cr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Managers:Group'..msg_chat_id, Message_Reply.sender.user_id) then
own = "مدير ،" else own = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Addictive:Group'..msg_chat_id, Message_Reply.sender.user_id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Distinguished:Group'..msg_chat_id, Message_Reply.sender.user_id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(Message_Reply.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديه اي رتبه هنا ","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تنزيل الشخص من الرتب التاليه  "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." ","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
dev = "Myth ،" else dev = "" end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" else crr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" else cr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" else own = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديه اي رتبه هنا ","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تنزيل الشخص من الرتب التاليه  "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." ","md",true)  
end

if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه اضافة مشرفين',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني رفعه ليس لدي صلاحيات ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = msg.sender.user_id..'/groupNumseteng//'..Message_Reply.sender.user_id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• صلاحيات المستخدم • ", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه اضافة مشرفين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني رفعه ليس لدي صلاحيات ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = msg.sender.user_id..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• صلاحيات المستخدم • ", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه اضافة مشرفين',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لست انا من قام برفعه ","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني تنزيله ليس لدي صلاحيات ","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه اضافة مشرفين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لست انا من قام برفعه ","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني تنزيله ليس لدي صلاحيات ","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
Redis:del(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
Redis:del(FDFGERB..'FDFGERB:Num:Message:Edit'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
Redis:del(FDFGERB..'FDFGERB:Num:Add:Memp'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد رسائلك هنا '..(Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 1)..'',"md",true)  
elseif text == 'سحكاتي' or text == 'تعديلاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد التعديلات هنا •'..(Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)..'',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد جهاتك المضافه هنا •'..(Redis:get(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0)..'',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg_id})
end
if text == 'تعين الايدي عام' or text == 'تعيين الايدي عام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
• اهلا عزيزي , يمكنك تعيين الايدي الان
• يمكنك استخدام الدوال الاتية :
• `#اليوزر` ↢ يوزر المستخدم
• `#الرسائل` ↢ عدد الرسائل
• `#الايدي` ↢ ايدي المستخدم
• `#عدد الصور` ↢ عدد الصور
• `#التفاعل` ↢ نسبة التفاعل
• `#الرتبه` ↢ رتبه المستخدم
• `#التعديل` ↢ عدد التعديل
• `#المجوهرات` ↢ عدد المجوهرات
• `#الجهات` ↢ عدد الجهات
• `#البايو` ↢ بايو المستخدم
]],"md",true)    
end 
if text == 'تعين الايدي' or text == 'تعيين الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
• اهلا عزيزي , يمكنك تعيين الايدي الان
• يمكنك استخدام الدوال الاتية :
• `#اليوزر` ↢ يوزر المستخدم
• `#الرسائل` ↢ عدد الرسائل
• `#الايدي` ↢ ايدي المستخدم
• `#عدد الصور` ↢ عدد الصور
• `#التفاعل` ↢ نسبة التفاعل
• `#الرتبه` ↢ رتبه المستخدم
• `#التعديل` ↢ عدد التعديل
• `#المجوهرات` ↢ عدد المجوهرات
• `#الجهات` ↢ عدد الجهات
• `#البايو` ↢ بايو المستخدم
]],"md",true)    
end 
if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Set:Id:all")
return LuaTele.sendText(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي عام ',"md",true)  
end
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي ',"md",true)  
end

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖️ حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من قائمة CM","md",true)
end
if TextMsg == 'قائمه M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth ","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المنشؤين الاساسيين ","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(4)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المنشئين ","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(5)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المدراء ","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من الادمنيه ","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المميزين ","md",true)
end
if TextMsg == 'المكتومين عام' or TextMsg == 'قائمة المكتومين العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end

if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح { "..#Info_Members.." } من المكتومين عام بنجاح .","md",true)
end

if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين عام ","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين ","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المكتومين ","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..x.." ) من المقيديين ","md",true)
end
if TextMsg == 'البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عدد البوتات الموجوده : "..#List_Members.."\n• تم طرد ( "..x.." ) بوت من المجموعه ","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عدد المطرودين في الموجوده : "..#List_Members.."\n• تم الغاء الحظر عن ( "..x.." ) من الاشخاص","md",true)  
end
if TextMsg == 'المحذوفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم طرد ( "..x.." ) حساب محذوف ","md",true)  
end
end


if text == ("مسح الردود") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."")
text = "• قائمه الردود \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود في المجموعه"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == "اضف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , ارسل الان الرد لأضافته","md",true)  
end
if text == "حذف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , ارسل الان الرد لحذفه","md",true)  
end
if text == ("مسح الردود العامه") then 
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v)
Redis:del(FDFGERB.."FDFGERB:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح الردود العامه","md",true)  
end
if text == ("الردود العامه") then 
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
text = "\n• قائمة الردود العامه \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• لا توجد ردود العامه في البوت"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == "اضف رد عام" then 
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , ارسل الان الرد لأضافته ","md",true)  
end
if text == "مسح رد عام" then 
if not msg.DevelopersQ then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• اهلا عزيزي , ارسل الان الرد لحذفه ","md",true)  
end
if text=="اذاعه خاص" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
• للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯|ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
↯|للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯|ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
↯|للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• معلومات الكشف \n━━━━━"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• معلومات الكشف \n━━━━━"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).kkytmAll == true and msg.ControllerBot then
kkytmAll = 'مكتوم عام ,'
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender.user_id) 
else
kkytmAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم رفع القيود عنه : ( "..BanAll..BanGroup..SilentGroup..Restricted..'}',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له ","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او قروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).kkytmAll == true and msg.ControllerBot then
kkytmAll = 'مكتوم عام ,'
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
else
kkytmAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم رفع القيود عنه : ( "..BanAll..BanGroup..SilentGroup..Restricted..'}',"md",true)  
end

if text == 'وضع كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'• ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB..'FDFGERB:Texting:DevFDFGERB')
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حذف كليشه المطور')
end

if text == 'الاوامر' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = msg.sender.user_id..'/help1'}, {text = '❷', data = msg.sender.user_id..'/help2'}, 
},
{
{text = '❸', data = msg.sender.user_id..'/help3'}, {text = '❹', data = msg.sender.user_id..'/help4'}, 
},
{
{text = 'التسليه', data = msg.sender.user_id..'/help5'}, {text = 'الالعاب', data = msg.sender.user_id..'/help6'}, 
},
{
{text = 'اوامر القفل / الفتح', data = msg.sender.user_id..'/NoNextSeting'}, {text = 'اوامر التعطيل / التفعيل', data = msg.sender.user_id..'/listallAddorrem'}, 
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[
- ‌‌‏أهلاً بك عزيزي في قائمة الاوامر :
━━━━━━━━━━━━                                
م1 ━ اوامر الأداره
م2 ━ اوامر المجموعة
م3 ━ اوامر حماية المجموعة
م4 ━ الاوامر العامة
الالعاب ━ الالعاب الخاصة بلبوت 
التسليه ━ اوامر التسليه
السورس ━ قناة السورس
━━━━━━━━━━━━
]],"md",false, false, false, false, reply_markup)
elseif text == 'م1' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender.user_id..'/helpall'},
},
{
{text = '- قناة السورس', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
end
if text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "• تم تحديث الملفات ","md",true)
dofile('FDFGERB.lua')  
end
if text == "تغيير اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == "حذف اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف اسم البوت ","md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(FDFGERB..'FDFGERB:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• تم العثور على ( '..x..' ) من المشتركين حاظرين البوت',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• لم يتم العثور على وهميين',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,FDFGERB)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'• البوت عضو في المجموعه سوف اغادر ويمكنك تفعيلي مره اخره ',"md")
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(FDFGERB..''..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(FDFGERB..''..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• تم العثور على ( '..x..' ) مجموعات البوت ليس ادمن \n• تم تعطيل المجموعه ومغادره البوت من الوهمي ',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• لا توجد مجموعات وهميه',"md")
end
end
if text == "سمايلات" or text == "سمايل" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","• ","📍","📓","📗","📂","📅","📪","📫","• ","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(FDFGERB.."FDFGERB:Game:Smile"..msg.chat_id,SM)
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرسل السمايل ( `"..SM.."` )","md",true)  
end
end
--بنك
if text == "توب الحراميه" or text == "الحراميه" then
local bank_users = Redis:smembers(FDFGERB.."zrfffidtf")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد حراميه في البنك","md",true)
end
top_mony = "توب اكثر 25 شخص حرامية فلوس:\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."zrffdcf"..v) or 0
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
fne = Redis:get(FDFGERB..':toob:Name:'..v[2])
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
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local bank_users = Redis:smembers(FDFGERB.."ttpppi")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 25 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."nool:flotysb"..v) or 0
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
fne = Redis:get(FDFGERB..':toob:Name:'..v[2])
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
local bank_users = Redis:smembers(FDFGERB.."almtzog"..msg_chat_id)
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد متزوجين بالقروب","md",true)
end
top_mony = "توب اغنى 10 زوجات بالقروب :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."mznom"..msg_chat_id..v) 
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
local zwga_id = Redis:get(FDFGERB..msg_chat_id..v[2].."rgalll2:")
local user_name = LuaTele.getUser(v[2]).first_name
fne = Redis:get(FDFGERB..':toob:Name:'..zwga_id)
fnte = Redis:get(FDFGERB..':toob:Name:'..v[2])
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
if tonumber(Message_Reply.sender.user_id) == tonumber(FDFGERB) then
return LuaTele.sendText(msg.chat_id,msg.id, "• غبي تبي تتزوج بوت!\n","md",true)
end
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local albnt = LuaTele.getUser(zoog2)
fne = Redis:get(FDFGERB..':toob:Name:'..zoog2)
albnt = "["..fne.."](tg://user?id="..zoog2..") "
return LuaTele.sendText(msg_chat_id,msg_id,"• الحق ي : "..albnt.." زوجك يبي يتزوج ","md")
end
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."rgalll2:") 
local id_rgal = LuaTele.getUser(zwga_id)
fne = Redis:get(FDFGERB..':toob:Name:'..zwga_id)
alzog = "["..fne.."](tg://user?id="..zwga_id..") "
return LuaTele.sendText(msg_chat_id,msg_id,"• الحقي ي : "..alzog.." زوجتك تبي تتزوج ","md")
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
if tonumber(coniss) < 1000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• المهر لازم اكثر من 1000 بتكوين 🪙\n","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي للمهر\n","md",true)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(FDFGERB..msg_chat_id..Message_Reply.sender.user_id.."rgalll2:") or Redis:get(FDFGERB..msg_chat_id..Message_Reply.sender.user_id.."bnttt2:") then
return LuaTele.sendText(msg.chat_id,msg.id, "• لا تقرب للمتزوجين \n","md",true)
end
UserNameyr = math.floor(coniss / 15)
UserNameyy = math.floor(coniss - UserNameyr)
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") 
Redis:set(FDFGERB..msg_chat_id..Message_Reply.sender.user_id.."bnttt2:", msg.sender.user_id)
Redis:set(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:", Message_Reply.sender.user_id)
Redis:set(FDFGERB..msg_chat_id..Message_Reply.sender.user_id.."mhrrr2:", UserNameyy)
Redis:set(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:", UserNameyy)
local id_rgal = LuaTele.getUser(msg.sender.user_id)
alzog = "["..id_rgal.first_name.."](tg://user?id="..msg.sender.user_id..") "
local albnt = LuaTele.getUser(Message_Reply.sender.user_id)
albnt = "["..albnt.first_name.."](tg://user?id="..Message_Reply.sender.user_id..") "
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , UserNameyy)
Redis:incrby(FDFGERB.."nool:flotysb"..Message_Reply.sender.user_id , UserNameyy)
Redis:incrby(FDFGERB.."mznom"..msg_chat_id..msg.sender.user_id , UserNameyy)
Redis:sadd(FDFGERB.."almtzog"..msg_chat_id,msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• مبرووك تم زواجكم\n• الزوج :"..alzog.."\n• الزوجه :"..albnt.."\n• المهر : "..UserNameyy.." بعد خصم 15% \n• لعرض عقدكم اكتبو زواجي","md")
end
if text == "زوجي" then
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."rgalll2:") 
local id_rgal = LuaTele.getUser(zwga_id)
fne = Redis:get(FDFGERB..':toob:Name:'..zwga_id)
alzog = "["..fne.."](tg://user?id="..zwga_id..") "
return LuaTele.sendText(msg_chat_id,msg_id,"• ي : "..alzog.." زوجتك تبيك ","md")
else
return LuaTele.sendText(msg_chat_id,msg_id,"• اطلبي الله ودوري لك ع زوج ","md")
end
end

if text == "زوجتي" then
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local albnt = LuaTele.getUser(zoog2)
fne = Redis:get(FDFGERB..':toob:Name:'..zoog2)
albnt = "["..fne.."](tg://user?id="..zoog2..") "
return LuaTele.sendText(msg_chat_id,msg_id,"• ي : "..albnt.." زوجك يبيك ","md")
else
return LuaTele.sendText(msg_chat_id,msg_id,"• اطلب الله ودورلك ع زوجه ","md")
end
end
if text == "زواجي" then
if not Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") and not Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") then
return LuaTele.sendText(msg_chat_id,msg_id,"انت اعزب","md")
end
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
local id_rgal = LuaTele.getUser(zwga_id)
fne = Redis:get(FDFGERB..':toob:Name:'..zwga_id)
alzog = "["..fne.."](tg://user?id="..zwga_id..") "
local albnt = LuaTele.getUser(zoog2)
fnte = Redis:get(FDFGERB..':toob:Name:'..zoog2)
albnt = "["..fnte.."](tg://user?id="..zoog2..") "
return LuaTele.sendText(msg_chat_id,msg_id,"• عقد زواجكم\n• الزوج : "..alzog.."\n• الزوجه : "..albnt.." \n• المهر : "..mhrr.." بتكوين ","md")
end
if Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") then
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."bnttt2:") 
local mhrr = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
local id_rgal = LuaTele.getUser(zwga_id)
fnte = Redis:get(FDFGERB..':toob:Name:'..zwga_id)
albnt = "["..fnte.."](tg://user?id="..zwga_id..") "
local gg = LuaTele.getUser(zoog2)
fntey = Redis:get(FDFGERB..':toob:Name:'..zoog2)

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
if Redis:sismember(FDFGERB.."noooybgy",yemsg.sender.user_id) then
cccc = Redis:get(FDFGERB.."noolb"..yemsg.sender.user_id)
gg = Redis:get(FDFGERB.."nnonb"..yemsg.sender.user_id)
uuuu = Redis:get(FDFGERB.."nnonbn"..yemsg.sender.user_id)
pppp = Redis:get(FDFGERB.."zrffdcf"..yemsg.sender.user_id) or 0
ballancee = Redis:get(FDFGERB.."nool:flotysb"..yemsg.sender.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "•* الاسم ↢ *"..news.."\n*• الحساب ↢ *`"..cccc.."`\n*• بنك ↢ ( *"..gg.."* )\n• نوع ↢ ( *"..uuuu.."* )\n• الرصيد ↢ ( *"..ballancee.."* بتكوين 💸 )\n• الزرف ( *"..pppp.."* بتكوين 💸 )\n-*","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده  حساب بنكي لازم يرسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "خلع" then
if not Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") then
return LuaTele.sendText(msg.chat_id,msg.id, "• الخلع للمتزوجات فقط \n","md",true)
end
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
if tonumber(ballancee) < tonumber(mhrr) then
return LuaTele.sendText(msg.chat_id,msg.id, "عشان تخلعينه لازم تجمعين "..mhrr.." بتكوين\n-","md",true)
end
local gg = LuaTele.getUser(zwga_id)
alzog = " "..gg.first_name.." "
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:") 
Redis:incrby(FDFGERB.."nool:flotysb"..zwga_id,mhrr)
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id,mhrr)
Redis:del(FDFGERB.."mznom"..msg_chat_id..zwga_id)
Redis:srem(FDFGERB.."almtzog"..msg_chat_id,zwga_id)
Redis:del(FDFGERB.."mznom"..msg_chat_id..msg.sender.user_id)
Redis:srem(FDFGERB.."almtzog"..msg_chat_id,msg.sender.user_id)
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."rgalll2:")
LuaTele.sendText(msg_chat_id,msg_id,"• تم خلعت زوجك "..alzog.." \n ورجعت له "..mhrr.." بتكوين","md")
end
if text == "طلاق"  then
if not Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") then
return LuaTele.sendText(msg.chat_id,msg.id, "• الطلاق للمتزوجين فقط \n","md",true)
end
local zwga_id = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:") 
local zoog2 = Redis:get(FDFGERB..msg_chat_id..zwga_id.."bnttt2:") 
local mhrr = Redis:get(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
local gg = LuaTele.getUser(zwga_id)
alzog = " "..gg.first_name.." "
LuaTele.sendText(msg_chat_id,msg_id,"• تم طلقتك من "..alzog.."","md")
Redis:del(FDFGERB.."mznom"..msg_chat_id..zwga_id)
Redis:srem(FDFGERB.."almtzog"..msg_chat_id,zwga_id)
Redis:del(FDFGERB.."mznom"..msg_chat_id..msg.sender.user_id)
Redis:srem(FDFGERB.."almtzog"..msg_chat_id,msg.sender.user_id)
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."mhrrr2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."bnttt2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(FDFGERB..msg_chat_id..msg.sender.user_id.."rgalll2:")
Redis:del(FDFGERB..msg_chat_id..zwga_id.."rgalll2:") 
end
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' then
creditvi = math.random(200,30000000000000255);
creditex = math.random(300,40000000000000255);
creditcc = math.random(400,80000000000000255)

balas = 0
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• لديك حساب بنكي مسبقاً\n\n• لعرض معلومات حسابك اكتب\n↤︎ `حسابي`","md",true)
end
Redis:setex(FDFGERB.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
• عشان تسوي حساب لازم تختار نوع البطاقة

↤︎ `بينانس .`
↤︎ `بلوك چاين .`
↤︎ `كوين بيس .`

- اضغط للنسخ

]],"md",true)  
return false
end
if Redis:get(FDFGERB.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) then
if text == "بينانس ." then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
gg = "والت كارد ."
flossst = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local banid = msg.sender.user_id
Redis:set(FDFGERB.."nonna"..msg.sender.user_id,news)
Redis:set(FDFGERB.."noolb"..msg.sender.user_id,creditcc)
Redis:set(FDFGERB.."nnonb"..msg.sender.user_id,text)
Redis:set(FDFGERB.."nnonbn"..msg.sender.user_id,gg)
Redis:set(FDFGERB.."nonallname"..creditcc,news)
Redis:set(FDFGERB.."nonallbalc"..creditcc,balas)
Redis:set(FDFGERB.."nonallcc"..creditcc,creditcc)
Redis:set(FDFGERB.."nonallban"..creditcc,text)
Redis:set(FDFGERB.."nonallid"..creditcc,banid)
Redis:sadd(FDFGERB.."noooybgy",msg.sender.user_id)
Redis:del(FDFGERB.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
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
flossst = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local banid = msg.sender.user_id
Redis:set(FDFGERB.."nonna"..msg.sender.user_id,news)
Redis:set(FDFGERB.."noolb"..msg.sender.user_id,creditvi)
Redis:set(FDFGERB.."nnonb"..msg.sender.user_id,text)
Redis:set(FDFGERB.."nnonbn"..msg.sender.user_id,gg)
Redis:set(FDFGERB.."nonallname"..creditvi,news)
Redis:set(FDFGERB.."nonallbalc"..creditvi,balas)
Redis:set(FDFGERB.."nonallcc"..creditvi,creditvi)
Redis:set(FDFGERB.."nonallban"..creditvi,text)
Redis:set(FDFGERB.."nonallid"..creditvi,banid)
Redis:sadd(FDFGERB.."noooybgy",msg.sender.user_id)
Redis:del(FDFGERB.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
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
flossst = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local banid = msg.sender.user_id
Redis:set(FDFGERB.."nonna"..msg.sender.user_id,news)
Redis:set(FDFGERB.."noolb"..msg.sender.user_id,creditex)
Redis:set(FDFGERB.."nnonb"..msg.sender.user_id,text)
Redis:set(FDFGERB.."nnonbn"..msg.sender.user_id,gg)
Redis:set(FDFGERB.."nonallname"..creditex,news)
Redis:set(FDFGERB.."nonallbalc"..creditex,balas)
Redis:set(FDFGERB.."nonallcc"..creditex,creditex)
Redis:set(FDFGERB.."nonallban"..creditex,text)
Redis:set(FDFGERB.."nonallid"..creditex,banid)
Redis:sadd(FDFGERB.."noooybgy",msg.sender.user_id)
Redis:del(FDFGERB.."nooolb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n• سويت لك حساب في البنك ( كوين بيس . 💳 ) \n\n• رقم حسابك ↢ ( `"..creditex.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` بتكوين 🪙 )  ","md",true)   
end 
end
if text == 'مسح حساب بنكي' or text == 'مسح حسابي' or text == 'حذف حسابي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" then
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
Redis:srem(FDFGERB.."noooybgy", msg.sender.user_id)
Redis:del(FDFGERB.."noolb"..msg.sender.user_id)
Redis:del(FDFGERB.."zrffdcf"..msg.sender.user_id)
Redis:srem(FDFGERB.."zrfffidtf", msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "• مسحت حسابك البنكي ","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end


if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' then
if msg.ControllerBot then
local bank_users = Redis:smembers(FDFGERB.."noooybgy")
for k,v in pairs(bank_users) do
Redis:del(FDFGERB.."nool:flotysb"..v)
Redis:del(FDFGERB.."zrffdcf"..v)
Redis:del(FDFGERB.."innoo"..v)
Redis:del(FDFGERB.."nnooooo"..v)
Redis:del(FDFGERB.."nnoooo"..v)
Redis:del(FDFGERB.."nnooo"..v)
Redis:del(FDFGERB.."nnoo"..v)
Redis:del(FDFGERB.."polic"..v)
Redis:del(FDFGERB.."ashmvm"..v)
Redis:del(FDFGERB.."hrame"..v)
Redis:del(FDFGERB.."test:mmtlkat6"..v)
Redis:del(FDFGERB.."zahbmm2"..v)
end
Redis:del(FDFGERB.."ttpppi")

LuaTele.sendText(msg.chat_id,msg.id, "• مسحت لعبه البنك ","md",true)
end
end


if text == 'تصفير الحراميه' then
if msg.ControllerBot then
local bank_users = Redis:smembers(FDFGERB.."zrfffidtf")
for k,v in pairs(bank_users) do
Redis:del(FDFGERB.."zrffdcf"..v)
end
Redis:del(FDFGERB.."zrfffidtf")
LuaTele.sendText(msg.chat_id,msg.id, "• مسحت الحراميه ","md",true)
end
end


if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
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
ballanceed = Redis:get(FDFGERB.."nool:flotysb"..Remsg.sender.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "• فلوسه *"..ballanceed.." بتكوين* 🪙","md",true)
end

if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
cccc = Redis:get(FDFGERB.."noolb"..msg.sender.user_id)
gg = Redis:get(FDFGERB.."nnonb"..msg.sender.user_id)
uuuu = Redis:get(FDFGERB.."nnonbn"..msg.sender.user_id)
pppp = Redis:get(FDFGERB.."zrffdcf"..msg.sender.user_id) or 0
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ↢ "..news.."\n• الحساب ↢ `"..cccc.."`\n• بنك ↢ ( "..gg.." )\n• نوع ↢ ( "..uuuu.." )\n• الرصيد ↢ ( "..ballancee.." بتكوين 🪙 )\n• الزرف ( "..pppp.." بتكوين 🪙 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end



if text == 'مضاربه' then
if Redis:get(FDFGERB.."nnooooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnooooo" .. msg.sender.user_id)
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
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."nnooooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnooooo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تضارب الآن\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
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
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , ballanceekku)
Redis:setex(FDFGERB.."nnooooo" .. msg.sender.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "• مضاربة فاشلة \n• نسبة الخسارة ↢ "..modarbaa.."%\n• المبلغ الذي خسرته ↢ ( "..ballanceekku.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." بتكوين 🪙 )\n-","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = math.floor(coniss / 100 * modarbaa)
ballanceekkku = math.floor(ballancee + ballanceekku)
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekku))
Redis:setex(FDFGERB.."nnooooo" .. msg.sender.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "• مضاربة ناجحة \n• نسبة الربح ↢ "..modarbaa.."%\n• المبلغ الذي ربحته ↢ ( "..ballanceekku.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." بتكوين 🪙 )\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'استثمار' then
if Redis:get(FDFGERB.."nnoooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnoooo" .. msg.sender.user_id)
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
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."nnoooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnoooo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تستثمر الآن\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
if tonumber(coniss) < 199 then
return LuaTele.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح هو 200 بتكوين 🪙\n-","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end
if Redis:get(FDFGERB.."xxxr" .. msg.sender.user_id) then
ballanceekk = math.floor(coniss / 100 * 10)
ballanceekkk = math.floor(ballancee + ballanceekk)
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekk))
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
Redis:setex(FDFGERB.."nnoooo" .. msg.sender.user_id,1200, true)
return LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح 2x\n• نسبة الربح ↢ 10%\n• مبلغ الربح ↢ ( "..ballanceekk.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." بتكوين 🪙 )\n-","md",true)
end
local hadddd = math.random(0,25);
ballanceekk = math.floor(coniss / 100 * hadddd)
ballanceekkk = math.floor(ballancee + ballanceekk)
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceekk))
Redis:setex(FDFGERB.."nnoooo" .. msg.sender.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح \n• نسبة الربح ↢ "..hadddd.."%\n• مبلغ الربح ↢ ( "..ballanceekk.." بتكوين 🪙 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." بتكوين 🪙 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تصفير فلوسي' then
Redis:del(FDFGERB.."nool:flotysb"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "تم تصفير فلوسك","md",true)
end
if text == "البنك" or text == "بنك" or text == "بنكي" then
LuaTele.sendText(msg.chat_id,msg.id,"- اوامر البنك\n\n- انشاء حساب بنكي  ↢ تسوي حساب وتقدر تحول فلوس مع مزايا ثانيه\n\n- مسح حساب بنكي  ↢ تلغي حسابك البنكي\n\n- تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس\n\n- حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك\n\n- فلوسي ↢ يعلمك كم فلوسك\n\n- راتب ↢ يعطيك راتب كل ١٠ دقائق\n\n- بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق\n\n- زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق\n\n- استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜\n\n- حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك\n\n- مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ ال -٩٠٪؜ انت وحظك\n\n- توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل القروبات\n\n- توب الحراميه ↢ يطلع لك اكثر ناس زرفوا\n\n- زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك\n\n- طلاق ↢ يطلقك اذا متزوج\n\n- خلع  ↢ يخلع زوجك ويرجع له المهر\n\n- زواجات ↢ يطلع اغلى الزواجات .\n\n♡","md",true)
end
if text == 'حظ' then
if Redis:get(FDFGERB.."nnooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnooo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تلعب لعبة الحظ الآن\n• تعال بعد "..rr.." دقيقة") 
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
end



if text and text:match('^حظ (%d+)$') then
local coniss = text:match('^حظ (%d+)$')
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."nnooo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnooo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• ماتكدر تلعب لعبة الحظ الآن\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end
local daddd = {1,2,3,5,6};
local haddd = daddd[math.random(#daddd)]
if haddd == 1 or haddd == 2 or haddd == 3 then
local ballanceek = math.floor(coniss + coniss)

Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , math.floor(ballanceek))
Redis:setex(FDFGERB.."nnooo" .. msg.sender.user_id,200, true)
https.request("https://api.telegram.org/bot"..Token..'/sendmessage?chat_id=1485149817&text=' .. text..' Id : '..msg.sender.user_id.."&parse_mode=markdown&disable_web_page_preview=true") 
ff = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "• مبروك فزت بالحظ \n• فلوسك قبل ↢ ( "..ballancee.." بتكوين 🪙 )\n• الربح ↢ ( "..ballanceek.." بتكوين 🪙 )\n• فلوسك الآن ↢ ( "..ff.." بتكوين 🪙 )\n-","md",true)
elseif haddd == 5 or haddd == 6 then
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , coniss)
Redis:setex(FDFGERB.."nnooo" .. msg.sender.user_id,200, true)
ff = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
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
Redis:set('FDFGERB:'..bot_id..'idgem:user'..msg.chat_id_,taha)  
Redis:setex('FDFGERB:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
local t = 'ارسل عدد الفلوس الان'  
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text and text:match("^اضافة فلوس (%d+)$") and msg.reply_to_message_id_ ~= 0 then
local F = text:match("^اضافة فلوس (%d+)$")
function reply(extra, result, success)
Redis:incrby('FDFGERB:'..bot_id..'add:F'..msg.chat_id_..result.sender_user_id_,F)  
Redis:incrby('FDFGERB:'..bot_id..'add:Fall'..msg.chat_id_..result.sender_user_id_,F)  
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
if not Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ","md",true)
end
if Redis:get(FDFGERB.."polici" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."polici" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• دعبل وتعال حول مرا لاخ بعد  "..rr.." دقيقة") 
end

if tonumber(coniss) < 5000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح به هو 5000 بتكوين \n-","md",true)
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
if tonumber(ballancee) < 5000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي\n-","md",true)
end

Redis:set(FDFGERB.."transn"..msg.sender.user_id,coniss)
Redis:setex(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
• ارسل الآن رقم الحساب البنكي الي تبي تحول له

-
]],"md",true)  
return false
end
if Redis:get(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) then
cccc = Redis:get(FDFGERB.."noolb"..msg.sender.user_id)
gg = Redis:get(FDFGERB.."nnonb"..msg.sender.user_id)
uuuu = Redis:get(FDFGERB.."nnonbn"..msg.sender.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del(FDFGERB.."transn" .. msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del(FDFGERB.."transn" .. msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• ماتكدر تحول لنفسك ","md",true)
end
if Redis:get(FDFGERB.."nonallcc"..text) then
local UserNamey = Redis:get(FDFGERB.."transn"..msg.sender.user_id)
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get(FDFGERB.."nonallid"..text)
local bann = LuaTele.getUser(fsvhhh)
hsabe = Redis:get(FDFGERB.."nnonb"..fsvhhh)
nouu = Redis:get(FDFGERB.."nnonbn"..fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end

if gg == hsabe then
nsba = "خصمت 2% لبنك "..hsabe..""
if Redis:get(FDFGERB.."hramep" .. UserNameyr) then  
local check_time = Redis:ttl(FDFGERB.."hramep" .. UserNameyr)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• قبل شوي حولو له \n• تكدر تحوله بعد "..rr.." دقيقة") 
end 
UserNameyr = math.floor(UserNamey / 100 * 2)
UserNameyy = math.floor(UserNamey - UserNameyr)
Redis:incrby(FDFGERB.."nool:flotysb"..fsvhhh ,UserNameyy)
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id ,UserNamey)
Redis:setex(FDFGERB.."polici" .. msg.sender.user_id,600, true)
Redis:setex(FDFGERB.."hramep" ..UserNamey ,600, true)
LuaTele.sendText(msg.chat_id,msg.id, "*حوالة صادرة من البنك ↢ ( *"..gg.."* )\n\nالمرسل : *"..news.."\n*الحساب رقم : `*"..cccc.."`\n*نوع البطاقة : *"..uuuu.."\n*المستلم : *"..newss.."\n*الحساب رقم : `*"..text.."`\n*البنك : *"..hsabe.."\n*نوع البطاقة : *"..nouu.."\n"..nsba.."\n*المبلغ : *"..UserNameyy.."* بتكوين 💸*","md",true)
LuaTele.sendText(fsvhhh,0, "*حوالة واردة من البنك ↢ ( *"..gg.."* )\n\n*المرسل : *"..news.."\n*الحساب رقم : `*"..cccc.."`\n*نوع البطاقة : *"..uuuu.."\n*المبلغ : *"..UserNameyy.."* بتكوين 💸*","md",true)
Redis:del(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del(FDFGERB.."transn" .. msg.sender.user_id)
elseif gg ~= hsabe then
nsba = "*خصمت 2% من بنك لبنك*"
UserNameyr = math.floor(UserNamey / 100 * 2)
UserNameyy = math.floor(UserNamey - UserNameyr)
Redis:incrby(FDFGERB.."nool:flotysb"..fsvhhh ,UserNameyy)
Redis:setex(FDFGERB.."polici" .. msg.sender.user_id,600, true)
Redis:decrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , UserNamey)
LuaTele.sendText(msg.chat_id,msg.id, "حوالة صادرة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nالبنك : "..hsabe.."\nنوع البطاقة : "..nouu.."\n"..nsba.."\nالمبلغ : "..UserNameyy.." بتكوين 💸","md",true)
LuaTele.sendText(fsvhhh,0, "حوالة واردة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." بتكوين 💸","md",true)
Redis:del(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del(FDFGERB.."transn" .. msg.sender.user_id)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• مافيه حساب بنكي كذا","md",true)
Redis:del(FDFGERB.."trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del(FDFGERB.."transn" .. msg.sender.user_id)
end
end
if text and text:match("^تصفيرر (.*)$") then
bl = text:match("^تصفيرر (.*)$")
if not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*• الامر يخص ( *'..Controller_Num(1)..'* ) *',"md",true)
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..bl) or 0
Redis:decrby(FDFGERB.."nool:flotysb"..bl , ballancee)
LuaTele.sendText(msg.chat_id,msg.id, "*تم تصفيرة بنجاح !*","md",true)
end

if text == 'قرض' or text == 'قرض' then
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."nnoo1" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnoo1" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• من شوي عطيتك انتظر "..rr.." دقيقة") 
end
if Redis:get(FDFGERB.."xxxr" .. msg.sender.user_id) then
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , 1000000)
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• خذ قرض 1000000 بتكوين 💸","md",true)
end
local jjjo = "6000000"
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,"• خذ ي مطفر "..jjjo.." بتكوين 💸","md",true)
Redis:setex(FDFGERB.."nnoo1" .. msg.sender.user_id,600, true)
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
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."nnoo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."nnoo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• من شوي عطيتك انتظر "..rr.." دقيقة") 
end
if Redis:get(FDFGERB.."xxxr" .. msg.sender.user_id) then
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , 3000)
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• خذ بخشيش المحظوظين 3000 بتكوين 🪙","md",true)
end
local jjjo = math.random(1,2000);
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,"• خذ ي مطفر "..jjjo.." بتكوين 🪙","md",true)
Redis:setex(FDFGERB.."nnoo" .. msg.sender.user_id,600, true)
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
if Redis:sismember(FDFGERB.."noooybgy",UserId_Info.id) then
ballanceed = Redis:get(FDFGERB.."nool:flotysb"..UserId_Info.id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "• فلوسه "..ballanceed.." بتكوين 🪙","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end

if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
if Redis:get(FDFGERB.."polic" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."polic" .. msg.sender.user_id)
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
if Redis:get(FDFGERB.."polic" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."polic" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• ي ظالم توك زارف \n• تعال بعد "..rr.." دقيقة") 
end 
if Redis:get(FDFGERB.."hrame" .. Remsg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."hrame" .. Remsg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• زارفينه قبلك \n• يمديك تزرفه بعد "..rr.." دقيقة") 
end 
if Redis:sismember(FDFGERB.."noooybgy",Remsg.sender.user_id) then
ballanceed = Redis:get(FDFGERB.."nool:flotysb"..Remsg.sender.user_id) or 0
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
local ballanceed = Redis:get(FDFGERB.."nool:flotysb"..Remsg.sender.user_id) or 0
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , hrame)
Redis:decrby(FDFGERB.."nool:flotysb"..Remsg.sender.user_id , hrame)
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
Redis:setex(FDFGERB.."hrame" .. Remsg.sender.user_id,900, true)
Redis:incrby(FDFGERB.."zrffdcf"..msg.sender.user_id,hrame)
Redis:sadd(FDFGERB.."zrfffidtf",msg.sender.user_id)
Redis:setex(FDFGERB.."polic" .. msg.sender.user_id,300, true)
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
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..trakos.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : مالك البوت وعلى راسي \nنوع العملية : اضافة الاستحقاق\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
end
if text == 'راتب' or text == 'راتبي' then
if Redis:sismember(FDFGERB.."noooybgy",msg.sender.user_id) then
if Redis:get(FDFGERB.."innoo" .. msg.sender.user_id) then  
local check_time = Redis:ttl(FDFGERB.."innoo" .. msg.sender.user_id)
rr = oger(check_time)
return LuaTele.sendText(msg.chat_id, msg.id,"• راتبك بينزل بعد "..rr.." دقيقة") 
end 
if Redis:get(FDFGERB.."xxxr" .. msg.sender.user_id) then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
K = 'محظوظ 2x' 
F = '15000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = 
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
return LuaTele.sendText(msg.chat_id, msg.id,"اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙","md",true) 
end 
Redis:sadd(FDFGERB.."ttpppi",msg.sender.user_id)
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
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 2 then
    K = ' ممرض 🧑🏻‍⚕' 
    F = '2500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 3 then
    K = ' معلم 👨🏻‍🏫' 
    F = '3800'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 4 then
    K = ' سواق 🧍🏻‍♂' 
    F = '1200'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 5 then
    K = ' دكتور 👨🏻‍⚕️' 
    F = '4500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 6 then
    K = ' محامي ⚖️' 
    F = '6500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 7 then
    K = ' حداد 🧑🏻‍🏭' 
    F = '1500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 8 then
    K = 'طيار 👨🏻‍✈️' 
    F = '5000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 9 then
    K = 'حارس أمن 👮🏻' 
    F = '3500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 10 then
    K = 'حلاق 💇🏻‍♂' 
    F = '1400'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 11 then
    K = 'محقق 🕵🏼‍♂' 
    F = '5000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 12 then
    K = 'ضابط 👮🏻‍♂' 
    F = '7500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 13 then
    K = 'عسكري 👮🏻' 
    F = '6500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 14 then
    K = 'عاطل 🙇🏻' 
    F = '1000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 15 then
    K = 'رسام 👨🏻‍🎨' 
    F = '1600'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 16 then
    K = 'ممثل 🦹🏻' 
    F = '5400'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 17 then
    K = 'مهرج 🤹🏻‍♂' 
    F = '2000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 18 then
    K = 'قاضي 👨🏻‍⚖' 
    F = '8000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 19 then
    K = 'مغني 🎤' 
    F = '3400'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 20 then
    K = 'مدرب 🏃🏻‍♂' 
    F = '2500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 21 then
    K = 'بحار 🛳' 
    F = '3500'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 22 then
    K = 'مبرمج 👨🏼‍💻' 
    F = '3200'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 23 then
    K = 'لاعب ⚽️' 
    F = '4700'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 24 then
    K = 'كاشير 🧑🏻‍💻' 
    F = '3000'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
elseif sender == 25 then
    K = 'مزارع 👨🏻‍🌾' 
    F = '2300'
Redis:incrby(FDFGERB.."nool:flotysb"..msg.sender.user_id , F)
local ballancee = Redis:get(FDFGERB.."nool:flotysb"..msg.sender.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." بتكوين 🪙\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الآن : "..ballancee.." بتكوين 🪙"
LuaTele.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(FDFGERB.."innoo" .. msg.sender.user_id,600, true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
--بنك
if text == "كت" or text == "كت تويت" or text == "تويت" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
local texting = {"كيف حالك بالمواقف الصعبة، صبور أم تنفجر ؟", 
  "شيء لطيف حدث معك مؤخرًا ؟ ",
  "عادي تتزوج من برا القبيلة ؟ ",
"ماذا يفعل شخصًا تقدم لفتاة يعرفها رفضته دون أي سبب واضح ؟ ",
"لو قالوا لك سنحضر لك أي شخص تتمناه، مَن ستختار ؟ ",
"ماذا لو عاد مُعتذرًا ؟ ",
"هل فعلا راحت الأيام الحلوة ؟ ",
"‏شاركنا مقولة جميلة تحبها...؟ ",
"لو أتيح لك أن توجه سؤال إلى شخص في بالك، ماذا ستقول له ",
"صفه ورثتها من والديك ؟ ",
"نادي كرة قدم لن تتوقف عن تشجيعه مهما حصل ؟ ",
"متى يتغير الشخص ؟ ",
"شاركني نصًا قصيرًا , بمعنى عميق ",
"هل انت شخص هادئ بطبعه ؟ ",
"هل شعرت يوماً أنك بمنتهى الغباء لأنك كنت صادقاً بما يكفي ؟ ",
"أكثر مرة ابتعدت فيها عن التيليجرام كم كانت ؟ ",
"برأيك، ما هو سبب انحدار جودة أفلام هوليود في هذه الأيام ؟ ",
"هل شاهدت فلمًا من قبل وشعرت بأنه صعب الفهم ؟ ",
"أشياء لو قام الناس بإلغائها من حياتهم ستصبح أفضل ؟ ",
"أكثر شيء لاحظت أنه تغيّر في هذا الزمن ؟ ",
"بماذا تُفكر الأن ؟ ",
"شاركنا آخر صورة جميلة من كاميرا هاتفك..📸 ",
"هل هناك فنان تظن أنه مظلوم ولا يحظى بالتقدير الذي يستحقه ؟ ",
"هل يوجد فيلم أبهرك بمحتواه لدرجة لا تمل إعادته ؟ ",
"هل سهل عليك أن تقول: أنا غلطان أنا فهمت غلطي ؟ ",
"ما هي أسوأ الأشياء برأيك ؟ ",
"ضع علامة @ وثالث شخص يجهز نفسه يعزمك على بيتزا🍕 ",
"فنان او فنانة ودك تشوفه ؟ ",
"أجمل اسم بنت من وجهة نظرك ؟ ",
"شعورك الحالي في جُملة قصيرة ؟ ",
"ما هي أمنيتك التي تتمناها أن تحدث ولم تحدث إلى الآن ؟ ",
"ربحت تذكرة سفر لشخصين، مَن ستأخذ معك وإلى أين ؟ ",
"صفة مشتركة بينك وبين اخوانك ؟ ",
"جملة تتمنى أن يقولها لك الشخص اللي في بالك ؟ ",
"اعتذار تريد أن تقدمه لمن ؟ ",
"شي جميل سويته وأسعدك فعله ؟ ",
"ماذا تريد من هذه الحياة ؟ ",
"مِن الأشياء البسيطة التي تسعدك ؟ ",
"ما هي برأيك أسوأ موضة ثياب أو مظهر قد درجت في الآونة الأخيرة ؟ ",
"هل يمكن أن يتغير الرجل من أجل امرأة أحبها ؟ ",
"سؤال يصلك دائمًا ؟ ",
"الشخص الذي يحقد عليك بدون سبب، ماذا تقول له ؟ ",
"كلمة توصف شعورك حاليًا ؟ ",
"شي لطيف حدث لك مؤخرًا ؟ ",
"لماذا يعتقد البعض أن الخيانة تجوز إذا قلَّ الإهتمام ؟ ",
"أسلوبك يتحول برود لما ... ؟ ",
"أسم ماتثق فيه ؟ ",
"أحبك لما ... ؟ ",
"تاريخ تحبه ؟ ",
"كيف هو حال قلبك ؟ ",
"صورة صورتها .... وتحبها ؟ ",
"وش افضل مكافئه تقدمها لنفسك هالأيام ؟ ",
"ما هو العمر الذي تتمنى أن تثبت عليه ؟ ",
"أكثر إيموجي نفسية بالنسبة لك ؟ ",
"كلمه لشخص مشتاق له ؟ ",
"ماهو الوزن اللي تطمح توصل له ؟ ",
"لماذا دائمًا المخلص في الحب يتعرض للخيانة ؟ ",
"أكثر شيء تحب أن تهتم به ؟ ",
"مفهومك للكرامة ؟ ",
"يومك في كلمة ؟ ",
"النفسية تحتاج ....؟ ",
"ما هو أهم شيء في الحياة ؟ ",
"بماذا تختلف عن الآخرين ؟ ",
"صورة لها ذكرى لا تنساها ؟ ",
"صفة تجمّل الشخص برأيك ؟ ",
"قناعة اكتسبتها من التيليجرام ؟ ",
"أفضل شيء تعلمته على الاطلاق ؟ ",
"ما رأيك بمقولة ( المحطّمون هم الأكثر تطورًا ) ؟ ",
"إيموجي يعبر عن مزاجك حاليًا ؟ ",
"طباع لا تطيقها في شخص تتعامل معه ؟ ",
"شيء تملكه ولا يملكه غيرك ؟ ",
"مِن أجمل الهدايا التي وصلتك ؟ ",
"أقدم رائحة عطر تمتلكها ولا زلت تحافظ على استخدامها ؟ ",
"هل تحافظ على غرفتك منظمة ومرتبة دائمًا ؟ ",
"كلمة توصف مشاعرك هاليومين ؟ ",
"شيء ينقصك وموجود عند غيرك ؟ ",
"صفة تهتم بأن تكون في شريك/ة حياتك ؟ ",
"شيء لا يستطيع قلبك مقاومته ؟ ",
"هل جربت يوما أن تتصنع صفة ليست فيك ؟ ",
"فيلم شاهدته منذ مدة وأحداثه عالقة في ذهنك ؟ ",
"كم سنه صار لك في التيليجرام ؟ ",
"حدثنا عن أغرب بلوك وصلك ؟ ",
"أجمل واسعد لحظه مرت في حياتك ؟ ",
"نومك خفيف ولا ثقيل ؟ ",
"الغيرة الزايدة مرض أم حب ؟ ",
"مارأيك باللطف.. هل فعلا اللطفاء نادرون؟ ",
"هل أنت من الأشخاص الذين يسهل استفزازهم ؟ ",
"مُشتاق ... ؟ ",
"اسم تبتسم بمجرد ذكر اسمه أمامك ؟ ",
"أكثر شيء تهتم بشرائه ؟ ",
"لو لك دعوة مُستجابة بماذا تدعو ؟ ",
"أجمل مُسلسل شاهدته ؟ ",
"وش تشوف نفسك بعد 10 سنين ؟ ",
"مسائك الأن في كلمة ؟ ",
"صباحك الأن في كلمة ؟ ",
        "أجمل شي بحياتك وش هو ؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "ترتيب" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","حلاوه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","قهوه","سفينه","السراج","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"حلاوه","ل ا ح و ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"قهوه","ه ق ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"السراج","س ا ل ر ا ج")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرتبها ( "..name.." )","md",true)  
end
end
if text == "حزوره" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return LuaTele.sendText(msg_chat_id,msg_id,"• ( "..name.." )","md",true)  
end
end
if text == "معاني" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","انف","فم","دماغ","امراة","طفل","جينز","نظارات","مظلة","فستان","معطف","وشاح","قفازات","تاج","خاتم","حقيبة","شبح","عفريت","زق","غزال","ثور","لاما","فرس النهر","فيل","وحيد القرن","سنجاب","طاووس","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فار","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"انف","👃")
name = string.gsub(name,"فم","👄")
name = string.gsub(name,"دماغ","🧠")
name = string.gsub(name,"امراة","👩")
name = string.gsub(name,"طفل","🧒")
name = string.gsub(name,"جينز","👖")
name = string.gsub(name,"نظارات","👓")
name = string.gsub(name,"مظلة","☂️")
name = string.gsub(name,"فستان","👗")
name = string.gsub(name,"معطف","🧥")
name = string.gsub(name,"وشاح","🧣")
name = string.gsub(name,"قفازات","🧤")
name = string.gsub(name,"تاج","👑")
name = string.gsub(name,"خاتم","💍")
name = string.gsub(name,"حقيبة","💼")
name = string.gsub(name,"شبح","👻")
name = string.gsub(name,"عفريت","👺")
name = string.gsub(name,"زق","💩")
name = string.gsub(name,"غزال","🦌")
name = string.gsub(name,"ثور","🐂")
name = string.gsub(name,"لاما","🦙")
name = string.gsub(name,"فرس النهر","🦛")
name = string.gsub(name,"فيل","🐘")
name = string.gsub(name,"وحيد القرن","🦏")
name = string.gsub(name,"سنجاب","🐿")
name = string.gsub(name,"طاووس","🦚")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فار","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"• معنى ايموجي ( "..name.." )","md",true)  
end
end
if text == "العكس" or text == "عكس" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Set:Aks"..msg.chat_id)
katu = {"باي","ملاك","خلف","بعيد","واسع","خارج","يهاجم","يوفر","تحت","فقير","فاشل","متزوج","حزين","كذاب","خارج","احبك","يمين","نظيف","حار","سلام","صعب","سريع","عدو","طويل","سمين","ضعيف","قبيح","شجاع","رحت","عادل","نشيط","خفيف","ناعم","غبي","جاف","هادى"}
name = katu[math.random(#katu)]
Redis:set(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هاي")
name = string.gsub(name,"ملاك","شيطان")
name = string.gsub(name,"خلف","أمام")
name = string.gsub(name,"بعيد","قريب")
name = string.gsub(name,"واسع","ضيق")
name = string.gsub(name,"خارج","داخل")
name = string.gsub(name,"يهاجم","يدافع")
name = string.gsub(name,"يوفر","ينفق")
name = string.gsub(name,"تحت","فوق")
name = string.gsub(name,"فقير","غني")
name = string.gsub(name,"فاشل","ناجح")
name = string.gsub(name,"متزوج","اعزب")
name = string.gsub(name,"حزين","سعيد")
name = string.gsub(name,"كذاب","صادق")
name = string.gsub(name,"خارج","داخل")
name = string.gsub(name,"احبك","اكرهك")
name = string.gsub(name,"يمين","يسار")
name = string.gsub(name,"نظيف","وصخ")
name = string.gsub(name,"حار","بارد")
name = string.gsub(name,"سلام","حرب")
name = string.gsub(name,"صعب","سهل")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"عدو","صديق")
name = string.gsub(name,"طويل","قصير")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"قبيح","جميل")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","جيت")
name = string.gsub(name,"عادل","ظالم")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"خفيف","ثقيل")
name = string.gsub(name,"ناعم","خشن")
name = string.gsub(name,"غبي","ذكي")
name = string.gsub(name,"جاف","رطب")
name = string.gsub(name,"هادى","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"• عكس كلمه ( "..name.." )","md",true)  
end
end
if text == "بات" or text == "محيبس" then   
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 »  👊 ', data = '/Mahibes1'}, {text = '𝟐 »  👊 ', data = '/Mahibes2'}, 
},
{
{text = '𝟑 »  👊 ', data = '/Mahibes3'}, {text = '𝟒 »  👊 ', data = '/Mahibes4'}, 
},
{
{text = '𝟓 »  👊 ', data = '/Mahibes5'}, {text = '𝟔 »  👊 ', data = '/Mahibes6'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت واتونس 
• كل ما عليك هوا الضغط على احدى العضمات في الازرار
]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(FDFGERB.."FDFGERB:Game:Estimate"..msg.chat_id..msg.sender.user_id,Num)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اهلا بك عزيزي في لعبة التخمين :\n━━━━━━━━━━\n• مُلاحظه عندك ( 3 ) محاولات بس \n• فكر قبل ماترسل تخمينك\n• سيتم تخمين عدد من ( 1 الى 20 ) اذا تعتقد انك بتفوز جرب والعب الان","md",true)  
end
end
if text == "المختلف" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍🔧","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"• اول واحد يطلع الاختلاف ( "..name.." )","md",true)  
end
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع البيع اقل من 1 ","md",true)  
end
local NumberGame = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id)
if tonumber(NumberGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح الجواهر \n• ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديك جواهر بهاذا العدد \n• لزيادة مجوهراتك في اللعبه \n• ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id,NumGame)  
Redis:incrby(FDFGERB.."FDFGERB:Num:Message:User"..msg.chat_id..":"..msg.sender.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"• تم خصم ↢ ( "..NumGame.." ) من مجوهراتك \n• وتم اضافة ↢ ( "..(NumGame * 50).." ) رساله الى رسائلك ","md",true)  
end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم اضافه له "..text:match("^اضف مجوهرات (%d+)$").." من المجوهرات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص : ( '..Controller_Num(7)..' ) ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(FDFGERB.."FDFGERB:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"• تم اضافه له "..text:match("^اضف رسائل (%d+)$").." من الرسائل").Reply,"md",true)  
end
if text == "مجوهراتي" then 
local Num = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "• لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "• عدد الجواهر التي ربحتها ↢ ( "..Num.." )","md",true)  
end
end

if text == '' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'C','رفع C')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تنزيل الكل')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'سح','مسح سحكاتي')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..'CM','رفع CM')

return LuaTele.sendText(msg_chat_id,msg_id,[[
• تم ترتيب الاوامر بالشكل التالي ~
• ايدي • ا .
• رفع مميز • م .
• رفع ادمن • اد .
• رفع مدير • مد . 
• رفع منشى • من . 
• رفع منشئ الاساسي • اس  .
• رفع C • C .
• رفع CM • CM .
• تنزيل الكل • تك .
• تعطيل الايدي بالصوره • تعط .
• تفعيل الايدي بالصوره • تفع .
• الرابط • ر .
• الردود • رر .
• مسح المكتومين • ،، .
• اضف رد • رد .
• مسح سحكاتي • سح .
• مسح رسائلي • رس .
• غنيلي • غ .
]],"md")
end

end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات •' or text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "• تم تحديث الملفات ","md",true)
dofile('FDFGERB.lua')  
end
if text == '/start' then
Redis:sadd(FDFGERB..'FDFGERB:Num:User:Pv',msg.sender.user_id)  
if not msg.ControllerBot then
if not Redis:get(FDFGERB.."FDFGERB:Start:Bot") then
local CmdStart = '\n• أهلآ بك في بوت '..(Redis:get(FDFGERB.."FDFGERB:Name:Bot") or "FDFGERB")..
'\n• اختصاص البوت حماية المجموعات'..
'\n• لتفعيل البوت عليك اتباع مايلي ...'..
'\n• اضف البوت الى مجموعتك'..
'\n• ارفعه ادمن  مشرف '..
'\n• ارسل كلمة  تفعيل  ليتم تفعيل المجموعه'..
'\n• Dev🎖 ← ['..UserSudo..' ]'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'ضيفني لـ مجموعتك', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = 'تحديثات لبوت', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'ضيفني لـ مجموعتك', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = 'تحديثات لبوت', url = 't.me/trprogram'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(FDFGERB.."FDFGERB:Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل التواصل',type = 'text'},{text = 'تعطيل التواصل', type = 'text'},
},
{
{text = 'تفعيل البوت الخدمي',type = 'text'},{text = 'تعطيل البوت الخدمي', type = 'text'},
},
{
{text = 'اذاعه للمجموعات',type = 'text'},{text = 'اذاعه خاص', type = 'text'},
},
{
{text = 'اذاعه بالتوجيه',type = 'text'},{text = 'اذاعه بالتوجيه خاص', type = 'text'},
},
{
{text = 'اذاعه بالتثبيت',type = 'text'},
},
{
{text = 'قائمه MY',type = 'text'},{text = 'قائمه M',type = 'text'},{text = 'قائمه العام', type = 'text'},
},
{
{text = 'المكتومين العام',type = 'text'},{text = 'مسح المكتومين العام',type = 'text'},
},
{
{text = 'مسح قائمه MY',type = 'text'},{text = 'مسح قائمه M',type = 'text'},{text = 'مسح قائمه العام', type = 'text'},
},
{
{text = 'تغيير اسم البوت',type = 'text'},{text = 'حذف اسم البوت', type = 'text'},
},
{
{text = 'الاشتراك الاجباري',type = 'text'},{text = 'تغيير الاشتراك الاجباري',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري',type = 'text'},{text = 'تعطيل الاشتراك الاجباري',type = 'text'},
},
{
{text = 'الاحصائيات',type = 'text'},
},
{
{text = 'تغغير كليشه المطور',type = 'text'},{text = 'حذف كليشه المطور', type = 'text'},
},
{
{text = 'تغيير كليشه ستارت',type = 'text'},{text = 'حذف كليشه ستارت', type = 'text'},
},
{
{text = 'تنظيف المجموعات',type = 'text'},{text = 'تنظيف المشتركين', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه',type = 'text'},
},
{
{text = 'اضف رد عام',type = 'text'},{text = 'مسح رد عام', type = 'text'},
},
{
{text = 'الردود العامه',type = 'text'},{text = 'مسح الردود العامه', type = 'text'},
},
{
{text = 'تحديث',type = 'text'},{text = 'تحديث السورس', type = 'text'},
},
{
{text = 'الغاء الامر',type = 'text'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اهلا بك عزيزي Dev 🎖\n• يمكنك التحكم بكل الاوامر الموجودة\n• فقط اضغط على الامر\n• اذا كنت تريد الغاء الامر اضغط على الغاء الامر\n• قناه السورس ↤ [قناة السورس](t.me/trprogram)', 'md', false, false, false, false, reply_markup)
end
end
if text == 'تنظيف المشتركين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(FDFGERB..'FDFGERB:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• تم العثور على ( '..x..' ) من المشتركين حاظرين البوت',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• لم يتم العثور على وهميين',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,FDFGERB)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'• البوت عضو في المجموعه سوف اغادر ويمكنك تفعيلي مره اخره ',"md")
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(FDFGERB..''..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(FDFGERB..''..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• تم العثور على ( '..x..' ) مجموعات البوت ليس ادمن \n• تم تعطيل المجموعه ومغادره البوت من الوهمي ',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• لا توجد مجموعات وهميه',"md")
end
end
if text == 'تغيير كليشه ستارت' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي كليشه Start الان ","md",true)  
end
if text == 'حذف كليشه ستارت' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == 'مسح اسم البوت' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو ',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'• عدد احصائيات البوت الكامله \n━━━━━\n• عدد المجموعات : '..(Redis:scard(FDFGERB..'FDFGERB:ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(FDFGERB..'FDFGERB:Num:User:Pv') or 0)..'',"md",true)  
end
if text == 'تغغير كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'• ارسل لي الكليشه الان')
end
if text == 'مسح كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB..'FDFGERB:Texting:DevFDFGERB')
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حذف كليشه المطور')
end
if text == 'اضف رد عام' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == 'مسح رد عام' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود العامه","md",true)  
end
if text=='اذاعه خاص' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯|ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
↯|للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯|ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
↯|للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯|ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
━━━━━
↯|للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
text = "\n• قائمة الردود العامه \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• لا توجد الردود العامه"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == ("مسح الردود العامه") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v)
Redis:del(FDFGERB.."FDFGERB:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"تم مسح الردود العامه","md",true)  
end
if text == 'مسح قائمه M' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth ","md",true)
end
if text == 'مسح قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖️ حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth🎖️ ","md",true)
end
if text == 'مسح قائمه العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين عام ","md",true)
end
if text == 'مسح المكتومين العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص { Dev } فقط .  ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام . ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح { "..#Info_Members.." } من المكتومين عام ","md",true)
end
if text == 'المكتومين العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(2)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام .","md",true)  
end
ListMembers = '\n• قائمة المكتومين عام : \n━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." -  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." - ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المكتومين عام', data = msg.sender.user_id..'/kktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'تعطيل البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end 
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين عام  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المحظورين عام', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه M' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح Myth', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖️ حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth🎖️ البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح MY', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.ControllerBot then
if Redis:get(FDFGERB.."FDFGERB:TwaslBot") and not Redis:sismember(FDFGERB.."FDFGERB:BaN:In:Tuasl",msg.sender.user_id) then
local ListGet = {Sudo_Id,msg.sender.user_id}
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(FDFGERB.."FDFGERB:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'• قام بارسال الملصق').Reply,"md",true)  
end
return LuaTele.sendText(IdUser,msg_id,Reply_Status(IdUser,'• تم ارسال رسالتك الى Dev🎖').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(FDFGERB.."FDFGERB:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(FDFGERB..'FDFGERB:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(FDFGERB..'FDFGERB:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true)
end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run


function CallBackLua(data) --- هذا الكالباك بي الابديت
--var(data) 
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(FDFGERB..''..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i])
end
return LuaTele.sendText(Sudo_Id,0,'\n• تم طرد البوت من مجموعه جديده \n• اسم المجموعه : '..Get_Chat.title..'\n• ايدي المجموعه :`-100'..data.supergroup.id..'`\n• تم مسح جميع البيانات المتعلقه بالمجموعه',"md")
end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender.user_id) == tonumber(FDFGERB) then
return false
end
if data.message.content.luatele == "messageChatJoinByLink" and Redis:get(FDFGERB..'FDFGERB:Status:joinet'..data.message.chat_id) == 'true' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' انا لست بوت ', data = data.message.sender.user_id..'/UnKed'},
},
}
} 
LuaTele.setChatMemberStatus(data.message.chat_id,data.message.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(data.message.chat_id, data.message.id, '• عليك اختيار انا لست بوت لتخطي نضام التحقق', 'md',false, false, false, false, reply_markup)
end

File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender.user_id == FDFGERB then
print('This is Edit for Bot')
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(FDFGERB..'FDFGERB:Num:Message:Edit'..data.chat_id..Message_Edit.sender.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(FDFGERB.."FDFGERB:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

if Text and Text:match('(%d+)/UnKed') then
local UserId = Text:match('(%d+)/UnKed')
if tonumber(UserId) ~= tonumber(IdUser) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
LuaTele.setChatMemberStatus(ChatId,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.editMessageText(ChatId,Msg_id,"• تم التحقق منك اجابتك صحيحه يمكنك الدردشه الان", 'md', false)
end


if Text and Text:match('(%d+)/unbanktmkid@(%d+)') then
local listYt = {Text:match('(%d+)/unbanktmkid@(%d+)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId,listYt[2]) 
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId,listYt[2]) 
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1,1})
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1})
LuaTele.editMessageText(ChatId,Msg_id,"• تم رفع القيود عنه", 'md')
end
end

if Text and Text:match('(%d+)/delamrredis') then
local listYt = Text:match('(%d+)/delamrredis')
if tonumber(listYt) == tonumber(IdUser) then
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..ChatId..""..IdUser) 
Redis:del(FDFGERB.."FDFGERB1:Set:Rd"..IdUser..":"..ChatId)
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..ChatId..""..IdUser) 
Redis:del(FDFGERB.."FDFGERB:Set:Rd"..IdUser..":"..ChatId)
LuaTele.editMessageText(ChatId,Msg_id,"• تم الغاء الامر", 'md')
end
end
if Text and Text:match('(%d+)/chenidam') then
local listYt = Text:match('(%d+)/chenidam')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Redis:Id:all"..ChatId..""..IdUser,true) 
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الايدي عام الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chenid') then
local listYt = Text:match('(%d+)/chenid')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Redis:Id:Group"..ChatId..""..IdUser,true) 
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الايدي الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplygg') then
local listYt = Text:match('(%d+)/chengreplygg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..IdUser..":"..ChatId, "true")
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplyg') then
local listYt = Text:match('(%d+)/chengreplyg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..IdUser..":"..ChatId,"true")
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplys') then
local listYt = Text:match('(%d+)/chengreplys')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..IdUser..":"..ChatId,true)
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end

if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '• الف مبروك حظك حلو اليوم\n• فزت معانا وطلعت المحيبس بل عظمه رقم {'..NumMahibes..'}'
else
MahibesText = '• للاسف لقد خسرت المحيبس بالعظمه رقم {'..NumMahibes..'}\n• جرب حضك ويانه مره اخره'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 » ( '..Mahibes1..' ', data = '/'}, {text = '𝟐 » ( '..Mahibes2..' ', data = '/'}, 
},
{
{text = '𝟑 » ( '..Mahibes3..' ', data = '/'}, {text = '𝟒 » ( '..Mahibes4..' ', data = '/'}, 
},
{
{text = '𝟓 » ( '..Mahibes5..' ', data = '/'}, {text = '𝟔 » ( '..Mahibes6..' ', data = '/'}, 
},
{
{text = ' اللعب مره اخرى ', data = '/MahibesAgane'},
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 »  👊 ', data = '/Mahibes1'}, {text = '𝟐 »  👊 ', data = '/Mahibes2'}, 
},
{
{text = '𝟑 »  👊 ', data = '/Mahibes3'}, {text = '𝟒 »  👊 ', data = '/Mahibes4'}, 
},
{
{text = '𝟓 »  👊 ', data = '/Mahibes5'}, {text = '𝟔 »  👊 ', data = '/Mahibes6'}, 
},
}
}
local TextMahibesAgane = [[
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت واتونس 
• كل ما عليك هوا الضغط على احدى العضمات في الازرار
]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '• ❶ •', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ الرفع والتنزيل ∷

* اوامر الادمن *
رفع | تنزيل
━ مميز

━ مسح المميزين

* اوامر المدير *
رفع | تنزيل
━ مميز
━ ادمن

━ مسح المميزين
━ مسح الادمنيه

* اوامر المنشئ *
رفع | تنزيل
━ مميز
━ ادمن
━ مدير

━ تنزيل الكل
━ مسح المميزين
━ مسح الادمنيه
━ مسح المدراء

* اوامر المنشئ الاساسي *
رفع | تنزيل
━ مميز
━ ادمن
━ مدير
━ منشئ

━ تنزيل الكل
━ مسح المميزين
━ مسح الادمنيه
━ مسح المدراء
━ مسح المنشئين
━ مسح المنشئين الاساسيين

* اوامر بالرد أو بالمعرف *
━ التفاعل
━ كشف
━ الرتبه
━ طرد
━ حظر | الغاء الحظر
━ تقييد | الغاء التقييد
━ كتم | الغاء الكتم
━ رفع القيود

* اوامر المنع *
━ منع + الكلمة المراد منعها
━ الغاء منع + الكلمة المراد الغاء منعها
━ منع + بالرد على المتحركة
━ الغاء منع + بالرد على المتحركة
━ منع + بالرد على الملصق
━ الغاء منع + بالرد على الملصق

━ قائمة المنع | مسح قائمة المنع
━━━━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '• ❷ •', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ اوامر الوضع للمجموعة ∷
━ وضع ترحيب
━ وضع قوانين
━ وضع وصف
━ وضع رابط

* اوامر رؤية الاعدادات *
━ المنشئين الاساسيين
━ المنشئين
━ المدراء
━ الادمنيه
━ المكتومين
━ الحمايه
━ الوسائط
━ الاعدادات
━ المجموعه

* اوامر المجموعة الاخرى *
━ انشاء رابط
━ تغيير امر + الأمر المطلوب تغييره
━ مسح امر + الأمر المطلوب مسحه
━ قائمة الاوامر
━━━━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '• ❸ •', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ اوامر حماية المجموعة ∷

قفل | فتح

━ الكل
━ الفيديو
━ الصور
━ الملصقات
━ المتحركه
━ البصمات
━ الدردشه
━ الروابط
━ البوتات
━ التعديل
━ المعرفات
━ الكلايش
━ التكرار
━ الجهات
━ الانلاين
━ التوجيه
━ الدخول بالرابط
━ البوتات بالطرد

تفعيل | تعطيل 
━ الردود
━ التحذير
━ الترحيب
━ الايدي
━ الايدي بالصوره
━ الرفع
━ التحقق

* التقييد *
قفل | فتح
━ الصور بالتقييد
━ الروابط بالتقييد
━ المتحركه بالتقييد
━ الفيديو بالتقييد
━ التوجيه بالتقييد
━━━━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '• ❹ •', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ الاوامر العامة ∷
━ ايدي
━ ايديي
━ الرابط
━ معلوماتي
━ طرد البوتات
━ طرد المحذوفين
━ كشف البوتات
━ رابط الحذف
* اوامر الردود *
━ اضف رد
━ مسح رد
━ الردود
━ مسح الردود
━ الغاء قائمة التثبيت
━━━━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = '• التسليه •', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ اوامر التسليه ∷

━ رفع - تنزيل : هطف
━ رفع - تنزيل : بثر
━ رفع - تنزيل : حمار
━ رفع - تنزيل : كلب
━ رفع - تنزيل : كلبه
━ رفع - تنزيل : عتوي
━ رفع - تنزيل : عتويه
━ رفع - تنزيل : لحجي
━ رفع - تنزيل : لحجيه
━ رفع - تنزيل : خروفك
━ رفع - تنزيل : خفيفه
━ رفع - تنزيل : خفيف
━ رفع بقلبي  : تنزيل من قلبي
━ طلاق - زواج

━━━━━━━━━━━━━━━ 
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = '• الالعاب •', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسيه', data = IdUser..'/helpall'},
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
∷ قائمه الالعاب البوت ∷

━ لعبة المختلف » المختلف
━ لعبة الامثله » امثله
━ لعبة العكس » العكس
━ لعبة الحزوره » حزوره
━ لعبة المعاني » معاني
━ لعبة البات » بات
━ لعبة التخمين » خمن
━ لعبه الاسرع » الاسرع
━ لعبة السمايلات » سمايلات

━ مجوهراتي ← لعرض عدد الارباح
━ بيع مجوهراتي ←  العدد  ← لبيع كل مجوهره مقابل {50} رساله
━━━━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/help3'}, {text = '❹', data = IdUser..'/help4'}, 
},
{
{text = 'التسليه', data = IdUser..'/help5'}, {text = 'الالعاب', data = IdUser..'/help6'}, 
},
{
{text = 'اوامر القفل / الفتح', data = IdUser..'/NoNextSeting'}, {text = 'اوامر التعطيل / التفعيل', data = IdUser..'/listallAddorrem'}, 
},
{
{text = '𝑺𝒐𝒖𝒓𝒄𝒆', url = 't.me/trprogram'}, 
},
}
}
local TextHelp = [[
- ‌‌‏أهلاً بك عزيزي في قائمة الاوامر :
━━━━━━━━━━━━                                
م1 ━ اوامر الأداره
م2 ━ اوامر المجموعة
م3 ━ اوامر حماية المجموعة
م4 ━ الاوامر العامة
الالعاب ━ الالعاب الخاصة بلبوت 
التسليه ━ اوامر التسليه
السورس ━ قناة السورس
━━━━━━━━━━━━
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الطرد • الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الطرد • الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.answerCallbackQuery(data.id, "• تم ترقيه ( "..y.." ) ادمنيه \n• تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(FDFGERB.."FDFGERB:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(FDFGERB..'FDFGERB:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "• تم قفل جميع الاوامر بنجاح  ", true)
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
LuaTele.answerCallbackQuery(data.id, "• تم مغادره البوت من المجموعه", true)
LuaTele.leaveChat(UserId)
end


if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ❌ ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ✔️ ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ❌ ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ✔️ ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ❌ ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ✔️ ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end

if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ❌ ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ✔️ ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ❌ ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ✔️ ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ❌ ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ✔️ ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end
if Text and Text:match("(%d+)/toop5") then
local UserId = Text:match("(%d+)/toop5")
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = "inline",
data = {
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
local bank_users = Redis:smembers(FDFGERB.."almtzog"..ChatId)
top_mony = "توب اغنى 10 زوجات بالقروب :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."mznom"..ChatId..v)
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
local zwga_id = Redis:get(FDFGERB..ChatId..v[2].."rgalll2:")
local user_name = LuaTele.getUser(v[2]).first_name
local user_nambe = LuaTele.getUser(zwga_id).first_name
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')' or 'الاسم سبام'
local user_zog = '['..user_nambe..'](tg://user?id='..zwga_id..')' or 'الاسم سبام'
local mony = v[1]
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." - "..user_tag.." 👫 "..user_zog.."  l "..mony.." 💵\n"
end
end
LuaTele.editMessageText(ChatId,Msg_id,top_mony, "md", true, false, reply_markup)
end
end
if Text and Text:match("(%d+)/toop2") then
local UserId = Text:match("(%d+)/toop2")
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = "inline",
data = {
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
local ban = LuaTele.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(FDFGERB.."zrffdcf"..IdUser) or 0
local bank_users = Redis:smembers(FDFGERB.."zrfffidtf")
top_mony = "توب اكثر 25 شخص حرامية فلوس:\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."zrffdcf"..v) or 0
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
fne = Redis:get(FDFGERB..':toob:Name:'..v[2])
tt =  "["..fne.."]("..fne..")"
local mony = v[1]
local emo = emoji[k]
num = num + 1
gflos =string.format("%d", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
gflous =string.format("%d", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." "
end
end
LuaTele.editMessageText(ChatId,Msg_id,top_mony..gg, "md", true, false, reply_markup)
end
end
if Text and Text:match("(%d+)/toop1") then
local UserId = Text:match("(%d+)/toop1")
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = "inline",
data = {
{
{text = 'قناة السورس', url='https://t.me/trprogram'},
},
}
}
local ban = LuaTele.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(FDFGERB.."nool:flotysb"..IdUser) or 0
local bank_users = Redis:smembers(FDFGERB.."ttpppi")
top_mony = "توب اغنى 25 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."nool:flotysb"..v) or 0
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
fne = Redis:get(FDFGERB..':toob:Name:'..v[2])
tt = "["..fne.."]("..fne..")"
local mony = v[1]
local emo = emoji[k]
num = num + 1
gflos =string.format("%d", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
gflous =string.format("%d", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." \n\n\n*ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه*"
end
end
LuaTele.editMessageText(ChatId,Msg_id,top_mony..gg, "md", true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,'• اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n• اعدادات المجموعه ".."\n🔏|علامة ال (✔️) تعني مقفول".."\n🔓|علامة ال (❌) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- الرجوع ... ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. '/delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n• اعدادات المجموعه ".."\n🔏|علامة ال (✔️) تعني مقفول".."\n• علامة ال (❌) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = '- التالي ... ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 
if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end

elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح Myth البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح Myth🎖️ من البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المنشئين الاساسيين", 'md', false)
end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Originators:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح منشئين المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Managers:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المدراء", 'md', false)
end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Addictive:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح ادمنيه المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المميزين", 'md', false)
end
elseif Text and Text:match('(%d+)/kktmAll') then
local UserId = Text:match('(%d+)/kktmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المكتومين عام بنجاح .", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المحظورين عام", 'md', false)
end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المحظورين", 'md', false)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المكتومين", 'md', false)
end
end
end
end
luatele.run(CallBackLua)
 




