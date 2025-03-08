SMODS.Atlas {
  key = "ZStar11",
  path = "z11.png",
  px = 71,
  py = 95
}

SMODS.Joker {
  key = "zstar11joker",
  loc_txt = {
    name = "Z*_11",
    text = {
      "{X:mult,C:white} XMult {} by the product",
      "of all scored",
      "{C:attention} number cards {}modulo 11"
    }
  },
  rarity = 3,
  atlas = "ZStar11",
  pos = { x= 0, y = 0 },
  cost = 11,
  -- Scoring calculation
  calculate = function(self, card, context)
    if context.joker_main then
      local xmult_mod_11 = 1
      for _, v in ipairs(context.scoring_hand) do 
        local numeric_value = v:get_id()
        -- Do not trigger on face cards
        if (numeric_value ~= 11 and numeric_value ~= 12 and numeric_value ~= 13) then
          -- Aces should count as 1 = 1 mod 11, not 14 = 3 mod 11
          if numeric_value == 14 then
            numeric_value = 1
          end
            xmult_mod_11 = xmult_mod_11 * numeric_value % 11
        end
      end
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { xmult_mod_11 } },
        Xmult_mod = xmult_mod_11
      }
    end
  end
}

-- NB9D2VX1 (jokur pak)