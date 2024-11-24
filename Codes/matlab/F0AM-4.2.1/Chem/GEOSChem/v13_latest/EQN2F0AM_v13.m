function EQN2F0AM_v13
 % Converts GEOSChem .eqn files to F0AM mechanism file.
 % 20200426 Xiangyu Liu, now @PurdueU
 % 20211022 Lixu Jin@UM           Modify the script for GCv13. Individual functions are from Kaite Travis@NASA
 
 warning(['EQN2F0AM has only been validated to work with the standard.eqn file of GEOSChem v12.07. '...
     'Please confirm accurate translation between .eqn and .m files, '...
     'particularly assignment of photolysis frequencies as found in FJX_j2j.dat.'])

 warning(['This script is used to convert fullchem.eqn in GCv13.3.2 to F0AM ready version. '...
        'Please modify the codes if you want to convert in other versions.'])

 % 20220103 BENZ + OH = BRO2 + 0.54PHEN + 0.54HO2 + 0.46AROMRO2 + 0.18GLYX + 0.2CO +0.56AROMP4 needs to be changed manually 
 
GEOSCHEM_flnm = './fullchem.eqn'; % Lixu, may need to delete some commented lines from raw under #EQUATIONS.
save_flnm ='./test_output';


%% EXTRACT SPECIES, REACTIONS AND RATE CONSTANTS 
fid=fopen(GEOSCHEM_flnm);
l = fgetl(fid);
%scrol the file until get to the variable line
while ~strncmp(l,'#DEFVAR',7)
    l=fgetl(fid);
end

% GRAB SPECIES NAMES
Snames = []; 
l=fgetl(fid);
l=fgetl(fid);
while ~isempty(l)
    SplitS = regexp(l,'\<*\w*\>','match');
    Specie=SplitS(:,1);
    Snames = [Snames Specie];
    l = fgetl(fid);
end
l=fgetl(fid);
l=fgetl(fid);
l=fgetl(fid);

% FIX SPECIES NAMES
Fix=[];
while ~isempty(l)
    SplitF = regexp(l,'\<*\w*\>','match');
    SpecieF=SplitF(:,1);
    Fix = [Fix SpecieF];
    l = fgetl(fid);
end
Snames=[Snames Fix];% put the fixed species into the species to add
i = ismember(Snames,{'N2','O2','H2O','hv'}); % 20220218 Lixu, remove hv
Snames(i) = []; %remove N2, O2, H2O from species list
l=fgetl(fid);
l=fgetl(fid);
l=fgetl(fid);
l=fgetl(fid);


% GET REACTIONS AND SPECIES NUMBER
rstart = ftell(fid)-length(l)-1; 
nRx=0;
while feof(fid)~=1
    l=fgetl(fid);
    if contains(l,';')==1
        nRx=nRx+1;
    end
end
fseek(fid,rstart,'bof');
k = cell(nRx,1);
Rnames = cell(nRx,1);

% GRAB REACTION RATE
for i=1:nRx
    l = fgetl(fid);
    while l(1)=='/'
        l = fgetl(fid);
    end
    while (l(end)~=';')&&(l(end)~='}')
        l = [l fgetl(fid)]; 
    end
    s = regexp(l,':','start');
    Rnames{i}= l(1:s-2);
    n=regexp(l,';');
    k{i}= strtrim(l(s+2:n(1)));
end

fclose(fid);

%% TRANSFORM RATE CONSTANS INTO THE RATE EQUATION
k = strrep(k,'TEMP','T');
k = strrep(k,'_dp','.');
k = strrep(k,'d-','E-');
k = strrep(k,'d0','');
k = strrep(k,'d+','E+');
k = strrep(k,'d1','E1');
k = strrep(k,'d2','E2');
k = strrep(k,'d3','E3');
k = strrep(k,'d4','E4');
k = strrep(k,'d5','E5');
k = strrep(k,'d6','E6');
k = strrep(k,'d7','E7');
k = strrep(k,'d8','E8');
k = strrep(k,'d9','E9');
k = strrep(k,'EXP','exp');


del=[];
print=[];

% Lixu, 12/22/2021
% Modify rate constant equations for GCv13 usage. Several steps are done
% for our purposes.
% All changes are based on the fullchem.eqn and fullchem_RateLawFuncs.F90
% Fullchem.eqn: https://github.com/geoschem/geos-chem/blob/526774872b803cd60f6019bb47af4a17772588de/KPP/fullchem/fullchem_RateLawFuncs.F90
% Rate Law: https://github.com/geoschem/geos-chem/blob/526774872b803cd60f6019bb47af4a17772588de/KPP/fullchem/fullchem_RateLawFuncs.F90

for i=1:nRx
    a=regexp(k{i},'('); 
    b=regexp(k{i},',');
    c=regexp(k{i},')');
    
    if strncmp(k{i},'GCARR_ac(',9) % compares up to 8 characters of k{i} and 'GCARR_ac'. The function returns 1 (true) if the two are identical and 0 (false) otherwise. 
        k{i} = insertAfter(k{i}, '(', 'T, ' ); % add temperature input. 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); %newStr = erase(str,match) deletes all occurrences of match in str
    elseif strncmp(k{i},'GCARR_ab(',9) 
        k{i} = insertAfter(k{i}, '(', 'T, ' ); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GCARR_abc(',10) 
        k{i} = insertAfter(k{i}, '(', 'T, ' );
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GC_ISO1(',8) 
        k{i} = insertAfter(k{i}, '(', 'T, ' );
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_ISO2(',8) 
        k{i} = insertAfter(k{i}, '(', 'T, ' ); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');          
    elseif strncmp(k{i},'GC_EPO_a(',9)
        k{i} = insertAfter(k{i},'(','M, T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GC_PAN_abab(',12)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_PAN_acac(',12)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');   
    elseif strncmp(k{i},'GC_NIT(',7) % Lixu, add M
        k{i} = insertAfter(k{i},'(','M, T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GC_ALK(',7)
        k{i} = insertAfter(k{i},'(','M, T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GC_HO2HO2_acac(',14)
       k{i} = insertAfter(k{i},'(','H2O, M, T, ');
       k{i} = strrep(k{i},'*NUMDEN','.*M');
       k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GC_TBRANCH_1_acac(',18)
       k{i} = insertAfter(k{i},'(','T, '); 
       k{i} = strrep(k{i},'*NUMDEN','.*M');
       k{i} = erase(k{i},';');  
   elseif strncmp(k{i},'GC_TBRANCH_2_acabc(',19)
       k{i} = insertAfter(k{i},'(','T, '); 
       k{i} = strrep(k{i},'*NUMDEN','.*M');
       k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_RO2HO2_aca(',14)
       k{i} = insertAfter(k{i},'(','T, '); 
       k{i} = strrep(k{i},'*NUMDEN','.*M');
       k{i} = erase(k{i},';');   
    elseif strncmp(k{i},'GC_DMSOH_acac(',14)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_GLYXNO3_ac(',13)
        k{i} = insertAfter(k{i},'(','M,T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_OHHNO3_acacac(',17)
        k{i} = insertAfter(k{i},'(','M,T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_GLYCOH_A_a(',14)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');     
    elseif strncmp(k{i},'GC_GLYCOH_B_a(',14)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    % miss GC_GLYCOH_B_ac, currently not avaialbe in fullchem.eqn
    elseif strncmp(k{i},'GC_GLYCOH_B_ac(',15)
        k{i} = insertAfter(k{i},'(','T, '); % add temperature input
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');     
    elseif strncmp(k{i},'GC_HACOH_A_ac(',14)
        k{i} = insertAfter(k{i},'(','T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_HACOH_B_ac(',14)%T must >=190K
        k{i} = insertAfter(k{i},'(','T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GC_OHCO_a(',10)
        k{i} = insertAfter(k{i},'(','M,T, ');
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GC_RO2NO_A1_ac(',15)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GC_RO2NO_B1_ac(',15)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GC_RO2NO_A2_aca(',16)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GC_RO2NO_B2_aca(',16)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';'); 
    elseif strncmp(k{i},'GCJPLEQ_acabab(',15)
        k{i} = insertAfter(k{i},'(','M,T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GCJPLPR_aa(',11)
        k{i} = insertAfter(k{i},'(','M, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');  
    elseif strncmp(k{i},'GCJPLPR_aba(',12)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GCJPLPR_abab(',13)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'GCJPLPR_abcabc(',15)
        k{i} = insertAfter(k{i},'(','M, T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'ARRPLUS_abde(',13)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'TUNPLUS_abcde(',14)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif strncmp(k{i},'ARRPLUS_ade(',12)
        k{i} = insertAfter(k{i},'(','T, '); 
        k{i} = strrep(k{i},'*NUMDEN','.*M');
        k{i} = erase(k{i},';');
    elseif contains(k{i}, 'State_Het') % delete all the Heterogeneous reactions
        del=[del,i];

    elseif contains(k{i},'PHOTOL')
        % Lixu, 10/22/2021
        % Modify photolysis ID for GCv13. Several steps are done for our
        % purposes.
        % 1) add photolysis names and IDs based on http://geoschemdata.wustl.edu/ExtData/CHEM_INPUTS/FAST_JX/v2021-10/FJX_j2j.dat 
        % 2) delete IDs if GCv13.3.2 doesn't include in fullchem.eqn
        % 3) map Jvalues to MCM (we should create a nice mapping for all IDs) based on previous GEOSCHEM_J.m script
        % 4) How to deal with remainings? It would be helpful if GCST coudl provide how they map GC names from MCM names. I made lots of assumptions to make it work.
        % GEOSCHEM_K.m modification
        Pnum = regexp(k{i},'\d*','match');
        Pnum = str2num(Pnum{1});   
        
        % list definitions
        % NOTE, assignments for reaction ID#'s likely differ b/w each GEOS_CHEM version!
        Jdef = {
%            %1  'JO2'  % GC included but F0AM not included
            2   'JO3P' % J2, ok
            3   'JO1D' % J1, ok
%            %6  'JNO'    % GC included but F0AM not included
            7   'JHCHO_HO2' % J11, ok
            8   'JHCHO_H2'  % J12, ok
            9   'JH2O2'     % J3, ok
            10  'JCH3OOH'   % J41, JMP in v12
            11  'JNO2'      % J4
            12  'JNO3_NO2'  % J6
            13  'JNO3_NO'   % J5
            14  'JN2O5_NO2' % Jn19
            15  'JHONO'     % J7
            16  'JHNO3'     % J8
            17  'JHNO4_a' % Jn21, assumption made as MCM do not consider the photolysis here
            18  'JHNO4_b' % Jn22, assumption made as MCM do not consider the photolysis here
            19  'JClNO3_Cl' % Jn34, assumption made as MCM do not consider the photolysis here
            20  'JClNO3_ClO'% Jn35, assumption made as MCM do not consider the photolysis here
            21  'JClNO2'    % Jn23, assumption made as starndard MCM do not include ClNO2
            22  'JCl2'      % Jn32, assumption made as MCM do not consider the photolysis here
            23  'JBr2'      % Jn24, assumption made as MCM do not consider the photolysis here
            24  'JHOCl'     % Jn36, assumption made as MCM do not consider the photolysis here
            25  'JOClO'     % Jn37, assumption made as MCM do not consider the photolysis here 
            26  'JCl2O2'    % Jn38, assumption made as MCM do not consider the photolysis here 
            27  'JClO'      % Jn33, assumption made as MCM do not consider the photolysis here 
            28  'JBrO'      % Jn25, assumption made as MCM do not consider the photolysis here 
            29  'JBrNO3_Br' % Jn28, assumption made as MCM do not consider the photolysis here 
            30  'JBrNO3_BrO'% Jn29, assumption made as MCM do not consider the photolysis here 
            31  'JBrNO2'    % Jn27, assumption made as MCM do not consider the photolysis here 
            32  'JHOBr'     % Jn26, assumption made as MCM do not consider the photolysis here 
            33  'JBrCl'     % Jn31, assumption made as MCM do not consider the photolysis here 
            % Lixu, 10/24/2021
            % I am not adding #34-#55 since these species have minor
            % impact on my study. Users are recommended to add them for
            % their own purposes.
            56  'JCHBr3'    % Jn30, assumption made as MCM do not consider the photolysis here
            59  'JPAN'      % Jn56*10.0, assumption made as MCM do not consider the photolysis here, there are several selections including J41, J17, J56*1.6, J56*4, and J56*10
            61  'JALD2a'    % J13, MCM only considers radical channel
            62  'JALD2b'    % J13, ch3cho; MCM only considers radical channel; FAST JX has QY=0, Jn5 might be another potential one based on FAST JX but I would keep MCM selection here.
            63  'JMVKa'     % J23, matching MCM
            64  'JMVKb'     % J24, matching MCM
            65  'JMVKc'     % J24, matching MCM
            66  'JMACR'     % 0.5*(J18 + J19), assumption made as MCM and GC have different photolysis path       
            68  'JGLYC'     % J15, matching MCM
            69  'JMEK'      % J22, matching MCM
            70  'JPrAld'    % J14, rename JPrAld from JRCHO, matching propanal in MCM
            71  'JMGlyxl'   % J34, renmae JMGlyxl from JMGLY, matching MCM
            72  'JGLYXa'    % J33, matching MCM
            73  'JGLYXb'    % J31, matching MCM
            74  'JGLYXc'    % J32, matching MCM
            75  'JHAC'      % J22, matching MCM 
            76  'JACETa'    % J21, MCM only considers this channel
            77  'JACETb'    % J21, acetone
            78  'JONIT2'    % assuming it's J41 but I could be wrong.
            79  'JCH3OOH'       % J41, assumption made based on FAST JX
            80  'JETP'          % J41*0.5, assumption made based on FAST JX
            81  'JCH3OOH'       % J41, assumption made based on FAST JX
            82  'JCH3OOH'       % J41, assumption made based on FAST JX
            83  'JCH3OOH'       % J41, assumption made based on FAST JX
            84  'JCH3OOH'       % J41, assumption made based on FAST JX
            85  'JCH3OOH'       % J41, assumption made based on FAST JX          
            86  'JCH3OOH'       % Assuming JHMHP is similar to JCH3OOH (J41), assumption made based on FAST JX     
            87  'JCH3OOH'       % Assuming JPrAldP is similar to JCH3OOH (J41), assumption made based on FAST JX    
            88  'JMGlyxl'       % J34, mathcing MCM
            89  'JPROPNN'       % J56; Muller et al., ACP (2014)
            90  'JMGlyxl'       % J34, assumption made based on FAST JX        
            91  'JPrAld'        % J14, assumption made based on FAST JX        
            92  'JCH3OOH'       % J41, assumption made based on FAST JX        
            93  'JMVKN'         % Assuming JPrAldP as JMVKN (J56*1.6),  assumption made based on FAST JX
            94  'JONIT1'        % Assuming JENOL as JONIT1 (J54),  assumption made based on FAST JX
            95  'JCH3OOH'       % Assuming JPrAldP is similar to JCH3OOH (J41)
            96  'JCH3OOH'       % Assuming JPrAldP is similar to JCH3OOH (J41)
            97  'JCH3OOH'       % J41
            98  'JCH3NO3'       % J51, Named as R4N2 in GCv12
            99  'JCH3OOH'       % J41
%            %100  'JH2SO4'     % assuming it's not important
            101 'JClOO'         %  Jn39, assumption made as MCM do not consider the photolysis here 
            103 'JMPNa'         % 0.5*(Jn16 + Jn17)*0.05, add up scale factor (not sure), %95/5 quantum yields set in chem file, assumption made as MCM do not consider the photolysis here 
            104 'JMPNb'         % 0.5*(Jn16 + Jn17)*0.95, add up scale factor (not sure), %95/5 quantum yields set in chem file, assumption made as MCM do not consider the photolysis here 
            105 'JH2O2'         % J3
            106 'JPAN'          % Follow previous instruction. Assume JICN as JPAN
            107 'JETHLN'        % Jmcm.J56*4.3; Muller et al., ACP (2014), not sure if this should be JHPALD
            108 'JMVKN'         % Jmcm.J56*1.6; Muller et al., ACP (2014), not sure if this should be JHPALD
            109 'JMACRN'        % Jmcm.J56*10; Muller et al., ACP (2014), not sure if this should be JHPALD
            110 'JMACR'         % Assuming JMACRNP as JMACR (J18+J19), not sure if this should be JHPALD
            111 'JONIT1'    % J54, check QY
            112 'JONIT1'    % J54, check QY
            113 'JONIT1'    % J54, check QY
            114 'JI2'       % Jn40
            115 'JHOI'      % Jn41
            116 'JIO'       % Jn42
            117 'JOIO'      % Jn43
            118 'JINO'      % Jn44
            119 'JIONO'     % Jn45
            120 'JIONO2'    % Jn46
            121 'JI2O2'     % Jn47
            % Lixu, 12/21/2021
            % I am not adding #122-#125 since these species have minor
            % impact on my study. Users are recommended to add them for
            % their own purposes.            
            126 'JI2O4'     % Jn48
            127 'JI2O3'     % Jn49
            128 'JIBr'      % Jn51
            129 'JICl'      % Jn50        
            % Lixu, 12/21/2021
            % I am not adding #130-#133 since these species have minor
            % impact on my study. Users are recommended to add them for
            % their own purposes.            
            % photolysis of Coarse mode inorganic nitrate. Important in plumes? Check with Lu.            
            134 'JMENO3'        % J51, renamed from JR4N2 as in previous version. We assume JCH3NO3 is similar to JMENO3
            135 'JETNO3'        % J52
            136 'JIPRNO3'       % J54 
            137 'JNPRNO3'       % J53
            % New from GCv13
            138 'JCH3OOH'       % J41
            139 'JCH3OOH'       % J41
            140 'JCH3OOH'       % J41
            141 'JCH3OOH'       % J41
            142 'JCH3OOH' % Assuming JHPALD1 as JCH3OOH, J41
            143 'JHPALD2' % Assuming it's J15
            144 'JCH3OOH' % Assuming JPrAldP is similar to JCH3OOH (J41)
            145 'JCH3OOH' % Assuming JPrAldP is similar to JCH3OOH (J41)
            146 'JONIT1'   % J54
            147 'JONIT1'   % J54
            148 'JONIT1'   % J54
            149 'JONIT1'   % J54
            150 'JNITP'    % Assuming JNITP as JONIT1, J54            
            151 'JCH3OOH'  % J41            
            152 'JONIT1'   % J54
            153 'JPrAld'   % J14, rename JPrAld from JRCHO
            154 'JCH3OOH'  % J41            
            155 'JCH3OOH' % Assuming JHP2 as JCH3OOH, J41
            156 'JCH3OOH' % J41            
            157 'JCH3OOH' % Assuming JPrAldP is similar to JCH3OOH (J41)
            158 'JCH3OOH' % J41
            159 'JONIT1'  % J54            
            160 'JMACRNP' % J56.*10            
            161 'JPrAld'  % J14, rename JPrAld from JRCHO
            162 'JCH3OOH' % J41            
            163 'JBALD'   % J19        
            164 'JCH3OOH' % J41
            165 'JCH3OOH' % J41
            166 'JPROPNN' % J56
            };  
        % Looking into GEOSCHEM_J.m script then to map it. Lixu, 12/21/2021
        Jnum = cell2mat(Jdef(:,1));

        j = find(Jnum==Pnum);
        if ~isempty(j)
            k{i} = Jdef{j,2};
%             disp([k{i} ' ' Rnames{i}]) %uncomment this to check J-value translations
        else
            del=[del,i];%delete the reations that are not in GEOSCHEM_AllRxn file and display on the command Window
             printi=['Photolysis reaction #' num2str(Pnum) ', "',Rnames{i},'", in the KPP file that is not included in GEOSCHEM_J.m. Please check and add the reaction by yourself!\n'];
             fprintf(printi);
        end
        
    elseif ~strncmp(k{i},'GC',2)
        k{i}=k{i}(1:end-1);
        
    else
        del=[del,i];
        g=regexp(k{i},'G');%delete the reations rate forms that are not in gckpp_Rates.F90 file and display on the command Window
        printi=['Rate form"',k{i}(g:a-1),'"of reaction"',Rnames{i},'"does not show in the gckpp_Rate file. Please check and add the reaction by yourself!\n'];
        fprintf(printi);
    end
    
end
k_del = k(del); %store
Rnames_del = Rnames(del);
k(del)=[];%delete the rate constants
Rnames(del)=[];%delete the reactions
nRx=nRx-size(del,2);%change the reaction number

%% CHANGE THE RATE EQUATION INTO F0AM USEABLE FORM

for i=1:length(Rnames)
    name = Rnames{i};
    ki = k{i};
    rawS=[];
   
    %grab the products
    eqn = regexp(name,'=','start'); 
    rhs=name(eqn+2:end);
    bracketl=regexp(rhs,'{','start');
    if ~isempty(bracketl)
        rhs=rhs(1:bracketl-2);
    end

    add=regexp(rhs,'+','start');
    
    if isempty(add)
        rawS{1}=rhs(1:end);

    elseif size(add,2)==1
        rawS{1,1}=rhs(1:add-2);
        rawS{1,2}=rhs(add+2:end);
    else
        rawS{1,1}=rhs(1:add(1)-2);
        for j=1:size(add,2)-1
            rawS{1,j+1}=rhs(add(j)+2:add(j+1)-2);
        end
        rawS{1,j+2}=rhs(add(j+1)+2:end);
        
    end
    for j=1:size(rawS,2)
            while strncmp(rawS{j},' ',1) %delete the space at the front of the products
                rawS{j}=rawS{j}(2:end);
            end
    end
    
     %grab the reactants
    rct = regexp(name(1:eqn-1),'\<*[0-9a-zA-Z.*]\w*\>','match');
    
    %delete the constant species 'M'and 'O2' 
    delr=[];
    for j=1:size(rct,2)
        if (rct{:,j}=='M') 
            delr=[delr,j];
        elseif strcmp(rct{:,j},'O2') %account for O2 in k, 20200426 GMW
            ki = [ki '.*0.21.*M'];
            delr=[delr,j];
        elseif strcmp(rct{:,j},'N2') %account for N2 in k, 20200426 GMW
            ki = [ki '.*0.78.*M'];
            delr=[delr,j];
        elseif strcmp(rct{:,j},'H2O') %account for H2O in k, 20200426 GMW
            ki = [ki '.*H2O'];
            delr=[delr,j];
        elseif strcmp(rct{:,j},'hv') %% 20220218 Lixu, remove hv
            delr=[delr,j];
        end
    end
     rct(:,delr)=[];
    prd=rawS;
  
    chart=cell(length(prd),2);
    
    %seperate the coeffients and the species
    for j=1:length(prd)
        firstN=regexp(prd{1,j},'[0-9]','start');
        firstC=regexp(prd{1,j},'[A-Z]','start');
        if ~isempty(firstN)&&firstN(1)==1
           chart{j,1} = prd{1,j}(1:firstC(1)-1);
            chart{j,2} = prd{1,j}(firstC(1):end);
        else
            chart{j,1} = '1';
            chart{j,2} = prd{1,j};
        end
    end
    
    delc=[];
    for m=1:size(chart,1)
%         if strncmp(chart{m,2},'O2',2)
        if any(strcmp(chart{m,2},{'N2','O2','H2O'}))
            delc=[delc,m];
        end
    end
    chart(delc,:)=[];

    %if contains(ki,'J')
    %    rct(:,2)=[]; % delete the 'hv'
    %end
    Gstr{i}=''; fstr{i}='';
    for o=1:length(rct)
        Gstr{i} = [Gstr{i} 'Gstr{i,' num2str(o) '} = ''' rct{o} '''; '];
        fstr{i} = [fstr{i} 'f' rct{o} '(i)=f' rct{o} '(i)-1; '];
    end
    
    %build product f-string
    coef = chart(:,1)';%coefficient
    prd2=chart(:,2)';
    
    for p=1:length(prd2)
        fstr{i} = [fstr{i} 'f' prd2{p} '(i)=f' prd2{p} '(i)+' coef{p} '; '];
    end

    Rnames{i} = name;
    k{i} = ki;
end


%% -----------------WRITE RATES SCRIPT FILE---------------------------------------------------

%Open script file
[mpath,name] = fileparts(which(GEOSCHEM_flnm));

%Lixu
name = 'GEOSCHEMv13_AllRxns_v2';

if nargin<2 %default is same as input MCM filename
    save_flnm = [name '.m'];
end
[fid,msg] = fopen(fullfile(mpath,save_flnm),'w');
if fid==-1
    disp('Problem opening script m-file. Message from fopen:')
    disp(msg)
    return
end    

%Print header
fprintf(fid,'%s\n',['% ' save_flnm]);
fprintf(fid,'%s\n',['% generated from ' GEOSCHEM_flnm]);
fprintf(fid,'%s\n',['% ' datestr(now,'YYYYmmdd')]);
fprintf(fid,'%s\n',['% # of species = ' num2str(length(Snames))]);
fprintf(fid,'%s\n\n',['% # of reactions = ' num2str(length(Rnames))]);

%Print excluded reactions
fprintf(fid,'%s\n','% REACTIONS EXCLUDED FROM MECHANISM:');
for i = 1:length(Rnames_del)
    fprintf(fid,'%s\n',['% ' Rnames_del{i} ' : ' k_del{i}]);
end
fprintf(fid,'\n');

%Print species names
fprintf(fid,'%s\n','SpeciesToAdd = {...');
Snames = Snames';
for i=1:length(Snames)
    s = Snames{i};
    fprintf(fid,'%s',['''' s '''; ']);
    if rem(i,10)==0
        fprintf(fid,'%s\n','...');
    end
end
fprintf(fid,'%s\n\n','};');

%Print some code
fprintf(fid,'%s\n\n','AddSpecies');

%print reaction parameters
for i=1:length(Rnames)
    fprintf(fid,'%s\n','i=i+1;');
    fprintf(fid,'%s\n',['Rnames{i} = ''' Rnames{i} ''';']);
    fprintf(fid,'%s\n',['k(:,i) = ' k{i} ';']);
    fprintf(fid,'%s\n',Gstr{i});
    fprintf(fid,'%s\n\n',fstr{i});
end

fprintf(fid,'%s\n\n\n',['%END OF REACTION LIST']);
fclose(fid);
 end
