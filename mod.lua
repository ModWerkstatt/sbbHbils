function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
			{
		        name = "jay_",
		        role = "CREATOR",
		    },
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
				params = {			
			{
				key = "soundCheck",
				name = _("sound_check"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,	
			},
		},
		tags = { "europe", "waggon", "schweiz", "switzerland", "UIC", "gueterwagen", "sbb" },
		tfnetId = { },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
	},

		runFn = function (settings, modParams)
		local params = modParams[getCurrentModId()]
	
		local function metadataHandler(fileName, data)
			if params.soundCheck == 0 then
				if fileName:match('/vehicle/waggon/hbilsGlatt/sbbHbils_([^/]*.mdl)') or fileName:match('/vehicle/waggon/hbilsRiffle/sbbHbils_([^/]*.mdl)') then
					data.metadata.railVehicle.soundSet.name = "waggon_freight_modern"
				end
			end
			return data
		end

		addModifier( "loadModel", metadataHandler )
	end,
}
end
