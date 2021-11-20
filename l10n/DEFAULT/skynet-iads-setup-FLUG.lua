do

--create an instance of the IADS
redIADS = SkynetIADS:create('FLUG')


---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = false
iadsDebug.ewRadarNoConnection = false
iadsDebug.samNoConnection = false
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = false
iadsDebug.hasNoPower = false
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
iadsDebug.commandCenterStatusEnvOutput = true
---end remove debug ---


--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EWA')



--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('IADSA')


-- POINT DEFENCE SA-2
local sa15 = redIADS:getSAMSiteByGroupName('IADSA_SA15_PD_1')
redIADS:getSAMSiteByGroupName('IADSA_SA2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)


local sa15 = redIADS:getSAMSiteByGroupName('IADSA_SA15_PD_2')
redIADS:getSAMSiteByGroupName('IADSA_SA2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)


--Add threat site 6 (SA-11) to IADS
redIADS:addSAMSite('Threatsite_6')

-- activate the IADS 
--redIADSA:activate()	
redIADS:setupSAMSitesAndThenActivate()


end

