local playerMeta = FindMetaTable("Player")

function playerMeta:SetWeighPoint(name, vector, OnReach)
    hook.Add("HUDPaint", "WeighPoint", function()
        local dist = self:GetPos():Distance(vector)
        local spos = vector:ToScreen()
        local howclose = math.Round(math.floor(dist) / 40)
        if not spos then return end
        render.SuppressEngineLighting(true)
        surface.SetFont("WB_Large")
        draw.DrawText(name .. "\n" .. howclose .. " Meters\n", "CenterPrintText", spos.x, spos.y, Color(123, 57, 209), TEXT_ALIGN_CENTER)
        render.SuppressEngineLighting(false)

        if howclose <= 3 then
            RunConsoleCommand("weighpoint_stop")
        end
    end)
end

concommand.Add("weighpoint_stop",function()
    hook.Add("HUDPaint", "WeighPoint", function() end)
    OnReach()
end)