%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting and data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOTTING AND ANALYSIS
switch MECHANISM
    case {'MCMv331_extension'}
        title_ts = 'Mixing ratio time series (MCMv331_extension)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (MCMv331_extension)';
    case {'MCMv331_base'}
        title_ts = 'Mixing ratio time series (MCMv331_base)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (MCMv331_base)';
    case {'MCMv331_GCvocs'}
        title_ts = 'Mixing ratio time series (MCMv331_GCvocs)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (MCMv331_GCvocs)';
    case {'MCMv331_noFUR'}
        title_ts = 'Mixing ratio time series (MCMv331_noFUR)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (MCMv331_noFUR)';
    case {'MCMv331_GCvocsF'}
        title_ts = 'Mixing ratio time series (MCMv331_GCvocsF)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (MCMv331_GCvocsF)';
    case {'GCv13_base'}
        title_ts = 'Mixing ratio time series (GCv13_base)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (GCv13_base)';
    case {'GCv13_base_notfixed'}
        title_ts = 'Mixing ratio time series (GCv13_base_notfixed)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (GCv13_base_notfixed)';
    case {'GCv13_JINF'}
        title_ts = 'Mixing ratio time series (GCv13_JINF)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (GCv13_JINF)';
    case {'GCv13_JINF_v2'}
        title_ts = 'Mixing ratio time series (GCv13_JINF_v2)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (GCv13_JINF_v2)';
    case {'GCv13_JINF_HCOOH'}
        title_ts = 'Mixing ratio time series (GCv13_JINF_HCOOH)';
        title_nemr_ts = 'Normalized enhancement mixing ratio time series (GCv13_JINF_HCOOH)';
    otherwise
end


switch Flight_ID
    case {'RF03'}
        postfix_ID = 'RF03_';
    case {'RF07'}
        postfix_ID = 'RF07_';
    case {'RF09'}
        postfix_ID = 'RF09_';
    case {'P3B'}
        postfix_ID = 'P3B_';
    case {'FN19'}
        postfix_ID = 'FN19_';
    case {'FN06'}
        postfix_ID = 'FN06_';
    otherwise
end

makeplots = 1;

if makeplots
    % calculate normalized excess mixing ratios: delta_X_dil = delta_X * delta_CO_source/delta_CO
    % this is standard procedure for biomass burning plumes.
    % We will also put these into a new structure compatible with F0AM plotting routines.
    delta_CO = S.Conc.CO - S.BkgdConc.CO(1);
    fCO = delta_CO(1)./delta_CO;
    Sd.Met = S.Met; Sd.Cnames = S.Cnames; Sd.Time = S.Time;
    for i=1:length(S.Cnames)
        name = S.Cnames{i};
        if isfield(S.BkgdConc,name), b = S.BkgdConc.(name)(1);
        else b = 0;
        end
        Sd.Conc.(name) = (S.Conc.(name) - b).*fCO;
    end

    % =================
    % Dilution checking
    % =================
    % First, check that dilution is working as it should
    PlotConc('CO',S);
    hold on
    plot(obs_time, smk_CO,'k+','markersize',18,'linewidth',4)
    fileoutput = [prefix, 'figures/', Flight_ID, '_CO_DILU_check_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % test

    % ====================================
    % NOy speciation (only when using MCM)
    % grouping method
    % ====================================
    % Now let's look at NOy speciation
    % first we have to get all NOy, which is a tall order for MCM, but we can try by using 
    % SMILES strings to identify functional groups.
    %{
    switch MECHANISM
        case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PNs = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
            ANs = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates
            otherNOy = {'NO','NO2','NO3','N2O5','HONO','HNO3','HO2NO2'};
            [~,iother] = ismember(otherNOy,S.Cnames);
            iNOy = unique([iother; PNs.index; ANs.index]);
            NOygroups = {{'NOx','NO','NO2'},['PNs';S.Cnames(PNs.index)],['ANs';S.Cnames(ANs.index)],'HONO','HNO3'};
            
            
            % =====================================================
            % TBD: we might want to make GEOS-Chem mechanism later!
            % =====================================================
            PlotConcGroup(NOygroups,Sd,5,'sortem',0,'name','NO_y')
            title('NOy speciation') 
            fileoutput = [prefix, 'figures/', Flight_ID, '_NOy_speciation_', MECHANISM, '.png'];
            saveas(gcf, fileoutput) % test
        otherwise
    end
    %}
    
    % ====================================================================
    % Timeseries of OH mixing ratio and dilution corrected mixing ratio
    % ====================================================================
    figure
    plot(mod_time,Sd.Conc.OH,'b-')
    xlabel('Reaction Time (s)')
    ylabel('\Delta_{dil}OH (ppb)')
    title('OH NEMR') 
    fileoutput = [prefix, 'figures/', Flight_ID, '_OH_NEMR_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    figure
    plot(mod_time,S.Conc.OH,'b-')
    xlabel('Reaction Time (s)')
    ylabel('OH (ppb)')
    title('OH Time series') 
    fileoutput = [prefix, 'figures/', Flight_ID, '_OH_TS_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    
    % ===================================================================================================================================
    % RO2 fraction from Furans, asked by Lu, just some motivations. 
    % Again, O3 is controlled by HO2 reaction but budget information will be helpful to clarify it. TBD!!
    % TBD: base run doesn't have any furans mechanims, set it for only furan mech run later
    % ===================================================================================================================================
    %{
    RO2_FUR = Sd.Conc.HYDFURANO2 + Sd.Conc.HYDMEFURANO2 + Sd.Conc.C5HYDCARBO2 + Sd.Conc.HYDDIMEFURANO2 + Sd.Conc.FURFURALO2 + ...
                Sd.Conc.HYDFURFURALO2 + Sd.Conc.MEFURFURALO2 + Sd.Conc.HYDMEFURFURALO2 + Sd.Conc.ALDFURFURALO2 + Sd.Conc.FURANO2 + ...
                Sd.Conc.CARBFURANO2 + Sd.Conc.H3BENZENE1O2 + Sd.Conc.H3TOLUENE1O2 + Sd.Conc.H3OXYLENE1O2 + Sd.Conc.H3PXYLENE1O2 + ...
                Sd.Conc.H3MXYLENE1O2 ;
    frac_RO2_FUR = RO2_FUR./(Sd.Conc.RO2);
    figure
    plot(mod_time,Sd.Conc.RO2,'b-', mod_time,RO2_FUR, 'r-', mod_time, frac_RO2_FUR, 'k--')
    xlabel('Reaction Time (s)')
    ylabel('\Delta_{dil}RO2 or fraction (ppb or %)')
    legend('TotalRO2','FUR RO2', 'FUR RO2 frac')
    title('RO2 NEMR') 
    fileoutput = [prefix, 'figures/', Flight_ID, '_RO2_NEMR_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    %}
    
    
    % ====================================================================================================================================================
    % Lixu, 11/15/2022
    % O3 budget, looking into Ox
    % The idea of odd oxygen is raised by Chapmen for stratoposphere
    % Wang et al (1998) expend it into troposphere and regard Ox as the sum of O3, O, O1D, NO2, 2*NO3, 3*N2O5, HNO3, HO2NO2, and PANs
    % Then, Fisher et al. (2016) expend it to organic nitrates. 
    % Later, halogen chemistry (Sherwen et al., 2016; Wang et al., 2019; Zhuet al., 2019) have added a number of terms to the Ox family (Hu et al., 2017).
    % More recently, Bate et al. (2020) expand the definition
    % Halogen chemistry is not considered here as we don't consider them as the input but we can add it later if we are interested in.
    % ====================================================================================================================================================
    PNs = SearchSMILES('peroxyNitrate',S.Cnames,'v331'); %peroxy nitrates
    ANs = SearchSMILES('alkylNitrate',S.Cnames,'v331'); %alkyl nitrates % Fisher et al., 2016
    CRs = SearchSMILES('criegee',S.Cnames,'v331'); %Criegee intermediates (produced from ozono-lysis of VOCs)
    %ROs = SearchSMILES('alkoxyRadical',S.Cnames,'v331'); %alkoxy Radical
    %rOs = SearchSMILES('aryloxyRadical',S.Cnames,'v331'); %like alkoxy radicals but attached to conjugated rings
    % Halogen chemistry is not considered here as we don't consider them as the input    
    %OxGroups = {'Ox', 'O3', 'O'}; % defined by the chapman mechanism, this is not working for troposphere
    %OxGroups = {'Ox', 'O3', 'O', 'O1D', 'NO2', '2*NO3', '3*N2O5', 'HNO3', 'HO2NO2', S.Cnames(PNs.index)}; %Wang et al., 1998
    OxGroups = {'Ox', 'O3', 'O', 'O1D', 'NO2', '2*NO3', '3*N2O5', 'HNO3', 'HO2NO2', S.Cnames(PNs.index), S.Cnames(ANs.index), S.Cnames(CRs.index)}; % halogen is not included
    
    % concatenate data and transpose the data
    OxGroups = cat(1, OxGroups{:})';
    switch MECHANISM
        case {'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}    
            % save the data
            figure
            PlotRates(OxGroups,S,5,'sumEq',1,'scale',1, 'saveout', 1, 'OxGoups_', Flight_ID, MECHANISM) % bug exist for the scale, fixed?
            fileoutput = [prefix, 'figures/', Flight_ID, '_Ox_rates_', MECHANISM, '.png'];
            saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
        otherwise
    end
    % ============================================================================================
    % Timeseries of O3 mixing ratio and dilution corrected mixing ratio
    % In FN06, I do not see much O3 enhencement from furan oxidation, due to the NOx limited regime
    % In FN19/RF03/P-3B, they are good cases to show the effect of Furans.
    % ============================================================================================
    % Next, lets look at ozone production.
    figure
    plot(mod_time,Sd.Conc.O3,'b-',...
        obs_time,(smk_O3-S.BkgdConc.('O3')(1)).*(smk_CO(starting_point)-S.BkgdConc.('CO')(1))./(smk_CO-S.BkgdConc.('CO')(1)),'ro')
    xlabel('Reaction Time (s)')
    ylabel('\Delta_{dil}O_3 (ppb)')
    legend('Model','Obs')
    title('O3 Average Production and Loss Rates') 
    fileoutput = [prefix, 'figures/', Flight_ID, '_O3_NEMR_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    figure
    plot(mod_time,S.Conc.O3,'b-',...
        obs_time,smk_O3,'ro')
    xlabel('Reaction Time (s)')
    ylabel('O_3 (ppb)')
    legend('Model','Obs')
    title('O3 Time series') 
    fileoutput = [prefix, 'figures/', Flight_ID, '_O3_TS_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    % It is easiest to look at production of ozone's precursor, NO2.
    % Also, since dilution is so strong, we will look at this in a rate-normalized sense
    % because we are just interested in speciation.
    figure
    PlotRates('NO2',S,5,'sumEq',1,'scale',0)
    fileoutput = [prefix, 'figures/', Flight_ID, '_NO2_rates_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    
    % NO + O3 is the dominant source, followed by NO + HO2.
    % NO + O3 will go to the loop and let's skip that for now
    % Focus on the **NO + HO2**
    % Note that FURFURAL, which is not in the MCM base chemistry, is a non-trivial source of HO2.
    figure
    PlotRates('HO2',S,5,'sumEq',1,'scale',0,'saveout', 1, 'HO2_rates_', Flight_ID,MECHANISM)
    fileoutput = [prefix, 'figures/', Flight_ID, '_HO2_rates_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    
    %%% TBD: Make the mechanism name consistent later!!!!
    %{
    % It looks like speciation doesn't change much over the integration period, so we can continue
    % investigation in an average sense.
    % CO and HCHO are signficant sources of HO2. Most of the CO is primary emissions, and so is HCHO
    % (intitally). What about secondary HCHO?
    figure
    PlotRatesAvg('HCHO',S,5)
    fileoutput = [prefix, 'figures/', Flight_ID, '_HCHO_rates_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    % HCHO is mostly from CH3O2 
    % FN19: followed by C2H4
    % RF03: followed by alkenes, C4H6, and furanone, and the latter two show simliar contribution)
    % RF07 and RF09: followed by alkenes, and C4H6 
    % P3B: followed by C3H6, isoprene, C2H4, and MOH
    % Commonly, HCHO is mostly from MCO3, and short alkenes.
    
    % Main: CH3O2
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('CH3O2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_CH3O2_rates_', MECHANISM, '.png'];
        case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2', 'GCv13_JINF_HCOOH'}
            PlotRatesAvg('MO2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_MO2_rates_', MECHANISM, '.png'];
        otherwise
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    
    
    % - FN06/FN19: MCO3 is the dominant source of MO2
    % followed by acetaldehyde in the FN06
    % suprisingly followed by CH4 in P3B, meaning something?
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('CH3CO3',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_CH3CO3_rates_', MECHANISM, '.png'];
        case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2', 'GCv13_JINF_HCOOH'}
            PlotRatesAvg('MCO3',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_MCO3_rates_', MECHANISM, '.png'];
        otherwise
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    % - FN06: The dominant source for MCO3 is the photolysis of **butanedione**, folowed by actaldehyde, methylglyoxal, and PAN (close to each other)
    % - FN19: The dominant source for MCO3 is the decomposition of PAN, folowed by the photolysis of **butanedione**, oxidation of  actaldehyde and methylglyoxal
    % - RF03: The dominant source for MCO3 is the photolysis of **butanedione**, folowed by actaldehyde, methylglyoxal, and PAN (close to each other)
    % - P3B:  The dominant source for MCO3 is oxidation of acetaldehyde, fololowed by photolysis of **butanedione**, PAN, and methylglyxoal
    
    
    %}
    
    
    %{
    % Extra: FN19, RF03
    % FN19: 1) C2H4 + OH
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('HOCH2CH2O2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_HOCH2CH2O2_rates_', MECHANISM, '.png'];
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    % - FN19: The dominant source for HOCH2CH2O2 is the C2H4 + OH.

    % RF03: 1)  C3H6 + OH
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('HYPROPO2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_HYPROPO2_rates_', MECHANISM, '.png'];
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    % RF03: 2)  BZFUONE + OH, CH3CHO + OH
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('HCOCH2O2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_HCOCH2O2_rates_', MECHANISM, '.png'];
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    % RF03: 3)  C3H4 + OH
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('BUTDBO2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_BUTDBO2_rates_', MECHANISM, '.png'];
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed

    % RF03: 4)  Butenenes + OH
    figure
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            PlotRatesAvg('NBUTOLAO2',S,5)
            fileoutput = [prefix, 'figures/', Flight_ID, '_NBUTOLAO2_rates_', MECHANISM, '.png'];
    end
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    %}
     
    
    % ============================================================================
    % Looking at OH reactivity to see which VOC are contributing most.
    % Here, we need to set EndPointsOnly as 1 so that we can bring up the bar plot
    % We should be able to account for addtional VOCs
    % ============================================================================
    % Let's group measured species together to make the plot easier to interpret.  
    % not completed 
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            Inorg    = {'Inorganic', 'CO', 'CH4', 'H2', 'HO2', 'O3', 'HO2', 'H2O2', ...
                        'HONO', 'NO2', 'NO', 'HO2NO2', 'HNO3', 'PPN', ...
                        'SO2'};
            Aldehyde = {'Aldehyde', 'CH3CHO','C2H5CHO','C3H7CHO', 'IPRCHO', 'BUT2CHO', 'C5H11CHO', 'C6H13CHO', ...
                        'MGLYOX', 'GLYOX', ...
                        'HOCH2CHO', 'HC3CHO', 'CO14O3CHO', 'ACCOMECHO', 'CO3C4CHO', 'HOC3H6CHO', 'CH3CHOHCHO', 'CO2H3CHO', 'CO2C3CHO'};
                        
            CxHy     = {'CxHy', 'C2H2', 'C2H4', 'C3H6', 'BUT1ENE', 'TBUT2ENE', 'CBUT2ENE', 'PENT1ENE', 'HEX1ENE' , ...
                        'C2H6', 'C3H8', 'NC4H10', 'IC4H10','IC5H12','NC5H12','NC6H14', 'M3PE', 'M22C4', 'NC7H16', 'NC8H18', 'NC9H20', 'NC10H22', 'NC11H24', ...
                        'C4H6'};
                        
            Ketone = {'Ketone', 'CH3COCH3','MEK', 'BCAL'};
            
            OtherOVOCs = {'OtherOVOCs', 'ACR', 'ACETOL', 'CH3OOH', 'HCC7CO', ... 
                          'ACRPAN', 'MPAN', 'BUTDBNO3', 'C5COO2NO2', 'C4PAN7', 'PHAN', 'C3DBPAN', 'BUTDANO3', 'PPEN', 'C3MCODBPAN', 'MC3CODBPAN', ...
                          'PINAL', 'NOPINONE','BCSOZ', 'IEPOXA'};
                          
            Alcohol  = {'Alcohol', 'CH3OH', 'C2H5OH', 'CYHEXOL'};
            
            Arom     = {'Arom','BENZENE','TOLUENE','EBENZ','MXYL','OXYL','PXYL', ...
                        'TM123B ','TM124B','TM135B', 'TM123OMUC', 'BENZAL', ...
                        'PETHTOL', 'CATECHOL', 'STYRENE', 'GUAIACOL', 'MGUAIACOL', ...
                        'NCATECHOL', 'OXYL', 'SYRINGOL', 'CRESOL'};
            
            Acids    = {'Acids', 'HCOOH', 'CH3CO2H', ...
                        'HCOCO2H'}; 

            BiogVOCs  = {'BiogVOCs','C5H8', 'APINENE','BPINENE','LIMONENE', 'MVKMACR','MVK','MACR', 'MVKOH'};
                        
            Furans= {'Furans', 'FURAN', 'M2FURAN', 'M3F', 'DIMEFURAN', 'FURFURAL', 'MEFURFURAL', ...
                     'BZFUONE', 'TLFUONE', 'PXYFUONE', ...
                     'MALANHY', 'MALDIAL', 'MALDALCO2H', 'MALDIALPAN', ...
                     'C5DIALCO', 'C5DICARB', 'C5CO14OH', ...
                    'C4ALDB', 'C4DBDIKET',  'C4MDIAL'};
            
            
            Reactants = {Inorg,Aldehyde,CxHy,Ketone,OtherOVOCs,Alcohol,Arom,Acids,BiogVOCs,Furans};

        case {'GCv13_base', 'GCv13_base_notfixed', 'GCv13_JINF', 'GCv13_JINF_v2', 'GCv13_JINF_HCOOH'}
            Inorg = {'Inorganic','CO','H2','O3','HO2','H2O2','NO2'};
            Alk   = {'Alk','C2H4','C2H6','C3H8','ALK4','PRPE'};
            Arom  = {'Arom','BENZENE','TOLUENE','EBENZ','TM124B','TM135B','MXYL','OXYL','PXYL','BENZAL'};
            oVOC  = {'oVOC','CH3CHO','C2H5CHO','C3H7CHO','HOCH2CHO','GLYOX','CH3OH','C2H5OH','ACETOL','BIACET'};
            Terp  = {'MTerp','APINENE','BPINENE','LIMONENE'};
            MVKMACR = {'MVKMACR','MVK','MACR'};
            Furans= {'Furans', 'FURAN', 'M3F', 'DIMEFURAN', 'FURFURAL', 'MEFURFURAL', 'BZFUONE'};
            Reactants = {Inorg,Alk,Arom,oVOC,'HCHO',MVKMACR,Terp,Furans,'C5H8'};
        otherwise
    end
    
    figure
    PlotReactivity('OH',S,Reactants,'cmapname', 'jet');
    fileoutput = [prefix, 'figures/', Flight_ID, '_OH_reactivity', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    % Furans and their oxidation products looks the most prodominant one so far, get the fraction of furans  
    
    
    % ===============================
    % FUR fraction on OH reactivity
    % ===============================
    switch MECHANISM
        case {'MCMv331_extension', 'MCMv331_base', 'MCMv331_GCvocs', 'MCMv331_noFUR', 'MCMv331_GCvocsF'}
            Furans= {'Furans', 'FURAN', 'M2FURAN', 'M3F', 'DIMEFURAN', 'FURFURAL', 'MEFURFURAL', ...
                     'BZFUONE', 'TLFUONE', 'PXYFUONE', ...
                     'MALANHY', 'MALDIAL', 'MALDALCO2H', 'MALDIALPAN', ...
                     'C5DIALCO', 'C5DICARB', 'C5CO14OH', ...
                    'C4ALDB', 'C4DBDIKET',  'C4MDIAL'};
            Reactants = {Furans};
        otherwise
    end
    
    [Reactivity,ReactivityNames] = GetReactivity('OH',S,Reactants);
    total_OHR = sum(Reactivity,2);
    Furans_OHR = Reactivity(:,2);
    FUR_frac = Furans_OHR./total_OHR;
    
    figure
    colororder({'k','k'})
    yyaxis left
    plot(mod_time,total_OHR,'b-', ...
            mod_time, Furans_OHR, 'r-')
    xlabel('Reaction Time (s)')
    legend('Total OHR','FUR OHR')
    ylabel('OHR (s^{-1})')
    
    yyaxis right
    plot(mod_time,FUR_frac,'k--')
    legend('Total OHR','FUR OHR')
    ylabel('Fraction of FUR OHR (%)')
    title('OH reactivity')  
    
    fileoutput = [prefix, 'figures/', Flight_ID, '_OHR_TS_', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    
    %{
    % ======================================================================
    % Find reactions that destroy NO and a peroxy radical and produce NO2.
    % ======================================================================
    % Next, let's look at ozone production on the last day.
    O3rates = PlotRates('O3',S,5,'unit','ppb_h','sumEq',1);
    O3netRate = sum(O3rates.Prod + O3rates.Loss,2);

    % The net ozone rate calculated above should be roughly equal to the rate of NO + XO2 = NO2.
    % Let's find reactions that destroy NO and a peroxy radical and produce NO2.
    XO2names = [S.Cnames(S.iRO2),'HO2'];
    [~,iNO]  = ismember('NO',S.Cnames); %index location of species
    [~,iNO2] = ismember('NO2',S.Cnames);
    [~,iXO2] = ismember(XO2names,S.Cnames);
    iNOtoNO2 = S.Chem.f(:,iNO)==-1 & ... %use stoichiometric coefficients to ID reactions
               S.Chem.f(:,iNO2)==1 & ...
               sum(S.Chem.f(:,iXO2)==-1,2);
    PNO2fromXO2 = sum(S.Chem.Rates(:,iNOtoNO2),2)*3600; %total NO2 production from XO2+NO, ppb/h
    
    % make the value can be visualized.
    figure
    plot(S.Time,O3netRate,'k-',S.Time,PNO2fromXO2,'r--')
    xlabel('Hour of Day')
    ylabel('Ozone Production (ppb h^-^1)')
    legend('O_3 Net','XO_2 + NO')
    purtyPlot
    fileoutput = [prefix, 'figures/', Flight_ID, '_O3_XO2PlusNO', MECHANISM, '.png'];
    saveas(gcf, fileoutput) % do not forget to save out the figure otherwise it cannot be displayed
    %}
    
    
end %end makeplots if
