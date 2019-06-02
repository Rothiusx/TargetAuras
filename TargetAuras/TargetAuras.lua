hooksecurefunc("TargetFrame_UpdateAuraPositions", function(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	local LARGE_AURA_SIZE = 26
	local SMALL_AURA_SIZE = 21
	local AURA_OFFSET = 2
	local size
	local offsetY = AURA_OFFSET
	local rowWidth = 0
	local firstBuffOnRow = 1
	for i = 1, numAuras do
		if (largeAuraList[i]) then
			size = LARGE_AURA_SIZE
			offsetX = AURA_OFFSET + 1
			offsetY = AURA_OFFSET + 1
		else
			size = SMALL_AURA_SIZE
		end
		if (i == 1) then
			rowWidth = size
			self.auraRows = self.auraRows + 1
		else
			rowWidth = rowWidth + size + offsetX
		end
		if (rowWidth > maxRowWidth) then
			updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically)
			rowWidth = size
			self.auraRows = self.auraRows + 1
			firstBuffOnRow = i
			offsetY = AURA_OFFSET
		else
			updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY, mirrorAurasVertically)
		end
	end
end)