-- dog.lua — Delta X mobile
local P=game:GetService("Players")local R=game:GetService("RunService")local U=game:GetService("UserInputService")local CG=game:GetService("CoreGui")local W=game:GetService("Workspace")local LP=P.LocalPlayer local Cam=W.CurrentCamera
local ok=pcall(function()end)
local SG=Instance.new("ScreenGui")SG.Name="dog"SG.ResetOnSpawn=false SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
if not pcall(function()SG.Parent=CG end)then SG.Parent=LP:WaitForChild("PlayerGui")end
local M=Instance.new("Frame")M.Size=UDim2.new(0,220,0,300)M.Position=UDim2.new(0,20,0,100)M.BackgroundColor3=Color3.fromRGB(20,20,25)M.BorderSizePixel=0 M.Active=true M.Draggable=true M.Parent=SG
Instance.new("UICorner",M).CornerRadius=UDim.new(0,8)
local T=Instance.new("TextLabel")T.Size=UDim2.new(1,0,0,30)T.BackgroundColor3=Color3.fromRGB(30,30,40)T.BorderSizePixel=0 T.Text="dog.lua"T.TextColor3=Color3.new(1,1,1)T.Font=Enum.Font.GothamBold T.TextSize=15 T.Parent=M
Instance.new("UICorner",T).CornerRadius=UDim.new(0,8)
local TB=Instance.new("TextButton")TB.Size=UDim2.new(0,26,0,26)TB.Position=UDim2.new(1,-30,0,2)TB.BackgroundColor3=Color3.fromRGB(200,50,50)TB.Text="–"TB.TextColor3=Color3.new(1,1,1)TB.Font=Enum.Font.GothamBold TB.TextSize=18 TB.Parent=T
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,6)
local S=Instance.new("ScrollingFrame")S.Size=UDim2.new(1,-10,1,-40)S.Position=UDim2.new(0,5,0,35)S.BackgroundTransparency=1 S.BorderSizePixel=0 S.ScrollBarThickness=3 S.CanvasSize=UDim2.new(0,0,0,0)S.Parent=M
local L=Instance.new("UIListLayout")L.SortOrder=Enum.SortOrder.LayoutOrder L.Padding=UDim.new(0,4)L.Parent=S
L:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()S.CanvasSize=UDim2.new(0,0,0,L.AbsoluteContentSize.Y+8)end)
TB.MouseButton1Click:Connect(function()S.Visible=not S.Visible M.Size=S.Visible and UDim2.new(0,220,0,300)or UDim2.new(0,220,0,30)TB.Text=S.Visible and "–"or "+"end)
local function btn(txt)B=Instance.new("TextButton")B.Size=UDim2.new(1,0,0,26)B.BackgroundColor3=Color3.fromRGB(40,40,50)B.Text=txt B.TextColor3=Color3.fromRGB(230,230,230)B.Font=Enum.Font.Gotham B.TextSize=13 B.Parent=S Instance.new("UICorner",B).CornerRadius=UDim.new(0,6)return B end
local function tog(txt)B=btn(txt..": OFF")B.BackgroundColor3=Color3.fromRGB(35,35,45)local st=false local function set(v)st=v B.Text=txt..": "..(v and "ON"or "OFF")B.BackgroundColor3=v and Color3.fromRGB(40,120,60)or Color3.fromRGB(35,35,45)end B.MouseButton1Click:Connect(function()set(not st)end)return B,function()return st end,set end
local function getC()return LP.Character or LP.CharacterAdded:Wait()end local function getH()local c=LP.Character return c and c:FindFirstChildOfClass("Humanoid")end local function getR()local c=LP.Character return c and c:FindFirstChild("HumanoidRootPart")end
-- ESP
local EF=Instance.new("Folder")EF.Name="dog_esp"EF.Parent=SG
local eP,eN=false,false local et={}
local function dESP(m)local t=et[m]if not t then return end if t.c then t.c:Disconnect()end if t.b then t.b:Destroy()end et[m]=nil end
local function aESP(m,n,isN)if et[m]then return end
local b=Instance.new("Frame")b.BackgroundTransparency=1 b.BorderSizePixel=0 b.Visible=false b.Parent=EF
local st=Instance.new("UIStroke")st.Color=Color3.fromRGB(255,60,60)st.Thickness=1.5 st.Parent=b
local lb=Instance.new("TextLabel")lb.BackgroundTransparency=1 lb.TextColor3=Color3.new(1,1,1)lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.TextStrokeTransparency=0 lb.TextXAlignment=Enum.TextXAlignment.Center lb.Size=UDim2.new(1,0,0,13)lb.Position=UDim2.new(0,0,-0.15,0)lb.Text=n lb.Parent=b
local info={b=b,s=st,l=lb,c=nil}et[m]=info
info.c=R.RenderStepped:Connect(function()
if not m or not m.Parent then dESP(m)return end
local hrp=m:FindFirstChild("HumanoidRootPart")local h=m:FindFirstChildOfClass("Humanoid")local hd=m:FindFirstChild("Head")
if not hrp or not h or h.Health<=0 then b.Visible=false return end
local tp=(hd and hd.Position+Vector3.new(0,0.6,0))or hrp.Position+Vector3.new(0,2.5,0)
local bp=hrp.Position-Vector3.new(0,3,0)
local a,ao=Cam:WorldToViewportPoint(tp)local c,co=Cam:WorldToViewportPoint(bp)
if not ao or not co or a.Z<0 then b.Visible=false return end
local hh=math.abs(a.Y-c.Y)local ww=hh*0.55
b.Visible=true b.Size=UDim2.new(0,ww,0,hh)b.Position=UDim2.new(0,a.X-ww/2,0,a.Y)
if not isN then local pl=P:GetPlayerFromCharacter(m)st.Color=pl and pl.Team and pl.Team.TeamColor.Color or Color3.fromRGB(255,60,60)else st.Color=Color3.fromRGB(255,165,0)end
lb.Text=n.." HP "..math.floor(h.Health+0.5)end)end
local function isN(m)if not m:FindFirstChildOfClass("Humanoid")then return false end return not P:GetPlayerFromCharacter(m)end
R.Heartbeat:Connect(function()
if eP then for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character then aESP(p.Character,p.Name,false)end end end
if eN then for _,o in pairs(W:GetDescendants())do if o:IsA("Model")and isN(o)and o~=LP.Character then aESP(o,o.Name,true)end end end
end)
task.spawn(function()while true do task.wait(1)for m,_ in pairs(et)do if not m.Parent then dESP(m)end end end end)
-- Float
local fB,fG=tog("Float")local fE=false local fU,fD,fI=20,20,3 local fc,fv,fg local hold=0
local function stopF()hold=0 if fv then fv:Destroy()fv=nil end if fg then fg:Destroy()fg=nil end if fc then fc:Disconnect()fc=nil end local h=getH()if h then h.PlatformStand=false end end
local function startF()local c=getC()local hrp=c:WaitForChild("HumanoidRootPart",3)if not hrp then return end stopF()
fv=Instance.new("BodyVelocity")fv.MaxForce=Vector3.new(1e5,1e5,1e5)fv.Velocity=Vector3.new(0,-fI,0)fv.Parent=hrp
fg=Instance.new("BodyGyro")fg.MaxTorque=Vector3.new(1e5,1e5,1e5)fg.P=1000 fg.Parent=hrp
fc=R.RenderStepped:Connect(function()if not fE then return end local h=getH()if h then h.PlatformStand=true end if fg then fg.CFrame=Cam.CFrame end if fv then fv.Velocity=hold==1 and Vector3.new(0,fU,0)or hold==-1 and Vector3.new(0,-fD,0)or Vector3.new(0,-fI,0)end end)end
fB.MouseButton1Click:Connect(function()task.wait()fE=fG()if fE then startF()else stopF()end end)
local uB=btn("↑ ВВЕРХ")uB.BackgroundColor3=Color3.fromRGB(50,110,60)uB.TextSize=14
local dB=btn("↓ ВНИЗ")dB.BackgroundColor3=Color3.fromRGB(110,50,50)dB.TextSize=14
local function pr(d)if not fE then return end hold=d end local function rl()hold=0 end
uB.MouseButton1Down:Connect(function()pr(1)end)uB.MouseButton1Up:Connect(rl)uB.MouseLeave:Connect(rl)
dB.MouseButton1Down:Connect(function()pr(-1)end)dB.MouseButton1Up:Connect(rl)dB.MouseLeave:Connect(rl)
-- TP по тапу
local tpB,tpG=tog("TP по тапу")local tR=1000
U.InputBegan:Connect(function(i,g)if g or not tpG()then return end if i.UserInputType~=Enum.UserInputType.Touch then return end if #SG:GetGuiObjectsAtPosition(i.Position.X,i.Position.Y)>0 then return end
local ry=Cam:ViewportPointToRay(i.Position.X,i.Position.Y)local pr=RaycastParams.new()pr.FilterType=Enum.RaycastFilterType.Exclude pr.FilterDescendantsInstances={LP.Character}pr.IgnoreWater=true
local r=W:Raycast(ry.Origin,ry.Direction*tR,pr)local pos=r and r.Position or ry.Origin+ry.Direction*tR
local hrp=getR()if hrp then hrp.CFrame=CFrame.new(pos+Vector3.new(0,3,0))end end)
-- ESP тогглы
local ePB,ePG=tog("ESP Игроки")ePB.MouseButton1Click:Connect(function()task.wait()eP=ePG()if not eP then for m,_ in pairs(et)do if P:GetPlayerFromCharacter(m)then dESP(m)end end end end)
local eNB,eNG=tog("ESP NPC")eNB.MouseButton1Click:Connect(function()task.wait()eN=eNG()if not eN then for m,_ in pairs(et)do if isN(m)then dESP(m)end end end end)
LP.CharacterAdded:Connect(function()task.wait(1)if fE then startF()end end)
print("[dog.lua] loaded")