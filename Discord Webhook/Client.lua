local Services = {Players = game:GetService("Players"), ReplicatedStorage = game:GetService("ReplicatedStorage"),}
local Objects = {} Objects.Event = Services.ReplicatedStorage:FindFirstChild("\a\n\a\ne") Objects.MainGui = script.Parent:FindFirstChild("Feedback") Objects.MainFrame = Objects.MainGui:FindFirstChild("Mainframe") Objects.InputBox = Objects.MainFrame:FindFirstChild("InputBox") Objects.Characters = Objects.MainFrame:FindFirstChild("Characters") Objects.Submit = Objects.MainFrame:FindFirstChild("Submit") Objects.Cancel = Objects.MainFrame:FindFirstChild("Cancel") Objects.SF = Objects.MainGui:FindFirstChild("Open") Objects.ThumbUp = Objects.MainFrame:FindFirstChild("ThumbUp") Objects.ThumbDown = Objects.MainFrame:FindFirstChild("ThumbDown")
Objects.Submit.MouseButton1Click:connect(function() Objects.Event:FireServer("submit", {Objects.Submit, Objects.InputBox.Text, Services.Players.LocalPlayer, Objects.InputBox, Objects.ThumbUp.Like.Value, Objects.ThumbDown.Dislike.Value}) end)
Objects.Cancel.MouseButton1Click:connect(function() Objects.Event:FireServer("close", {Objects.MainFrame, Objects.SF}) end)
Objects.SF.MouseButton1Click:connect(function() Objects.Event:FireServer("open", {Objects.MainFrame, Objects.SF}) end)
Objects.InputBox.Changed:connect(function(Property) if Property == "Text" then Objects.Event:FireServer("tchanged", {Objects.InputBox, Objects.Characters, Objects.InputBox.Text}) end end)
Objects.Characters.Changed:connect(function(Property) if Property == "Text" then Objects.Event:FireServer("cchanged", {Objects.InputBox, Objects.Characters, Objects.Submit, Property}) end end)
Objects.ThumbUp.MouseButton1Click:connect(function() Objects.Event:FireServer("like", {Objects.ThumbUp, Objects.ThumbDown, Objects.ThumbUp:WaitForChild("Like").Value, Objects.ThumbDown.Dislike.Value, "rbxassetid://571463067", "rbxassetid://571465244", "rbxassetid://571463222"}) end)
Objects.ThumbDown.MouseButton1Click:connect(function() Objects.Event:FireServer("dislike", {Objects.ThumbUp, Objects.ThumbDown, Objects.ThumbUp.Like.Value, Objects.ThumbDown.Dislike.Value, "rbxassetid://571463067", "rbxassetid://571465244", "rbxassetid://571463521"}) end)