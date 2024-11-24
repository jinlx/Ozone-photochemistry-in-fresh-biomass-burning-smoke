% %%%%%%%%%%%%%%%%%%%
% save the rxt rates
% %%%%%%%%%%%%%%%%%%%
% ============
% Primary VOCs
% ============
% ----
% C2H2
% ----
PlotRates('C2H2',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'C2H2_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_C2H2_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% C2H4
% ----
PlotRates(nC2H4,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h',  'C2H4_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_C2H4_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% PRPE
% -----
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PRPE_names = {nC3H6; nBUT1ENE; nTBUT2ENE; nCBUT2ENE; nPENT1ENE; nHEX1ENE};
        PRPE = ExtractSpecies(PRPE_names,S);
        PRPE_names = fieldnames(PRPE);

    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2' 'GCv13_JINF_HCOOH'}
        PRPE_names = {nPRPE};

    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
PRPEGroup = [{'Total PRPE'}; PRPE_names];
PlotRates(PRPEGroup,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h',  'PRPE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PRPE_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% C2H6
% ----
PlotRates('C2H6',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'RCHO_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_RCHO_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% C3H8
% ----
PlotRates('C3H8',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h',  'C3H8_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_C3H8_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% ALK4
% -----
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        ALK4_names = {nNC4H10; nIC4H10; nNC5H12; nIC5H12; nNC6H14; nM3PE; nM22C4; nNC7H16; nNC8H18; nNC9H20; nNC10H22; nNC11H24};
        ALK4 = ExtractSpecies(ALK4_names,S);
        ALK4_names = fieldnames(ALK4);

    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2' 'GCv13_JINF_HCOOH'}
        ALK4_names = {nALK4};

    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
ALK4Group = [{'Total ALK4'}; ALK4_names];
PlotRates(ALK4Group,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ALK4_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ALK4_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% BENZ
% ----
PlotRates(nBENZ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h',  'BENZ_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_BENZ_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% TOLU
% ----
PlotRates(nTOLU,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'TOLU_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_TOLU_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% XYLE
% ----
PlotRates(nXYLE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'XYLE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_XYLE_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ------
% HCOOH
% ------
PlotRates('HCOOH',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'HCOOH_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HCOOH_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% ACTA
% ----
PlotRates(nACTA,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACTA_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ACTA_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% ISOP
% ----
PlotRates(nISOP,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ISOP_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ISOP_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% MOH
% ----
PlotRates(nMOH,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MOH_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MOH_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% EOH
% ----
PlotRates(nEOH,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'EOH_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_EOH_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% ACET
% ----
PlotRates(nACET,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACET_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ACET_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% MEK
% ----
PlotRates('MEK',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MEK_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MEK_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% DMS
% ----
PlotRates('DMS',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'DMS_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_DMS_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% MGLY
% ----
PlotRates(nMGLY,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MGLY_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MGLY_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% PHEN
% ----
PlotRates(nPHEN,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'PHEN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_PHEN_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% CSL
% ----
PlotRates(nCSL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'CSL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_CSL_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        % ------
        % FURAN
        % ------
        PlotRates(nFURAN,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'FURAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_FURAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % M2FURAN
        % -------
        PlotRates(nM2FURAN,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'M2FURAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_M2FURAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ----------
        % DIMEFURAN
        % ----------
        PlotRates(nDIMEFURAN,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'DIMEFURAN_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_DIMEFURAN_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % --------
        % FURFURAL
        % --------
        PlotRates(nFURFURAL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'FURFURAL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_FURFURAL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ----------
        % MEFURFURAL
        % ----------
        PlotRates(nMEFURFURAL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MEFURFURAL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_MEFURFURAL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % BZFUONE
        % -------
        PlotRates(nBZFUONE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'BZFUONE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUONE_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ----
        % C4H6
        % ----
        PlotRates(nC4H6,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'C4H6_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_C4H6_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ------
        % C4ALDB
        % ------
        PlotRates(nC4ALDB,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'C4ALDB_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_C4ALDB_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ----
        % MPRK
        % ----
        PlotRates(nMPRK,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MPRK_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_MPRK_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ----
        % DIEK
        % ----
        PlotRates(nDIEK,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'DIEK_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_DIEK_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % --------
        % CYHEXOL
        % --------
        PlotRates(nCYHEXOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'CYHEXOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_CYHEXOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % --------
        % GUAIACOL
        % --------
        PlotRates(nGUAIACOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'GUAIACOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_GUAIACOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % STYRENE
        % -------
        PlotRates(nSTYRENE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'STYRENE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_STYRENE_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ------
        % OXYLAL
        % ------
        PlotRates(nOXYLAL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'OXYLAL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_OXYLAL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ---------
        % MGUAIACOL
        % --------
        PlotRates(nMGUAIACOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MGUAIACOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_MGUAIACOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % --------
        % SYRINGOL
        % --------
        PlotRates(nSYRINGOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'SYRINGOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_SYRINGOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ------
        % TM123B
        % ------
        PlotRates(nTM123B,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'TM123B_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_TM123B_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % IPBENZ 
        % -------
        PlotRates(nIPBENZ ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'IPBENZ_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_IPBENZ_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -----
        % PBENZ
        % -----
        PlotRates(nPBENZ ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'PBENZ_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PBENZ_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % METHTOL
        % -------
        PlotRates(nMETHTOL ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'METHTOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_METHTOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % PETHTOL
        % -------
        PlotRates(nPETHTOL ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'PETHTOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PETHTOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ------
        % TM135B
        % ------
        PlotRates(nTM135B  ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'TM135B_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_TM135B_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -------
        % OETHTOL
        % -------
        PlotRates(nOETHTOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'OETHTOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_OETHTOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -----
        % PINIC
        % -----
        PlotRates(nPINIC ,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'PINIC_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PINIC_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -----
        % BCARY
        % -----
        PlotRates(nBCARY,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'BCARY_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_BCARY_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % -----
        % ACO2H
        % -----
        PlotRates(nACO2H,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACO2H_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_ACO2H_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        % ------
        % OXYLOL
        % ------
        PlotRates(nOXYLOL,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'OXYLOL_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_OXYLOL_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end 

% ===============
% Secodnary VOCs
% ===============
% ----
% CH2O
% ----
PlotRates(nHCHO,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'CH2O_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_CH2O_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% ALD2
% ----
PlotRates(nALD2,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ALD2_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ALD2_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% RCHO
% ----
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        RCHO_names = {'C2H5CHO'; 'C3H7CHO'; ...
                     'IPRCHO'; 'BUT2CHO'; 'C5H11CHO'; 'C6H13CHO'};
        RCHO = ExtractSpecies(RCHO_names,S);
        RCHO_names = fieldnames(RCHO);

    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2' 'GCv13_JINF_HCOOH'}
        RCHO_names = {nRCHO};

    case {'GCv13_MCM_missing'}
        RCHO_names_MCM = {'C2H5CHO'; 'C3H7CHO'; ...
                     'IPRCHO'; 'BUT2CHO'; 'C5H11CHO'; 'C6H13CHO'};
        RCHO_names_GC = {nRCHO};        
        RCHO_names = [RCHO_names_MCM', RCHO_names_GC];
        % extract the data based on the names and recreate the names 
        RCHO = ExtractSpecies(RCHO_names,S);
        RCHO_names = fieldnames(RCHO);
    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
RCHOGroup = [{'Total RCHO'}; RCHO_names];
PlotRates(RCHOGroup,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'RCHO_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_RCHO_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% -----
% MTPA
% -----
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        MTPA_names = {nAPINENE; nBPINENE};
        MTPA = ExtractSpecies(MTPA_names,S);
        MTPA_names = fieldnames(MTPA);

    case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2' 'GCv13_JINF_HCOOH'}
        MTPA_names = {nMTPA};

    otherwise
        error(['Invalid mechanism "' mechanism '".'])
end
MTPAGroup = [{'Total MTPA'}; MTPA_names];
PlotRates(MTPAGroup,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MTPA_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MTPA_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

% -----
% GLYX
% -----
PlotRates(nGLYX,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'GLYX_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_GLYX_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% HCOOH
% -----
PlotRates('HCOOH',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'HCOOH_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HCOOH_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% ACTA
% -----
PlotRates(nACTA,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACTA_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ACTA_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% MACR
% -----
PlotRates('MACR',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MACR_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MACR_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% MVK
% -----
PlotRates('MVK',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MVK_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MVK_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% ACET
% ----
PlotRates(nACET,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACET_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_ACET_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% ----
% MEK
% ----
PlotRates('MEK',S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MEK_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MEK_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% GLYC
% -----
PlotRates(nGLYC,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'GLYC_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_GLYC_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% MGLY
% -----
PlotRates(nMGLY,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MGLY_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_MGLY_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% HAC
% -----
PlotRates(nHAC,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'HAC_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_HAC_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----
% BALD
% -----
PlotRates(nBALD,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'BALD_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
fileoutput = [prefix, 'figures/', Flight_ID, '_BALD_rates_', MECHANISM, FixNOx_postfix, '.png'];
saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
% -----------------------------------------------------------------------------
% BZFUONE
% Below we look into those VOCs we currently haven't included in the GEOS-Chem.
% -----------------------------------------------------------------------------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nBZFUONE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'BZFUONE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_BZFUONE_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end
% ---
% ACR
% ---
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nACR,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'ACR_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_ACR_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end

% -------
% MALANHY
% -------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nMALANHY,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'MALANHY_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_MALANHY_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end

% ------
% BIACET
% ------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nBIACET,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h',  'BIACET_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_BIACET_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end

% --------
% HEPT3ONE
% --------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nHEPT3ONE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'HEPT3ONE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_HEPT3ONE_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end

% --------
% PINONIC 
% --------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nPINONIC,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h','PINONIC_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PINONIC_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end 
% --------
% PBZQONE 
% --------
switch MECHANISM
    case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF', 'MCMv331_extension'}
        PlotRates(nPBZQONE,S,1000,'sumEq',1, 'saveout', 1, 'unit', 'ppb_h', 'PBZQONE_rates_', Flight_ID, MECHANISM, FixNOx_postfix);
        fileoutput = [prefix, 'figures/', Flight_ID, '_PBZQONE_rates_', MECHANISM, FixNOx_postfix, '.png'];
        saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    otherwise
        disp('skip as it is not in the GEOS-Chem')
end 
