﻿----------------------------------------------------------------------------------------------
hook.Run("AddPIMOption", PIM.options)
----------------------------------------------------------------------------------------------
function PIM:CheckDistance(client, ent)
    return ent:GetPos():DistToSqr(client:GetPos()) < lia.config.MaxInteractionDistance
end

----------------------------------------------------------------------------------------------
function PIM:AddOption(name, data)
    self.options[name] = data
end
----------------------------------------------------------------------------------------------
