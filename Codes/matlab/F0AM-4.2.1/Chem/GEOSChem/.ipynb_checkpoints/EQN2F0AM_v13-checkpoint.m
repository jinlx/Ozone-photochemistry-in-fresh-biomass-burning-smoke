 function EQN2F0AM_v13(GEOSCHEM_flnm,save_flnm)
 %  function EQN2F0AM(GEOSCHEM_flnm,save_flnm)
 % Converts GEOSChem .eqn files to F0AM mechanism file.
 %
 % 20200426 Xiangyu Liu
 % 20211022 Lixu Jin@UM           Modify the script for GCv13.  
 warning(['EQN2F0AM has only been validated to work with the standard.eqn file of GEOSChem v12.07. '...
     'Please confirm accurate translation between .eqn and .m files, '...
     'particularly assignment of photolysis frequencies as found in FJX_j2j.dat.'])

 warning(['This script is used to convert fullchem.eqn in GCv13.3.2 to F0AM ready version. '...
        'Please modify the codes if you want to convert in other versions.'])

%% EXTRACT SPECIES, REACTIONS AND RATE CONSTANTS 
fid=fopen(GEOSCHEM_flnm);

l = fgetl(fid);
%scrol the file until get to the variable line
while ~strncmp(l,'#DEFVAR',7)
    l=fgetl(fid);
end
%grab species names
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
%get the fix species name
Fix=[];
while ~isempty(l)
    SplitF = regexp(l,'\<*\w*\>','match');
    SpecieF=SplitF(:,1);
    Fix = [Fix SpecieF];
    l = fgetl(fid);
end
Snames=[Snames Fix];% put the fixed species into the species to add
i = ismember(Snames,{'N2','O2','H2O'});
Snames(i) = []; %remove N2, O2, H2O from species list
l=fgetl(fid);
l=fgetl(fid);
l=fgetl(fid);
l=fgetl(fid);

%get the reactions and species number
rstart = ftell(fid)-length(l)-1; 
nSp=size(Snames,2);
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

%grab the reaction rate form and constants
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
del=[];
print=[];
% Lixu, 10/21/2021
% Modify rate constant equations for GCv13 usage. Several steps are done
% for our purposes.
% All changes are based on the fullchen.eq
% 1)changed d to E;
% 2)delete GCJPLPR and add GCJPLPR_aba and GCJPLPR_abab;
% 3)changed GC_HO2HO2 to GC_HO2HO2_acac;
% 4)changed GC_OHCO to GC_OHCO_a;
% 5)delete GC_RO2NO and add GC_RO2NO_A2_aca and GC_RO2NO_B2_aca;
% 6)delete GC_TBRANCH and add GC_TBRANCH_1_acac and GC_TBRANCH_2_acabc;
% 7)delete GCJPLEQ and add GCJPLEQ_acabab;
% 8)delete GC_RO2HO2 and add GC_RO2HO2_aca 
% 9)delete GC_DMSOH and add GC_DMSOH_acac
%10)delete GC_GLYCOHA and GC_GLYCOHB, and add GC_GLYCOH_A_a and GC_GLYCOH_B_a
%11)delete GC_HACOHA and GC_HACOHB, and  add GC_HACOH_A_ac and GC_HACOH_B_ac
%12)changed GC_OHHNO3 to GC_OHHNO3_acacac

% just include the rate form in the gckpp_Rates.F90 file
for i=1:nRx
    a=regexp(k{i},'('); %Match regular expression, its used as indexing method
    b=regexp(k{i},',');
    c=regexp(k{i},')');

    k{i} = strrep(k{i},'d','E'); %newStr = strrep(str,old,new) replaces all occurrences of old in str with new.    

    if strncmp(k{i},'GCARR_ac',8) %tf = strncmp(s1,s2,n) compares up to n characters of s1 and s2. The function returns 1 (true) if the two are identical and 0 (false) otherwise. 
        % changed to use the GCARR function, 20200426 GMW
        k{i} = insertAfter(k{i},'(','T, '); % newStr = insertAfter(str,pat,newText) inserts newText into str after the substring specified by pat and returns the result as newStr. add temperature input. 
        % For example, GCARR(3.00E-12, 0.0E+00, -1500.0) will become GCARR(T, 3.00E-12, 0.0E+00, -1500.0)
        k{i} = strrep(k{i},'*NUMDEN','.*M'); %newStr = strrep(str,old,new) replaces all occurrences of old in str with new.
        % For example GCARR(6.00E-34, 2.4E+00, 0.0)*NUMDEN wil become GCARR(6.00E-34, 2.4E+00, 0.0).*M
        k{i} = erase(k{i},';'); %newStr = erase(str,match) deletes all occurrences of match in str
        % For example, GCARR(3.00E-12, 0.0E+00, -1500.0); will become GCARR(3.00E-12, 0.0E+00, -1500.0)
        
%         if contains(k{i},'*NUMDEN')==1
%             k{i}=[k{i}(a+1:b(1)-1),'.*exp(',k{i}(b(2)+2:end-10),'./T).*M'];
%         else
%             k{i}=[k{i}(a+1:b(1)-1),'.*exp(',k{i}(b(2)+2:end-3),'/T)'];
%         end
 
    elseif strncmp(k{i},'GCJPLPR_aba(',12)
        A1 = str2double(k{i}(a+1:b(1)-1));
        %disp(A1)
        B1 = str2double(k{i}(b(1)+1:b(2)-1));
        %disp(B1)
        A2 = str2double(k{i}(b(2)+1:b(3)-1));
        %disp(A2)
        FV = str2double(k{i}(b(3)+1:end-2));
        RLOW=[num2str(A1),'.*(300./T).^(',num2str(B1),').*M'];
        %disp(RLOW)
        XYRAT = [RLOW,'./','(',num2str(A2),')'];
        %disp(XYRAT)
        BLOG=['log10(',XYRAT,')'];
        %disp(BLOG)
        FEXP = ['1./(1+(',BLOG,').*(',BLOG,'))'];
        %disp(FEXP)
        k{i} = [RLOW,'.*(',num2str(FV),'.^(',FEXP,'))./(1+',XYRAT,')']; 
        
    elseif strncmp(k{i},'GCJPLPR_abab(',13)     
        A1 = str2double(k{i}(a+1:b(1)-1));
        %disp(A1)
        B1 = str2double(k{i}(b(1)+1:b(2)-1));
        %disp(B1)
        A2 = str2double(k{i}(b(2)+1:b(3)-1));
        %disp(A2)
        B2 = str2double(k{i}(b(3)+1:b(4)-1));
        %disp(B2)
        FV = str2double(k{i}(b(4)+1:end-2));
        %disp(FV)
        RLOW=[num2str(A1),'.*(300./T).^(',num2str(B1),').*M'];
        %disp(RLOW)
        RHGIH = [num2str(A2),'.*','(','(300./T).^(',num2str(B2),'))'];
        %disp(RHGIH)
        XYRAT=[num2str(A1/A2),'.*((300./T).^(',num2str(B1-B2),')).*M'];
        %disp(XYRAT)
        BLOG=['log10(',XYRAT,')'];
        %disp(BLOG)
        FEXP = ['1./(1+(',BLOG,').*(',BLOG,'))'];
        %disp(FEXP)   
        % Rate
        k{i} = [RLOW,'.*(',num2str(FV),'.^(',FEXP,'))./(1+',XYRAT,')'];       
 
    elseif strncmp(k{i},'GC_HO2HO2_acac',14) 
        k{i}='K_HO2_HO2';
        
    elseif strncmp(k{i},'GC_OHCO_a',9)
        k{i}='K_OH_CO';
     
    elseif strncmp(k{i},'GC_RO2NO_A2_aca(',16)     
        A0=str2double(k{i}(a+1:b(1)-1));
        %disp(A0)
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        %disp(C0)
        A1=str2double(k{i}(b(2)+1:end-2));
        %disp(A1)
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        ALPHA= num2str(1.94e-22);
        BETA = num2str(0.97);
        XXYN = [num2str(ALPHA), '.*exp(',BETA,'.*',num2str(A1),').*M'];
        Y300 = num2str(0.826);
        XMINF= num2str(8.1);
        YYYN=[Y300,'.*(300./T).^',XMINF];
        AAA=['log10(',XXYN,'./(',YYYN,'))'];
        ZZYN=['1./(1+(',AAA,').^2)'];
        RARB=['(' XXYN './(1+(' XXYN './(' YYYN ')))).*' XF '.^(' ZZYN ')'];
        FYRNO3=[RARB,'./(1+',RARB,')'];
        
        % Rate
        k{i}=[R0,'.*',FYRNO3];
        
    elseif strncmp(k{i},'GC_RO2NO_B2_aca(',16)     
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        A1=str2double(k{i}(b(2)+1:end-2));
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        ALPHA= num2str(1.94e-22);
        BETA = num2str(0.97);
        XXYN = [num2str(ALPHA), '.*exp(',BETA,'.*',num2str(A1),').*M'];
        Y300 = num2str(0.826);
        XMINF= num2str(8.1);
        XF   = num2str(0.411)
        YYYN=[Y300,'.*(300./T).^',XMINF];
        AAA=['log10(',XXYN,'./(',YYYN,'))'];
        ZZYN=['1./(1+(',AAA,').^2)'];
        RARB=['(' XXYN './(1+(' XXYN './(' YYYN ')))).*' XF '.^(' ZZYN ')'];
        FYRNO3=[RARB,'./(1+',RARB,')'];
        
        % Rate
        k{i}=[R0,'.*(1-',FYRNO3,')'];
        
    elseif strncmp(k{i},'GC_TBRANCH_1_acac',17)
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        A1=str2double(k{i}(b(2)+1:b(3)-1));
        C1=str2double(k{i}(b(3)+1:end-2));
        
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        R1=[num2str(A1),'.*exp(',num2str(C1),'./T)'];
        k{i}=[R0,'./(1+',R1,')'];
    
    elseif strncmp(k{i},'GC_TBRANCH_2_acabc',18)
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        A1=str2double(k{i}(b(2)+1:b(3)-1));
        B1=str2double(k{i}(b(3)+1:b(4)-1));
        C1=str2double(k{i}(b(4)+1:end-2));
        
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        R1=[num2str(A1),'.*exp(',num2str(C1),'./T).*(300./T).^(',num2str(B1),')'];
        k{i}=[R0,'./(1+',R1,')'];

    elseif strncmp(k{i},'GC_OHHNO3_acacac',16)
        k{i}='K_OH_HNO3';
     
    elseif strncmp(k{i},'GCJPLEQ_acabab',14) 
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        A1=str2double(k{i}(b(2)+1:b(3)-1));
        B1=str2double(k{i}(b(3)+1:b(4)-1));
        A2=str2double(k{i}(b(4)+1:b(5)-1));
        B2=str2double(k{i}(b(5)+1:b(6)-1));
        FV=str2double(k{i}(b(6)+1:end-2));
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        
        RLOW = [num2str(A1),'.*','(','(300./T).^(',num2str(B1),')).*M'];
        %disp(RLOW)
        XYRAT = [RLOW,'./','(',num2str(A2),')'];
        %disp(XYRAT)
        BLOG = ['log10(',XYRAT,')'];
        %disp(BLOG)
        FEXP = ['1./(1+(',BLOG,').*(',BLOG,'))'];
        %disp(FEXP)
        R1 = [RLOW,'.*(',num2str(FV),'.^(',FEXP,'))./(1+',XYRAT,')'];             
        k{i}=[R1,'./(',R0,')'];
    elseif strncmp(k{i},'GC_RO2HO2_aca',13)
        A0 = str2double(k{i}(a+1:b(1)-1));
        C0 = str2double(k{i}(b(1)+1:b(2)-1));
        A1 = str2double(k{i}(b(2)+1:end-2));
        R0 = [num2str(A0),'.*exp(',num2str(C0),'./T)'];
        k{i}=[R0,'.*(1-exp(-0.245.*',num2str(A1),'))'];
     
    elseif strncmp(k{i},'GC_DMSOH_acac',13)
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:b(2)-1));
        A1=str2double(k{i}(b(2)+1:b(3)-1));
        C1=str2double(k{i}(b(3)+1:end-2));
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        R1=[num2str(A1),'.*exp(',num2str(C1),'./T)'];
        k{i}=['(M.*0.2095.*' R0 ')./(1+0.2095.*' R1 ')'];
    
    elseif strncmp(k{i},'GC_GLYCOH_A_a',13)
        A0=str2double(k{i}(a+1:end-2));
        
        GLYC_FRAC='1-11.0729*exp((-1/73).*T)';%T must >=176K
        k{i}=[num2str(A0),'.*(',GLYC_FRAC,')'];
        
    elseif strncmp(k{i},'GC_GLYCOH_B_a',13)
        A0=str2double(k{i}(a+1:end-2));
        GLYC_FRAC='1-11.0729.*exp((-1/73).*T)';%T must >=176K
        k{i}=[num2str(A0),'.*(1-(',GLYC_FRAC,'))'];
        
    elseif strncmp(k{i},'GC_GLYXNO3_ac',13)
        O2='0.2095.*M';
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:end-2));
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        k{i}=[R0,'.*(',O2,'+3.5e18)./(2.*',O2,'+3.5e18)'];
    
    elseif strncmp(k{i},'GC_HACOH_A_ac',13)
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:end-2));
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        HAC_FRAC='1-23.7.*exp((-1/60).*T)';%T must >=190K
        k{i}=[R0,'.*(',HAC_FRAC,')'];
        
    elseif strncmp(k{i},'GC_HACOH_B_ac',13)
        A0=str2double(k{i}(a+1:b(1)-1));
        C0=str2double(k{i}(b(1)+1:end-2));     
        R0=[num2str(A0),'.*exp(',num2str(C0),'./T)'];
        HAC_FRAC='1-23.7.*exp((-1/60).*T)';%T must >=190K
        k{i}=[R0,'.*(1-(',HAC_FRAC,'))'];
       
        
    elseif strncmp(k{i},'ARRPLUS_abEe',12)
        k{i} = strrep(k{i},'abEe','abde');
        A0=str2double(k{i}(a+1:b(1)-1));
        B0=str2double(k{i}(b(1)+1:b(2)-1));
        D0=str2double(k{i}(b(2)+1:b(3)-1));
        E0=str2double(k{i}(b(3)+1:end-2));        
        k{i} = [num2str(A0),'.*(', num2str(D0), '+(T.*', num2str(E0), ')).*','exp(-',num2str(B0),'./T)'];%Temperture limits, fine for now.
        disp(k{i});
        
    elseif strncmp(k{i},'TUNPLUS_abcEe',12)
        k{i} = strrep(k{i},'abcEe','abcde');
        A0=str2double(k{i}(a+1:b(1)-1));
        B0=str2double(k{i}(b(1)+1:b(2)-1));
        C0=str2double(k{i}(b(2)+1:b(3)-1));
        D0=str2double(k{i}(b(3)+1:b(4)-1));    
        E0=str2double(k{i}(b(4)+1:end-2));
        Rate = ['(',num2str(D0),'+(T.*',num2str(E0),'))'];
        k{i} = [Rate,'.*exp(',num2str(B0),'./T).*exp(',num2str(C0),'./T.^3)'];%Temperture limits, fine for now.
        
    
    elseif strncmp(k{i},'ARRPLUS_aEe',11)
        k{i} = strrep(k{i},'aEe','ade');
        A0=str2double(k{i}(a+1:b(1)-1));
        D0=str2double(k{i}(b(1)+1:b(2)-1));
        E0=str2double(k{i}(b(2)+1:end-2));
        k{i} = [num2str(A0),'.*(',num2str(D0),'+(T.*',num2str(E0),'))']; %Temperture limits, fine for now.
        
    elseif strncmp(k{i},'HET',3) % delete all the Heterogeneous reactions
        del=[del,i];
        
    elseif contains(k{i},'PHOTOL')
        % Lixu, 10/22/2021
        % Modify photolysis ID for GCv13. Several steps are done for our
        % purposes.
        % 1)compare the diff b/ GCv13 and GCv12 in FJX_j2j.dat;
        % see /home/lj152920/project/geos-chem/ExtData/CHEM_INPUTS/FAST_JX/v2021-10

             
        % 2)fix some scale factor issues in old script. For example, adding
        %   scale factors for #17 and #18, which is originally missed in
        %   old script;
        
        % 3)add new J which is not originally in the old version
        % FJX_j2j.dat. For examples, #78 and other IDs commented as 'new';

        % 4)fix some inconsistencies. For example, #88 and other IDs
        % commented as 'originally exist'.
        
        % 5)add new J IDs for GCv13. For examples, everything after #137.
        
        % GEOSCHEM_J.m modification
        % In order to add new photolysis rate, we need to create a new full
        % MCM + others mechanisms and then map GEOSCHEM_J.m to it.
        
        % We will need cross section and quantum yield to add into PhotoDataSources.xlsx 
        
        % Eastham2014 focuses on the transport and chemsitry between
        % stratosphere and troposhere and it is not the major driver for
        % my purposes. Thus, I would not add it yet. Users are recommended
        % to make it useful later;
        % Sherwen2016 is provided in F0AM/Chem/MCMv331/Halogens_Sherwen2016/Halogens_Sherwen2016.m
        % Bates2019 has not been updated in the F0AM, which we may need to
        % do it by ourselves.
        
        % GEOSCHEM_K.m modification
        
        
        
        % get Photolysis number
        Pnum = regexp(k{i},'\d*','match');
        Pnum = str2num(Pnum{1});    
        % list definitions
        % NOTE, assignments for reaction ID#'s likely differ b/w each GEOS_CHEM version!
        % Is this from FJX_j2j.dat? May need to double check with Xiangyu
        % or Glenn.

        % STEP1: Mark the Jdef for GCv13.3.2 based on http://geoschemdata.wustl.edu/ExtData/CHEM_INPUTS/FAST_JX/v2021-10/FJX_j2j.dat 
        % STEP2: Mapping Jdef from GC to MCM and comment that in the last.
        % The mapping is based on previous scripts. (may need to add new?)
        % JX is MCM ANALOGUES
        % What is JnX? Ask Glenn.
        % Double check if 111, 112, and 113 are same!
        Jdef = {
            %1  'JO2'  % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            2   'JO3P' % J2, ok
            3   'JO1D' % J1, ok
            %4  'JH2O'  % GC not included&F0AM not included
            %5  'JHO2'  % GC not included&F0AM not included
            %6  'JNO'    % GC included but F0AM not included
            7   'JHCHO_HO2' % J11, ok
            8   'JHCHO_H2'  % J12, ok
            9   'JH2O2'     % J3, ok
            10  'JCH3OOH'   % J41, ok
            11  'JNO2'      % J4, ok
            12  'JNO3_NO2'  % J6, ok
            13  'JNO3_NO'   % J5, ok
            14  'JN2O5_NO2' % Jn19?, where does Jn19 comes from? 
            15  'JHONO'     % J7, ok
            16  'JHNO3'     % J8, ok
            17  'JHNO4_a' % need change the scale factor? Jn21?
            18  'JHNO4_b' % need change the scale factor? Jn22? 
            19  'JClNO3_Cl' % Jn34?
            20  'JClNO3_ClO'% Jn35?
            21  'JClNO2'    % Jn23?
            22  'JCl2'      % Jn32?
            23  'JBr2'      % Jn24? 
            24  'JHOCl'     % Jn36?  
            25  'JOClO'     % Jn37?  
            26  'JCl2O2'    % Jn38? 
            27  'JClO'      % Jn33?  
            28  'JBrO'      % Jn25?
            29  'JBrNO3_Br' % Jn28? may already scale up the factor? 
            30  'JBrNO3_BrO'% Jn29? may already scale up the factor? 
            31  'JBrNO2'    % Jn27?  
            32  'JHOBr'     % Jn26?
            33  'JBrCl'     % Jn31?
            % Lixu, 10/24/2021
            % I am not adding #34-#55 since these species have minor
            % impact on my study. Users are recommended to add them for
            % their own purposes.
            %34  'OCS'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %35  'SO2'       % GC doesn't consider
            %36  'N2O'         % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %37  'CFC11'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %38  'CFC12'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %39  'CFC113'      % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %40  'CFC114'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %41  'CFC115'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %42  'CCl4'         % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %43  'CH3Cl'        % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %44  'CH3CCl3'      % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %45  'CH2Cl2'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %46  'HCFC22'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %47  'HCFC123'      % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %48  'HCFC141b'     % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %49  'HCFC142b'     % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %50  'CH3Br'        % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %51  'H1211'        % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %52  'H12O2'        % GC doesn't consider
            %53  'H1301'        % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %54  'H2402'        % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            %55  'CH2Br2'       % added, new, need to figure out how to map it, this is not even in MCMv331. from Eastham2014
            56  'JCHBr3'    % Jn30? 
            %58  'CF3I'     % GC not included&MCM not included
            59  'JPAN'      % Jn14 + Jn15 
            %60  'JCH3NO3'     % GC doesn't consider
            61  'JALD2a'    % J13, MCM only considers radical channel, ok 
            62  'JALD2b'    % Jn5? MCM only considers radical channel
            63  'JMVK*0.6'  % Jmcm.J23 + Jmcm.J24
            64  'JMVK*0.2'  % Jmcm.J23 + Jmcm.J24 
            65  'JMVK*0.2'  % Jmcm.J23 + Jmcm.J24
            66  'JMACR'     % Jmcm.J18 + Jmcm.J19 
            %67  'JMACR'     % scale factor is 0
            68  'JGLYC'     % Jn9?
            69  'JMEK'      % J22 
            70  'JPrAld'    % J14 
            71  'JMGlyxl'   % J34 
            72  'JGLYXa'    % J33
            73  'JGLYXb'    % J31 
            74  'JGLYXc'    % J32 
            75  'JHAC*0.6'  % Jn10 
            76  'JACETa'    % J21, MCM only considers this channel
            77  'JACETb'    % Jn8, acetone
            %78  'JONIT2'   % GCv13.3.2: 0.227INA + 0.228ICN + 0.228HO2 :            PHOTOL(78);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            79  'JCH3OOH'       % J41  
            80  'JCH3OOH*0.5'   % J41
            81  'JCH3OOH'       % J41
            82  'JCH3OOH'       % J41
            83  'JCH3OOH'       % J41
            84  'JCH3OOH'       % J41
            85  'JCH3OOH'       % J41
            % Previous script assume 86-91 is JCH3OOH but it's actually not. 
            %86  'JHMHP'     % GCv13.3.2: HMHP + hv = 2OH + CH2O :                     PHOTOL(86);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            %87  'JPrAldP'   % GCv13.3.2: HPETHNL + hv = OH + CO + HO2 + CH2O :        PHOTOL(87);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            88  'JMGlyxl'    % J34
            89  'JPROPNN'    % Jmcm.J56; Muller et al., ACP (2014)
            90  'JMGlyxl'    % J34
            91  'JPrAld'     % J14
            92  'JCH3OOH'    % J41
            %93  'JPrAldP'   % GCv13.3.2: HPETHNL + hv = OH + CO + HO2 + CH2O :        PHOTOL(87);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            %94  'JENOL'     % GCv13.3.2: 0.125MCO3 + 0.125GLYX :                     PHOTOL(94);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            %95  'JPrAldP'   % GCv13.3.2: HPETHNL + hv = OH + CO + HO2 + CH2O :        PHOTOL(87);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            %96  'JPrAldP'   % GCv13.3.2: HPETHNL + hv = OH + CO + HO2 + CH2O :        PHOTOL(87);     {2019/11/06; Bates2019; KHB}; not sure about MCM
            97  'JCH3OOH'    % J41
            98  'JCH3NO3'    % GCv13.3.2: 0.320OTHRO2 :                               PHOTOL(98); not sure about MCM. Previous version assumed it's JR4N2
            99  'JCH3OOH'    % J41
            %100  'SO4'    % GCv13.3.2: SO4 + hv = SO2 + 2.000OH :                   PHOTOL(100);    {2014/02/03; Eastham2014; SDE}; not sure about MCM
            101 'JClOO'      % Jn39? 
            %102  'JO1D'     % GC not included.
            103 'JMPN*0.05'  % Jmcm.Jn16 + Jmcm.Jn17, add up scale factor
            104 'JMPN*0.95'  % Jmcm.Jn16 + Jmcm.Jn17, add up scale factor
            105 'JH2O2'      % J3
            %106 'JICN'      % GCv13.3.2: 0.481MCRENOL + 0.128C4HVP2 + 0.068C4HVP1 :  PHOTOL(106);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            107 'JETHLN'     % Jmcm.J56*4.3; Muller et al., ACP (2014)
            108 'JMVKN'      % Jmcm.J56*1.6; Muller et al., ACP (2014)
            109 'JMACRN'     % Jmcm.J56*10; Muller et al., ACP (2014)
            %110 'JMACRNP'  % GCv13.3.2: MCRHNB + hv = PROPNN + OH + CO + HO2 :       PHOTOL(110);    {2019/11/06; Bates2019; KHB}; not sure about MCM. Previous script assumed it's JMACR
            111 'JONIT1'    % GCv13.3.2: MONITS + hv = MEK + NO2 :                    PHOTOL(111);    {2017/07/14; Browne2014; KRT,JAF,CCM,EAM,KHB,RHS}. Previous script assumed it's J54
            112 'JONIT1'    % GCv13.3.2: MONITS + hv = MEK + NO2 :                    PHOTOL(111);    {2017/07/14; Browne2014; KRT,JAF,CCM,EAM,KHB,RHS}. Previous script assumed it's J54
            113 'JONIT1'    % GCv13.3.2: MONITS + hv = MEK + NO2 :                    PHOTOL(111);    {2017/07/14; Browne2014; KRT,JAF,CCM,EAM,KHB,RHS}. Previous script assumed it's J54
            114 'JI2'       % Jn40
            115 'JHOI'      % Jn41
            116 'JIO'       % Jn42
            117 'JOIO'      % Jn43
            118 'JINO'      % Jn44
            119 'JIONO'     % Jn45
            120 'JIONO2'    % Jn46
            121 'JI2O2'     % Jn47
            %122  'CH3I'     % GCv13.3.2: CH3I + hv = I :                              PHOTOL(122);    {2017/09/22; Sherwen2016b;TS,JAS,SDE}; not sure about MCM.
            %123  'CH2I2'       % GCv13.3.2: CH2I2 + hv = 2.000I :                        PHOTOL(123);    {2017/09/22; Sherwen2016b;TS,JAS,SDE}; not sure about MCM.
            %124  'CH2ICl'      % GCv13.3.2: CH2ICl + hv = I + Cl :                       PHOTOL(124);    {2017/09/22; Sherwen2016b;TS,JAS,SDE}; not sure about MCM
            %125  'CH2IBr'      % GCv13.3.2: CH2IBr + hv = I + Br :                       PHOTOL(125);    {2017/09/22; Sherwen2016b;TS,JAS,SDE}; not sure about MCM
            126 'JI2O4'     % Jn48
            127 'JI2O3'     % Jn49
            128 'JIBr'      % Jn51
            129 'JICl'      % Jn50
            %130  'NITs'        % GCv13.3.2: NITs + hv = HNO2 :                           PHOTOL(130);    {2018/07/19; Kasibhatla2018; PK, TMS}; not sure about MCM
            %131  'NITs'        % Gcv13.3.2: NITs + hv = NO2 :                            PHOTOL(131);    {2018/07/19; Kasibhatla2018; PK, TMS}; not sure about MCM
            %132  'NIT'         % GCv13.3.2: NIT + hv = HNO2 :                            PHOTOL(132);    {2018/07/19; Kasibhatla2018; PK, TMS}; not sure about MCM
            %133  'NIT'         % GCv13.3.2: NIT + hv = NO2 :                             PHOTOL(133);    {2018/07/19; Kasibhatla2018; PK, TMS}; not sure about MCM
            134 'JMENO3'        % J51, renamed from JR4N2 as in previous version. 
            135 'JETNO3'        % J52
            136 'JIPRNO3'       % J54 
            137 'JNPRNO3'       % J53
            % New from GCv13
            138 'JCH3OOH'       % J41
            139 'JCH3OOH'       % J41
            140 'JCH3OOH'       % J41
            141 'JCH3OOH'       % J41
            %142 'JHPALD1' % GCv13.3.2: HPALD1 + hv = 0.888CO + 1.662OH + 0.112HO2 + 0.112IDC + 0.112MVKPC + 0.552MCRENOL + 0.224C4HVP1 :                PHOTOL(142);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            %143 'JHPALD2' % GCv13.3.2: HPALD2 + hv = 0.818CO + 1.637OH + 0.182HO2 + 0.182IDC + 0.182MVKPC + 0.455MCRENOL + 0.182C4HVP2 :                PHOTOL(143);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            %144 'JPrAldP' % GCv13.3.2: HPALD3 + hv = CO + OH + HO2 + MVK :          PHOTOL(144);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            %145 'JPrAldP' % GCv13.3.2: HPALD4 + hv = CO + OH + HO2 + MACR :         PHOTOL(145);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            146 'JONIT1'   % GCv13.3.2:  IHN1 + hv = NO2 + 0.45HC5A + 0.45HO2 + 0.55MVKHP + 0.55CO + 0.55OH :               PHOTOL(146);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            147 'JONIT1'   % GCv13.3.2: IHN2 + hv = NO2 + MVK + HO2 + CH2O :         PHOTOL(147);    {2019/11/06; Bates2019; KHB}; not sure about MCM
            148 'JONIT1'   % GCv13.3.2: IHN3 + hv = NO2 + MACR + HO2 + CH2O :        PHOTOL(148);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            149 'JONIT1'   % GCv13.3.2: IHN4 + hv = NO2 + 0.45HC5A + 0.45HO2 + 0.55MCRHP + 0.55CO + 0.55OH :               PHOTOL(149);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            %150 'JNITP' % GCv13.3.2: INPB + hv = NO2 + CH2O + 0.097MACR + 0.903MVK + 0.67OH + 0.33HO2 :               PHOTOL(150);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            151 'JCH3OOH' % J41
            152 'JONIT1'   % GCv13.3.2: INPD + hv = NO2 + 0.841IHOO1 + 0.159IHOO4 :  PHOTOL(152);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            %153 'JPrAld' % GCv13.3.2: ICPDH + hv = CO + 1.5HO2 + 0.5OH + 0.5MCRHP + 0.35MVKDH + 0.15MCRDH :          PHOTOL(153);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            154 'JCH3OOH' % J41
            %155 'JHP2' % IDHDP + hv = 1.25OH + 0.25GLYC + 0.25HAC + 0.75ICPDH + 0.75HO2 :                       PHOTOL(155);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            156 'JCH3OOH' % J41
            %157 'JPrAldP' % IDCHP + hv = 0.546OH + CO + 1.454HO2 + 0.391MVKHC + 0.155MVKHCB + 0.454MVKPC :     PHOTOL(157);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            158 'JCH3OOH' % J41
            159 'JONIT1' % IDCHP + hv = 0.546OH + CO + 1.454HO2 + 0.391MVKHC + 0.155MVKHCB + 0.454MVKPC :     PHOTOL(157);    {2019/11/06; Bates2019; KHB}; note sure about MCM
            %160 'JMACRNP' % ITCN + hv = MGLY + OH + NO2 + GLYC :         PHOTOL(160);    {2019/11/06; Bates2019; KHB}
            %161 'JPrAld' % ITCN + hv = 0.5MVKHP + 0.5MCRHP + CO + NO2 + HO2 :                                 PHOTOL(161);    {2019/11/06; Bates2019; KHB}
            162 'JCH3OOH' % J41
            163 'JBALD' % BALD + hv = BENZO2 + CO + HO2 :              PHOTOL(163);    {2021/09/29; Bates2021b; KHB,MSL}
            164 'JCH3OOH' % J41
            165 'JCH3OOH' % J41
            166 'JPROPNN' % NPHEN + hv = HNO2 + CO + CO2 + AROMP4 + HO2 :                        PHOTOL(166);    {2021/09/29; Bates2021b; KHB,MSL}
            };  
        
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

    if contains(ki,'J')
        rct(:,2)=[]; % delete the 'hv'
    end
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
if nargin<2 %default is same as input MCM filename
    save_flnm = [name '.m'];
end
[fid,msg] = fopen(fullfile(save_flnm),'w');
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


