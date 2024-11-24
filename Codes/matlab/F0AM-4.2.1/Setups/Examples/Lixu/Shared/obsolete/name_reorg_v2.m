%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input names inconsistenc due to mechanisms (customized)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Naming setting for MCM and GEOS-Chem
% priorize the base setting
% This section is for compounds both exist in MCM and GEOS-Chem but with different names
% Lixu, 2023/04/05, using C2H5CHO as the RCHO in the MCM 
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
        % Common compounds but different names 
        nJNO2  = 'J4'; 
        nJO3   = 'J1';
        nJHONO = 'J7';
        nJH2O2 = 'J3';
        nJHNO3 = 'J8';
        nJHCHO_HO2 = 'J11';
        nJHCHO_H2  = 'J12';
        nJNO3_NO   = 'J5';
        nJNO3_NO2  = 'J6';

        % For FIREX-AQ
        nJO3_O3P      = 'J2'; % JO3P
        nJCH3CHO_CH3  = 'J13'; %JALD2a
        nJCHOCHO_H2   = 'J31'; %JGLYXb
        nJCHOCHO_CH2O = 'J32';
        nJCHOCHO_HCO  = 'J33'; %JGLYXa
        nJCH3OOH      = 'J41'; %JCH3OOH 
        
        nHONO = 'HONO';
        nHCHO = 'HCHO';
        nALD2 =  'CH3CHO';
        nGLYX = 'GLYOX';
        nBENZ = 'BENZENE';
        nTOLU = 'TOLUENE';
        nACTA = 'CH3CO2H';
        nISOP = 'C5H8';
        nMOH  = 'CH3OH'; 
        nEOH  = 'C2H5OH';
        nACET = 'CH3COCH3';
        nGLYC = 'HOCH2CHO';
        nMAP  = 'CH3CO3H';
        nMGLY = 'MGLYOX';
        nHAC  = 'ACETOL';
        nIHN  = 'ISOPANO3';
        nRIPA = 'IEPOXA';
        nPHEN = 'PHENOL';
        nBALD = 'BENZAL';
        nCSL  = 'CRESOL';
        
        % Compounds that not in GEOS-Chem or lumped species        
        nC3H4 = 'C3H4';
        nC2H4 = 'C2H4';
        
        nPRPE     = 'lumpdummy1';
        nC3H6     = 'C3H6';
        nBUT1ENE  = 'BUT1ENE';
        nTBUT2ENE = 'TBUT2ENE';
        nCBUT2ENE = 'CBUT2ENE';
        nPENT1ENE = 'PENT1ENE';
        nHEX1ENE  = 'HEX1ENE';
        
        nALK4   = 'lumpdummy2';
        nNC4H10 = 'NC4H10';
        nIC4H10 = 'IC4H10';
        nNC5H12 = 'NC5H12';
        nIC5H12 = 'IC5H12';
        nNC6H14 = 'NC6H14';
        nM2PE   = 'M2PE';
        nM3PE   = 'M3PE';
        nM22C4  = 'M22C4';
        nNC7H16 = 'NC7H16';
        nNC8H18 = 'NC8H18';
        nNC9H20 = 'NC9H20';
        nNC10H22 = 'NC10H22';
        nNC11H24 = 'NC11H24';
        % Lixu, 2023/04/05, changing the data here.
        nRCHO    = 'C2H5CHO';
        nC2H5CHO = 'lumpdummy11';
        nC3H7CHO = 'C3H7CHO';
        nIPRCHO  =  'IPRCHO';
        nBUT2CHO = 'BUT2CHO';        
        
        nXYLE   = 'lumpdummy4';
        nmpXYLE = 'PXYL';
        noXYLE  = 'OXYL';
        netBENZ = 'EBENZ';
        
        nMTPA     = 'lumpdummy5';
        nAPINENE  = 'APINENE';
        nBPINENE  = 'BPINENE'; 
        nLIMONENE = 'LIMONENE';
        
        nC3H7OH = 'C3H7OH';
        
        nFURAN  = 'FURAN';
        nM3F    = 'M3F';
        nM2FURAN    = 'M2FURAN';
        nDIMEFURAN  = 'DIMEFURAN';
        nFURFURAL   = 'FURFURAL';
        nMEFURFURAL = 'MEFURFURAL';
        nBZFUONE    = 'BZFUONE';
        
        nACR = 'ACR';
        
        nMETHACET = 'METHACET';
        nETHFORM  = 'ETHFORM';
        
        nIC3H7NO3 = 'IC3H7NO3';
        nNC3H7NO3 = 'NC3H7NO3';
        
        nMALANHY = 'MALANHY';
        
        nC4H6 = 'C4H6';
        nC4ALDB = 'C4ALDB';
        nBIACET = 'BIACET';

        nIC4H9NO3 = 'IC4H9NO3';
        nNC4H9NO3 = 'NC4H9NO3';
        
        nMPRK = 'MPRK';
        nDIEK = 'DIEK';
        nCATECHOL = 'CATECHOL';
        nCYHEXOL = 'CYHEXOL';
        nC5H11CHO = 'C5H11CHO';
        nGUAIACOL = 'GUAIACOL';
        nC6H13CHO = 'C6H13CHO';
        nHEPT3ONE = 'HEPT3ONE';
        nSTYRENE = 'STYRENE';
        nOXYLAL = 'OXYLAL';
        nMGUAIACOL= 'MGUAIACOL';
        nSYRINGOL = 'SYRINGOL';
        nMPHCOME = 'MPHCOME';
        
        nTM123B = 'TM123B';
        nIPBENZ = 'IPBENZ';
        nPBENZ = 'PBENZ';
        nMETHTOL = 'METHTOL';
        nPETHTOL = 'PETHTOL';
        nTM135B = 'TM135B';
        nOETHTOL = 'OETHTOL';
        nTM134B  = 'TM134B';
        
        nPINIC = 'PINIC';
        nPINONIC = 'PINONIC';
        nBCARY = 'BCARY';
        
        % For FIREX-AQ
        nACO2H = 'ACO2H';
        nOXYLOL = 'OXYLOL';
        nMETHCOACET = 'METHCOACET';
        nPBZQONE   = 'PBZQONE';
        nACETONIT  = 'ACETONIT';
        nNCATECHOL = 'NCATECHOL';

        % For additional VOCs based on Wolfe 2022
        nMEKAOH       = 'dummy300'; 
        nC512OOH      = 'dummy301';  
        nHEX3ONDOOH   = 'dummy302';
        nM3HEXANO3    = 'dummy303';    
        nCO1M22CHO    = 'dummy304';    
        nHO2CO4CHO    = 'dummy305';     
        nPEBOH        = 'dummy306';             
        nC4DBDIKET    = 'dummy307';      
        nHO25C6       = 'dummy308';           
        nC7CO4EDB     = 'dummy309';         
        nMAE          = 'dummy310';               
        nLIMKET       = 'dummy311';            
        nACO2H        = 'dummy312';             
        nCO2M33CO3H   = 'dummy313';     
        nHO25C7       = 'dummy314';            
        nHMACO3H      = 'dummy315';          
        nHO3C5CHO     = 'dummy317';          
        nM23C4        = 'dummy318';             
        nUDECOH       = 'dummy319';            
        nDECOH        = 'dummy320';             
        nCHCL2CHO     = 'dummy321';         
        nNOPINAOH     = 'dummy322';          
        nIEB4CHO      = 'dummy323';           
        nDICLETOH     = 'dummy324';         
        nETBE         = 'dummy325';              
        nME2BUT2ENE   = 'dummy326';
        nM3PECOOH     = 'dummy327';      
        nETHOX        = 'dummy328';             
        nC8BCCO       = 'dummy329';            
        nC7MOCOCO3H   = 'dummy330';  
        nCCL3CHO      = 'dummy331';           
        nCH3CCL2OH    = 'dummy332';        
        nME2BUT1ENE   = 'dummy334';    
        nEMPHCOME     = 'dummy335';         
        nMC6OTKETOH   = 'dummy336';        
        nIBUTOL       = 'dummy337';            
        nMIPK         = 'dummy338';              
        nC108NO3      = 'dummy339';         
        nCL12PRCHO    = 'dummy340';       
        nC129CO       = 'dummy341';            
        nALLYLOH      = 'dummy342';           
        nPINAL        = 'dummy343';             
        nHM33C4OH     = 'dummy344';        
        nNC1313OH     = 'dummy345';         
        nTBUACET      = 'dummy346';           
        nC828PAN      = 'dummy347';           
        nCYHXONAOOH   = 'dummy348';    
        nACECOCOCH3   = 'dummy349';     
        nC5PAN6       = 'dummy350';            
        nACCOPRONE    = 'dummy351';      
        nM3PEAOH      = 'dummy352';           
        nH25M2C6      = 'dummy353';           
        nNC71CO       = 'dummy354';           
        nH2M3C4CHO    = 'dummy356';      
        nMEPROPENE    = 'dummy357';        
        nM2PEDOH      = 'dummy358';           
        nC6CO2OHPAN   = 'dummy359';       
        nDDEC3ONE     = 'dummy360';          
        nHO36C10      = 'dummy361';           
        nC126CHO      = 'dummy362';           
        nEOX2COMEOH   = 'dummy363';      
        nC920PAN      = 'dummy364';           
        nPXYCATECH    = 'dummy365';         
        nBCKET        = 'dummy366';             
        nNPRACBOOH    = 'dummy367';   
        nTHEX2ENE     = 'dummy368';          
        nMALDALCO3H   = 'dummy370';    
        nPROPACID     = 'dummy372';         
        nETHOXOOH     = 'dummy373';         
        nIPECOH       = 'dummy376'; 
%==============================================
    case {'MCMv331_extension'}
        % Common compounds but different names 
        nJNO2  = 'J4'; 
        nJO3   = 'J1';
        nJHONO = 'J7';
        nJH2O2 = 'J3';
        nJHNO3 = 'J8';
        nJHCHO_HO2 = 'J11';
        nJHCHO_H2  = 'J12';
        nJNO3_NO   = 'J5';
        nJNO3_NO2  = 'J6';

        % For FIREX-AQ
        nJO3_O3P      = 'J2'; % JO3P
        nJCH3CHO_CH3  = 'J13'; %JALD2a
        nJCHOCHO_H2   = 'J31'; %JGLYXb
        nJCHOCHO_CH2O = 'J32';
        nJCHOCHO_HCO  = 'J33'; %JGLYXa
        nJCH3OOH      = 'J41'; %JCH3OOH 
        
        nHONO = 'HONO';
        nHCHO = 'HCHO';
        nALD2 =  'CH3CHO';
        nGLYX = 'GLYOX';
        nBENZ = 'BENZENE';
        nTOLU = 'TOLUENE';
        nACTA = 'CH3CO2H';
        nISOP = 'C5H8';
        nMOH  = 'CH3OH'; 
        nEOH  = 'C2H5OH';
        nACET = 'CH3COCH3';
        nGLYC = 'HOCH2CHO';
        nMAP  = 'CH3CO3H';
        nMGLY = 'MGLYOX';
        nHAC  = 'ACETOL';
        nIHN  = 'ISOPANO3';
        nRIPA = 'IEPOXA';
        nPHEN = 'PHENOL';
        nBALD = 'BENZAL';
        nCSL  = 'CRESOL';
        
        % Compounds that not in GEOS-Chem or lumped species        
        nC3H4 = 'C3H4';
        nC2H4 = 'C2H4';
        
        nPRPE     = 'lumpdummy1';
        nC3H6     = 'C3H6';
        nBUT1ENE  = 'BUT1ENE';
        nTBUT2ENE = 'TBUT2ENE';
        nCBUT2ENE = 'CBUT2ENE';
        nPENT1ENE = 'PENT1ENE';
        nHEX1ENE  = 'HEX1ENE';
        
        nALK4   = 'lumpdummy2';
        nNC4H10 = 'NC4H10';
        nIC4H10 = 'IC4H10';
        nNC5H12 = 'NC5H12';
        nIC5H12 = 'IC5H12';
        nNC6H14 = 'NC6H14';
        nM2PE   = 'M2PE';
        nM3PE   = 'M3PE';
        nM22C4  = 'M22C4';
        nNC7H16 = 'NC7H16';
        nNC8H18 = 'NC8H18';
        nNC9H20 = 'NC9H20';
        nNC10H22 = 'NC10H22';
        nNC11H24 = 'NC11H24';
        % Lixu, 2023/04/05, changing the data here.
        nRCHO    = 'C2H5CHO';
        nC2H5CHO = 'lumpdummy11';
        nC3H7CHO = 'C3H7CHO';
        nIPRCHO  =  'IPRCHO';
        nBUT2CHO = 'BUT2CHO';        
        
        nXYLE   = 'lumpdummy4';
        nmpXYLE = 'PXYL';
        noXYLE  = 'OXYL';
        netBENZ = 'EBENZ';
        
        nMTPA     = 'lumpdummy5';
        nAPINENE  = 'APINENE';
        nBPINENE  = 'BPINENE'; 
        nLIMONENE = 'LIMONENE';
        
        nC3H7OH = 'C3H7OH';
        
        nFURAN  = 'FURAN';
        nM3F    = 'M3F';
        nM2FURAN    = 'M2FURAN';
        nDIMEFURAN  = 'DIMEFURAN';
        nFURFURAL   = 'FURFURAL';
        nMEFURFURAL = 'MEFURFURAL';
        nBZFUONE    = 'BZFUONE';
        
        nACR = 'ACR';
        
        nMETHACET = 'METHACET';
        nETHFORM  = 'ETHFORM';
        
        nIC3H7NO3 = 'IC3H7NO3';
        nNC3H7NO3 = 'NC3H7NO3';
        
        nMALANHY = 'MALANHY';
        
        nC4H6 = 'C4H6';
        nC4ALDB = 'C4ALDB';
        nBIACET = 'BIACET';

        nIC4H9NO3 = 'IC4H9NO3';
        nNC4H9NO3 = 'NC4H9NO3';
        
        nMPRK = 'MPRK';
        nDIEK = 'DIEK';
        nCATECHOL = 'CATECHOL';
        nCYHEXOL = 'CYHEXOL';
        nC5H11CHO = 'C5H11CHO';
        nGUAIACOL = 'GUAIACOL';
        nC6H13CHO = 'C6H13CHO';
        nHEPT3ONE = 'HEPT3ONE';
        nSTYRENE = 'STYRENE';
        nOXYLAL = 'OXYLAL';
        nMGUAIACOL= 'MGUAIACOL';
        nSYRINGOL = 'SYRINGOL';
        nMPHCOME = 'MPHCOME';
        
        nTM123B = 'TM123B';
        nIPBENZ = 'IPBENZ';
        nPBENZ = 'PBENZ';
        nMETHTOL = 'METHTOL';
        nPETHTOL = 'PETHTOL';
        nTM135B = 'TM135B';
        nOETHTOL = 'OETHTOL';
        nTM134B  = 'TM134B';
        
        nPINIC = 'PINIC';
        nPINONIC = 'PINONIC';
        nBCARY = 'BCARY';
        
        % For FIREX-AQ
        %nACO2H = 'ACO2H';
        nOXYLOL = 'OXYLOL';
        nMETHCOACET = 'METHCOACET';
        nPBZQONE   = 'PBZQONE';
        nACETONIT  = 'ACETONIT';
        nNCATECHOL = 'NCATECHOL';
    
        % copy and paste above from the basics
        % For additional VOCs based on Wolfe 2022
        nMEKAOH       = 'MEKAOH';   
        nC512OOH      = 'C512OOH';   
        nHEX3ONDOOH   = 'HEX3ONDOOH'; 
        nM3HEXANO3    = 'M3HEXANO3';   
        nCO1M22CHO    = 'CO1M22CHO';    
        nHO2CO4CHO    = 'HO2CO4CHO';     
        nPEBOH        = 'PEBOH';         
        nC4DBDIKET    = 'C4DBDIKET';      
        nHO25C6       = 'HO25C6';           
        nC7CO4EDB     = 'C7CO4EDB';         
        nMAE          = 'MAE';               
        nLIMKET       = 'LIMKET';            
        nACO2H        = 'ACO2H';             
        nCO2M33CO3H   = 'CO2M33CO3H';     
        nHO25C7       = 'HO25C7';            
        nHMACO3H      = 'HMACO3H';          
        nHO3C5CHO     = 'HO3C5CHO';          
        nM23C4        = 'M23C4';             
        nUDECOH       = 'UDECOH';            
        nDECOH        = 'DECOH';             
        nCHCL2CHO     = 'CHCL2CHO';         
        nNOPINAOH     = 'NOPINAOH';          
        nIEB4CHO      = 'IEB4CHO';           
        nDICLETOH     = 'DICLETOH';         
        nETBE         = 'ETBE';              
        nME2BUT2ENE   = 'ME2BUT2ENE';
        nM3PECOOH     = 'M3PECOOH';      
        nETHOX        = 'ETHOX';             
        nC8BCCO       = 'C8BCCO';            
        nC7MOCOCO3H   = 'C7MOCOCO3H';  
        nCCL3CHO      = 'CCL3CHO';           
        nCH3CCL2OH    = 'CH3CCL2OH';        
        nME2BUT1ENE   = 'ME2BUT1ENE';    
        nEMPHCOME     = 'EMPHCOME';         
        nMC6OTKETOH   = 'MC6OTKETOH';        
        nIBUTOL       = 'IBUTOL';            
        nMIPK         = 'MIPK';              
        nC108NO3      = 'C108NO3';         
        nCL12PRCHO    = 'CL12PRCHO';       
        nC129CO       = 'C129CO';            
        nALLYLOH      = 'ALLYLOH';           
        nPINAL        = 'PINAL';             
        nHM33C4OH     = 'HM33C4OH';        
        nNC1313OH     = 'NC1313OH';         
        nTBUACET      = 'TBUACET';           
        nC828PAN      = 'C828PAN';           
        nCYHXONAOOH   = 'CYHXONAOOH';    
        nACECOCOCH3   = 'ACECOCOCH3';     
        nC5PAN6       = 'C5PAN6';            
        nACCOPRONE    = 'ACCOPRONE';      
        nM3PEAOH      = 'M3PEAOH';           
        nH25M2C6      = 'H25M2C6';           
        nNC71CO       = 'NC71CO';           
        nC129CO       = 'C129CO';            
        nH2M3C4CHO    = 'H2M3C4CHO';      
        nMEPROPENE    = 'MEPROPENE';        
        nM2PEDOH      = 'M2PEDOH';           
        nC6CO2OHPAN   = 'C6CO2OHPAN';       
        nDDEC3ONE     = 'DDEC3ONE';          
        nHO36C10      = 'HO36C10';           
        nC126CHO      = 'C126CHO';           
        nEOX2COMEOH   = 'EOX2COMEOH';      
        nC920PAN      = 'C920PAN';           
        nPXYCATECH    = 'PXYCATECH';         
        nBCKET        = 'BCKET';             
        nNPRACBOOH    = 'NPRACBOOH';   
        nTHEX2ENE     = 'THEX2ENE';          
        nMALDALCO3H   = 'MALDALCO3H';    
        nPROPACID     = 'PROPACID';         
        nETHOXOOH     = 'ETHOXOOH';         
        nPROPACID     = 'PROPACID';         
        nIPECOH       = 'IPECOH';   
%==============================================================================
    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_HCOOH'}
        % common compounds with different names
        nJNO2    = 'JNO2'; 
        nJO3     = 'JO1D';
        nJHONO   = 'JHONO';
        nJH2O2   = 'JH2O2';
        nJHNO3   = 'JHNO3';
        nJHCHO_HO2 = 'JHCHO_HO2';
        nJHCHO_H2  = 'JHCHO_H2';
        nJNO3_NO   = 'JNO3_NO';
        nJNO3_NO2  = 'JNO3_NO2';
        
        % For FIREX-AQ
        nJO3_O3P      = 'JO3P'; % JO3P
        nJCH3CHO_CH3  = 'JALD2a'; %JALD2a
        nJCHOCHO_H2   = 'JGLYXb'; %JGLYXb
        nJCHOCHO_CH2O = 'JGLYXc';
        nJCHOCHO_HCO  = 'JGLYXa'; %JGLYXa
        nJCH3OOH      = 'JCH3OOH'; %JCH3OOH 
        
        nHONO = 'HNO2';
        nHCHO = 'CH2O';
        nALD2 =  'ALD2';
        nGLYX = 'GLYX';
        nBENZ = 'BENZ';
        nTOLU = 'TOLU';
        nACTA = 'ACTA';
        nISOP = 'ISOP';
        nMOH  = 'MOH'; 
        nEOH  = 'EOH';
        nACET = 'ACET';
        nGLYC = 'GLYC';
        nMAP  = 'MAP';
        nMGLY = 'MGLY';
        nHAC  = 'HAC';
        nIHN  = 'IHN1';
        nRIPA = 'RIPA';
        nPHEN = 'PHEN';
        nBALD = 'BALD';
        nCSL  = 'CSL';
        % Compounds that not in GEOS-Chem experiments
        nC3H4 = 'dummy1';
        nC2H4 = 'C2H4';

        nPRPE = 'PRPE';
        nC3H6 = 'dummy2';
        nBUT1ENE = 'dummy3';
        nTBUT2ENE = 'dummy4';
        nCBUT2ENE = 'dummy5';
        nME3BUT1ENE= 'dummy6';
        nPENT1ENE = 'dummy110';
        nHEX1ENE= 'dummy7';
        
        nALK4 = 'ALK4';
        nNC4H10 = 'dummy8';
        nIC4H10 = 'dummy9';
        nNC5H12 = 'dummy11';
        nIC5H12 = 'dummy10';
        nNC6H14 = 'dummy12';
        nM2PE   = 'dummy13';
        nM3PE   = 'dummy14';
        nM22C4  = 'dummy15';
        nNC7H16 = 'dummy16';
        nNC8H18 = 'dummy17';
        nNC9H20 = 'dummy18';
        nNC10H22 = 'dummy19';
        nNC11H24 = 'dummy20';

        nRCHO = 'RCHO';
        nC2H5CHO = 'dummy21';
        nC3H7CHO = 'dummy22';
        nIPRCHO =  'dummy23';
        nBUT2CHO  = 'dummy24';        
        
        nXYLE = 'XYLE';
        nmpXYLE = 'dummy25';
        noXYLE = 'dummy26';
        netBENZ = 'dummy27';
        
        nMTPA = 'MTPA';
        nAPINENE = 'dummy28';
        nBPINENE = 'dummy29'; 
        nLIMONENE = 'dummy30';
        
        nC3H7OH = 'dummy31';
        
        nFURAN  = 'dummy32';
        nM3F    = 'dummy33';
        nM2FURAN = 'dummy34';
        nDIMEFURAN = 'dummy35';
        nFURFURAL  = 'dummy36';
        nMEFURFURAL = 'dummy37';
        nBZFUONE    = 'dummy120';
        
        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
        
        nMALANHY = 'dummy43';
        
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nC5H11CHO = 'dummy53';
        nGUAIACOL = 'dummy54';
        nC6H13CHO = 'dummy55';
        nHEPT3ONE = 'dummy56';

        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';

        % For FIREX-AQ
        nACO2H = 'dummy201';
        nOXYLOL = 'dummy202';
        nMETHCOACET = 'dummy203';
        nPBZQONE = 'dummy204';
        nACETONIT = 'dummy205';
        nNCATECHOL = 'dummy206';

        % For additional VOCs based on Wolfe 2022
        nMEKAOH       = 'dummy300';   
        nC512OOH      = 'dummy301';   
        nHEX3ONDOOH   = 'dummy302'; 
        nM3HEXANO3    = 'dummy303';    
        nCO1M22CHO    = 'dummy304';    
        nHO2CO4CHO    = 'dummy305';     
        nPEBOH        = 'dummy306';             
        nC4DBDIKET    = 'dummy307';      
        nHO25C6       = 'dummy308';           
        nC7CO4EDB     = 'dummy309';         
        nMAE          = 'dummy310';               
        nLIMKET       = 'dummy311';            
        nACO2H        = 'dummy312';             
        nCO2M33CO3H   = 'dummy313';     
        nHO25C7       = 'dummy314';            
        nHMACO3H      = 'dummy315';          
        nM3HEXANO3    = 'dummy316';        
        nHO3C5CHO     = 'dummy317';          
        nM23C4        = 'dummy318';             
        nUDECOH       = 'dummy319';            
        nDECOH        = 'dummy320';             
        nCHCL2CHO     = 'dummy321';         
        nNOPINAOH     = 'dummy322';          
        nIEB4CHO      = 'dummy323';           
        nDICLETOH     = 'dummy324';         
        nETBE         = 'dummy325';              
        nME2BUT2ENE   = 'dummy326';
        nM3PECOOH     = 'dummy327';      
        nETHOX        = 'dummy328';             
        nC8BCCO       = 'dummy329';            
        nC7MOCOCO3H   = 'dummy330';  
        nCCL3CHO      = 'dummy331';           
        nCH3CCL2OH    = 'dummy332';        
        nNC9H20       = 'dummy381';            
        nME2BUT1ENE   = 'dummy334';    
        nEMPHCOME     = 'dummy335';         
        nMC6OTKETOH   = 'dummy336';        
        nIBUTOL       = 'dummy337';            
        nMIPK         = 'dummy338';              
        nC108NO3      = 'dummy339';         
        nCL12PRCHO    = 'dummy340';       
        nC129CO       = 'dummy341';            
        nALLYLOH      = 'dummy342';           
        nPINAL        = 'dummy343';             
        nHM33C4OH     = 'dummy344';        
        nNC1313OH     = 'dummy345';         
        nTBUACET      = 'dummy346';           
        nC828PAN      = 'dummy347';           
        nCYHXONAOOH   = 'dummy348';    
        nACECOCOCH3   = 'dummy349';     
        nC5PAN6       = 'dummy350';            
        nACCOPRONE    = 'dummy351';      
        nM3PEAOH      = 'dummy352';           
        nH25M2C6      = 'dummy353';           
        nNC71CO       = 'dummy354';           
        nC129CO       = 'dummy355';            
        nH2M3C4CHO    = 'dummy356';      
        nMEPROPENE    = 'dummy357';        
        nM2PEDOH      = 'dummy358';           
        nC6CO2OHPAN   = 'dummy359';       
        nDDEC3ONE     = 'dummy360';          
        nHO36C10      = 'dummy361';           
        nC126CHO      = 'dummy362';           
        nEOX2COMEOH   = 'dummy363';      
        nC920PAN      = 'dummy364';           
        nPXYCATECH    = 'dummy365';         
        nBCKET        = 'dummy366';             
        nNPRACBOOH    = 'dummy367';   
        nTHEX2ENE     = 'dummy368';          
        nNC11H24      = 'dummy369';           
        nMALDALCO3H   = 'dummy370';    
        nDICLETOH     = 'dummy371';          
        nPROPACID     = 'dummy372';         
        nETHOXOOH     = 'dummy373';         
        nETHOX        = 'dummy374';             
        nIPECOH       = 'dummy376'; 
%==================================================================================
    case {'GCv13_MCM_missing'}
        % common compounds with different names
        nJNO2    = 'JNO2'; 
        nJO3     = 'JO1D';
        nJHONO   = 'JHONO';
        nJH2O2   = 'JH2O2';
        nJHNO3   = 'JHNO3';
        nJHCHO_HO2 = 'JHCHO_HO2';
        nJHCHO_H2  = 'JHCHO_H2';
        nJNO3_NO   = 'JNO3_NO';
        nJNO3_NO2  = 'JNO3_NO2';
        
        % For FIREX-AQ
        nJO3_O3P      = 'JO3P'; % JO3P
        nJCH3CHO_CH3  = 'JALD2a'; %JALD2a
        nJCHOCHO_H2   = 'JGLYXb'; %JGLYXb
        nJCHOCHO_CH2O = 'JGLYXc';
        nJCHOCHO_HCO  = 'JGLYXa'; %JGLYXa
        nJCH3OOH      = 'JCH3OOH'; %JCH3OOH 
        
        nHONO = 'HNO2';
        nHCHO = 'CH2O';
        nALD2 =  'ALD2';
        nGLYX = 'GLYX';
        nBENZ = 'BENZ';
        nTOLU = 'TOLU';
        nACTA = 'ACTA';
        nISOP = 'ISOP';
        nMOH  = 'MOH'; 
        nEOH  = 'EOH';
        nACET = 'ACET';
        nGLYC = 'GLYC';
        nMAP  = 'MAP';
        nMGLY = 'MGLY';
        nHAC  = 'HAC';
        nIHN  = 'IHN1';
        nRIPA = 'RIPA';
        nPHEN = 'PHEN';
        nBALD = 'BALD';
        nCSL  = 'CSL';
        % Compounds that not in GEOS-Chem experiments
        nC3H4 = 'dummy1';
        nC2H4 = 'C2H4';

        nPRPE = 'PRPE';
        nC3H6 = 'dummy2';
        nBUT1ENE = 'dummy3';
        nTBUT2ENE = 'dummy4';
        nCBUT2ENE = 'dummy5';
        nME3BUT1ENE= 'dummy6';
        nPENT1ENE = 'dummy110';
        nHEX1ENE= 'dummy7';
        
        nALK4 = 'ALK4';
        nNC4H10 = 'dummy8';
        nIC4H10 = 'dummy9';
        nNC5H12 = 'dummy11';
        nIC5H12 = 'dummy10';
        nNC6H14 = 'dummy12';
        nM2PE   = 'dummy13';
        nM3PE   = 'dummy14';
        nM22C4  = 'dummy15';
        nNC7H16 = 'dummy16';
        nNC8H18 = 'dummy17';
        nNC9H20 = 'dummy18';
        nNC10H22 = 'dummy19';
        nNC11H24 = 'dummy20';

        nRCHO = 'RCHO';
        nC2H5CHO = 'dummy21';
        nC3H7CHO = 'dummy22';
        nIPRCHO =  'dummy23';
        nBUT2CHO  = 'dummy24';        
        
        nXYLE = 'XYLE';
        nmpXYLE = 'dummy25';
        noXYLE = 'dummy26';
        netBENZ = 'dummy27';
        
        nMTPA = 'MTPA';
        nAPINENE = 'dummy28';
        nBPINENE = 'dummy29'; 
        nLIMONENE = 'dummy30';
        
        nC3H7OH = 'dummy31';
% ==================================================
        nFURAN  = 'FURAN';
        nM3F    = 'M3F';
        nM2FURAN    = 'M2FURAN';
        nDIMEFURAN  = 'DIMEFURAN';
        nFURFURAL   = 'FURFURAL';
        nMEFURFURAL = 'MEFURFURAL';
        nBZFUONE    = 'BZFUONE';
        
        nACR = 'ACR';
        
        nMETHACET = 'METHACET';
        nETHFORM  = 'ETHFORM';
        
        nIC3H7NO3 = 'IC3H7NO3';
        nNC3H7NO3 = 'NC3H7NO3';
        
        nMALANHY = 'MALANHY';
        
        nC4H6 = 'C4H6';
        nC4ALDB = 'C4ALDB';
        nBIACET = 'BIACET';


        nIC4H9NO3 = 'IC4H9NO3';
        nNC4H9NO3 = 'NC4H9NO3';
        
        nMPRK = 'MPRK';
        nDIEK = 'DIEK';
        nCATECHOL = 'CATECHOL';
        nCYHEXOL = 'CYHEXOL';
        nC5H11CHO = 'C5H11CHO';
        nGUAIACOL = 'GUAIACOL';
        nC6H13CHO = 'C6H13CHO';
        nHEPT3ONE = 'HEPT3ONE';
        nSTYRENE = 'STYRENE';
        nOXYLAL = 'OXYLAL';
        nMGUAIACOL= 'MGUAIACOL';
        nSYRINGOL = 'SYRINGOL';
        nMPHCOME = 'MPHCOME';

        nTM123B = 'TM123B';
        nIPBENZ = 'IPBENZ';
        nPBENZ = 'PBENZ';
        nMETHTOL = 'METHTOL';
        nPETHTOL = 'PETHTOL';
        nTM135B = 'TM135B';
        nOETHTOL = 'OETHTOL';
        nTM134B  = 'TM134B';
        
        nPINIC = 'PINIC';
        nPINONIC = 'PINONIC';
        nBCARY = 'BCARY';
        
        % For FIREX-AQ
        %nACO2H = 'ACO2H';
        nOXYLOL = 'OXYLOL';
        nMETHCOACET = 'METHCOACET';
        nPBZQONE   = 'PBZQONE';
        nACETONIT  = 'ACETONIT';
        nNCATECHOL = 'NCATECHOL';

        % copy and paste above from the basics
        % For additional VOCs based on Wolfe 2022
        nMEKAOH       = 'MEKAOH';   
        nC512OOH      = 'C512OOH';   
        nHEX3ONDOOH   = 'HEX3ONDOOH'; 
        nM3HEXANO3    = 'M3HEXANO3';   
        nCO1M22CHO    = 'CO1M22CHO';    
        nHO2CO4CHO    = 'HO2CO4CHO';     
        nPEBOH        = 'PEBOH';         
        nC4DBDIKET    = 'C4DBDIKET';      
        nHO25C6       = 'HO25C6';           
        nC7CO4EDB     = 'C7CO4EDB';         
        nMAE          = 'MAE';               
        nLIMKET       = 'LIMKET';            
        nACO2H        = 'ACO2H';             
        nCO2M33CO3H   = 'CO2M33CO3H';     
        nHO25C7       = 'HO25C7';            
        nHMACO3H      = 'HMACO3H';          
        nHO3C5CHO     = 'HO3C5CHO';          
        nM23C4        = 'M23C4';             
        nUDECOH       = 'UDECOH';            
        nDECOH        = 'DECOH';             
        nCHCL2CHO     = 'CHCL2CHO';         
        nNOPINAOH     = 'NOPINAOH';          
        nIEB4CHO      = 'IEB4CHO';           
        nDICLETOH     = 'DICLETOH';         
        nETBE         = 'ETBE';              
        nME2BUT2ENE   = 'ME2BUT2ENE';
        nM3PECOOH     = 'M3PECOOH';      
        nETHOX        = 'ETHOX';             
        nC8BCCO       = 'C8BCCO';            
        nC7MOCOCO3H   = 'C7MOCOCO3H';  
        nCCL3CHO      = 'CCL3CHO';           
        nCH3CCL2OH    = 'CH3CCL2OH';        
        nME2BUT1ENE   = 'ME2BUT1ENE';    
        nEMPHCOME     = 'EMPHCOME';         
        nMC6OTKETOH   = 'MC6OTKETOH';        
        nIBUTOL       = 'IBUTOL';            
        nMIPK         = 'MIPK';              
        nC108NO3      = 'C108NO3';         
        nCL12PRCHO    = 'CL12PRCHO';       
        nC129CO       = 'C129CO';            
        nALLYLOH      = 'ALLYLOH';           
        nPINAL        = 'PINAL';             
        nHM33C4OH     = 'HM33C4OH';        
        nNC1313OH     = 'NC1313OH';         
        nTBUACET      = 'TBUACET';           
        nC828PAN      = 'C828PAN';           
        nCYHXONAOOH   = 'CYHXONAOOH';    
        nACECOCOCH3   = 'ACECOCOCH3';     
        nC5PAN6       = 'C5PAN6';            
        nACCOPRONE    = 'ACCOPRONE';      
        nM3PEAOH      = 'M3PEAOH';           
        nH25M2C6      = 'H25M2C6';           
        nNC71CO       = 'NC71CO';           
        nC129CO       = 'C129CO';            
        nH2M3C4CHO    = 'H2M3C4CHO';      
        nMEPROPENE    = 'MEPROPENE';        
        nM2PEDOH      = 'M2PEDOH';           
        nC6CO2OHPAN   = 'C6CO2OHPAN';       
        nDDEC3ONE     = 'DDEC3ONE';          
        nHO36C10      = 'HO36C10';           
        nC126CHO      = 'C126CHO';           
        nEOX2COMEOH   = 'EOX2COMEOH';      
        nC920PAN      = 'C920PAN';           
        nPXYCATECH    = 'PXYCATECH';         
        nBCKET        = 'BCKET';             
        nNPRACBOOH    = 'NPRACBOOH';   
        nTHEX2ENE     = 'THEX2ENE';          
        nMALDALCO3H   = 'MALDALCO3H';    
        nPROPACID     = 'PROPACID';         
        nETHOXOOH     = 'ETHOXOOH';         
        nPROPACID     = 'PROPACID';         
        nIPECOH       = 'IPECOH';   
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end

% Naming setting for sensitivity experiment beyond base mechanisms
switch MECHANISM    
    case 'MCMv331_noFUR'
        % Compounds that not in the original MCM       
        nFURAN  = 'dummy32';
        nM3F    = 'dummy33';
        nM2FURAN = 'dummy34';
        nDIMEFURAN = 'dummy35';
        nFURFURAL  = 'dummy36';
        nMEFURFURAL = 'dummy37';
        nMALANHY = 'dummy43'; 
        
        %nBZFUONE = 'dummy120';
        %nMALANHY = 'dummy43'; 


    case 'MCMv331_GCvocs'
        % Compounds that not in GEOS-Chem        
        nC3H4 = 'dummy1';

        nC3H7OH = 'dummy31';
        
        nFURAN  = 'dummy32';
        nM3F    = 'dummy33';
        nM2FURAN = 'dummy34';
        nDIMEFURAN = 'dummy35';
        nFURFURAL  = 'dummy36';
        nMEFURFURAL = 'dummy37';
        nBZFUONE = 'dummy120';

        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
        
        nMALANHY = 'dummy43';
        
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nGUAIACOL = 'dummy54';
        nHEPT3ONE = 'dummy56';

        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';
        
        % For FIREX-AQ
        nACO2H = 'dummy201';
        nOXYLOL = 'dummy202';
        nMETHCOACET = 'dummy203';
        nPBZQONE = 'dummy204';
        nACETONIT = 'dummy205';
        nNCATECHOL = 'dummy206';
        
    case 'MCMv331_GCvocsF'    
        nC3H4 = 'dummy1';

        nC3H7OH = 'dummy31';
        
        nACR = 'dummy38';
        nMETHACET = 'dummy39';
        nETHFORM  = 'dummy40';
        
        nIC3H7NO3 = 'dummy41';
        nNC3H7NO3 = 'dummy42';
                
        nC4H6 = 'dummy44';
        nC4ALDB = 'dummy45';
        nBIACET = 'dummy46';

        nIC4H9NO3 = 'dummy47';
        nNC4H9NO3 = 'dummy48';
        
        nMPRK = 'dummy49';
        nDIEK = 'dummy50';

        nCATECHOL = 'dummy51';
        nCYHEXOL = 'dummy52';
        nGUAIACOL = 'dummy54';
        nHEPT3ONE = 'dummy56';
        
        nSTYRENE = 'dummy57';
        nOXYLAL = 'dummy58';
        nMGUAIACOL = 'dummy59';
        nSYRINGOL = 'dummy60';
        nMPHCOME = 'dummy61';
        
        nTM123B = 'dummy101';
        nIPBENZ = 'dummy102';
        nPBENZ = 'dummy103';
        nMETHTOL = 'dummy104';
        nPETHTOL = 'dummy105';
        nTM135B = 'dummy106';
        nOETHTOL = 'dummy107';
        nTM134B  = 'dummy108';
        
        nPINIC = 'dummy63';
        nPINONIC = 'dummy64';
        nBCARY = 'dummy65';

        % For FIREX-AQ
        nACO2H = 'dummy201';
        nOXYLOL = 'dummy202';
        nMETHCOACET = 'dummy203';
        nPBZQONE = 'dummy204';
        nACETONIT  = 'dummy205';
        nNCATECHOL = 'dummy206';
        
    case 'GCv13_JINF'
        % Furans
        nFURAN = 'FURAN';
        nM2FURAN = 'M2FURAN';
        nMEFURFURAL = 'MEFURFURAL';
        nDIMEFURAN = 'DIMEFURAN';
        nFURFURAL = 'FURFURAL';
        nMALANHY = 'MALANHY';
        nBZFUONE = 'LBZFUONE';

    case 'GCv13_JINF_HCOOH'
        % Furans
        nFURAN = 'FURAN';
        nM2FURAN = 'M2FURAN';
        nMEFURFURAL = 'MEFURFURAL';
        nDIMEFURAN = 'DIMEFURAN';
        nFURFURAL = 'FURFURAL';
        nMALANHY = 'MALANHY';
        nBZFUONE = 'LBZFUONE';

        % ACR
        nACR = 'ACR';

    case 'GCv13_base_notfixed'
        nC2H4 = 'dummy108';
end





