--[[==========
	STRUCTURE
	==========
	- Nodeboxes
	- Register function
]]

local S = core.get_translator("big_houses")

--==========
--NODEBOXES
--==========
local a=0.5		--thickness of walls
local am=a		--thickness of main walls
local h=1		--height
local l=-0.5	--level of ground
local f=4		--floor height
local d=1		--door width
local dm=d		--main door width
local t=a		--thickness of floor

local x1=3
local x2=x1+d+a
local x3=x2+f
local x4=10
local xm=15		--x maximum = width of house

local y1=l+f
local y2=l+2*f

local z1=3
local z2=z1+d+a
local z3=8-a
local zm=11		--z maximum = length of house

--basic nodeboxes
--{,,,,,}
local h01wx10={0,		l,0,	x3-1,l+h,a}
local h01wx11={x3,		l,0,	xm,l+h,a}
local h01wx12={x2+1.5,	l,z1,	x3-1,l+f,z1+a}
local h01wx13={x2,		l,z2,	x3,l+3*f-h,z2+a}
local h01wx14={x4+a,	l,z2,	xm-a,l+2*f-t,z2+a}
local h01wx15={x3-a,	l,z2+2,	x4+0.5,l+f-t,z2+2+a}
local h01wx16={0,		l,z3,	x2,l+f+h,z3+a}
local h01wx17={x2,		l,zm-a,	xm,l+h,zm}

local h01wx20={0,		l+h,0,x2+1,l+f-1,a}
local h01wx21={x3-2,	l+h,0,x3-1,l+f-1,a}
local h01wx22={x3,		l+h,0,x4+1.5,l+f-1,a}
local h01wx23={x4+3.5,	l+h,0,xm,l+f-1,a}
local h01wx25={x2,		l+h,zm-a,x2+2,l+f-1,zm}
local h01wx26={x3,		l+h,zm-a,x4+1.5,l+f-1,zm}
local h01wx27={x4+3.5,	l+h,zm-a,xm,l+f-1,zm}

local h01wx30={0,l+f-h,0,xm,l+f+h,a}
local h01wx31={x3-d,l+2*h,0,x3,l+f-h,a}
local h01wx37={x2,l+f-h,zm-a,xm,l+f+h,zm}

local h01wx41={a,l+f,z1,x2-d,l+f+2*h,z1+a}
local h01wx42={x2,l+f,z1,x3,l+f+2*h,z1+a}
local h01wx43={x3+d,l+f,z1,x4,l+f+2*h,z1+a}
local h01wx45={x2,l+f,z3-a,x3,l+2*f-t,z3}

local h01wx50={0,l+f+h,0,x2-2,l+2*f-h,a}
local h01wx51={x2,l+f+h,0,x3,l+2*f-h,a}
local h01wx52={x3+1,l+f+h,0,x4+a+1,l+2*f-h,a}
local h01wx53={x4+3.5,l+f+h,0,xm,l+2*f-h,a}
local h01wx54={0,l+f+h,z3,x1+a,l+2*f-h,z3+a}
local h01wx55={x2,l+f+h,zm-a,x3-2,l+2*f-h,zm}
local h01wx56={x3,l+f+h,zm-a,x4+1.5,l+2*f-h,zm}
local h01wx57={x4+3.5,l+f+h,zm-a,xm,l+2*f-h,zm}

local h01wx60={0,l+f+3*h,0,xm,l+2*f,a}
local h01wx62={a,l+f+2*h,z1,x4,l+2*f,z1+a}
local h01wx63={0,l+f+3*h,z3,x2+a,l+3*f-1,z3+a}
local h01wx64={x3,l+f+2*h,z3-a,x3+1,l+2*f-t,z3}
local h01wx67={x2,l+f+3*h,zm-a,xm,l+2*f,zm}

local h01wx70={0,l+2*f,0,xm-a,l+2*f+h,a}
local h01wx72={a,l+2*f,z1,x1+a,l+2*f+2*h,z1+a}
local h01wx73={x2,l+2*f,z1,xm-a,l+2*f+h,z1+a}

local h01wx80={0,l+2*f+h,0,2.5,l+2*f+3*h,a}
local h01wx81={x2,l+2*f+h,0,x3,l+2*f+3*h,a}
local h01wx82={x4+a,l+2*f+h,0,xm-a-1,l+2*f+2*h,a}
local h01wx83={x2,l+2*f+h,z1,xm-a-1,l+2*f+2*h,z1+a}

local h01wx92={x4+a,l+2*f+2*h,0,xm-a-2,l+2*f+3*h,a}
local h01wx93={a,l+2*f+2*h,z1,xm-a-2,l+2*f+3*h,z1+a}
local h01wx95={x2-d,l+2*f+2*h,z2+1,x2,l+2*f+3*h,z2+1+a}

local h01wz10={0,l,0,a,l+h,z3}
local h01wz12={x2,l,a,x2+a,l+2*h,1.5}
local h01wz13={x2,l,2.5,x2+a,l+2*h,zm}
local h01wz14={x3-a,l,z2+a,x3,l+2*h,z2+1}
local h01wz15={x4-a,l,z2+a+2,x4,l+2*f-t,zm-a}
local h01wz16={x4,l,a,x4+a,l+2*h,1.5}
local h01wz17={x4,l,2.5,x4+a,l+2*h,z2+1}
local h01wz18={xm-a,l,a,xm,l+2*f,zm-a}

local h01wz20={0,l+h,0,a,l+3*h,2.5}
local h01wz21={0,l+h,5.5,a,l+3*h,z3}

local h01wz32={x2,l+2*h,a,x2+a,l+f,zm}
local h01wz34={x3-a,l+2*h,z2+a,x3,l+f-t,z2+2}
local h01wz36={x4,l+2*h,a,x4+a,l+f-t,z2+2}

local h01wz40={0,l+f-1,0,	a,l+f+h,z3}
local h01wz41={x1,l+f,z1+a,	x1+a,l+3*f-1,z2}
local h01wz42={x1,l+f,z2+d,	x1+a,l+3*f-1,z3}
local h01wz43={x2,l+f,z3,	x2+a,l+2*f+h,zm-a}
local h01wz44={x2+1,l+f,a,	x2+1+a,l+2*f-t,z1}
local h01wz46={x4,l+f,a,	x4+a,l+f+2*h,z1+a}
local h01wz47={x4,l+f,z2,	x4+a,l+f+2*h,z2+1}
local h01wz48={x4,l+f,z2+1+d,x4+a,l+f+2*h,z3}

local h01wz50={0,l+f+h,a,	a,l+2*f+3*h,4+a}
local h01wz51={0,l+f+h,6+a,	a,l+2*f+3*h,z3}

local h01wz60={0,l+f+3*h,z2,	a,l+2*f+h,z2+2}
local h01wz62={x1,l+f+2*h,z1+a+1,x1+a,l+2*f-t,z1+a+2}
local h01wz65={x4,l+f+2*h,a,	x4+a,l+2*f-t,z3}

local h01wz74={x2,l+2*f,z2+a,	x2+a,l+2*f+3*h,z2+a+1}
local h01wz75={x2+1,l+2*f,a,	x2+1+a,l+2*f+2*h,1.5}
local h01wz76={x2+1,l+2*f,1.5+d,	x2+1+a,l+2*f+2*h,z1}
local h01wz77={x3,l+2*f,z1+a,	x3+a,l+2*f+3*h,z2+a}

local h01wz86={x2,l+2*f+h,z3+a,	x2+a,l+2*f+2*h,zm-a-1}

local h01wz92={x1,l+2*f+2*h,z1+a+1,x1+a,l+3*f-1,z1+a+2}
local h01wz95={x2+1,l+2*f+2*h,a,	x2+1+a,l+3*f-1,z1}
local h01wz96={x2,l+2*f+2*h,z3+a,	x2+a,l+2*f+3*h,zm-a-2}

--local h01wz50={0,l+f+3*h,a,	a,l+2*f-t,z3-a}
--local h01wz50={0,l+f+3*h,a,	a,l+2*f-t,z3-a}

local h01f11={a,l+f-t,a,x2,l+f,z3}
local h01f12={x2+a,l+f-t,a,x3,l+f,z1+a}
local h01f13={x3,l+f-t,a,xm-a,l+f,z2+a}
local h01f14={x2+a,l+f-t,z2+a,xm-a,l+f,zm-a}

local h01f21={a,l+2*f-t,a,x2,l+2*f,z3}
local h01f22={x2,l+2*f-t,a,x3,l+2*f,z1+a}
local h01f23={x3,l+2*f-t,a,xm-a,l+2*f,z2+a}
local h01f24={x2,l+2*f-t,z2+a,xm-a,l+2*f,zm-a}

--local x3=6

--completed nodeboxes
local h01={h01wx10,h01wx11,h01wx12,h01wx13,h01wx14,h01wx15,h01wx16,h01wx17,
h01wx20,h01wx21,h01wx22,h01wx23,h01wx25,h01wx26,h01wx27,
h01wx30,h01wx31,h01wx37,h01wx41,h01wx42,h01wx43,h01wx45,
h01wx50,h01wx51,h01wx52,h01wx53,h01wx54,h01wx55,h01wx56,h01wx57,
h01wx60,h01wx62,h01wx63,h01wx64,h01wx67,
h01wx70,h01wx72,h01wx73,h01wx80,h01wx81,h01wx82,h01wx83,h01wx92,h01wx93,h01wx95,

h01wz10,h01wz12,h01wz13,h01wz14,h01wz15,h01wz16,h01wz17,h01wz18,
h01wz20,h01wz21,h01wz32,h01wz34,h01wz36,
h01wz40,h01wz41,h01wz42,h01wz43,h01wz44,h01wz46,h01wz47,h01wz48,
h01wz50,h01wz51,h01wz60,h01wz62,h01wz65,
h01wz74,h01wz75,h01wz76,h01wz77,h01wz86,h01wz92,h01wz95,h01wz96, --77 needn't

h01f11,h01f12,h01f13,h01f14,
h01f21,h01f22,h01f23,h01f24,
}

minetest.register_node("big_houses:test",{
description = "test",
tiles = {"default_acacia_wood.png"},
groups = {oddly_breakable_by_hand = 3,big_house = 1,big_house_unbreakable = 1},
drawtype = "nodebox",
paramtype = "light",
paramtype2 = "color4dir",
node_box = {type = "fixed",fixed = {nil,},},
walkable = true,
pointable = true,
diggable = true,
sunlight_propagates = true,
is_ground_content = false,
palette = "big_houses_palette.png",
})

local nbxs = {{"h01", h01, "3-floor"},}
local mats={"stone_brick","brick","silver_sandstone","silver_sandstone_brick","acacia_wood","aspen_wood","junglewood","pine_wood","wood"}

local function big_houses_reghouse(namebox,nbx,mat,namehouse)
minetest.register_node("big_houses:" .. namebox.."_"..mat, {
description = S("Big house").." "..S(namehouse).." "..S("from").." "..S(mat),
tiles = {"default_"..mat..".png"},
groups = {oddly_breakable_by_hand = 3,big_house = 1,big_house_unbreakable = 1},
drawtype = "nodebox",
paramtype = "light",
paramtype2 = "color4dir",
node_box = {type = "fixed",fixed = nbx,},
selection_box = {type = "fixed",fixed = nbx,},
collision_box = {type = "fixed",fixed = nbx,},
walkable = true,
pointable = true,
diggable = true,
sunlight_propagates = true,
is_ground_content = false,
palette = "big_houses_palette.png",
})
end

for _, nbxv in ipairs(nbxs) do
	local namebox = nbxv[1]
	local nbx = nbxv[2]
	local namehouse = nbxv[3]
for _, mat in ipairs(mats) do
    big_houses_reghouse(namebox,nbx,mat,namehouse)
end
end

local nbxs = {{"h01", h01, "3-floor"},}
local mats={"stone_brick","brick","silver_sandstone","silver_sandstone_brick","acacia_wood","aspen_wood","junglewood","pine_wood","wood"}

--[[
PARTS
]]

local p21w={-0.5,-0.5,0.2,0.5,1.5,0.3}
local p22w={-0.5,-0.5,0.2,1.5,1.5,0.3}
local p23w={-0.5,-0.5,0.2,2.5,1.5,0.3}

local wnbxs = {{"p21w", p21w, "1x2"},{"p22w", p22w, "2x2"},{"p23w", p23w, "3x2"},}
local wmats = {{"glass","default_glass_detail"},}
local trp = "big_houses_transparent.png"

local function big_houses_regwin(namebox,nbx,mat,namewin,texturemat)
minetest.register_node("big_houses:" .. namebox.."_"..mat, {
description = S("Window").." - "..S("shape").." "..namewin.." "..S("from").." "..S(mat),
--tiles = {texturemat..".png",texturemat..".png",trp,trp,trp,trp},
--tiles = {trp,trp,texturemat..".png",texturemat..".png",trp,trp},
tiles = {trp,trp,trp,trp,texturemat..".png",texturemat..".png"},
groups = {oddly_breakable_by_hand = 3},
drawtype = "nodebox",
paramtype = "light",
paramtype2 = "color4dir",
node_box = {
type = "fixed",
fixed = nbx,
},
use_texture_alpha = "blend",
is_ground_content = false,
palette = "big_houses_palette.png",
})
end

for _, wnbxv in ipairs(wnbxs) do
	local namebox = wnbxv[1]
	local nbx = wnbxv[2]
	local namewin = wnbxv[3]
for _, wmatv in ipairs(wmats) do
    local mat = wmatv[1]
	local texturemat = wmatv[2]
	big_houses_regwin(namebox,nbx,mat,namewin,texturemat)
end
end

--[[local function big_houses_regpart(namebox,nbx,mat,matcat)
if matcat==nil then matcat=mat end
minetest.register_node("big_houses:" .. namebox.."_"..mat, {
description = S("Part of Big house").." - "..S("shape").." "..namebox.." "..S("from").." "..S(mat),
tiles = {"default_"..mat..".png"},
groups = {oddly_breakable_by_hand = 3},
drawtype = "nodebox",
paramtype = "light",
paramtype2 = "color4dir",
node_box = {
type = "fixed",
fixed = nbx,
},
is_ground_content = false,
palette = "big_houses_palette_"..matcat..".png",
})
end]]