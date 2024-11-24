%%%%%%%%%%%%%%%%%
% chemistry
%%%%%%%%%%%%%%%%%
%{
ChemFiles is a cell array of strings specifying functions and scripts for the chemical mechanism.

THE FIRST CELL is always a function for generic K-values.

THE SECOND CELL is always a function for J-values (photolysis frequencies).
    The numeric flag of "2" in the J function inputs specifies the use of the "HYBRID" method for
    calculating J-values (see ReadMe).

All other inputs are scripts for mechanisms and sub-mechanisms.

Examples are given here for all of the mechanisms currently available.
%}

switch MECHANISM
    case {'MCMv331_extension', 'MCMv331_base','MCMv331_GCvocs','MCMv331_GCvocsF'}
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'MCMv331_J(Met,2)'; %Jmethod flag of 0 specifies "MCM" J-value method.2 is hybrid
            'MCMv331_NOAABB_V4_20200604_name_correct';
            'ZachEST_Lixu_fixed';
            'dummyMech'};
    
    case 'MCMv331_noFUR'
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'MCMv331_J(Met,2)'; %Jmethod flag of 0 specifies "MCM" J-value method.2 is hybrid
            'MCMv331_NOAABB_V4_20200604_name_correct';
            'ZachEST_Lixu_fixed';
            'dummyMech'};            

    case {'GCv13_MCM_missing'}
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'GEOSCHEM_J_v13_MCM(Met,2)'; % Check if it is possible to do things like this, Lixu, 03/18/2023
            'GEOSCHEMv13_AllRxns_v2'; % I put the fixed C2H4 error here as the error is proved.
            'MCMv331_NOAABB_V4_20200604_name_correct';
            'ZachEST_Lixu_fixed';
            'dummyMech'};
            

    case {'GCv13_base', 'GCv13_base_notfixed'}
        ChemFiles = {...
            'MCMv3331_K(Met)';
            'GEOSCHEM_J_v13(Met,2)';
            'GEOSCHEMv13_AllRxns_v2'; % I put the fixed C2H4 error here as the error is proved.
            'dummyMech'};

    case 'GCv13_JINF'
        ChemFiles = {...
            'MCMv3331_K(Met)';... % dummy script, will not use it. 
            'GEOSCHEM_J_v13(Met,2)';...
            'GEOSCHEMv13_AllRxns_v2';...
            'Sub_reduced_FUR';...
            'dummyMech'};
            
    case 'GCv13_JINF_HCOOH'
        ChemFiles = {...
            'MCMv3331_K(Met)';... % dummy script, will not use it. 
            'GEOSCHEM_J_v13(Met,2)';...
            'GEOSCHEMv13_AllRxns_v2';...
            'Sub_reduced_FUR';...
            'GC_HCOOH';...
            'dummyMech'};
end
