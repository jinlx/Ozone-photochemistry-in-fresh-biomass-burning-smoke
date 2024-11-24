% GEOSCHEMv13_LATEST.m
% generated from ./fullchem.eqn
% 20220218
% # of species = 292
% # of reactions = 775

% REACTIONS EXCLUDED FROM MECHANISM:
% HO2 = H2O : HO2uptk1stOrd( State_Het );
% NO2 = 0.500HNO3 + 0.500HNO2 : NO2uptk1stOrdAndCloud( State_Het );
% NO3 = HNO3 : NO3uptk1stOrdAndCloud( State_Het );
% NO3 = NIT : NO3hypsisClonSALA( State_Het );
% NO3 = NITs : NO3hypsisClonSALC( State_Het );
% N2O5 + H2O = 2.000HNO3 : N2O5uptkByH2O( State_Het );
% N2O5 + HCl = ClNO2 + HNO3 : N2O5uptkByStratHCl( State_Het );
% N2O5 = 2.000HNO3 : N2O5uptkByCloud( State_Het );
% N2O5 + SALACL = ClNO2 + HNO3 : N2O5uptkBySALACl( State_Het );
% N2O5 + SALCCL = ClNO2 + HNO3 : N2O5uptkBySALCCl( State_Het );
% OH + SALACL = 0.500Cl2 : OHuptkBySALACl( State_Het );
% OH + SALCCL = 0.500Cl2 : OHuptkBySALCCl( State_Het );
% BrNO3 + H2O = HOBr + HNO3 : BrNO3uptkByH2O( State_Het );
% BrNO3 + HCl = BrCl + HNO3 : BrNO3uptkByHCl( State_Het );
% ClNO3 + H2O = HOCl + HNO3 : ClNO3uptkByH2O( State_Het );
% ClNO3 + HCl = Cl2 + HNO3 : ClNO3uptkByHCl( State_Het );
% ClNO3 + HBr = BrCl + HNO3 : ClNO3uptkByHBr( State_Het );
% ClNO3 + BrSALA = BrCl + HNO3 : ClNO3uptkByBrSALA( State_Het );
% ClNO3 + BrSALC = BrCl + HNO3 : ClNO3uptkByBrSALC( State_Het );
% ClNO3 + SALACL = Cl2 + HNO3 : ClNO3uptkBySALACL( State_Het );
% ClNO3 + SALCCL = Cl2 + HNO3 : ClNO3uptkBySALCCL( State_Het );
% ClNO2 + SALACL = Cl2 + HNO2 : ClNO2uptkBySALACL( State_Het );
% ClNO2 + SALCCL = Cl2 + HNO2 : ClNO2uptkBySALCCL( State_Het );
% ClNO2 + HCl = Cl2 + HNO2 : ClNO2uptkByHCl( State_Het );
% ClNO2 + BrSALA = BrCl + HNO2 : ClNO2uptkByBrSALA( State_Het );
% ClNO2 + BrSALC = BrCl + HNO2 : ClNO2uptkByBrSALC( State_Het );
% ClNO2 + HBr = BrCl + HNO2 : ClNO2uptkByHBr( State_Het );
% HOCl + HCl = Cl2 + H2O : HOClUptkByHCl( State_Het );
% HOCl + HBr = BrCl + H2O : HOClUptkByHBr( State_Het );
% HOCl + SALACL = Cl2 + H2O : HOClUptkBySALACL( State_Het );
% HOCl + SALCCL = Cl2 + H2O : HOClUptkBySALCCL( State_Het );
% HOCl = SO4H3 + HCl : HOClHetSO4H3( State_Het );
% HOCl = SO4H4 + HCl : HOClHetSO4H4( State_Het );
% HOBr + HBr = Br2 + H2O : HOBrUptkByHBr( State_Het );
% HOBr + HCl = BrCl + H2O : HOBrUptkByHCl( State_Het );
% HOBr + SALACL = BrCl + H2O : HOBrUptkBySALACL( State_Het );
% HOBr + SALCCL = BrCl + H2O : HOBrUptkBySALCCL( State_Het );
% HOBr + BrSALA = Br2 : HOBrUptkByBrSALA( State_Het );
% HOBr + BrSALC = Br2 : HOBrUptkByBrSALC( State_Het );
% HOBr = SO4H1 + HBr : HOBrHetSO4H1( State_Het );
% HOBr = SO4H2 + HBr : HOBrHetSO4H2( State_Het );
% O3 + HBr = HOBr : O3uptkByHBr( State_Het );
% O3 + BrSALA = HOBr : O3uptkByBrSALA( State_Het );
% O3 + BrSALC = HOBr : O3uptkByBrSALC( State_Het );
% HBr = BrSALA : HBrUptkBySALA( State_Het );
% HBr = BrSALC : HBrUptkBySALC( State_Het );
% HI = AERI : IuptkBySulf1stOrd( SR_MW(ind_HI), 0.10., State_Het );
% HI = ISALA : IuptkBySALA1stOrd( SR_MW(ind_HI), 0.10., State_Het );
% HI = ISALC : IuptkBySALC1stOrd( SR_MW(ind_HI), 0.10., State_Het );
% I2O2 = 2.000AERI : IuptkBySulf1stOrd( SR_MW(ind_I2O2), 0.02., State_Het );
% I2O2 = 2.000ISALA : IuptkBySALA1stOrd( SR_MW(ind_I2O2), 0.02., State_Het );
% I2O2 = 2.000ISALC : IuptkBySALC1stOrd( SR_MW(ind_I2O2), 0.02., State_Het );
% I2O3 = 2.000AERI : IuptkBySulf1stOrd( SR_MW(ind_I2O3), 0.02., State_Het );
% I2O3 = 2.000ISALA : IuptkBySALA1stOrd( SR_MW(ind_I2O3), 0.02., State_Het );
% I2O3 = 2.000ISALC : IuptkBySALC1stOrd( SR_MW(ind_I2O3), 0.02., State_Het );
% I2O4 = 2.000AERI : IuptkBySulf1stOrd( SR_MW(ind_I2O4), 0.02., State_Het );
% I2O4 = 2.000ISALA : IuptkBySALA1stOrd( SR_MW(ind_I2O4), 0.02., State_Het );
% I2O4 = 2.000ISALC : IuptkBySALC1stOrd( SR_MW(ind_I2O4), 0.02., State_Het );
% IONO2 + H2O = HOI + HNO3 : IONO2uptkByH2O( State_Het );
% IONO + BrSALA = IBr + HNO2 : IbrkdnByAcidBrSALA( SR_MW(ind_IONO), C(ind_IONO), 0.02., State_Het );
% IONO + BrSALC = IBr + HNO2 : IbrkdnByAcidBrSALC( SR_MW(ind_IONO), C(ind_IONO), 0.02., State_Het );
% IONO + SALACL = ICl + HNO2 : IbrkdnByAcidSALACl( SR_MW(ind_IONO), C(ind_IONO), 0.02., State_Het );
% IONO + SALCCL = ICl + HNO2 : IbrkdnByAcidSALCCl( SR_MW(ind_IONO), C(ind_IONO), 0.02., State_Het );
% IONO2 + BrSALA = IBr + HNO3 : IbrkdnByAcidBrSALA( SR_MW(ind_IONO2), C(ind_IONO2), 0.01., State_Het );
% IONO2 + BrSALC = IBr + HNO3 : IbrkdnByAcidBrSALC( SR_MW(ind_IONO2), C(ind_IONO2), 0.01., State_Het );
% IONO2 + SALACL = ICl + HNO3 : IbrkdnByAcidSALACl( SR_MW(ind_IONO2), C(ind_IONO2), 0.01., State_Het );
% IONO2 + SALCCL = ICl + HNO3 : IbrkdnByAcidSALCCl( SR_MW(ind_IONO2), C(ind_IONO2), 0.01., State_Het );
% HOI + BrSALA = IBr : IbrkdnByAcidBrSALA( SR_MW(ind_HOI), C(ind_HOI), 0.01., State_Het );
% HOI + BrSALC = IBr : IbrkdnByAcidBrSALC( SR_MW(ind_HOI), C(ind_HOI), 0.01., State_Het );
% HOI + SALACL = ICl : IbrkdnByAcidSALACl( SR_MW(ind_HOI), C(ind_HOI), 0.01., State_Het );
% HOI + SALCCL = ICl : IbrkdnByAcidSALCCl( SR_MW(ind_HOI), C(ind_HOI), 0.01., State_Het );
% GLYX = SOAGX : GLYXuptk1stOrd( SR_MW(ind_GLYX), State_Het);
% MGLY = SOAGX : MGLYuptk1stOrd( SR_MW(ind_MGLY), State_Het);
% IEPOXA = SOAIE : IEPOXuptk1stOrd( SR_MW(ind_IEPOXA), .FALSE., State_Het );
% IEPOXB = SOAIE : IEPOXuptk1stOrd( SR_MW(ind_IEPOXB), .FALSE., State_Het );
% IEPOXD = SOAIE : IEPOXuptk1stOrd( SR_MW(ind_IEPOXD), .FALSE., State_Het );
% LVOC = LVOCOA : VOCuptk1stOrd( SR_MW(ind_LVOC), 1.0., State_Het );
% MVKN = IONITA : VOCuptk1stOrd( SR_MW(ind_MVKN), 5.0E-3., State_Het );
% R4N2 = IONITA : VOCuptk1stOrd( SR_MW(ind_R4N2), 5.0E-3., State_Het );
% MONITS = MONITA : VOCuptk1stOrd( SR_MW(ind_MONITS), 1.0E-2., State_Het );
% MONITU = MONITA : VOCuptk1stOrd( SR_MW(ind_MONITU), 1.0E-2., State_Het );
% HONIT = MONITA : VOCuptk1stOrd( SR_MW(ind_HONIT), 1.0E-2., State_Het );
% PYAC = SOAGX : MGLYuptk1stOrd( SR_MW(ind_PYAC), State_Het );
% HMML = SOAIE : IEPOXuptk1stOrd( SR_MW(ind_HMML), .TRUE., State_Het);
% IHN1 = IONITA : VOCuptk1stOrd( SR_MW(ind_IHN1), 5.0E-3., State_Het );
% IHN2 = IONITA : VOCuptk1stOrd( SR_MW(ind_IHN2), 5.0E-2., State_Het );
% IHN3 = IONITA : VOCuptk1stOrd( SR_MW(ind_IHN3), 5.0E-3., State_Het );
% IHN4 = IONITA : VOCuptk1stOrd( SR_MW(ind_IHN4), 5.0E-3., State_Het );
% ICHE = SOAIE : IEPOXuptk1stOrd( SR_MW(ind_ICHE), .FALSE., State_Het );
% INPD = IONITA : VOCuptk1stOrd( SR_MW(ind_INPD), 5.0E-3., State_Het );
% INPB = IONITA : VOCuptk1stOrd( SR_MW(ind_INPB), 5.0E-3., State_Het );
% IDN = IONITA : VOCuptk1stOrd( SR_MW(ind_IDN), 5.0E-3., State_Het );
% ITCN = IONITA : VOCuptk1stOrd( SR_MW(ind_ITCN), 5.0E-3., State_Het );
% ITHN = IONITA : VOCuptk1stOrd( SR_MW(ind_ITHN), 5.0E-3., State_Het );
% MCRHNB = IONITA : VOCuptk1stOrd( SR_MW(ind_MCRHNB), 5.0E-3., State_Het );
% MCRHN = IONITA : VOCuptk1stOrd( SR_MW(ind_MCRHN), 5.0E-3., State_Het );
% NPHEN = AONITA : VOCuptk1stOrd( SR_MW(ind_NPHEN), 1.0E-2., State_Het );
% O2 + hv = 2.000O : PHOTOL(1);
% CH2Br2 + hv = 2.000Br : PHOTOL(55);
% CH3Br + hv = MO2 + Br : PHOTOL(50);
% CH3Cl + hv = MO2 + Cl : PHOTOL(43);
% CH2Cl2 + hv = 2.000Cl : PHOTOL(45);
% CH3CCl3 + hv = 3.000Cl : PHOTOL(44);
% CCl4 + hv = 4.000Cl : PHOTOL(42);
% CFC11 + hv = 3.000Cl : PHOTOL(37);
% CFC12 + hv = 2.000Cl : PHOTOL(38);
% CFC113 + hv = 3.000Cl : PHOTOL(39);
% CFC114 + hv = 2.000Cl : PHOTOL(40);
% CFC115 + hv = Cl : PHOTOL(41);
% HCFC123 + hv = 2.000Cl : PHOTOL(47);
% HCFC141b + hv = 2.000Cl : PHOTOL(48);
% HCFC142b + hv = Cl : PHOTOL(49);
% HCFC22 + hv = Cl : PHOTOL(46);
% H1301 + hv = Br : PHOTOL(53);
% H1211 + hv = Cl + Br : PHOTOL(51);
% H2402 + hv = 2.000Br : PHOTOL(54);
% CH3I + hv = I : PHOTOL(122);
% CH2I2 + hv = 2.000I : PHOTOL(123);
% CH2ICl + hv = I + Cl : PHOTOL(124);
% CH2IBr + hv = I + Br : PHOTOL(125);
% N2O + hv = N2 + O1D : PHOTOL(36);
% OCS + hv = SO2 + CO : PHOTOL(34);
% SO4 + hv = SO2 + 2.000OH : PHOTOL(100);
% NO + hv = O + N : PHOTOL(6);
% NITs + hv = HNO2 : PHOTOL(130);
% NITs + hv = NO2 : PHOTOL(131);
% NIT + hv = HNO2 : PHOTOL(132);
% NIT + hv = NO2 : PHOTOL(133);

% 20220221, add C4H6+OH
SpeciesToAdd = {...
'A3O2'; 'ACET'; 'ACTA'; 'AERI'; 'ALD2'; 'ALK4'; 'AONITA'; 'AROMRO2'; 'AROMP4'; 'AROMP5'; ...
'ATO2'; 'ATOOH'; 'B3O2'; 'BALD'; 'BENZ'; 'BENZO'; 'BENZO2'; 'BENZP'; 'Br'; 'Br2'; ...
'BrCl'; 'BrNO2'; 'BrNO3'; 'BrO'; 'BRO2'; 'BrSALA'; 'BrSALC'; 'BZCO3'; 'BZCO3H'; 'BZPAN'; ...
'C2H2'; 'C2H4'; 'C2H6'; 'C3H8'; 'C4HVP1'; 'C4HVP2'; 'CCl4'; 'CFC11'; 'CFC12'; 'CFC113'; ...
'CFC114'; 'CFC115'; 'CH2Br2'; 'CH2Cl2'; 'CH2I2'; 'CH2IBr'; 'CH2ICl'; 'CH2O'; 'CH2OO'; 'CH3Br'; ...
'CH3CCl3'; 'CH3CHOO'; 'CH3Cl'; 'CH3I'; 'CH4'; 'CHBr3'; 'CHCl3'; 'Cl'; 'Cl2'; 'Cl2O2'; ...
'ClNO2'; 'ClNO3'; 'ClO'; 'ClOO'; 'CO'; 'CO2'; 'CSL'; 'DMS'; 'EOH'; 'ETHLN'; ...
'ETHN'; 'ETHP'; 'ETNO3'; 'ETO'; 'ETOO'; 'ETO2'; 'ETP'; 'GLYC'; 'GLYX'; 'H'; ...
'H1211'; 'H1301'; 'H2402'; 'H2O2'; 'HAC'; 'HBr'; 'HC5A'; 'HCFC123'; 'HCFC141b'; 'HCFC142b'; ...
'HCFC22'; 'HCl'; 'HCOOH'; 'HI'; 'HMHP'; 'HMML'; 'HMS'; 'HNO2'; 'HNO3'; 'HNO4'; ...
'HO2'; 'HOBr'; 'HOCl'; 'HOI'; 'HONIT'; 'DUMMY'; 'HPALD1'; 'HPALD1OO'; 'HPALD2'; 'HPALD2OO'; ...
'HPALD3'; 'HPALD4'; 'HPETHNL'; 'I'; 'I2'; 'I2O2'; 'I2O3'; 'I2O4'; 'IBr'; 'ICHE'; ...
'ICHOO'; 'ICl'; 'ICN'; 'ICNOO'; 'ICPDH'; 'IDC'; 'IDCHP'; 'IDHDP'; 'IDHNBOO'; 'IDHNDOO1'; ...
'IDHNDOO2'; 'IDHPE'; 'IDN'; 'IDNOO'; 'IEPOXA'; 'IEPOXAOO'; 'IEPOXB'; 'IEPOXBOO'; 'IEPOXD'; 'IHN1'; ...
'IHN2'; 'IHN3'; 'IHN4'; 'IHOO1'; 'IHOO4'; 'IHPNBOO'; 'IHPNDOO'; 'IHPOO1'; 'IHPOO2'; 'IHPOO3'; ...
'INA'; 'INDIOL'; 'INO'; 'INO2B'; 'INO2D'; 'INPB'; 'INPD'; 'IO'; 'IONITA'; 'IONO'; ...
'IONO2'; 'IPRNO3'; 'ISALA'; 'ISALC'; 'ISOP'; 'ISOPNOO1'; 'ISOPNOO2'; 'ITCN'; 'ITHN'; 'KO2'; ...
'LBRO2H'; 'LBRO2N'; 'LIMO'; 'LIMO2'; 'LISOPOH'; 'LISOPNO3'; 'LNRO2H'; 'LNRO2N'; 'LTRO2H'; 'LTRO2N'; ...
'LVOC'; 'LVOCOA'; 'LXRO2H'; 'LXRO2N'; 'MACR'; 'MACR1OO'; 'MACR1OOH'; 'MACRNO2'; 'MAP'; 'MCO3'; ...
'MCRDH'; 'MCRENOL'; 'MCRHN'; 'MCRHNB'; 'MCRHP'; 'MCROHOO'; 'MCT'; 'MEK'; 'MENO3'; 'MGLY'; ...
'MO2'; 'MOH'; 'MONITA'; 'MONITS'; 'MONITU'; 'MP'; 'MPAN'; 'MPN'; 'MSA'; 'MTPA'; ...
'MTPO'; 'MVK'; 'MVKDH'; 'MVKHC'; 'MVKHCB'; 'MVKHP'; 'MVKN'; 'MVKOHOO'; 'MVKPC'; 'N'; ...
'N2O'; 'N2O5'; 'NAP'; 'NIT'; 'NITs'; 'NO'; 'NO2'; 'NO3'; 'NPHEN'; 'NPRNO3'; ...
'NRO2'; 'O'; 'O1D'; 'O3'; 'O3A'; 'O3C'; 'OClO'; 'OCS'; 'OH'; 'OIO'; ...
'OLND'; 'OLNN'; 'OTHRO2'; 'PAN'; 'PHEN'; 'PIO2'; 'PIP'; 'PO2'; 'PP'; 'PPN'; ...
'PRN1'; 'PROPNN'; 'PRPE'; 'PRPN'; 'PYAC'; 'R4N1'; 'R4N2'; 'R4O2'; 'R4P'; 'RA3P'; ...
'RB3P'; 'RCHO'; 'RCO3'; 'RIPA'; 'RIPB'; 'RIPC'; 'RIPD'; 'ROH'; 'RP'; 'SALAAL'; ...
'SALCAL'; 'SALACL'; 'SALCCL'; 'SALASO2'; 'SALCSO2'; 'SALASO3'; 'SALCSO3'; 'SO2'; 'SO4'; 'SO4H1'; ...
'SO4H2'; 'SO4H3'; 'SO4H4'; 'SO4s'; 'SOAGX'; 'SOAIE'; 'TOLU'; 'TRO2'; 'XYLE'; 'XRO2'; ...
'H2'; 'RCOOH'; ...
'SO3'; ...
'C4H6'; 'C4H6O2'; ...
'ACR'; 'ACRO2'; ...
'FURAN'; 'MALDIAL'; 'HYDFURANO2'; 'MALDIALCO3'; 'MALDIALO2'; 'HYDFURANOOH'; 'MALDALCO2H'; 'MALDALCO3H'; 'MALDIALCO2'; 'MALDIALPAN'; 'MALDIALOOH'; 'MALDIALO'; 'HOCOC4DIAL'; 'HOHOC4DIAL'; ...
'HCOCO2H'; 'MALANHY'; 'C32OH13CO'; 'CO2C4DIAL'; 'HCOCOHCO3'; 'MALANHYO2'; 'HCOCOHCO3H'; 'HCOCOHPAN'; 'MALANHYOOH'; 'MALANHYO'; 'MALANHY2OH'; 'MALNHYOHCO'; ...
'M2FURAN'; 'C5DICARB'; 'HYDMEFURANO2'; 'C5HYDCARBO2'; 'C5CO14O2'; 'C5DICARBO'; 'C5DICARBO2'; 'TLFUONE'; 'C5CO14OH'; 'HYDMEFURANOOH'; 'C5HYDCARBOOH'; ...
'C5CO14OOH'; 'C5CO14CO2'; 'C5COO2NO2'; 'C5DICAROOH'; 'C5134CO2OH'; 'C514CO23OH'; 'NTLFUO2'; 'TLFUONOOA'; 'TLFUO2'; ...
'C54CO'; 'CO23C3CHO'; 'CO2H3CHO'; 'NTLFUOOH'; 'NTLFUO'; 'MECOACETO2'; 'TLFUONOO'; 'TLFUOH'; 'ACCOMECHO'; 'MECOACEOOH'; 'MECOACETO'; 'C24O3CCO2H'; 'TLFUO'; 'TLFUOOH'; ...
'ACCOMECO3'; 'ACCOMECO3H'; 'ACCOMEPAN'; 'METACETHO'; ...
'DIMEFURAN'; 'C4DBDIKET'; 'HYDDIMEFURANO2'; 'MGLOOB'; 'DMKOHO2'; 'HYDDIMEFURANOOH'; 'MGLOO'; 'DMKOHOOH'; 'DMKOHO'; 'DMK2OH'; 'DMKCOOH'; 'CH3COCO2H'; 'C62O'; 'CO2H3CO3'; ...
'CO2H3CO3H'; 'C4PAN6'; 'HCOCO3H'; ...
'FURFURAL'; 'C3H4'; 'FURFURALO2'; 'C5DIALCO'; 'HYDFURFURALO2'; 'ALDFURFURALO2'; 'FURFURALOOH'; 'HYDFURFURALOOH'; 'FURANO2'; 'ALDFURFURALOOH'; 'CARBFURANO2'; 'FURANOOH'; 'CARBFURANOOH'; ...
'MEFURFURAL'; 'MEFURFURALO2'; 'HYDMEFURFURALO2'; 'C5MCO3DB'; 'C3MCOCO2H'; 'MEFURFURALOOH'; 'HYDMEFURFURALOOH';};

% Lixu, add C4H6 + OH, and lumped BUTDAO2, BUTDBO2, and BUTDCO2 into C4H6O2 but without further reactions, may need to think it as RO2
% Lixu, add ACR + OH, and lumped ACO3, ACRO2, and OCCOHCO2 into ACRO2 but without further reactions 
% See 24 reactions and corresponding speices in the list. Details in Lixu_C3H6_box_model.pptx
% Here are updates


% OH path
% 1) Furan, M2Furan, DiMefuran, Furfural, and Mefurfural via OH oxidation
% 2) C4H6 and ACR via OH oxidation
% 20220221, Think about how to get FURANs + O3 -> ALD2 + CH2O ... reactions later.

%{
Following Kelvin Bate's protocol, we should have 
1) AROMRO2 {generic peroxy radical from FURANs oxidation}
AROMRO2 + HO2 = OH + HO2 :                   2.91d-13 * EXP( 1300.0d0 / TEMP ) * 0.82d0;                                       {2021/09/29; Bates2021b; KHB,MSL}
AROMRO2 + NO = NO2 + HO2 :                   GCARR_abc(2.60d-12, 0.0d+00, 365.0d0);                                            {2021/09/29; Bates2021b; KHB,MSL}
AROMRO2 + NO3 = NO2 + HO2 :                  2.30d-12;                                                                         {2021/09/29; Bates2021b; KHB,MSL}
AROMRO2 + MO2 = CH2O + HO2 + HO2 :           GCARR_abc(1.70d-14, 0.0d0, 220.0d0);                                              {2021/09/29; Bates2021b; KHB,MSL}
AROMRO2 + MCO3 = MO2 + HO2 :                 GCARR_abc(4.20d-14, 0.0d0, 220.0d0);                                              {2021/09/29; Bates2021b; KHB,MSL}

2) AROMP4 
AROMP4     = IGNORE; {Generic C4 product from aromatic oxidation}
AROMP4 + OH = 0.6GLYX + 0.25CO + 0.25HCOOH + 0.25OH + 0.33HO2 + 0.33RCO3 + 0.45RCOOH 
AROMP4 + O3 = 0.5HCOOH + 0.5CO + 0.6GLYX + 0.9GLYC + 0.1HO2 + 0.1OH 
AROMP4 = 0.2HO2 + 0.2GLYX + 1.2RCHO
3) AROMP5
AROMP5     = IGNORE; {Generic C5 product from aromatic oxidation}
AROMP5 + OH = 0.6MGLY + 0.15ACTA + 0.1HCOOH + 0.25OH + 0.33HO2 + 0.33RCO3 + 0.25CO + 0.52RCOOH   
AROMP5 + O3 = 0.6MGLY + 0.3ACTA + 0.2HCOOH + 0.5CO + 0.95GLYC + 0.1HO2 + 0.1OH 
AROMP5 = 0.2HO2 + 0.2R4O2 + 0.2MGLY + 1.2RCHO


Question from Lixu: what if we lump it as AROMRO2, AROMP4, and AROMP5?

- FURAN, M2FURAN, and DIMEFURAN
FALD      {Generic aldehdye products from furans oxidation including MALDIAL (majority, put it as individial due to MANHYDRIDE), HOHOC4DIAL; C5DICARB; C4DBDIKET; C5DIALCO} # This is the one we need to consider about thoroughly

C4DIAL {MALDIAL} 

FURANRO2 {Generic peroxy radical from furans oxidation including HYDFURANO2; C5HYDCARBO2; FURFURALO2, HYDFURFURALO2, ALDFURFURALO2(this probably need to be put individually)} # 4 of these will produce MALANHY

MALDIALO2 (this probably need to be put individually, testing on it)

HYDMEFURANRO2 {Generic hydroperoxide radical from methyl furans including HYDMEFURANO2, HYDDIMEFURANO2, and HYDMEFURFURALO2}
C5CO14OH {Acetyl acrylic acid or C5CO14OH}

Q: For FURANRO2, do we need to divide two paths for FURANRO2 and HYDFURANRO2? (done)
C4DIALCO3  {Generic Peroxyacetyl radical from furan-related aldehydes oxidation including MALDIALCO3}
C4DIALCO2H {Generic Peroxyacetyl radical from furan-related aldehydes oxidation including MALDALCO2H and MALDALCO3H}
MANHYDRIDE  { Maleic anhydride or MALANHY}
MANHYDRIDEO2 { Peroxyacetyl radical from MANHYDRIDE oxidation or MALANHY}
GLYCO2H  {Glyoxylic acid or HCOCO2H}
FURANOOH {Generic peroxide product from oxidation of FURANRO2, including HYDFURANOOH and MALDIALOOH}
FURANPAN {MALDIALPAN}




% OH path for furans
% This simplication assume furans follow the similiar pattern
% Thus focusing on FURAN mechanism, along with other 5 furans, it contains ~ 20 rxts
% OH oxidation path

FURAN + OH = 0.7C4DIAL + 0.7HO2 + 0.3FURANRO2 (k = 4.2e-11)                                                           # haven't weighted glyxoal and divide products into number of C
    C4DIAL + OH = 0.83C4DIALCO3 + 0.17C4DIALCO2 (k = 5.20e-11)
    C4DIAL + hv = 0.6C4DIALCO3 + 0.6HO2 + 0.4BZFUONE (giving a name later, along with TLFUONE, and XYFUNONE)
    
    
    FALD + OH = 0.83FALDCO3 + 0.17FURANRO2 (k = 5.20e-11)
        FALDCO3 + MO2 = 0.7*(0.4GLYX + 0.4CO + 0.6MANHYDRIDE) + 0.3*FALDCO2H (k = 1.00e-11)                         # assuming RO2 as MO2;
            FALDCO2H + OH = FURANRO2 (k = 3.70e-11)
            FALDCO2H + hv = GLYCO2H + HO2 + CO + HO2 + CO
                GLYCO2H + OH = CO + HO2 (k = 1.23e-11)
        FALDCO3 + HO2 = 0.56FALDCO2H + 0.15O3  + 0.44(OH+HO2) + 0.176GLYX + 0.176CO + 0.246MANHYDRIDE
            MANHYDRIDE + OH = MO2  (k = 1.4e-12)                                                                    # regard MALANHYO2 as MO2. This could be a big assumption. Check any potential error.
            
        FALDCO3 + NO = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2 (k = KAPNO)        
        FALDCO3 + NO2 = FURANPAN (k = KFPAN)
            FURANPAN = FALDCO3 + NO2 (k = KBPAN)
        FALDCO3 + NO3 = 0.4GLYX + 0.4CO + 0.6MANHYDRIDE + NO2 (k = KRO2NO3.*1.74)
        

    FURANRO2 + NO = GLYX + NO2 + HO2 (k = KRO2NO)                                                                   #  assuming it is half MALDIALO2 and half HYDFURANO2
    FURANRO2 + HO2 = FURANOOH (k = KRO2HO2) # assuming it follows the reaction of HYDFURANOOH
        FURANOOH + hv = FALDCO2H  + OH (JHPALD.*2)
        FURANOOH + OH = FALDCO2H + OH (k = 4e-11)
    FURANRO2 + MO2 = 0.42*(2GLYX + HO2) + 0.16FALD + 0.42FALDCO2H (k = 6.6e-13)                                     # assumption made to weight proportion and rate constant, assuming RO2 as MO2
    FURANRO2 + NO3 = 2GLYX + HO2 + NO2 (k = KRO2NO3)                                                                # this is from MALDIALO, likely will overpredict the GLYX production since other FURANO2 doens't contain this path. 
        
M2FURAN + OH = 0.3FALD + 0.3HO2 + 0.3HYDMEFURANRO2 + 0.4FURANRO2 + X CH2O (k = 6.2e-11)
    HYDMEFURANRO2 + NO = C5CO14OH + HO2 + NO2 (k = KRO2NO)
        C5CO14OH = 0.83(MANHYDRIDE + MO2) + 0.17(MGLY + HO2 + CO) (k = 5.44e-11) 

# The oxidation of FALD from M2FURAN can have different product than from FURAN. Forample, in M2FURAN path, the oxidation can produce MGLY while FURAN cannot, how did Kelvin deal with it?
DIMEFURAN + OH = 0.3FALD + 0.3HO2 + 0.7HYDMEFURANRO2 (k = 1.32e-10) 

- Furfurals
FURALD {Generic aldehdye products from furfurals oxidation including C5DIALCO(majority) and ALDFURFURALO2 (ignored since it's trivial)}
C5DIAL {C5DIALCO}


# 
FURFURALRO2 {Peroxyacetyl radical from furfurals oxidation including HYDFURFURALO2 (majority) and FURFURALO2}
FURFURALROOH {Generic peroxide product from oxidation of FURANRO2, including HYDFURFURALOOH and FURFURALOOH (same reactions)}

% OH path for furfurals
FURFURAL + hv = 0.15FURAN + 0.85PRPE + 2.7CO (k = J57) # regard C3H4 as PRPE for now it is unstudied.

FURFURAL + OH = 0.565FURFURALRO2 + 0.435C5DIAL + 0.463HO2 (k = 3.50e-11)
    FURFURALRO2 + NO = FALDCO2H + NO2 + CO + HO2 (k = KRO2NO)
    FURFURALRO2 + HO2 = FURFURALROOH (k = KRO2HO2)
        FURFURALROOH + hv = FALDCO2H  + OH + CO + HO2 (JCH3OOH)
    FURFURALRO2 + MO2 = FALDCO2H + CO + HO2 (k = 1e-14)
    C5DIAL + OH = C4DIALCO3 + CO (k = 4.90e-11)
    C5DIAL + hv = C4DIALCO3 + CO + HO2 (J18, J19, J34)
    
    
    
        
MEFURFURAL + OH = 0.01FURFURALRO2 + 0.542HYDMEFURANRO2 + 0.458FALD + 0.458HO2(k = 5.1e-11) # choose HYDMEFURANRO2 since CO is not important.  
    
    
% O3 oxidation path for furans

% NO3 oxidation path for furans

% In order to simplify C4H6 mech, we lumped it as PRPE.





%}




























AddSpecies

i=i+1;
Rnames{i} = 'O3 + NO = NO2 + O2';
k(:,i) = GCARR_ac(T, 3.00E-12, -1500.0);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO'; 
fO3(i)=fO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'O3 + OH = HO2 + O2';
k(:,i) = GCARR_ac(T, 1.70E-12, -940.0);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'OH'; 
fO3(i)=fO3(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'O3 + HO2 = OH + O2 + O2';
k(:,i) = GCARR_ac(T, 1.00E-14, -490.0);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'HO2'; 
fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'O3 + NO2 = O2 + NO3';
k(:,i) = GCARR_ac(T, 1.20E-13, -2450.0);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO2'; 
fO3(i)=fO3(i)-1; fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'O3 + MO2 = CH2O + HO2 + O2';
k(:,i) = GCARR_ac(T, 2.90E-16, -1000.0);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'MO2'; 
fO3(i)=fO3(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + OH = H2O + O';
k(:,i) = 1.80E-12;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'OH'; 
fOH(i)=fOH(i)-1; fOH(i)=fOH(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'OH + OH {+M} = H2O2';
k(:,i) = GCJPLPR_aba(M, T, 6.90E-31, 1.0E+00, 2.6E-11, 0.6);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'OH'; 
fOH(i)=fOH(i)-1; fOH(i)=fOH(i)-1; fH2O2(i)=fH2O2(i)+1; 

i=i+1;
Rnames{i} = 'OH + HO2 = H2O + O2';
k(:,i) = GCARR_ac(T, 4.80E-11, 250.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HO2'; 
fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)-1; 

i=i+1;
Rnames{i} = 'OH + H2O2 = H2O + HO2';
k(:,i) = 1.80E-12;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'H2O2'; 
fOH(i)=fOH(i)-1; fH2O2(i)=fH2O2(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + NO = OH + NO2';
k(:,i) = GCARR_ac(T, 3.30E-12, 270.0);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO'; 
fHO2(i)=fHO2(i)-1; fNO(i)=fNO(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + HO2 = H2O2 + O2';
k(:,i) = GC_HO2HO2_acac(H2O, M, T, 3.00E-13, 460.0, 2.1E-33, 920.0);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'HO2'; 
fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)-1; fH2O2(i)=fH2O2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CO = HO2 + CO2';
k(:,i) = GC_OHCO_a(M,T, 1.50E-13);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CO'; 
fOH(i)=fOH(i)-1; fCO(i)=fCO(i)-1; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CH4 = MO2 + H2O';
k(:,i) = GCARR_ac(T, 2.45E-12, -1775.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CH4'; 
fOH(i)=fOH(i)-1; fCH4(i)=fCH4(i)-1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + NO = CH2O + HO2 + NO2';
k(:,i) = GC_RO2NO_B1_ac(T, 2.80E-12, 300.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'NO'; 
fMO2(i)=fMO2(i)-1; fNO(i)=fNO(i)-1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + NO = MENO3';
k(:,i) = GC_RO2NO_A1_ac(T, 2.80E-12, 300.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'NO'; 
fMO2(i)=fMO2(i)-1; fNO(i)=fNO(i)-1; fMENO3(i)=fMENO3(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + HO2 = MP + O2';
k(:,i) = GCARR_abc(T, 4.10E-13, 0.0E+00, 750.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'HO2'; 
fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)-1; fMP(i)=fMP(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + MO2 = MOH + CH2O + O2';
k(:,i) = GC_TBRANCH_1_acac(T, 9.50E-14, 390.0, 2.62E1, -1130.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'MO2'; 
fMO2(i)=fMO2(i)-1; fMO2(i)=fMO2(i)-1; fMOH(i)=fMOH(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + MO2 = 2.000CH2O + 2.000HO2';
k(:,i) = GC_TBRANCH_1_acac(T, 9.50E-14, 390.0, 4.0E-2, 1130.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'MO2'; 
fMO2(i)=fMO2(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+2.000; fHO2(i)=fHO2(i)+2.000; 

i=i+1;
Rnames{i} = 'MO2 + OH = 0.13MOH + 0.87CH2O + 1.74HO2';
k(:,i) = 1.60E-10 ;
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'OH'; 
fMO2(i)=fMO2(i)-1; fOH(i)=fOH(i)-1; fMOH(i)=fMOH(i)+0.13; fCH2O(i)=fCH2O(i)+0.87; fHO2(i)=fHO2(i)+1.74; 

i=i+1;
Rnames{i} = 'MP + OH = MO2 + H2O';
k(:,i) = GCARR_ac(T, 2.66E-12, 200.0);
Gstr{i,1} = 'MP'; Gstr{i,2} = 'OH'; 
fMP(i)=fMP(i)-1; fOH(i)=fOH(i)-1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'MP + OH = CH2O + OH + H2O';
k(:,i) = GCARR_ac(T, 1.14E-12, 200.0);
Gstr{i,1} = 'MP'; Gstr{i,2} = 'OH'; 
fMP(i)=fMP(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ATOOH + OH = ATO2 + H2O';
k(:,i) = GCARR_ac(T, 2.66E-12, 200.0);
Gstr{i,1} = 'ATOOH'; Gstr{i,2} = 'OH'; 
fATOOH(i)=fATOOH(i)-1; fOH(i)=fOH(i)-1; fATO2(i)=fATO2(i)+1; 

i=i+1;
Rnames{i} = 'ATOOH + OH = MGLY + OH + H2O';
k(:,i) = GCARR_ac(T, 1.14E-12, 200.0);
Gstr{i,1} = 'ATOOH'; Gstr{i,2} = 'OH'; 
fATOOH(i)=fATOOH(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'CH2O + OH = CO + HO2 + H2O';
k(:,i) = GCARR_ac(T, 5.50E-12, 125.0);
Gstr{i,1} = 'CH2O'; Gstr{i,2} = 'OH'; 
fCH2O(i)=fCH2O(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + OH {+M} = HNO3 {+M}';
k(:,i) = GCJPLPR_aba(M, T, 1.80E-30, 3.0E+00, 2.8E-11, 0.6);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'OH'; 
fNO2(i)=fNO2(i)-1; fOH(i)=fOH(i)-1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'HNO3 + OH = H2O + NO3';
k(:,i) = GC_OHHNO3_acacac(M,T, 2.41E-14, 460.0, 2.69E-17, 2199.0, 6.51E-34, 1335.0);
Gstr{i,1} = 'HNO3'; Gstr{i,2} = 'OH'; 
fHNO3(i)=fHNO3(i)-1; fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'NO + OH {+M} = HNO2 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 7.00E-31, 2.6E+00, 3.60E-11, 0.1, 0.6);
Gstr{i,1} = 'NO'; Gstr{i,2} = 'OH'; 
fNO(i)=fNO(i)-1; fOH(i)=fOH(i)-1; fHNO2(i)=fHNO2(i)+1; 

i=i+1;
Rnames{i} = 'HNO2 + OH = H2O + NO2';
k(:,i) = GCARR_ac(T, 1.80E-11, -390.0);
Gstr{i,1} = 'HNO2'; Gstr{i,2} = 'OH'; 
fHNO2(i)=fHNO2(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + NO2 {+M} = HNO4 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 1.90E-31, 3.4E+00, 4.0E-12, 0.3, 0.6);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO2'; 
fHO2(i)=fHO2(i)-1; fNO2(i)=fNO2(i)-1; fHNO4(i)=fHNO4(i)+1; 

i=i+1;
Rnames{i} = 'HNO4 {+M} = HO2 + NO2';
k(:,i) = GCJPLPR_abcabc(M, T, 9.05E-05, 3.4, -10900.0, 1.90E15, 0.3, -10900.0, 0.6);
Gstr{i,1} = 'HNO4'; 
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HNO4 + OH = H2O + NO2 + O2';
k(:,i) = GCARR_ac(T, 1.30E-12, 380.0);
Gstr{i,1} = 'HNO4'; Gstr{i,2} = 'OH'; 
fHNO4(i)=fHNO4(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + NO3 = OH + NO2 + O2';
k(:,i) = 3.50E-12;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO3'; 
fHO2(i)=fHO2(i)-1; fNO3(i)=fNO3(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO + NO3 = 2.000NO2';
k(:,i) = GCARR_ac(T, 1.50E-11, 170.0);
Gstr{i,1} = 'NO'; Gstr{i,2} = 'NO3'; 
fNO(i)=fNO(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2.000; 

i=i+1;
Rnames{i} = 'OH + NO3 = HO2 + NO2';
k(:,i) = 2.20E-11;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO3'; 
fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + NO3 {+M} = N2O5 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 2.40E-30, 3.0E+00, 1.6E-12, -0.1, 0.6);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3'; 
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fN2O5(i)=fN2O5(i)+1; 

i=i+1;
Rnames{i} = 'N2O5 {+M} = NO2 + NO3';
k(:,i) = GCJPLPR_abcabc(M, T, 4.14E-04, 3.0, -10840.0, 2.76E14, -0.1, -10840.0, 0.6);
Gstr{i,1} = 'N2O5'; 
fN2O5(i)=fN2O5(i)-1; fNO2(i)=fNO2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'HCOOH + OH = H2O + CO2 + HO2';
k(:,i) = 4.00E-13;
Gstr{i,1} = 'HCOOH'; Gstr{i,2} = 'OH'; 
fHCOOH(i)=fHCOOH(i)-1; fOH(i)=fOH(i)-1; fCO2(i)=fCO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MOH + OH = HO2 + CH2O';
k(:,i) = GCARR_ac(T, 2.90E-12, -345.0);
Gstr{i,1} = 'MOH'; Gstr{i,2} = 'OH'; 
fMOH(i)=fMOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + NO3 = NO + NO2 + O2';
k(:,i) = GCARR_ac(T, 4.50E-14, -1260.0);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3'; 
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + CH2O = HNO3 + HO2 + CO';
k(:,i) = 5.80E-16;
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'CH2O'; 
fNO3(i)=fNO3(i)-1; fCH2O(i)=fCH2O(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'ALD2 + OH = 0.950MCO3 + 0.050CH2O + 0.050CO + 0.050HO2 + H2O';
k(:,i) = GCARR_ac(T, 4.63E-12, 350.0);
Gstr{i,1} = 'ALD2'; Gstr{i,2} = 'OH'; 
fALD2(i)=fALD2(i)-1; fOH(i)=fOH(i)-1; fMCO3(i)=fMCO3(i)+0.950; fCH2O(i)=fCH2O(i)+0.050; fCO(i)=fCO(i)+0.050; fHO2(i)=fHO2(i)+0.050; 

i=i+1;
Rnames{i} = 'ALD2 + NO3 = HNO3 + MCO3';
k(:,i) = GCARR_ac(T, 1.40E-12, -1900.0);
Gstr{i,1} = 'ALD2'; Gstr{i,2} = 'NO3'; 
fALD2(i)=fALD2(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + NO2 {+M} = PAN';
k(:,i) = GCJPLPR_abab(M, T, 9.70E-29, 5.6E+00, 9.3E-12, 1.5, 0.6);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'NO2'; 
fMCO3(i)=fMCO3(i)-1; fNO2(i)=fNO2(i)-1; fPAN(i)=fPAN(i)+1; 

i=i+1;
Rnames{i} = 'PAN = MCO3 + NO2';
k(:,i) = GCJPLEQ_acabab(M,T, 9.30E-29, 14000.0, 9.7E-29, 5.6, 9.3E-12, 1.5, 0.6);
Gstr{i,1} = 'PAN'; 
fPAN(i)=fPAN(i)-1; fMCO3(i)=fMCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + NO = MO2 + NO2 + CO2';
k(:,i) = GCARR_ac(T, 8.10E-12, 270.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'NO'; 
fMCO3(i)=fMCO3(i)-1; fNO(i)=fNO(i)-1; fMO2(i)=fMO2(i)+1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'C2H6 + OH = ETO2 + H2O';
k(:,i) = GCARR_ac(T, 7.66E-12, -1020.0);
Gstr{i,1} = 'C2H6'; Gstr{i,2} = 'OH'; 
fC2H6(i)=fC2H6(i)-1; fOH(i)=fOH(i)-1; fETO2(i)=fETO2(i)+1; 

i=i+1;
Rnames{i} = 'ETO2 + NO = ALD2 + NO2 + HO2';
k(:,i) = GC_RO2NO_B2_aca(M, T, 2.60E-12, 365.0, 2.0);
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'NO'; 
fETO2(i)=fETO2(i)-1; fNO(i)=fNO(i)-1; fALD2(i)=fALD2(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ETO2 + NO = ETNO3';
k(:,i) = GC_RO2NO_A2_aca(M, T, 2.60E-12, 365.0, 2.0);
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'NO'; 
fETO2(i)=fETO2(i)-1; fNO(i)=fNO(i)-1; fETNO3(i)=fETNO3(i)+1; 

i=i+1;
Rnames{i} = 'OTHRO2 + NO = ALD2 + NO2 + HO2';
k(:,i) = GCARR_ac(T, 2.60E-12, 365.0);
Gstr{i,1} = 'OTHRO2'; Gstr{i,2} = 'NO'; 
fOTHRO2(i)=fOTHRO2(i)-1; fNO(i)=fNO(i)-1; fALD2(i)=fALD2(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C3H8 + OH = B3O2';
k(:,i) = GC_TBRANCH_2_acabc(T, 7.60E-12, -585.0, 5.87, 0.64, -816.0);
Gstr{i,1} = 'C3H8'; Gstr{i,2} = 'OH'; 
fC3H8(i)=fC3H8(i)-1; fOH(i)=fOH(i)-1; fB3O2(i)=fB3O2(i)+1; 

i=i+1;
Rnames{i} = 'C3H8 + OH = A3O2';
k(:,i) = GC_TBRANCH_2_acabc(T, 7.60E-12, -585.0, 1.7E-1, -0.64, 816.0);
Gstr{i,1} = 'C3H8'; Gstr{i,2} = 'OH'; 
fC3H8(i)=fC3H8(i)-1; fOH(i)=fOH(i)-1; fA3O2(i)=fA3O2(i)+1; 

i=i+1;
Rnames{i} = 'A3O2 + NO = NO2 + HO2 + RCHO';
k(:,i) = GC_RO2NO_B2_aca(M, T, 2.90E-12, 350.0, 3.0);
Gstr{i,1} = 'A3O2'; Gstr{i,2} = 'NO'; 
fA3O2(i)=fA3O2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'A3O2 + NO = NPRNO3';
k(:,i) = GC_RO2NO_A2_aca(M, T, 2.90E-12, 350.0, 3.0);
Gstr{i,1} = 'A3O2'; Gstr{i,2} = 'NO'; 
fA3O2(i)=fA3O2(i)-1; fNO(i)=fNO(i)-1; fNPRNO3(i)=fNPRNO3(i)+1; 

i=i+1;
Rnames{i} = 'PO2 + NO = NO2 + HO2 + CH2O + ALD2';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'PO2'; Gstr{i,2} = 'NO'; 
fPO2(i)=fPO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'ALK4 + OH = R4O2';
k(:,i) = GCARR_ac(T, 9.10E-12, -405.0);
Gstr{i,1} = 'ALK4'; Gstr{i,2} = 'OH'; 
fALK4(i)=fALK4(i)-1; fOH(i)=fOH(i)-1; fR4O2(i)=fR4O2(i)+1; 

i=i+1;
Rnames{i} = 'R4O2 + NO = NO2 + 0.320ACET + 0.190MEK + 0.190MO2 + 0.270HO2 + 0.320ALD2 + 0.140RCHO + 0.050A3O2 + 0.180B3O2 + 0.320OTHRO2';
k(:,i) = GC_RO2NO_B2_aca(M, T, 2.70E-12, 350.0, 4.5);
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'NO'; 
fR4O2(i)=fR4O2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fACET(i)=fACET(i)+0.320; fMEK(i)=fMEK(i)+0.190; fMO2(i)=fMO2(i)+0.190; fHO2(i)=fHO2(i)+0.270; fALD2(i)=fALD2(i)+0.320; fRCHO(i)=fRCHO(i)+0.140; fA3O2(i)=fA3O2(i)+0.050; fB3O2(i)=fB3O2(i)+0.180; fOTHRO2(i)=fOTHRO2(i)+0.320; 

i=i+1;
Rnames{i} = 'R4O2 + NO = R4N2';
k(:,i) = GC_RO2NO_A2_aca(M, T, 2.70E-12, 350.0, 4.5);
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'NO'; 
fR4O2(i)=fR4O2(i)-1; fNO(i)=fNO(i)-1; fR4N2(i)=fR4N2(i)+1; 

i=i+1;
Rnames{i} = 'R4N1 + NO = 2.000NO2 + 0.570RCHO + 0.860ALD2 + 0.570CH2O';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'R4N1'; Gstr{i,2} = 'NO'; 
fR4N1(i)=fR4N1(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2.000; fRCHO(i)=fRCHO(i)+0.570; fALD2(i)=fALD2(i)+0.860; fCH2O(i)=fCH2O(i)+0.570; 

i=i+1;
Rnames{i} = 'ATO2 + NO = NO2 + CH2O + MCO3';
k(:,i) = GCARR_ac(T, 2.80E-12, 300.0);
Gstr{i,1} = 'ATO2'; Gstr{i,2} = 'NO'; 
fATO2(i)=fATO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'KO2 + NO = 0.930NO2 + 0.930ALD2 + 0.930MCO3 + 0.070R4N2';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'KO2'; Gstr{i,2} = 'NO'; 
fKO2(i)=fKO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+0.930; fALD2(i)=fALD2(i)+0.930; fMCO3(i)=fMCO3(i)+0.930; fR4N2(i)=fR4N2(i)+0.070; 

i=i+1;
Rnames{i} = 'B3O2 + NO = NO2 + HO2 + ACET';
k(:,i) = GC_RO2NO_B2_aca(M, T, 2.70E-12, 360.0, 3.0);
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'NO'; 
fB3O2(i)=fB3O2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fACET(i)=fACET(i)+1; 

i=i+1;
Rnames{i} = 'B3O2 + NO = IPRNO3';
k(:,i) = GC_RO2NO_A2_aca(M, T, 2.70E-12, 360.0, 3.0);
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'NO'; 
fB3O2(i)=fB3O2(i)-1; fNO(i)=fNO(i)-1; fIPRNO3(i)=fIPRNO3(i)+1; 

i=i+1;
Rnames{i} = 'PRN1 + NO = 2.000NO2 + CH2O + ALD2';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'PRN1'; Gstr{i,2} = 'NO'; 
fPRN1(i)=fPRN1(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2.000; fCH2O(i)=fCH2O(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'ALK4 + NO3 = HNO3 + R4O2';
k(:,i) = GCARR_ac(T, 2.80E-12, -3280.0);
Gstr{i,1} = 'ALK4'; Gstr{i,2} = 'NO3'; 
fALK4(i)=fALK4(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fR4O2(i)=fR4O2(i)+1; 

i=i+1;
Rnames{i} = 'R4N2 + OH = R4N1 + H2O';
k(:,i) = 1.60E-12;
Gstr{i,1} = 'R4N2'; Gstr{i,2} = 'OH'; 
fR4N2(i)=fR4N2(i)-1; fOH(i)=fOH(i)-1; fR4N1(i)=fR4N1(i)+1; 

i=i+1;
Rnames{i} = 'ACTA + OH = MO2 + CO2 + H2O';
k(:,i) = GCARR_ac(T, 3.15E-14, 920.0);
Gstr{i,1} = 'ACTA'; Gstr{i,2} = 'OH'; 
fACTA(i)=fACTA(i)-1; fOH(i)=fOH(i)-1; fMO2(i)=fMO2(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + RCHO = RCO3 + H2O';
k(:,i) = GCARR_ac(T, 6.00E-12, 410.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'RCHO'; 
fOH(i)=fOH(i)-1; fRCHO(i)=fRCHO(i)-1; fRCO3(i)=fRCO3(i)+1; 

i=i+1;
Rnames{i} = 'RCO3 + NO2 {+M} = PPN';
k(:,i) = GCJPLPR_abab(M, T, 9.00E-28, 8.9, 7.7E-12, 0.2, 0.6);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'NO2'; 
fRCO3(i)=fRCO3(i)-1; fNO2(i)=fNO2(i)-1; fPPN(i)=fPPN(i)+1; 

i=i+1;
Rnames{i} = 'PPN = RCO3 + NO2';
k(:,i) = GCJPLEQ_acabab(M,T, 9.00E-29, 14000.0, 9.00E-28, 8.9, 7.7E-12, 0.2, 0.6);
Gstr{i,1} = 'PPN'; 
fPPN(i)=fPPN(i)-1; fRCO3(i)=fRCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'RCO3 + NO = NO2 + 0.500OTHRO2 + 0.070A3O2 + 0.270B3O2';
k(:,i) = GCARR_ac(T, 6.70E-12, 340.0);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'NO'; 
fRCO3(i)=fRCO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fOTHRO2(i)=fOTHRO2(i)+0.500; fA3O2(i)=fA3O2(i)+0.070; fB3O2(i)=fB3O2(i)+0.270; 

i=i+1;
Rnames{i} = 'RCHO + NO3 = HNO3 + RCO3';
k(:,i) = 6.50E-15;
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'NO3'; 
fRCHO(i)=fRCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fRCO3(i)=fRCO3(i)+1; 

i=i+1;
Rnames{i} = 'ACET + OH = ATO2 + H2O';
k(:,i) = 1.33E-13 + 3.82E-11*exp(-2000.0/T);
Gstr{i,1} = 'ACET'; Gstr{i,2} = 'OH'; 
fACET(i)=fACET(i)-1; fOH(i)=fOH(i)-1; fATO2(i)=fATO2(i)+1; 

i=i+1;
Rnames{i} = 'A3O2 + MO2 = HO2 + 0.750CH2O + 0.750RCHO + 0.250MOH + 0.250ROH';
k(:,i) = 5.92E-13;
Gstr{i,1} = 'A3O2'; Gstr{i,2} = 'MO2'; 
fA3O2(i)=fA3O2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+0.750; fRCHO(i)=fRCHO(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; 

i=i+1;
Rnames{i} = 'PO2 + MO2 = HO2 + 0.500ALD2 + 1.250CH2O + 0.160HAC + 0.090RCHO + 0.250MOH + 0.250ROH';
k(:,i) = 5.92E-13;
Gstr{i,1} = 'PO2'; Gstr{i,2} = 'MO2'; 
fPO2(i)=fPO2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+0.500; fCH2O(i)=fCH2O(i)+1.250; fHAC(i)=fHAC(i)+0.160; fRCHO(i)=fRCHO(i)+0.090; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; 

i=i+1;
Rnames{i} = 'R4O2 + HO2 = R4P';
k(:,i) = GCARR_ac(T, 7.40E-13, 700.0);
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'HO2'; 
fR4O2(i)=fR4O2(i)-1; fHO2(i)=fHO2(i)-1; fR4P(i)=fR4P(i)+1; 

i=i+1;
Rnames{i} = 'R4N1 + HO2 = R4N2';
k(:,i) = GCARR_ac(T, 7.40E-13, 700.0);
Gstr{i,1} = 'R4N1'; Gstr{i,2} = 'HO2'; 
fR4N1(i)=fR4N1(i)-1; fHO2(i)=fHO2(i)-1; fR4N2(i)=fR4N2(i)+1; 

i=i+1;
Rnames{i} = 'ATO2 + HO2 = 0.150MCO3 + 0.150OH + 0.150CH2O + 0.850ATOOH';
k(:,i) = GCARR_ac(T, 8.60E-13, 700.0);
Gstr{i,1} = 'ATO2'; Gstr{i,2} = 'HO2'; 
fATO2(i)=fATO2(i)-1; fHO2(i)=fHO2(i)-1; fMCO3(i)=fMCO3(i)+0.150; fOH(i)=fOH(i)+0.150; fCH2O(i)=fCH2O(i)+0.150; fATOOH(i)=fATOOH(i)+0.850; 

i=i+1;
Rnames{i} = 'KO2 + HO2 = 0.150OH + 0.150ALD2 + 0.150MCO3 + 0.850ATOOH';
k(:,i) = GC_RO2HO2_aca(T, 2.91E-13, 1300.0, 4.0);
Gstr{i,1} = 'KO2'; Gstr{i,2} = 'HO2'; 
fKO2(i)=fKO2(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+0.150; fALD2(i)=fALD2(i)+0.150; fMCO3(i)=fMCO3(i)+0.150; fATOOH(i)=fATOOH(i)+0.850; 

i=i+1;
Rnames{i} = 'B3O2 + HO2 = RB3P';
k(:,i) = GC_RO2HO2_aca(T, 2.91E-13, 1300.0, 3.0);
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'HO2'; 
fB3O2(i)=fB3O2(i)-1; fHO2(i)=fHO2(i)-1; fRB3P(i)=fRB3P(i)+1; 

i=i+1;
Rnames{i} = 'PRN1 + HO2 = PRPN';
k(:,i) = GC_RO2HO2_aca(T, 2.91E-13, 1300.0, 3.0);
Gstr{i,1} = 'PRN1'; Gstr{i,2} = 'HO2'; 
fPRN1(i)=fPRN1(i)-1; fHO2(i)=fHO2(i)-1; fPRPN(i)=fPRPN(i)+1; 

i=i+1;
Rnames{i} = 'MEK + OH = KO2 + H2O';
k(:,i) = GCARR_ac(T, 1.30E-12, -25.0);
Gstr{i,1} = 'MEK'; Gstr{i,2} = 'OH'; 
fMEK(i)=fMEK(i)-1; fOH(i)=fOH(i)-1; fKO2(i)=fKO2(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + ETO2 = 0.750CH2O + 0.750ALD2 + HO2 + 0.250MOH + 0.250EOH';
k(:,i) = 3.00E-13;
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'ETO2'; 
fMO2(i)=fMO2(i)-1; fETO2(i)=fETO2(i)-1; fCH2O(i)=fCH2O(i)+0.750; fALD2(i)=fALD2(i)+0.750; fHO2(i)=fHO2(i)+1; fMOH(i)=fMOH(i)+0.250; fEOH(i)=fEOH(i)+0.250; 

i=i+1;
Rnames{i} = 'MO2 + OTHRO2 = 0.750CH2O + 0.750ALD2 + HO2 + 0.250MOH + 0.250EOH';
k(:,i) = 3.00E-13;
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'OTHRO2'; 
fMO2(i)=fMO2(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fCH2O(i)=fCH2O(i)+0.750; fALD2(i)=fALD2(i)+0.750; fHO2(i)=fHO2(i)+1; fMOH(i)=fMOH(i)+0.250; fEOH(i)=fEOH(i)+0.250; 

i=i+1;
Rnames{i} = 'MEK + NO3 = HNO3 + KO2';
k(:,i) = 8.00E-16;
Gstr{i,1} = 'MEK'; Gstr{i,2} = 'NO3'; 
fMEK(i)=fMEK(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fKO2(i)=fKO2(i)+1; 

i=i+1;
Rnames{i} = 'R4O2 + MO2 = 0.160ACET + 0.100MEK + 0.090MO2 + 0.140HO2 + 0.160ALD2 + 0.070RCHO + 0.030A3O2 + 0.090B3O2 + 0.160OTHRO2 + 0.250MEK + 0.750CH2O + 0.250MOH + 0.250ROH + 0.500HO2';
k(:,i) = 8.37E-14;
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'MO2'; 
fR4O2(i)=fR4O2(i)-1; fMO2(i)=fMO2(i)-1; fACET(i)=fACET(i)+0.160; fMEK(i)=fMEK(i)+0.100; fMO2(i)=fMO2(i)+0.090; fHO2(i)=fHO2(i)+0.140; fALD2(i)=fALD2(i)+0.160; fRCHO(i)=fRCHO(i)+0.070; fA3O2(i)=fA3O2(i)+0.030; fB3O2(i)=fB3O2(i)+0.090; fOTHRO2(i)=fOTHRO2(i)+0.160; fMEK(i)=fMEK(i)+0.250; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fHO2(i)=fHO2(i)+0.500; 

i=i+1;
Rnames{i} = 'R4N1 + MO2 = NO2 + 0.200CH2O + 0.380ALD2 + 0.290RCHO + 0.150R4O2 + 0.250RCHO + 0.750CH2O + 0.250MOH + 0.250ROH + 0.500HO2';
k(:,i) = 8.37E-14;
Gstr{i,1} = 'R4N1'; Gstr{i,2} = 'MO2'; 
fR4N1(i)=fR4N1(i)-1; fMO2(i)=fMO2(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.200; fALD2(i)=fALD2(i)+0.380; fRCHO(i)=fRCHO(i)+0.290; fR4O2(i)=fR4O2(i)+0.150; fRCHO(i)=fRCHO(i)+0.250; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fHO2(i)=fHO2(i)+0.500; 

i=i+1;
Rnames{i} = 'ATO2 + MO2 = 0.300HO2 + 0.300CH2O + 0.300MCO3 + 0.200HAC + 0.200CH2O + 0.500MGLY + 0.500MOH';
k(:,i) = GCARR_ac(T, 7.50E-13, 500.0);
Gstr{i,1} = 'ATO2'; Gstr{i,2} = 'MO2'; 
fATO2(i)=fATO2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+0.300; fCH2O(i)=fCH2O(i)+0.300; fMCO3(i)=fMCO3(i)+0.300; fHAC(i)=fHAC(i)+0.200; fCH2O(i)=fCH2O(i)+0.200; fMGLY(i)=fMGLY(i)+0.500; fMOH(i)=fMOH(i)+0.500; 

i=i+1;
Rnames{i} = 'KO2 + MO2 = 0.500ALD2 + 0.500MCO3 + 0.250MEK + 0.750CH2O + 0.250MOH + 0.250ROH + 0.500HO2';
k(:,i) = 8.37E-14;
Gstr{i,1} = 'KO2'; Gstr{i,2} = 'MO2'; 
fKO2(i)=fKO2(i)-1; fMO2(i)=fMO2(i)-1; fALD2(i)=fALD2(i)+0.500; fMCO3(i)=fMCO3(i)+0.500; fMEK(i)=fMEK(i)+0.250; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fHO2(i)=fHO2(i)+0.500; 

i=i+1;
Rnames{i} = 'B3O2 + MO2 = 0.500HO2 + 0.500ACET + 0.250ACET + 0.750CH2O + 0.250MOH + 0.250ROH + 0.500HO2';
k(:,i) = 8.37E-14;
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'MO2'; 
fB3O2(i)=fB3O2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+0.500; fACET(i)=fACET(i)+0.500; fACET(i)=fACET(i)+0.250; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fHO2(i)=fHO2(i)+0.500; 

i=i+1;
Rnames{i} = 'PRN1 + MO2 = NO2 + 0.500CH2O + 0.500ALD2 + 0.250RCHO + 0.750CH2O + 0.250MOH + 0.250ROH + 0.500HO2';
k(:,i) = 8.37E-14;
Gstr{i,1} = 'PRN1'; Gstr{i,2} = 'MO2'; 
fPRN1(i)=fPRN1(i)-1; fMO2(i)=fMO2(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.500; fALD2(i)=fALD2(i)+0.500; fRCHO(i)=fRCHO(i)+0.250; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fHO2(i)=fHO2(i)+0.500; 

i=i+1;
Rnames{i} = 'EOH + OH = HO2 + ALD2';
k(:,i) = 3.35E-12;
Gstr{i,1} = 'EOH'; Gstr{i,2} = 'OH'; 
fEOH(i)=fEOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'ROH + OH = HO2 + RCHO';
k(:,i) = GCARR_ac(T, 4.60E-12, 70.0);
Gstr{i,1} = 'ROH'; Gstr{i,2} = 'OH'; 
fROH(i)=fROH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'ETO2 + ETO2 = 2.000ALD2 + 2.000HO2';
k(:,i) = 4.10E-14;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'ETO2'; 
fETO2(i)=fETO2(i)-1; fETO2(i)=fETO2(i)-1; fALD2(i)=fALD2(i)+2.000; fHO2(i)=fHO2(i)+2.000; 

i=i+1;
Rnames{i} = 'OTHRO2 + OTHRO2 = 2.000ALD2 + 2.000HO2';
k(:,i) = 4.10E-14;
Gstr{i,1} = 'OTHRO2'; Gstr{i,2} = 'OTHRO2'; 
fOTHRO2(i)=fOTHRO2(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fALD2(i)=fALD2(i)+2.000; fHO2(i)=fHO2(i)+2.000; 

i=i+1;
Rnames{i} = 'ETO2 + ETO2 = EOH + ALD2';
k(:,i) = 2.70E-14;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'ETO2'; 
fETO2(i)=fETO2(i)-1; fETO2(i)=fETO2(i)-1; fEOH(i)=fEOH(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'OTHRO2 + OTHRO2 = EOH + ALD2';
k(:,i) = 2.70E-14;
Gstr{i,1} = 'OTHRO2'; Gstr{i,2} = 'OTHRO2'; 
fOTHRO2(i)=fOTHRO2(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fEOH(i)=fEOH(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + ETO2 = ETP';
k(:,i) = GCARR_ac(T, 7.40E-13, 700.0);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'ETO2'; 
fHO2(i)=fHO2(i)-1; fETO2(i)=fETO2(i)-1; fETP(i)=fETP(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + OTHRO2 = ETP';
k(:,i) = GCARR_ac(T, 7.40E-13, 700.0);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'OTHRO2'; 
fHO2(i)=fHO2(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fETP(i)=fETP(i)+1; 

i=i+1;
Rnames{i} = 'A3O2 + HO2 = RA3P';
k(:,i) = GC_RO2HO2_aca(T, 2.91E-13, 1300.0, 3.0);
Gstr{i,1} = 'A3O2'; Gstr{i,2} = 'HO2'; 
fA3O2(i)=fA3O2(i)-1; fHO2(i)=fHO2(i)-1; fRA3P(i)=fRA3P(i)+1; 

i=i+1;
Rnames{i} = 'PO2 + HO2 = PP';
k(:,i) = GC_RO2HO2_aca(T, 2.91E-13, 1300.0, 3.0);
Gstr{i,1} = 'PO2'; Gstr{i,2} = 'HO2'; 
fPO2(i)=fPO2(i)-1; fHO2(i)=fHO2(i)-1; fPP(i)=fPP(i)+1; 

i=i+1;
Rnames{i} = 'RCO3 + HO2 = 0.410RP + 0.150RCOOH + 0.150O3 + 0.440OH + 0.220OTHRO2 + 0.030A3O2 + 0.120B3O2';
k(:,i) = GCARR_ac(T, 4.30E-13, 1040.0);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'HO2'; 
fRCO3(i)=fRCO3(i)-1; fHO2(i)=fHO2(i)-1; fRP(i)=fRP(i)+0.410; fRCOOH(i)=fRCOOH(i)+0.150; fO3(i)=fO3(i)+0.150; fOH(i)=fOH(i)+0.440; fOTHRO2(i)=fOTHRO2(i)+0.220; fA3O2(i)=fA3O2(i)+0.030; fB3O2(i)=fB3O2(i)+0.120; 

i=i+1;
Rnames{i} = 'PRPE + OH {+M} = PO2';
k(:,i) = GCJPLPR_abab(M, T, 4.60E-27, 4.0, 2.6E-11, 1.3, 0.5);
Gstr{i,1} = 'PRPE'; Gstr{i,2} = 'OH'; 
fPRPE(i)=fPRPE(i)-1; fOH(i)=fOH(i)-1; fPO2(i)=fPO2(i)+1; 

i=i+1;
Rnames{i} = 'PRPE + O3 = 0.500ALD2 + 0.500CH2O + 0.120CH3CHOO + 0.100CH4 + 0.120CH2OO + 0.280MO2 + 0.560CO + 0.280HO2 + 0.360OH';
k(:,i) = GCARR_ac(T, 5.50E-15, -1880.0);
Gstr{i,1} = 'PRPE'; Gstr{i,2} = 'O3'; 
fPRPE(i)=fPRPE(i)-1; fO3(i)=fO3(i)-1; fALD2(i)=fALD2(i)+0.500; fCH2O(i)=fCH2O(i)+0.500; fCH3CHOO(i)=fCH3CHOO(i)+0.120; fCH4(i)=fCH4(i)+0.100; fCH2OO(i)=fCH2OO(i)+0.120; fMO2(i)=fMO2(i)+0.280; fCO(i)=fCO(i)+0.560; fHO2(i)=fHO2(i)+0.280; fOH(i)=fOH(i)+0.360; 

i=i+1;
Rnames{i} = 'GLYC + OH = 0.732CH2O + 0.361CO2 + 0.505CO + 0.227OH + 0.773HO2 + 0.134GLYX + 0.134HCOOH';
k(:,i) = GC_GLYCOH_A_a(T, 8.00E-12);
Gstr{i,1} = 'GLYC'; Gstr{i,2} = 'OH'; 
fGLYC(i)=fGLYC(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+0.732; fCO2(i)=fCO2(i)+0.361; fCO(i)=fCO(i)+0.505; fOH(i)=fOH(i)+0.227; fHO2(i)=fHO2(i)+0.773; fGLYX(i)=fGLYX(i)+0.134; fHCOOH(i)=fHCOOH(i)+0.134; 

i=i+1;
Rnames{i} = 'GLYC + OH = HCOOH + OH + CO';
k(:,i) = GC_GLYCOH_B_a(T, 8.00E-12);
Gstr{i,1} = 'GLYC'; Gstr{i,2} = 'OH'; 
fGLYC(i)=fGLYC(i)-1; fOH(i)=fOH(i)-1; fHCOOH(i)=fHCOOH(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'PRPE + NO3 = PRN1';
k(:,i) = GCARR_ac(T, 4.59E-13, -1156.0);
Gstr{i,1} = 'PRPE'; Gstr{i,2} = 'NO3'; 
fPRPE(i)=fPRPE(i)-1; fNO3(i)=fNO3(i)-1; fPRN1(i)=fPRN1(i)+1; 

i=i+1;
Rnames{i} = 'GLYX + OH = HO2 + 2.000CO';
k(:,i) = GCARR_ac(T, 3.10E-12, 340.0);
Gstr{i,1} = 'GLYX'; Gstr{i,2} = 'OH'; 
fGLYX(i)=fGLYX(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+2.000; 

i=i+1;
Rnames{i} = 'MGLY + OH = MCO3 + CO';
k(:,i) = 1.50E-11;
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'OH'; 
fMGLY(i)=fMGLY(i)-1; fOH(i)=fOH(i)-1; fMCO3(i)=fMCO3(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'GLYX + NO3 = HNO3 + HO2 + 2.000CO';
k(:,i) = GC_GLYXNO3_ac(M,T, 1.40E-12, -1860.0);
Gstr{i,1} = 'GLYX'; Gstr{i,2} = 'NO3'; 
fGLYX(i)=fGLYX(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+2.000; 

i=i+1;
Rnames{i} = 'MGLY + NO3 = HNO3 + CO + MCO3';
k(:,i) = GCARR_ac(T, 3.36E-12, -1860.0);
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'NO3'; 
fMGLY(i)=fMGLY(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'HAC + OH = MGLY + HO2';
k(:,i) = GC_HACOH_A_ac(T, 2.15E-12, 305.0);
Gstr{i,1} = 'HAC'; Gstr{i,2} = 'OH'; 
fHAC(i)=fHAC(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HAC + OH = 0.500HCOOH + OH + 0.500ACTA + 0.500CO2 + 0.500CO + 0.500MO2';
k(:,i) = GC_HACOH_B_ac(T, 2.15E-12, 305.0);
Gstr{i,1} = 'HAC'; Gstr{i,2} = 'OH'; 
fHAC(i)=fHAC(i)-1; fOH(i)=fOH(i)-1; fHCOOH(i)=fHCOOH(i)+0.500; fOH(i)=fOH(i)+1; fACTA(i)=fACTA(i)+0.500; fCO2(i)=fCO2(i)+0.500; fCO(i)=fCO(i)+0.500; fMO2(i)=fMO2(i)+0.500; 

i=i+1;
Rnames{i} = 'MCO3 + A3O2 = MO2 + RCHO + HO2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'A3O2'; 
fMCO3(i)=fMCO3(i)-1; fA3O2(i)=fA3O2(i)-1; fMO2(i)=fMO2(i)+1; fRCHO(i)=fRCHO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + PO2 = MO2 + ALD2 + CH2O + HO2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'PO2'; 
fMCO3(i)=fMCO3(i)-1; fPO2(i)=fPO2(i)-1; fMO2(i)=fMO2(i)+1; fALD2(i)=fALD2(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + A3O2 = ACTA + RCHO';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'A3O2'; 
fMCO3(i)=fMCO3(i)-1; fA3O2(i)=fA3O2(i)-1; fACTA(i)=fACTA(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + PO2 = ACTA + 0.350RCHO + 0.650HAC';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'PO2'; 
fMCO3(i)=fMCO3(i)-1; fPO2(i)=fPO2(i)-1; fACTA(i)=fACTA(i)+1; fRCHO(i)=fRCHO(i)+0.350; fHAC(i)=fHAC(i)+0.650; 

i=i+1;
Rnames{i} = 'RCO3 + MO2 = CH2O + HO2 + 0.500OTHRO2 + 0.070A3O2 + 0.270B3O2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'MO2'; 
fRCO3(i)=fRCO3(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fOTHRO2(i)=fOTHRO2(i)+0.500; fA3O2(i)=fA3O2(i)+0.070; fB3O2(i)=fB3O2(i)+0.270; 

i=i+1;
Rnames{i} = 'RCO3 + MO2 = RCOOH + CH2O';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'MO2'; 
fRCO3(i)=fRCO3(i)-1; fMO2(i)=fMO2(i)-1; fRCOOH(i)=fRCOOH(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'PRPN + OH = 0.209PRN1 + 0.791OH + 0.791PROPNN';
k(:,i) = GCARR_ac(T, 8.78E-12, 200.0);
Gstr{i,1} = 'PRPN'; Gstr{i,2} = 'OH'; 
fPRPN(i)=fPRPN(i)-1; fOH(i)=fOH(i)-1; fPRN1(i)=fPRN1(i)+0.209; fOH(i)=fOH(i)+0.791; fPROPNN(i)=fPROPNN(i)+0.791; 

i=i+1;
Rnames{i} = 'ETP + OH = 0.640OH + 0.360OTHRO2 + 0.640ALD2';
k(:,i) = GCARR_ac(T, 5.18E-12, 200.0);
Gstr{i,1} = 'ETP'; Gstr{i,2} = 'OH'; 
fETP(i)=fETP(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.640; fOTHRO2(i)=fOTHRO2(i)+0.360; fALD2(i)=fALD2(i)+0.640; 

i=i+1;
Rnames{i} = 'RA3P + OH = 0.640OH + 0.360A3O2 + 0.640RCHO';
k(:,i) = GCARR_ac(T, 5.18E-12, 200.0);
Gstr{i,1} = 'RA3P'; Gstr{i,2} = 'OH'; 
fRA3P(i)=fRA3P(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.640; fA3O2(i)=fA3O2(i)+0.360; fRCHO(i)=fRCHO(i)+0.640; 

i=i+1;
Rnames{i} = 'RB3P + OH = 0.791OH + 0.209B3O2 + 0.791ACET';
k(:,i) = GCARR_ac(T, 8.78E-12, 200.0);
Gstr{i,1} = 'RB3P'; Gstr{i,2} = 'OH'; 
fRB3P(i)=fRB3P(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.791; fB3O2(i)=fB3O2(i)+0.209; fACET(i)=fACET(i)+0.791; 

i=i+1;
Rnames{i} = 'R4P + OH = 0.791OH + 0.209R4O2 + 0.791RCHO';
k(:,i) = GCARR_ac(T, 8.78E-12, 200.0);
Gstr{i,1} = 'R4P'; Gstr{i,2} = 'OH'; 
fR4P(i)=fR4P(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.791; fR4O2(i)=fR4O2(i)+0.209; fRCHO(i)=fRCHO(i)+0.791; 

i=i+1;
Rnames{i} = 'RP + OH = RCO3';
k(:,i) = GCARR_ac(T, 6.13E-13, 200.0);
Gstr{i,1} = 'RP'; Gstr{i,2} = 'OH'; 
fRP(i)=fRP(i)-1; fOH(i)=fOH(i)-1; fRCO3(i)=fRCO3(i)+1; 

i=i+1;
Rnames{i} = 'PP + OH = 0.791OH + 0.209PO2 + 0.791HAC';
k(:,i) = GCARR_ac(T, 8.78E-12, 200.0);
Gstr{i,1} = 'PP'; Gstr{i,2} = 'OH'; 
fPP(i)=fPP(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.791; fPO2(i)=fPO2(i)+0.209; fHAC(i)=fHAC(i)+0.791; 

i=i+1;
Rnames{i} = 'LVOC + OH = OH';
k(:,i) = GCARR_ac(T, 4.82E-11, -400.0);
Gstr{i,1} = 'LVOC'; Gstr{i,2} = 'OH'; 
fLVOC(i)=fLVOC(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'OH + MAP = MCO3';
k(:,i) = GCARR_ac(T, 6.13E-13, 200.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'MAP'; 
fOH(i)=fOH(i)-1; fMAP(i)=fMAP(i)-1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'C2H6 + NO3 = ETO2 + HNO3';
k(:,i) = 1.40E-18;
Gstr{i,1} = 'C2H6'; Gstr{i,2} = 'NO3'; 
fC2H6(i)=fC2H6(i)-1; fNO3(i)=fNO3(i)-1; fETO2(i)=fETO2(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + MCO3 = 2.000MO2';
k(:,i) = GCARR_ac(T, 2.50E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'MCO3'; 
fMCO3(i)=fMCO3(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+2.000; 

i=i+1;
Rnames{i} = 'MCO3 + MO2 = CH2O + MO2 + HO2';
k(:,i) = GCARR_ac(T, 1.80E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'MO2'; 
fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fMO2(i)=fMO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + MO2 = ACTA + CH2O';
k(:,i) = GCARR_ac(T, 2.00E-13, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'MO2'; 
fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)-1; fACTA(i)=fACTA(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'R4O2 + MCO3 = MO2 + 0.320ACET + 0.190MEK + 0.270HO2 + 0.320ALD2 + 0.130RCHO + 0.050A3O2 + 0.180B3O2 + 0.320OTHRO2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'MCO3'; 
fR4O2(i)=fR4O2(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fACET(i)=fACET(i)+0.320; fMEK(i)=fMEK(i)+0.190; fHO2(i)=fHO2(i)+0.270; fALD2(i)=fALD2(i)+0.320; fRCHO(i)=fRCHO(i)+0.130; fA3O2(i)=fA3O2(i)+0.050; fB3O2(i)=fB3O2(i)+0.180; fOTHRO2(i)=fOTHRO2(i)+0.320; 

i=i+1;
Rnames{i} = 'ATO2 + MCO3 = MO2 + MCO3 + CH2O';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'ATO2'; Gstr{i,2} = 'MCO3'; 
fATO2(i)=fATO2(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fMCO3(i)=fMCO3(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'KO2 + MCO3 = MO2 + ALD2 + MCO3';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'KO2'; Gstr{i,2} = 'MCO3'; 
fKO2(i)=fKO2(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fALD2(i)=fALD2(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'B3O2 + MCO3 = MO2 + HO2 + ACET';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'MCO3'; 
fB3O2(i)=fB3O2(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fHO2(i)=fHO2(i)+1; fACET(i)=fACET(i)+1; 

i=i+1;
Rnames{i} = 'R4N1 + MCO3 = MO2 + NO2 + 0.390CH2O + 0.750ALD2 + 0.570RCHO + 0.300R4O2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'R4N1'; Gstr{i,2} = 'MCO3'; 
fR4N1(i)=fR4N1(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.390; fALD2(i)=fALD2(i)+0.750; fRCHO(i)=fRCHO(i)+0.570; fR4O2(i)=fR4O2(i)+0.300; 

i=i+1;
Rnames{i} = 'PRN1 + MCO3 = MO2 + NO2 + CH2O + ALD2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'PRN1'; Gstr{i,2} = 'MCO3'; 
fPRN1(i)=fPRN1(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'R4O2 + MCO3 = MEK + ACTA';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'R4O2'; Gstr{i,2} = 'MCO3'; 
fR4O2(i)=fR4O2(i)-1; fMCO3(i)=fMCO3(i)-1; fMEK(i)=fMEK(i)+1; fACTA(i)=fACTA(i)+1; 

i=i+1;
Rnames{i} = 'ATO2 + MCO3 = MGLY + ACTA';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'ATO2'; Gstr{i,2} = 'MCO3'; 
fATO2(i)=fATO2(i)-1; fMCO3(i)=fMCO3(i)-1; fMGLY(i)=fMGLY(i)+1; fACTA(i)=fACTA(i)+1; 

i=i+1;
Rnames{i} = 'KO2 + MCO3 = MEK + ACTA';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'KO2'; Gstr{i,2} = 'MCO3'; 
fKO2(i)=fKO2(i)-1; fMCO3(i)=fMCO3(i)-1; fMEK(i)=fMEK(i)+1; fACTA(i)=fACTA(i)+1; 

i=i+1;
Rnames{i} = 'R4N1 + MCO3 = RCHO + ACTA + NO2';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'R4N1'; Gstr{i,2} = 'MCO3'; 
fR4N1(i)=fR4N1(i)-1; fMCO3(i)=fMCO3(i)-1; fRCHO(i)=fRCHO(i)+1; fACTA(i)=fACTA(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'PRN1 + MCO3 = RCHO + ACTA + NO2';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'PRN1'; Gstr{i,2} = 'MCO3'; 
fPRN1(i)=fPRN1(i)-1; fMCO3(i)=fMCO3(i)-1; fRCHO(i)=fRCHO(i)+1; fACTA(i)=fACTA(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'B3O2 + MCO3 = ACET + ACTA';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'B3O2'; Gstr{i,2} = 'MCO3'; 
fB3O2(i)=fB3O2(i)-1; fMCO3(i)=fMCO3(i)-1; fACET(i)=fACET(i)+1; fACTA(i)=fACTA(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + ETO2 = MO2 + ALD2 + HO2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'ETO2'; 
fMCO3(i)=fMCO3(i)-1; fETO2(i)=fETO2(i)-1; fMO2(i)=fMO2(i)+1; fALD2(i)=fALD2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + OTHRO2 = MO2 + ALD2 + HO2';
k(:,i) = GCARR_ac(T, 1.68E-12, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'OTHRO2'; 
fMCO3(i)=fMCO3(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fMO2(i)=fMO2(i)+1; fALD2(i)=fALD2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + ETO2 = ACTA + ALD2';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'ETO2'; 
fMCO3(i)=fMCO3(i)-1; fETO2(i)=fETO2(i)-1; fACTA(i)=fACTA(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'MCO3 + OTHRO2 = ACTA + ALD2';
k(:,i) = GCARR_ac(T, 1.87E-13, 500.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'OTHRO2'; 
fMCO3(i)=fMCO3(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fACTA(i)=fACTA(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'RCO3 + MCO3 = MO2 + 0.500OTHRO2 + 0.070A3O2 + 0.270B3O2';
k(:,i) = GCARR_ac(T, 2.50E-12, 500.0);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'MCO3'; 
fRCO3(i)=fRCO3(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fOTHRO2(i)=fOTHRO2(i)+0.500; fA3O2(i)=fA3O2(i)+0.070; fB3O2(i)=fB3O2(i)+0.270; 

i=i+1;
Rnames{i} = 'NO3 + NO3 = 2.000NO2 + O2';
k(:,i) = GCARR_ac(T, 8.50E-13, -2450.0);
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2.000; 

i=i+1;
Rnames{i} = 'MO2 + NO2 {+M} = MPN {+M}';
k(:,i) = GCJPLPR_abab(M, T, 1.00E-30, 4.8E+00, 7.2E-12, 2.1, 0.6);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'NO2'; 
fMO2(i)=fMO2(i)-1; fNO2(i)=fNO2(i)-1; fMPN(i)=fMPN(i)+1; 

i=i+1;
Rnames{i} = 'MPN {+M} = MO2 + NO2';
k(:,i) = GCJPLPR_abcabc(M, T, 1.05E-02, 4.8E+00, -11234.0, 7.58E16, 2.1, -11234.0, 0.6);
Gstr{i,1} = 'MPN'; 
fMPN(i)=fMPN(i)-1; fMO2(i)=fMO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'DMS + OH = SO2 + MO2 + CH2O';
k(:,i) = GCARR_ac(T, 1.20E-11, -280.0);
Gstr{i,1} = 'DMS'; Gstr{i,2} = 'OH'; 
fDMS(i)=fDMS(i)-1; fOH(i)=fOH(i)-1; fSO2(i)=fSO2(i)+1; fMO2(i)=fMO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'DMS + OH = 0.750SO2 + 0.250MSA + MO2';
k(:,i) = GC_DMSOH_acac(M, T, 8.20E-39, 5376.0, 1.05E-5, 3644.0);
Gstr{i,1} = 'DMS'; Gstr{i,2} = 'OH'; 
fDMS(i)=fDMS(i)-1; fOH(i)=fOH(i)-1; fSO2(i)=fSO2(i)+0.750; fMSA(i)=fMSA(i)+0.250; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'DMS + NO3 = SO2 + HNO3 + MO2 + CH2O';
k(:,i) = GCARR_ac(T, 1.90E-13, 530.0);
Gstr{i,1} = 'DMS'; Gstr{i,2} = 'NO3'; 
fDMS(i)=fDMS(i)-1; fNO3(i)=fNO3(i)-1; fSO2(i)=fSO2(i)+1; fHNO3(i)=fHNO3(i)+1; fMO2(i)=fMO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'SO2 + OH {+M} = SO4 + HO2';
k(:,i) = GCJPLPR_aba(M, T, 3.30E-31, 4.3E+00, 1.6E-12, 0.6);
Gstr{i,1} = 'SO2'; Gstr{i,2} = 'OH'; 
fSO2(i)=fSO2(i)-1; fOH(i)=fOH(i)-1; fSO4(i)=fSO4(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + O3 = BrO + O2';
k(:,i) = GCARR_ac(T, 1.60E-11, -780.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'O3'; 
fBr(i)=fBr(i)-1; fO3(i)=fO3(i)-1; fBrO(i)=fBrO(i)+1; 

i=i+1;
Rnames{i} = 'BrO + HO2 = HOBr + O2';
k(:,i) = GCARR_ac(T, 4.50E-12, 460.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'HO2'; 
fBrO(i)=fBrO(i)-1; fHO2(i)=fHO2(i)-1; fHOBr(i)=fHOBr(i)+1; 

i=i+1;
Rnames{i} = 'Br + HO2 = HBr + O2';
k(:,i) = GCARR_ac(T, 4.80E-12, -310.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'HO2'; 
fBr(i)=fBr(i)-1; fHO2(i)=fHO2(i)-1; fHBr(i)=fHBr(i)+1; 

i=i+1;
Rnames{i} = 'HBr + OH = Br + H2O';
k(:,i) = GCARR_ac(T, 5.50E-12, 200.0);
Gstr{i,1} = 'HBr'; Gstr{i,2} = 'OH'; 
fHBr(i)=fHBr(i)-1; fOH(i)=fOH(i)-1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'BrO + BrO = 2.000Br + O2';
k(:,i) = GCARR_ac(T, 2.40E-12,  40.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'BrO'; 
fBrO(i)=fBrO(i)-1; fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+2.000; 

i=i+1;
Rnames{i} = 'BrO + BrO = Br2 + O2';
k(:,i) = GCARR_ac(T, 2.80E-14, 860.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'BrO'; 
fBrO(i)=fBrO(i)-1; fBrO(i)=fBrO(i)-1; fBr2(i)=fBr2(i)+1; 

i=i+1;
Rnames{i} = 'BrO + NO = Br + NO2';
k(:,i) = GCARR_ac(T, 8.80E-12, 260.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'NO'; 
fBrO(i)=fBrO(i)-1; fNO(i)=fNO(i)-1; fBr(i)=fBr(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + BrNO3 = Br2 + NO3';
k(:,i) = 4.90E-11;
Gstr{i,1} = 'Br'; Gstr{i,2} = 'BrNO3'; 
fBr(i)=fBr(i)-1; fBrNO3(i)=fBrNO3(i)-1; fBr2(i)=fBr2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'Br2 + OH = HOBr + Br';
k(:,i) = GCARR_ac(T, 2.10E-11, 240.0);
Gstr{i,1} = 'Br2'; Gstr{i,2} = 'OH'; 
fBr2(i)=fBr2(i)-1; fOH(i)=fOH(i)-1; fHOBr(i)=fHOBr(i)+1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'HOBr + O = OH + BrO';
k(:,i) = GCARR_ac(T, 1.20E-10, -430.0);
Gstr{i,1} = 'HOBr'; Gstr{i,2} = 'O'; 
fHOBr(i)=fHOBr(i)-1; fO(i)=fO(i)-1; fOH(i)=fOH(i)+1; fBrO(i)=fBrO(i)+1; 

i=i+1;
Rnames{i} = 'HBr + O = OH + Br';
k(:,i) = GCARR_ac(T, 5.80E-12, -1500.0);
Gstr{i,1} = 'HBr'; Gstr{i,2} = 'O'; 
fHBr(i)=fHBr(i)-1; fO(i)=fO(i)-1; fOH(i)=fOH(i)+1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'BrO + OH = Br + HO2';
k(:,i) = GCARR_ac(T, 1.70E-11, 250.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'OH'; 
fBrO(i)=fBrO(i)-1; fOH(i)=fOH(i)-1; fBr(i)=fBr(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + NO3 = BrO + NO2';
k(:,i) = 1.60E-11;
Gstr{i,1} = 'Br'; Gstr{i,2} = 'NO3'; 
fBr(i)=fBr(i)-1; fNO3(i)=fNO3(i)-1; fBrO(i)=fBrO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + CH2O = HBr + HO2 + CO';
k(:,i) = GCARR_ac(T, 1.70E-11, -800.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'CH2O'; 
fBr(i)=fBr(i)-1; fCH2O(i)=fCH2O(i)-1; fHBr(i)=fHBr(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'Br + ALD2 = HBr + MCO3';
k(:,i) = GCARR_ac(T, 1.80E-11, -460.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'ALD2'; 
fBr(i)=fBr(i)-1; fALD2(i)=fALD2(i)-1; fHBr(i)=fHBr(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'Br + ACET = HBr + ATO2';
k(:,i) = GCARR_ac(T, 1.66E-10, -7000.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'ACET'; 
fBr(i)=fBr(i)-1; fACET(i)=fACET(i)-1; fHBr(i)=fHBr(i)+1; fATO2(i)=fATO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + C2H6 = HBr + ETO2';
k(:,i) = GCARR_ac(T, 2.36E-10, -6411.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'C2H6'; 
fBr(i)=fBr(i)-1; fC2H6(i)=fC2H6(i)-1; fHBr(i)=fHBr(i)+1; fETO2(i)=fETO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + C3H8 = HBr + A3O2';
k(:,i) = GCARR_ac(T, 8.77E-11, -4330.0);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'C3H8'; 
fBr(i)=fBr(i)-1; fC3H8(i)=fC3H8(i)-1; fHBr(i)=fHBr(i)+1; fA3O2(i)=fA3O2(i)+1; 

i=i+1;
Rnames{i} = 'Br + NO2 {+M} = BrNO2 {+M}';
k(:,i) = GCJPLPR_aba(M, T, 4.20E-31, 2.4, 2.7E-11, 0.6);
Gstr{i,1} = 'Br'; Gstr{i,2} = 'NO2'; 
fBr(i)=fBr(i)-1; fNO2(i)=fNO2(i)-1; fBrNO2(i)=fBrNO2(i)+1; 

i=i+1;
Rnames{i} = 'BrO + NO2 {+M} = BrNO3 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 5.40E-31, 3.1, 6.5E-12, 2.9, 0.6);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'NO2'; 
fBrO(i)=fBrO(i)-1; fNO2(i)=fNO2(i)-1; fBrNO3(i)=fBrNO3(i)+1; 

i=i+1;
Rnames{i} = 'CHBr3 + OH = 3.000Br';
k(:,i) = GCARR_ac(T, 9.00E-13, -360.0);
Gstr{i,1} = 'CHBr3'; Gstr{i,2} = 'OH'; 
fCHBr3(i)=fCHBr3(i)-1; fOH(i)=fOH(i)-1; fBr(i)=fBr(i)+3.000; 

i=i+1;
Rnames{i} = 'CH2Br2 + OH = 2.000Br';
k(:,i) = GCARR_ac(T, 2.00E-12, -840.0);
Gstr{i,1} = 'CH2Br2'; Gstr{i,2} = 'OH'; 
fCH2Br2(i)=fCH2Br2(i)-1; fOH(i)=fOH(i)-1; fBr(i)=fBr(i)+2.000; 

i=i+1;
Rnames{i} = 'CH3Br + OH = Br + H2O + HO2';
k(:,i) = GCARR_ac(T, 1.42E-12, -1150.0);
Gstr{i,1} = 'CH3Br'; Gstr{i,2} = 'OH'; 
fCH3Br(i)=fCH3Br(i)-1; fOH(i)=fOH(i)-1; fBr(i)=fBr(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'O1D + H2O = 2.000OH';
k(:,i) = GCARR_ac(T, 1.63E-10, 60.0).*H2O;
Gstr{i,1} = 'O1D'; 
fO1D(i)=fO1D(i)-1; fOH(i)=fOH(i)+2.000; 

i=i+1;
Rnames{i} = 'O1D + N2 = O + N2';
k(:,i) = GCARR_ac(T, 2.15E-11, 110.0).*0.78.*M;
Gstr{i,1} = 'O1D'; 
fO1D(i)=fO1D(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'O1D + O2 = O + O2';
k(:,i) = GCARR_ac(T, 3.30E-11, 55.0).*0.21.*M;
Gstr{i,1} = 'O1D'; 
fO1D(i)=fO1D(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'O1D + H2 = H + OH';
k(:,i) = 1.20E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'H2'; 
fO1D(i)=fO1D(i)-1; fH2(i)=fH2(i)-1; fH(i)=fH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'O1D + N2O = N2 + O2';
k(:,i) = GCARR_ac(T, 4.63E-11, 20.0);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'N2O'; 
fO1D(i)=fO1D(i)-1; fN2O(i)=fN2O(i)-1; 

i=i+1;
Rnames{i} = 'O1D + N2O = 2.000NO';
k(:,i) = GCARR_ac(T, 7.25E-11, 20.0);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'N2O'; 
fO1D(i)=fO1D(i)-1; fN2O(i)=fN2O(i)-1; fNO(i)=fNO(i)+2.000; 

i=i+1;
Rnames{i} = 'O1D + CH4 = MO2 + OH';
k(:,i) = 1.31E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CH4'; 
fO1D(i)=fO1D(i)-1; fCH4(i)=fCH4(i)-1; fMO2(i)=fMO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'O1D + CH4 = CH2O + H2';
k(:,i) = 0.09E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CH4'; 
fO1D(i)=fO1D(i)-1; fCH4(i)=fCH4(i)-1; fCH2O(i)=fCH2O(i)+1; fH2(i)=fH2(i)+1; 

i=i+1;
Rnames{i} = 'O1D + CH4 = CH2O + H + HO2';
k(:,i) = 0.35E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CH4'; 
fO1D(i)=fO1D(i)-1; fCH4(i)=fCH4(i)-1; fCH2O(i)=fCH2O(i)+1; fH(i)=fH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'O + O2 {+M} = O3 {+M}';
k(:,i) = GCARR_ab(T, 6.00E-34, 2.4).*M.*0.21.*M;
Gstr{i,1} = 'O'; 
fO(i)=fO(i)-1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = 'O + O3 = 2.000O2';
k(:,i) = GCARR_ac(T, 8.00E-12, -2060.0);
Gstr{i,1} = 'O'; Gstr{i,2} = 'O3'; 
fO(i)=fO(i)-1; fO3(i)=fO3(i)-1; 

i=i+1;
Rnames{i} = 'OH + H2 = H2O + H';
k(:,i) = GCARR_ac(T, 2.80E-12, -1800.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'H2'; 
fOH(i)=fOH(i)-1; fH2(i)=fH2(i)-1; fH(i)=fH(i)+1; 

i=i+1;
Rnames{i} = 'O + OH = O2 + H';
k(:,i) = GCARR_ac(T, 1.80E-11, 180.0);
Gstr{i,1} = 'O'; Gstr{i,2} = 'OH'; 
fO(i)=fO(i)-1; fOH(i)=fOH(i)-1; fH(i)=fH(i)+1; 

i=i+1;
Rnames{i} = 'HO2 + O = OH + O2';
k(:,i) = GCARR_ac(T, 3.00E-11, 200.0);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'O'; 
fHO2(i)=fHO2(i)-1; fO(i)=fO(i)-1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'O1D + O3 = 2.000O2';
k(:,i) = 1.20E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'O3'; 
fO1D(i)=fO1D(i)-1; fO3(i)=fO3(i)-1; 

i=i+1;
Rnames{i} = 'O1D + O3 = 2.000O + O2';
k(:,i) = 1.20E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'O3'; 
fO1D(i)=fO1D(i)-1; fO3(i)=fO3(i)-1; fO(i)=fO(i)+2.000; 

i=i+1;
Rnames{i} = 'OCS + O = CO + SO2';
k(:,i) = GCARR_ac(T, 2.10E-11, -2200.0);
Gstr{i,1} = 'OCS'; Gstr{i,2} = 'O'; 
fOCS(i)=fOCS(i)-1; fO(i)=fO(i)-1; fCO(i)=fCO(i)+1; fSO2(i)=fSO2(i)+1; 

i=i+1;
Rnames{i} = 'OCS + OH = CO2 + SO2';
k(:,i) = GCARR_ac(T, 1.10E-13, -1200.0);
Gstr{i,1} = 'OCS'; Gstr{i,2} = 'OH'; 
fOCS(i)=fOCS(i)-1; fOH(i)=fOH(i)-1; fCO2(i)=fCO2(i)+1; fSO2(i)=fSO2(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + O = NO + O2';
k(:,i) = GCARR_ac(T, 5.10E-12, 210.0);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'O'; 
fNO2(i)=fNO2(i)-1; fO(i)=fO(i)-1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + O = NO2 + O2';
k(:,i) = 1.00E-11;
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'O'; 
fNO3(i)=fNO3(i)-1; fO(i)=fO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO + O {+M} = NO2 {+M}';
k(:,i) = GCJPLPR_aba(M, T, 9.00E-32, 1.5E+00, 3.0E-11, 0.6);
Gstr{i,1} = 'NO'; Gstr{i,2} = 'O'; 
fNO(i)=fNO(i)-1; fO(i)=fO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + O {+M} = NO3 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 2.50E-31, 1.8E+00, 2.2E-11, 0.7, 0.6);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'O'; 
fNO2(i)=fNO2(i)-1; fO(i)=fO(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'H2O2 + O = OH + HO2';
k(:,i) = GCARR_ac(T, 1.40E-12, -2000.0);
Gstr{i,1} = 'H2O2'; Gstr{i,2} = 'O'; 
fH2O2(i)=fH2O2(i)-1; fO(i)=fO(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'H + O2 {+M} = HO2 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 4.40E-32, 1.3E+00, 7.5E-11, -0.2, 0.6).*0.21.*M;
Gstr{i,1} = 'H'; 
fH(i)=fH(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'H + O3 = OH + O2';
k(:,i) = GCARR_ac(T, 1.40E-10, -470.0);
Gstr{i,1} = 'H'; Gstr{i,2} = 'O3'; 
fH(i)=fH(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'H + HO2 = 2.000OH';
k(:,i) = 7.20E-11;
Gstr{i,1} = 'H'; Gstr{i,2} = 'HO2'; 
fH(i)=fH(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+2.000; 

i=i+1;
Rnames{i} = 'H + HO2 = O + H2O';
k(:,i) = 1.60E-12;
Gstr{i,1} = 'H'; Gstr{i,2} = 'HO2'; 
fH(i)=fH(i)-1; fHO2(i)=fHO2(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'H + HO2 = H2 + O2';
k(:,i) = 6.90E-12;
Gstr{i,1} = 'H'; Gstr{i,2} = 'HO2'; 
fH(i)=fH(i)-1; fHO2(i)=fHO2(i)-1; fH2(i)=fH2(i)+1; 

i=i+1;
Rnames{i} = 'N + O2 = NO + O';
k(:,i) = GCARR_ac(T, 1.50E-11, -3600.0).*0.21.*M;
Gstr{i,1} = 'N'; 
fN(i)=fN(i)-1; fNO(i)=fNO(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'N + NO = N2 + O';
k(:,i) = GCARR_ac(T, 2.10E-11, 100.0);
Gstr{i,1} = 'N'; Gstr{i,2} = 'NO'; 
fN(i)=fN(i)-1; fNO(i)=fNO(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'N + NO2 = N2O + O';
k(:,i) = GCARR_ac(T, 5.80E-12, 220.0);
Gstr{i,1} = 'N'; Gstr{i,2} = 'NO2'; 
fN(i)=fN(i)-1; fNO2(i)=fNO2(i)-1; fN2O(i)=fN2O(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'BrO + O = Br + O2';
k(:,i) = GCARR_ac(T, 1.90E-11, 230.0);
Gstr{i,1} = 'BrO'; Gstr{i,2} = 'O'; 
fBrO(i)=fBrO(i)-1; fO(i)=fO(i)-1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'CH2O + O = CO + HO2 + OH';
k(:,i) = GCARR_ac(T, 3.40E-11, -1600.0);
Gstr{i,1} = 'CH2O'; Gstr{i,2} = 'O'; 
fCH2O(i)=fCH2O(i)-1; fO(i)=fO(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'O1D + HCl = 0.090O + 0.090HCl + 0.240H + 0.670Cl + 0.240ClO + 0.670OH';
k(:,i) = 1.50E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HCl'; 
fO1D(i)=fO1D(i)-1; fHCl(i)=fHCl(i)-1; fO(i)=fO(i)+0.090; fHCl(i)=fHCl(i)+0.090; fH(i)=fH(i)+0.240; fCl(i)=fCl(i)+0.670; fClO(i)=fClO(i)+0.240; fOH(i)=fOH(i)+0.670; 

i=i+1;
Rnames{i} = 'O1D + HBr = 0.200O + 0.200HBr + 0.150BrO + 0.650OH + 0.150H + 0.650Br';
k(:,i) = 1.50E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HBr'; 
fO1D(i)=fO1D(i)-1; fHBr(i)=fHBr(i)-1; fO(i)=fO(i)+0.200; fHBr(i)=fHBr(i)+0.200; fBrO(i)=fBrO(i)+0.150; fOH(i)=fOH(i)+0.650; fH(i)=fH(i)+0.150; fBr(i)=fBr(i)+0.650; 

i=i+1;
Rnames{i} = 'O1D + Cl2 = 0.250O + 0.250Cl2 + 0.750Cl + 0.750ClO';
k(:,i) = 2.70E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'Cl2'; 
fO1D(i)=fO1D(i)-1; fCl2(i)=fCl2(i)-1; fO(i)=fO(i)+0.250; fCl2(i)=fCl2(i)+0.250; fCl(i)=fCl(i)+0.750; fClO(i)=fClO(i)+0.750; 

i=i+1;
Rnames{i} = 'O1D + CCl4 = 0.140O + 0.140CCl4 + 0.860ClO + 2.580Cl';
k(:,i) = 3.30E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CCl4'; 
fO1D(i)=fO1D(i)-1; fCCl4(i)=fCCl4(i)-1; fO(i)=fO(i)+0.140; fCCl4(i)=fCCl4(i)+0.140; fClO(i)=fClO(i)+0.860; fCl(i)=fCl(i)+2.580; 

i=i+1;
Rnames{i} = 'O1D + CH3Br = 0.440BrO + MO2 + 0.560Br';
k(:,i) = 1.80E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CH3Br'; 
fO1D(i)=fO1D(i)-1; fCH3Br(i)=fCH3Br(i)-1; fBrO(i)=fBrO(i)+0.440; fMO2(i)=fMO2(i)+1; fBr(i)=fBr(i)+0.560; 

i=i+1;
Rnames{i} = 'O1D + CH2Br2 = 0.050O + 0.050CH2Br2 + 0.950BrO + 0.950Br';
k(:,i) = 2.70E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CH2Br2'; 
fO1D(i)=fO1D(i)-1; fCH2Br2(i)=fCH2Br2(i)-1; fO(i)=fO(i)+0.050; fCH2Br2(i)=fCH2Br2(i)+0.050; fBrO(i)=fBrO(i)+0.950; fBr(i)=fBr(i)+0.950; 

i=i+1;
Rnames{i} = 'O1D + CHBr3 = 0.320O + 0.320CHBr3 + 0.680BrO + 1.360Br';
k(:,i) = 6.60E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CHBr3'; 
fO1D(i)=fO1D(i)-1; fCHBr3(i)=fCHBr3(i)-1; fO(i)=fO(i)+0.320; fCHBr3(i)=fCHBr3(i)+0.320; fBrO(i)=fBrO(i)+0.680; fBr(i)=fBr(i)+1.360; 

i=i+1;
Rnames{i} = 'O1D + HCFC22 = 0.280O + 0.280HCFC22 + 0.550ClO + 0.170Cl';
k(:,i) = 1.02E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HCFC22'; 
fO1D(i)=fO1D(i)-1; fHCFC22(i)=fHCFC22(i)-1; fO(i)=fO(i)+0.280; fHCFC22(i)=fHCFC22(i)+0.280; fClO(i)=fClO(i)+0.550; fCl(i)=fCl(i)+0.170; 

i=i+1;
Rnames{i} = 'O1D + CFC11 = 0.120O + 0.120CFC11 + 0.880ClO + 1.760Cl';
k(:,i) = 2.30E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CFC11'; 
fO1D(i)=fO1D(i)-1; fCFC11(i)=fCFC11(i)-1; fO(i)=fO(i)+0.120; fCFC11(i)=fCFC11(i)+0.120; fClO(i)=fClO(i)+0.880; fCl(i)=fCl(i)+1.760; 

i=i+1;
Rnames{i} = 'O1D + CFC12 = 0.140O + 0.140CFC12 + 0.860ClO + 0.860Cl';
k(:,i) = 1.40E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CFC12'; 
fO1D(i)=fO1D(i)-1; fCFC12(i)=fCFC12(i)-1; fO(i)=fO(i)+0.140; fCFC12(i)=fCFC12(i)+0.140; fClO(i)=fClO(i)+0.860; fCl(i)=fCl(i)+0.860; 

i=i+1;
Rnames{i} = 'O1D + H1211 = 0.360O + 0.360H1211 + 0.310BrO + 0.310Cl + 0.330Br + 0.330ClO';
k(:,i) = 1.50E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'H1211'; 
fO1D(i)=fO1D(i)-1; fH1211(i)=fH1211(i)-1; fO(i)=fO(i)+0.360; fH1211(i)=fH1211(i)+0.360; fBrO(i)=fBrO(i)+0.310; fCl(i)=fCl(i)+0.310; fBr(i)=fBr(i)+0.330; fClO(i)=fClO(i)+0.330; 

i=i+1;
Rnames{i} = 'O1D + H1301 = 0.590O + 0.590H1301 + 0.410BrO';
k(:,i) = 1.00E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'H1301'; 
fO1D(i)=fO1D(i)-1; fH1301(i)=fH1301(i)-1; fO(i)=fO(i)+0.590; fH1301(i)=fH1301(i)+0.590; fBrO(i)=fBrO(i)+0.410; 

i=i+1;
Rnames{i} = 'O1D + HCFC141b = 0.310O + 0.310HCFC141b + 0.690ClO + 0.690Cl';
k(:,i) = 2.60E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HCFC141b'; 
fO1D(i)=fO1D(i)-1; fHCFC141b(i)=fHCFC141b(i)-1; fO(i)=fO(i)+0.310; fHCFC141b(i)=fHCFC141b(i)+0.310; fClO(i)=fClO(i)+0.690; fCl(i)=fCl(i)+0.690; 

i=i+1;
Rnames{i} = 'O1D + HCFC142b = 0.260O + 0.260HCFC142b + 0.740ClO';
k(:,i) = 2.00E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HCFC142b'; 
fO1D(i)=fO1D(i)-1; fHCFC142b(i)=fHCFC142b(i)-1; fO(i)=fO(i)+0.260; fHCFC142b(i)=fHCFC142b(i)+0.260; fClO(i)=fClO(i)+0.740; 

i=i+1;
Rnames{i} = 'O1D + HCFC123 = 0.210O + 0.210HCFC123 + 0.790Cl + 0.790ClO';
k(:,i) = 2.00E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'HCFC123'; 
fO1D(i)=fO1D(i)-1; fHCFC123(i)=fHCFC123(i)-1; fO(i)=fO(i)+0.210; fHCFC123(i)=fHCFC123(i)+0.210; fCl(i)=fCl(i)+0.790; fClO(i)=fClO(i)+0.790; 

i=i+1;
Rnames{i} = 'O1D + CFC113 = 0.250O + 0.250CFC113 + 1.500Cl + 0.750ClO';
k(:,i) = 2.32E-10;
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CFC113'; 
fO1D(i)=fO1D(i)-1; fCFC113(i)=fCFC113(i)-1; fO(i)=fO(i)+0.250; fCFC113(i)=fCFC113(i)+0.250; fCl(i)=fCl(i)+1.500; fClO(i)=fClO(i)+0.750; 

i=i+1;
Rnames{i} = 'O1D + CFC114 = 0.250O + 0.250CFC114 + 0.750Cl + 0.750ClO';
k(:,i) = GCARR_ac(T, 1.30E-10, -25.0);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CFC114'; 
fO1D(i)=fO1D(i)-1; fCFC114(i)=fCFC114(i)-1; fO(i)=fO(i)+0.250; fCFC114(i)=fCFC114(i)+0.250; fCl(i)=fCl(i)+0.750; fClO(i)=fClO(i)+0.750; 

i=i+1;
Rnames{i} = 'O1D + CFC115 = 0.700O + 0.700CFC115 + 0.300ClO';
k(:,i) = GCARR_ac(T, 5.40E-11, -30.0);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'CFC115'; 
fO1D(i)=fO1D(i)-1; fCFC115(i)=fCFC115(i)-1; fO(i)=fO(i)+0.700; fCFC115(i)=fCFC115(i)+0.700; fClO(i)=fClO(i)+0.300; 

i=i+1;
Rnames{i} = 'O1D + H2402 = 0.250O + 0.250H2402 + 0.750Br + 0.750BrO';
k(:,i) = GCARR_ac(T, 1.60E-10, 0.0);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'H2402'; 
fO1D(i)=fO1D(i)-1; fH2402(i)=fH2402(i)-1; fO(i)=fO(i)+0.250; fH2402(i)=fH2402(i)+0.250; fBr(i)=fBr(i)+0.750; fBrO(i)=fBrO(i)+0.750; 

i=i+1;
Rnames{i} = 'OH + Cl2 = HOCl + Cl';
k(:,i) = GCARR_ac(T, 2.60E-12, -1100.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'Cl2'; 
fOH(i)=fOH(i)-1; fCl2(i)=fCl2(i)-1; fHOCl(i)=fHOCl(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'MO2 + ClO = ClOO + HO2 + CH2O';
k(:,i) = GCARR_ac(T, 1.80E-11, -600.0);
Gstr{i,1} = 'MO2'; Gstr{i,2} = 'ClO'; 
fMO2(i)=fMO2(i)-1; fClO(i)=fClO(i)-1; fClOO(i)=fClOO(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'OH + ClO = HO2 + Cl';
k(:,i) = GCARR_ac(T, 7.40E-12, 270.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClO'; 
fOH(i)=fOH(i)-1; fClO(i)=fClO(i)-1; fHO2(i)=fHO2(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + ClO = HCl + O2';
k(:,i) = GCARR_ac(T, 6.00E-13, 230.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClO'; 
fOH(i)=fOH(i)-1; fClO(i)=fClO(i)-1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + OClO = HOCl + O2';
k(:,i) = GCARR_ac(T, 1.40E-12, 600.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'OClO'; 
fOH(i)=fOH(i)-1; fOClO(i)=fOClO(i)-1; fHOCl(i)=fHOCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + Cl2O2 = HOCl + ClOO';
k(:,i) = GCARR_ac(T, 6.00E-13, 670.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'Cl2O2'; 
fOH(i)=fOH(i)-1; fCl2O2(i)=fCl2O2(i)-1; fHOCl(i)=fHOCl(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'OH + HCl = H2O + Cl';
k(:,i) = GCARR_ac(T, 1.80E-12, -250.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCl'; 
fOH(i)=fOH(i)-1; fHCl(i)=fHCl(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + HOCl = H2O + ClO';
k(:,i) = GCARR_ac(T, 3.00E-12, -500.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HOCl'; 
fOH(i)=fOH(i)-1; fHOCl(i)=fHOCl(i)-1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'OH + ClNO2 = HOCl + NO2';
k(:,i) = GCARR_ac(T, 2.40E-12, -1250.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClNO2'; 
fOH(i)=fOH(i)-1; fClNO2(i)=fClNO2(i)-1; fHOCl(i)=fHOCl(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + ClNO3 = HOCl + NO3';
k(:,i) = GCARR_ac(T, 1.20E-12, -330.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'ClNO3'; 
fOH(i)=fOH(i)-1; fClNO3(i)=fClNO3(i)-1; fHOCl(i)=fHOCl(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'OH + CH3Cl = Cl + HO2 + H2O';
k(:,i) = GCARR_ac(T, 1.96E-12, -1200.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CH3Cl'; 
fOH(i)=fOH(i)-1; fCH3Cl(i)=fCH3Cl(i)-1; fCl(i)=fCl(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CH2Cl2 = 2.000Cl + HO2';
k(:,i) = GCARR_ac(T, 2.61E-12, -944.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CH2Cl2'; 
fOH(i)=fOH(i)-1; fCH2Cl2(i)=fCH2Cl2(i)-1; fCl(i)=fCl(i)+2.000; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CHCl3 = 3.000Cl + HO2';
k(:,i) = GCARR_ac(T, 4.69E-12, -1134.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CHCl3'; 
fOH(i)=fOH(i)-1; fCHCl3(i)=fCHCl3(i)-1; fCl(i)=fCl(i)+3.000; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CH3CCl3 = 3.000Cl + H2O';
k(:,i) = GCARR_ac(T, 1.64E-12, -1520.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CH3CCl3'; 
fOH(i)=fOH(i)-1; fCH3CCl3(i)=fCH3CCl3(i)-1; fCl(i)=fCl(i)+3.000; 

i=i+1;
Rnames{i} = 'OH + HCFC22 = Cl + H2O';
k(:,i) = GCARR_ac(T, 9.20E-13, -1560.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCFC22'; 
fOH(i)=fOH(i)-1; fHCFC22(i)=fHCFC22(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + HCFC141b = 2.000Cl + H2O';
k(:,i) = GCARR_ac(T, 1.25E-12, -1600.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCFC141b'; 
fOH(i)=fOH(i)-1; fHCFC141b(i)=fHCFC141b(i)-1; fCl(i)=fCl(i)+2.000; 

i=i+1;
Rnames{i} = 'OH + HCFC142b = Cl + H2O';
k(:,i) = GCARR_ac(T, 1.30E-12, -1770.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCFC142b'; 
fOH(i)=fOH(i)-1; fHCFC142b(i)=fHCFC142b(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'OH + HCFC123 = 2.000Cl + H2O';
k(:,i) = GCARR_ac(T, 7.40E-13, -900.0);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCFC123'; 
fOH(i)=fOH(i)-1; fHCFC123(i)=fHCFC123(i)-1; fCl(i)=fCl(i)+2.000; 

i=i+1;
Rnames{i} = 'CH4 + Cl = HCl + MO2';
k(:,i) = GCARR_ac(T, 7.10E-12, -1270.0);
Gstr{i,1} = 'CH4'; Gstr{i,2} = 'Cl'; 
fCH4(i)=fCH4(i)-1; fCl(i)=fCl(i)-1; fHCl(i)=fHCl(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'CH2O + Cl = CO + HCl + HO2';
k(:,i) = GCARR_ac(T, 7.32E-11, -30.0);
Gstr{i,1} = 'CH2O'; Gstr{i,2} = 'Cl'; 
fCH2O(i)=fCH2O(i)-1; fCl(i)=fCl(i)-1; fCO(i)=fCO(i)+1; fHCl(i)=fHCl(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + O3 = ClO + O2';
k(:,i) = GCARR_ac(T, 2.30E-11, -200.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'O3'; 
fCl(i)=fCl(i)-1; fO3(i)=fO3(i)-1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'Cl + H2 = H + HCl';
k(:,i) = GCARR_ac(T, 3.05E-11, -2270.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'H2'; 
fCl(i)=fCl(i)-1; fH2(i)=fH2(i)-1; fH(i)=fH(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'Cl + H2O2 = HO2 + HCl';
k(:,i) = GCARR_ac(T, 1.10E-11, -980.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'H2O2'; 
fCl(i)=fCl(i)-1; fH2O2(i)=fH2O2(i)-1; fHO2(i)=fHO2(i)+1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'Cl + HO2 = O2 + HCl';
k(:,i) = GCARR_ac(T, 1.40E-11, 270.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HO2'; 
fCl(i)=fCl(i)-1; fHO2(i)=fHO2(i)-1; fHCl(i)=fHCl(i)+1; 

i=i+1;
Rnames{i} = 'Cl + HO2 = OH + ClO';
k(:,i) = GCARR_ac(T, 3.60E-11, -375.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HO2'; 
fCl(i)=fCl(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fClO(i)=fClO(i)+1; 

i=i+1;
Rnames{i} = 'ClO + O = Cl + O2';
k(:,i) = GCARR_ac(T, 2.80E-11, 85.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'O'; 
fClO(i)=fClO(i)-1; fO(i)=fO(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'ClO + HO2 = O2 + HOCl';
k(:,i) = GCARR_ac(T, 2.60E-12, 290.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'HO2'; 
fClO(i)=fClO(i)-1; fHO2(i)=fHO2(i)-1; fHOCl(i)=fHOCl(i)+1; 

i=i+1;
Rnames{i} = 'ClO + NO = Cl + NO2';
k(:,i) = GCARR_ac(T, 6.40E-12, 290.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'NO'; 
fClO(i)=fClO(i)-1; fNO(i)=fNO(i)-1; fCl(i)=fCl(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClO + NO2 {+M} = ClNO3 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 1.80E-31, 3.4E+00, 1.50E-11, 1.9, 0.6);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'NO2'; 
fClO(i)=fClO(i)-1; fNO2(i)=fNO2(i)-1; fClNO3(i)=fClNO3(i)+1; 

i=i+1;
Rnames{i} = 'ClO + ClO = Cl2 + O2';
k(:,i) = GCARR_ac(T, 1.00E-12, -1590.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO'; 
fClO(i)=fClO(i)-1; fClO(i)=fClO(i)-1; fCl2(i)=fCl2(i)+1; 

i=i+1;
Rnames{i} = 'ClO + ClO = Cl + ClOO';
k(:,i) = GCARR_ac(T, 3.00E-11, -2450.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO'; 
fClO(i)=fClO(i)-1; fClO(i)=fClO(i)-1; fCl(i)=fCl(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClO + ClO = OClO + Cl';
k(:,i) = GCARR_ac(T, 3.50E-13, -1370.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO'; 
fClO(i)=fClO(i)-1; fClO(i)=fClO(i)-1; fOClO(i)=fOClO(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'Cl + O2 {+M} = ClOO {+M}';
k(:,i) = GCJPLPR_aba(M, T, 2.20E-33, 3.1E+00, 1.8E-10, 0.6).*0.21.*M;
Gstr{i,1} = 'Cl'; 
fCl(i)=fCl(i)-1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClOO {+M} = Cl + O2 {+M}';
k(:,i) = GCJPLEQ_acabab(M,T, 6.60E-25, 2502.0, 2.20E-33, 3.1E+00, 1.8E-10, 0.0, 0.6);
Gstr{i,1} = 'ClOO'; 
fClOO(i)=fClOO(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'ClO + ClO {+M} = Cl2O2 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 1.90E-32, 3.6E+00, 3.7E-12, 1.6, 0.6);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'ClO'; 
fClO(i)=fClO(i)-1; fClO(i)=fClO(i)-1; fCl2O2(i)=fCl2O2(i)+1; 

i=i+1;
Rnames{i} = 'Cl2O2 {+M} = 2.000ClO {+M}';
k(:,i) = GCJPLEQ_acabab(M,T, 2.16E-27, 8537.0, 1.90E-32, 3.6E+00, 3.7E-12, 1.6, 0.6);
Gstr{i,1} = 'Cl2O2'; 
fCl2O2(i)=fCl2O2(i)-1; fClO(i)=fClO(i)+2.000; 

i=i+1;
Rnames{i} = 'ClOO + Cl = Cl2 + O2';
k(:,i) = 2.30E-10;
Gstr{i,1} = 'ClOO'; Gstr{i,2} = 'Cl'; 
fClOO(i)=fClOO(i)-1; fCl(i)=fCl(i)-1; fCl2(i)=fCl2(i)+1; 

i=i+1;
Rnames{i} = 'ClOO + Cl = 2.000ClO';
k(:,i) = 1.20E-11;
Gstr{i,1} = 'ClOO'; Gstr{i,2} = 'Cl'; 
fClOO(i)=fClOO(i)-1; fCl(i)=fCl(i)-1; fClO(i)=fClO(i)+2.000; 

i=i+1;
Rnames{i} = 'ClO + BrO = Br + OClO';
k(:,i) = GCARR_ac(T, 9.50E-13, 550.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'BrO'; 
fClO(i)=fClO(i)-1; fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+1; fOClO(i)=fOClO(i)+1; 

i=i+1;
Rnames{i} = 'ClO + BrO = Br + ClOO';
k(:,i) = GCARR_ac(T, 2.30E-12, 260.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'BrO'; 
fClO(i)=fClO(i)-1; fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClO + BrO = BrCl + O2';
k(:,i) = GCARR_ac(T, 4.10E-13, 290.0);
Gstr{i,1} = 'ClO'; Gstr{i,2} = 'BrO'; 
fClO(i)=fClO(i)-1; fBrO(i)=fBrO(i)-1; fBrCl(i)=fBrCl(i)+1; 

i=i+1;
Rnames{i} = 'ClNO3 + O = ClO + NO3';
k(:,i) = GCARR_ac(T, 3.60E-12, -840.0);
Gstr{i,1} = 'ClNO3'; Gstr{i,2} = 'O'; 
fClNO3(i)=fClNO3(i)-1; fO(i)=fO(i)-1; fClO(i)=fClO(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'ClNO3 + Cl = Cl2 + NO3';
k(:,i) = GCARR_ac(T, 6.50E-12, 135.0);
Gstr{i,1} = 'ClNO3'; Gstr{i,2} = 'Cl'; 
fClNO3(i)=fClNO3(i)-1; fCl(i)=fCl(i)-1; fCl2(i)=fCl2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'CH3Cl + Cl = CO + 2.000HCl + HO2';
k(:,i) = GCARR_ac(T, 2.17E-11, -1130.0);
Gstr{i,1} = 'CH3Cl'; Gstr{i,2} = 'Cl'; 
fCH3Cl(i)=fCH3Cl(i)-1; fCl(i)=fCl(i)-1; fCO(i)=fCO(i)+1; fHCl(i)=fHCl(i)+2.000; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'CH2Cl2 + Cl = CO + HCl + 2.000Cl + HO2';
k(:,i) = GCARR_ac(T, 1.24E-12, -1070.0);
Gstr{i,1} = 'CH2Cl2'; Gstr{i,2} = 'Cl'; 
fCH2Cl2(i)=fCH2Cl2(i)-1; fCl(i)=fCl(i)-1; fCO(i)=fCO(i)+1; fHCl(i)=fHCl(i)+1; fCl(i)=fCl(i)+2.000; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'CHCl3 + Cl = CO + HCl + 3.000Cl + HO2';
k(:,i) = GCARR_ac(T, 3.77E-12, -1011.0);
Gstr{i,1} = 'CHCl3'; Gstr{i,2} = 'Cl'; 
fCHCl3(i)=fCHCl3(i)-1; fCl(i)=fCl(i)-1; fCO(i)=fCO(i)+1; fHCl(i)=fHCl(i)+1; fCl(i)=fCl(i)+3.000; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + HCOOH = HCl + CO2 + H2O';
k(:,i) = 2.00E-13;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'HCOOH'; 
fCl(i)=fCl(i)-1; fHCOOH(i)=fHCOOH(i)-1; fHCl(i)=fHCl(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + MO2 = ClO + CH2O + HO2';
k(:,i) = 1.60E-10;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MO2'; 
fCl(i)=fCl(i)-1; fMO2(i)=fMO2(i)-1; fClO(i)=fClO(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + MP = HCl + MO2';
k(:,i) = 5.7E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MP'; 
fCl(i)=fCl(i)-1; fMP(i)=fMP(i)-1; fHCl(i)=fHCl(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + C2H6 = HCl + ETO2';
k(:,i) = GCARR_ac(T, 7.2E-11, -70.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C2H6'; 
fCl(i)=fCl(i)-1; fC2H6(i)=fC2H6(i)-1; fHCl(i)=fHCl(i)+1; fETO2(i)=fETO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + ETO2 = ClO + HO2 + ALD2';
k(:,i) = 7.4E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ETO2'; 
fCl(i)=fCl(i)-1; fETO2(i)=fETO2(i)-1; fClO(i)=fClO(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + OTHRO2 = ClO + HO2 + ALD2';
k(:,i) = 7.4E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'OTHRO2'; 
fCl(i)=fCl(i)-1; fOTHRO2(i)=fOTHRO2(i)-1; fClO(i)=fClO(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + MOH = HCl + CH2O + HO2';
k(:,i) = 5.5E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'MOH'; 
fCl(i)=fCl(i)-1; fMOH(i)=fMOH(i)-1; fHCl(i)=fHCl(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + EOH = HCl + ALD2';
k(:,i) = 9.6E-11;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'EOH'; 
fCl(i)=fCl(i)-1; fEOH(i)=fEOH(i)-1; fHCl(i)=fHCl(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + ACTA = HCl + MO2 + CO2';
k(:,i) = 2.8E-14;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ACTA'; 
fCl(i)=fCl(i)-1; fACTA(i)=fACTA(i)-1; fHCl(i)=fHCl(i)+1; fMO2(i)=fMO2(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + C3H8 = HCl + B3O2';
k(:,i) = GCARR_ac(T, 6.54E-11, 60.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H8'; 
fCl(i)=fCl(i)-1; fC3H8(i)=fC3H8(i)-1; fHCl(i)=fHCl(i)+1; fB3O2(i)=fB3O2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + C3H8 = HCl + A3O2';
k(:,i) = GCARR_ac(T, 8.12E-11, -90.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'C3H8'; 
fCl(i)=fCl(i)-1; fC3H8(i)=fC3H8(i)-1; fHCl(i)=fHCl(i)+1; fA3O2(i)=fA3O2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + ACET = HCl + ATO2';
k(:,i) = GCARR_ac(T, 7.70E-11, -1000.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ACET'; 
fCl(i)=fCl(i)-1; fACET(i)=fACET(i)-1; fHCl(i)=fHCl(i)+1; fATO2(i)=fATO2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + ISOP = HCl + 0.5IHOO1 + 0.5IHOO4';
k(:,i) = GCARR_ac(T, 7.60E-11, 500.0);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ISOP'; 
fCl(i)=fCl(i)-1; fISOP(i)=fISOP(i)-1; fHCl(i)=fHCl(i)+1; fIHOO1(i)=fIHOO1(i)+0.5; fIHOO4(i)=fIHOO4(i)+0.5; 

i=i+1;
Rnames{i} = 'Cl + ALK4 = HCl + R4O2';
k(:,i) = 2.05E-10;
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'ALK4'; 
fCl(i)=fCl(i)-1; fALK4(i)=fALK4(i)-1; fHCl(i)=fHCl(i)+1; fR4O2(i)=fR4O2(i)+1; 

i=i+1;
Rnames{i} = 'Cl + PRPE {+M} = HCl + PO2 {+M}';
k(:,i) = GCJPLPR_aa(M, 4.00E-28, 2.8E-10, 0.6);
Gstr{i,1} = 'Cl'; Gstr{i,2} = 'PRPE'; 
fCl(i)=fCl(i)-1; fPRPE(i)=fPRPE(i)-1; fHCl(i)=fHCl(i)+1; fPO2(i)=fPO2(i)+1; 

i=i+1;
Rnames{i} = 'Br + PRPE = HBr + PO2';
k(:,i) = 3.60E-12;
Gstr{i,1} = 'Br'; Gstr{i,2} = 'PRPE'; 
fBr(i)=fBr(i)-1; fPRPE(i)=fPRPE(i)-1; fHBr(i)=fHBr(i)+1; fPO2(i)=fPO2(i)+1; 

i=i+1;
Rnames{i} = 'I + NO {+M} = INO {+M}';
k(:,i) = GCJPLPR_aba(M, T, 1.80E-32, 1.0, 1.77E-11, 0.6);
Gstr{i,1} = 'I'; Gstr{i,2} = 'NO'; 
fI(i)=fI(i)-1; fNO(i)=fNO(i)-1; fINO(i)=fINO(i)+1; 

i=i+1;
Rnames{i} = 'INO + INO = I2 + 2.000NO';
k(:,i) = GCARR_ac(T, 8.40E-11, -2620.0);
Gstr{i,1} = 'INO'; Gstr{i,2} = 'INO'; 
fINO(i)=fINO(i)-1; fINO(i)=fINO(i)-1; fI2(i)=fI2(i)+1; fNO(i)=fNO(i)+2.000; 

i=i+1;
Rnames{i} = 'I + NO2 {+M} = IONO {+M}';
k(:,i) = GCJPLPR_aba(M, T, 3.00E-31, 1.0, 6.6E-11, 0.63);
Gstr{i,1} = 'I'; Gstr{i,2} = 'NO2'; 
fI(i)=fI(i)-1; fNO2(i)=fNO2(i)-1; fIONO(i)=fIONO(i)+1; 

i=i+1;
Rnames{i} = 'IONO {+M} = I + NO2 {+M}';
k(:,i) = GCARR_ac(T, 9.94E+17, -11859.0);
Gstr{i,1} = 'IONO'; 
fIONO(i)=fIONO(i)-1; fI(i)=fI(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IONO + IONO = I2 + 2.000NO2';
k(:,i) = GCARR_ac(T, 2.90E-11, -2600.0);
Gstr{i,1} = 'IONO'; Gstr{i,2} = 'IONO'; 
fIONO(i)=fIONO(i)-1; fIONO(i)=fIONO(i)-1; fI2(i)=fI2(i)+1; fNO2(i)=fNO2(i)+2.000; 

i=i+1;
Rnames{i} = 'I2 + NO3 = I + IONO2';
k(:,i) = 1.50E-12;
Gstr{i,1} = 'I2'; Gstr{i,2} = 'NO3'; 
fI2(i)=fI2(i)-1; fNO3(i)=fNO3(i)-1; fI(i)=fI(i)+1; fIONO2(i)=fIONO2(i)+1; 

i=i+1;
Rnames{i} = 'IO + NO2 {+M} = IONO2 {+M}';
k(:,i) = GCJPLPR_abab(M, T, 7.50E-31, 3.5, 7.6E-12, 1.5, 0.6);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'NO2'; 
fIO(i)=fIO(i)-1; fNO2(i)=fNO2(i)-1; fIONO2(i)=fIONO2(i)+1; 

i=i+1;
Rnames{i} = 'IONO2 {+M} = IO + NO2 {+M}';
k(:,i) = GCARR_ac(T, 2.10E+15, -13670.0);
Gstr{i,1} = 'IONO2'; 
fIONO2(i)=fIONO2(i)-1; fIO(i)=fIO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IONO2 + I = I2 + NO3';
k(:,i) = GCARR_ac(T, 9.10E-11, -146.0);
Gstr{i,1} = 'IONO2'; Gstr{i,2} = 'I'; 
fIONO2(i)=fIONO2(i)-1; fI(i)=fI(i)-1; fI2(i)=fI2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'I + BrO = IO + Br';
k(:,i) = 1.20E-11;
Gstr{i,1} = 'I'; Gstr{i,2} = 'BrO'; 
fI(i)=fI(i)-1; fBrO(i)=fBrO(i)-1; fIO(i)=fIO(i)+1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'IO + BrO = Br + I + O2';
k(:,i) = GCARR_ac(T, 3.00E-12, 510.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'BrO'; 
fIO(i)=fIO(i)-1; fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+1; fI(i)=fI(i)+1; 

i=i+1;
Rnames{i} = 'IO + BrO = Br + OIO';
k(:,i) = GCARR_ac(T, 1.20E-11, 510.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'BrO'; 
fIO(i)=fIO(i)-1; fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+1; fOIO(i)=fOIO(i)+1; 

i=i+1;
Rnames{i} = 'IO + OIO {+M} = I2O3 {+M}';
k(:,i) = 1.00E-10;
Gstr{i,1} = 'IO'; Gstr{i,2} = 'OIO'; 
fIO(i)=fIO(i)-1; fOIO(i)=fOIO(i)-1; fI2O3(i)=fI2O3(i)+1; 

i=i+1;
Rnames{i} = 'OIO + OIO = I2O4';
k(:,i) = 1.50E-10;
Gstr{i,1} = 'OIO'; Gstr{i,2} = 'OIO'; 
fOIO(i)=fOIO(i)-1; fOIO(i)=fOIO(i)-1; fI2O4(i)=fI2O4(i)+1; 

i=i+1;
Rnames{i} = 'I2O4 {+M} = 2.000OIO {+M}';
k(:,i) = 3.80E-02;
Gstr{i,1} = 'I2O4'; 
fI2O4(i)=fI2O4(i)-1; fOIO(i)=fOIO(i)+2.000; 

i=i+1;
Rnames{i} = 'OIO + NO = IO + NO2';
k(:,i) = GCARR_ac(T, 1.10E-12, 542.0);
Gstr{i,1} = 'OIO'; Gstr{i,2} = 'NO'; 
fOIO(i)=fOIO(i)-1; fNO(i)=fNO(i)-1; fIO(i)=fIO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IO + ClO = I + OClO';
k(:,i) = GCARR_ac(T, 5.10E-12, 280.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'ClO'; 
fIO(i)=fIO(i)-1; fClO(i)=fClO(i)-1; fI(i)=fI(i)+1; fOClO(i)=fOClO(i)+1; 

i=i+1;
Rnames{i} = 'IO + ClO = I + Cl + O2';
k(:,i) = GCARR_ac(T, 2.81E-12, 280.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'ClO'; 
fIO(i)=fIO(i)-1; fClO(i)=fClO(i)-1; fI(i)=fI(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'IO + ClO = ICl + O2';
k(:,i) = GCARR_ac(T, 1.02E-12, 280.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'ClO'; 
fIO(i)=fIO(i)-1; fClO(i)=fClO(i)-1; fICl(i)=fICl(i)+1; 

i=i+1;
Rnames{i} = 'I + O3 = IO + O2';
k(:,i) = GCARR_ac(T, 2.30E-11, -870.0);
Gstr{i,1} = 'I'; Gstr{i,2} = 'O3'; 
fI(i)=fI(i)-1; fO3(i)=fO3(i)-1; fIO(i)=fIO(i)+1; 

i=i+1;
Rnames{i} = 'I + HO2 = HI + O2';
k(:,i) = GCARR_ac(T, 1.50E-11, -1090.0);
Gstr{i,1} = 'I'; Gstr{i,2} = 'HO2'; 
fI(i)=fI(i)-1; fHO2(i)=fHO2(i)-1; fHI(i)=fHI(i)+1; 

i=i+1;
Rnames{i} = 'I2 + OH = HOI + I';
k(:,i) = 1.80E-10;
Gstr{i,1} = 'I2'; Gstr{i,2} = 'OH'; 
fI2(i)=fI2(i)-1; fOH(i)=fOH(i)-1; fHOI(i)=fHOI(i)+1; fI(i)=fI(i)+1; 

i=i+1;
Rnames{i} = 'HI + OH = I + H2O';
k(:,i) = 3.00E-11;
Gstr{i,1} = 'HI'; Gstr{i,2} = 'OH'; 
fHI(i)=fHI(i)-1; fOH(i)=fOH(i)-1; fI(i)=fI(i)+1; 

i=i+1;
Rnames{i} = 'HOI + OH = IO + H2O';
k(:,i) = 5.00E-12;
Gstr{i,1} = 'HOI'; Gstr{i,2} = 'OH'; 
fHOI(i)=fHOI(i)-1; fOH(i)=fOH(i)-1; fIO(i)=fIO(i)+1; 

i=i+1;
Rnames{i} = 'IO + HO2 = HOI + O2';
k(:,i) = GCARR_ac(T, 1.30E-11, 570.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'HO2'; 
fIO(i)=fIO(i)-1; fHO2(i)=fHO2(i)-1; fHOI(i)=fHOI(i)+1; 

i=i+1;
Rnames{i} = 'IO + NO = I + NO2';
k(:,i) = GCARR_ac(T, 9.10E-12, 240.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'NO'; 
fIO(i)=fIO(i)-1; fNO(i)=fNO(i)-1; fI(i)=fI(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IO + IO = I + OIO';
k(:,i) = GCARR_ac(T, 6.00E-12, 500.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'IO'; 
fIO(i)=fIO(i)-1; fIO(i)=fIO(i)-1; fI(i)=fI(i)+1; fOIO(i)=fOIO(i)+1; 

i=i+1;
Rnames{i} = 'IO + IO {+M} = I2O2 {+M}';
k(:,i) = GCARR_ac(T, 9.00E-12, 500.0);
Gstr{i,1} = 'IO'; Gstr{i,2} = 'IO'; 
fIO(i)=fIO(i)-1; fIO(i)=fIO(i)-1; fI2O2(i)=fI2O2(i)+1; 

i=i+1;
Rnames{i} = 'I2O2 {+M} = 2.000IO {+M}';
k(:,i) = GCARR_ac(T, 1.00E+12, -9770.0);
Gstr{i,1} = 'I2O2'; 
fI2O2(i)=fI2O2(i)-1; fIO(i)=fIO(i)+2.000; 

i=i+1;
Rnames{i} = 'I2O2 {+M} = OIO + I {+M}';
k(:,i) = GCARR_ac(T, 2.50E+14, -9770.0);
Gstr{i,1} = 'I2O2'; 
fI2O2(i)=fI2O2(i)-1; fOIO(i)=fOIO(i)+1; fI(i)=fI(i)+1; 

i=i+1;
Rnames{i} = 'CH3I + OH = H2O + I + MO2';
k(:,i) = GCARR_ac(T, 2.90E-12, -1100.0);
Gstr{i,1} = 'CH3I'; Gstr{i,2} = 'OH'; 
fCH3I(i)=fCH3I(i)-1; fOH(i)=fOH(i)-1; fI(i)=fI(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'ETHLN + OH = CH2O + CO2 + NO2';
k(:,i) = 2.40E-12;
Gstr{i,1} = 'ETHLN'; Gstr{i,2} = 'OH'; 
fETHLN(i)=fETHLN(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+1; fCO2(i)=fCO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'PROPNN + OH = NO2 + MGLY';
k(:,i) = 6.70E-13;
Gstr{i,1} = 'PROPNN'; Gstr{i,2} = 'OH'; 
fPROPNN(i)=fPROPNN(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; fMGLY(i)=fMGLY(i)+1; 

i=i+1;
Rnames{i} = 'CH2OO + CO = CH2O';
k(:,i) = 1.20E-15;
Gstr{i,1} = 'CH2OO'; Gstr{i,2} = 'CO'; 
fCH2OO(i)=fCH2OO(i)-1; fCO(i)=fCO(i)-1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'CH2OO + NO = CH2O + NO2';
k(:,i) = 1.00E-14;
Gstr{i,1} = 'CH2OO'; Gstr{i,2} = 'NO'; 
fCH2OO(i)=fCH2OO(i)-1; fNO(i)=fNO(i)-1; fCH2O(i)=fCH2O(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'CH2OO + NO2 = CH2O + NO3';
k(:,i) = 1.00E-15;
Gstr{i,1} = 'CH2OO'; Gstr{i,2} = 'NO2'; 
fCH2OO(i)=fCH2OO(i)-1; fNO2(i)=fNO2(i)-1; fCH2O(i)=fCH2O(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'CH2OO + H2O = 0.730HMHP + 0.210HCOOH + 0.060CH2O + 0.060H2O2';
k(:,i) = 1.70E-15.*H2O;
Gstr{i,1} = 'CH2OO'; 
fCH2OO(i)=fCH2OO(i)-1; fHMHP(i)=fHMHP(i)+0.730; fHCOOH(i)=fHCOOH(i)+0.210; fCH2O(i)=fCH2O(i)+0.060; fH2O2(i)=fH2O2(i)+0.060; 

i=i+1;
Rnames{i} = 'CH2OO + H2O + H2O = 0.400HMHP + 0.540HCOOH + 0.060CH2O + 0.060H2O2';
k(:,i) = GCARR_ac(T, 2.88E-35, 1391.0).*H2O.*H2O;
Gstr{i,1} = 'CH2OO'; 
fCH2OO(i)=fCH2OO(i)-1; fHMHP(i)=fHMHP(i)+0.400; fHCOOH(i)=fHCOOH(i)+0.540; fCH2O(i)=fCH2O(i)+0.060; fH2O2(i)=fH2O2(i)+0.060; 

i=i+1;
Rnames{i} = 'CH2OO + O3 = CH2O';
k(:,i) = 1.40E-12;
Gstr{i,1} = 'CH2OO'; Gstr{i,2} = 'O3'; 
fCH2OO(i)=fCH2OO(i)-1; fO3(i)=fO3(i)-1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'CH2OO + SO2 = CH2O + SO4';
k(:,i) = 3.70E-11;
Gstr{i,1} = 'CH2OO'; Gstr{i,2} = 'SO2'; 
fCH2OO(i)=fCH2OO(i)-1; fSO2(i)=fSO2(i)-1; fCH2O(i)=fCH2O(i)+1; fSO4(i)=fSO4(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + CO = ALD2';
k(:,i) = 1.20E-15;
Gstr{i,1} = 'CH3CHOO'; Gstr{i,2} = 'CO'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fCO(i)=fCO(i)-1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + NO = ALD2 + NO2';
k(:,i) = 1.00E-14;
Gstr{i,1} = 'CH3CHOO'; Gstr{i,2} = 'NO'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fNO(i)=fNO(i)-1; fALD2(i)=fALD2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + NO2 = ALD2 + NO3';
k(:,i) = 1.00E-15;
Gstr{i,1} = 'CH3CHOO'; Gstr{i,2} = 'NO2'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fNO2(i)=fNO2(i)-1; fALD2(i)=fALD2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + SO2 = ALD2 + SO4';
k(:,i) = 7.00E-14;
Gstr{i,1} = 'CH3CHOO'; Gstr{i,2} = 'SO2'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fSO2(i)=fSO2(i)-1; fALD2(i)=fALD2(i)+1; fSO4(i)=fSO4(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + H2O = ALD2 + H2O2';
k(:,i) = 6.00E-18.*H2O;
Gstr{i,1} = 'CH3CHOO'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fALD2(i)=fALD2(i)+1; fH2O2(i)=fH2O2(i)+1; 

i=i+1;
Rnames{i} = 'CH3CHOO + H2O = ACTA';
k(:,i) = 1.00E-17.*H2O;
Gstr{i,1} = 'CH3CHOO'; 
fCH3CHOO(i)=fCH3CHOO(i)-1; fACTA(i)=fACTA(i)+1; 

i=i+1;
Rnames{i} = 'MTPA + OH = PIO2';
k(:,i) = GCARR_ac(T, 1.21E-11, 440.0);
Gstr{i,1} = 'MTPA'; Gstr{i,2} = 'OH'; 
fMTPA(i)=fMTPA(i)-1; fOH(i)=fOH(i)-1; fPIO2(i)=fPIO2(i)+1; 

i=i+1;
Rnames{i} = 'MTPO + OH = PIO2';
k(:,i) = GCARR_ac(T, 1.21E-11, 440.0);
Gstr{i,1} = 'MTPO'; Gstr{i,2} = 'OH'; 
fMTPO(i)=fMTPO(i)-1; fOH(i)=fOH(i)-1; fPIO2(i)=fPIO2(i)+1; 

i=i+1;
Rnames{i} = 'PIO2 + NO = 0.820HO2 + 0.820NO2 + 0.230CH2O + 0.430RCHO + 0.110ACET + 0.440MEK + 0.070HCOOH + 0.120MONITS + 0.060MONITU';
k(:,i) = 4.00E-12;
Gstr{i,1} = 'PIO2'; Gstr{i,2} = 'NO'; 
fPIO2(i)=fPIO2(i)-1; fNO(i)=fNO(i)-1; fHO2(i)=fHO2(i)+0.820; fNO2(i)=fNO2(i)+0.820; fCH2O(i)=fCH2O(i)+0.230; fRCHO(i)=fRCHO(i)+0.430; fACET(i)=fACET(i)+0.110; fMEK(i)=fMEK(i)+0.440; fHCOOH(i)=fHCOOH(i)+0.070; fMONITS(i)=fMONITS(i)+0.120; fMONITU(i)=fMONITU(i)+0.060; 

i=i+1;
Rnames{i} = 'PIO2 + HO2 = PIP';
k(:,i) = 1.50E-11;
Gstr{i,1} = 'PIO2'; Gstr{i,2} = 'HO2'; 
fPIO2(i)=fPIO2(i)-1; fHO2(i)=fHO2(i)-1; fPIP(i)=fPIP(i)+1; 

i=i+1;
Rnames{i} = 'PIO2 + MO2 = HO2 + 0.750CH2O + 0.250MOH + 0.250ROH + 0.750RCHO + 0.750MEK';
k(:,i) = GCARR_ac(T, 3.56E-14, 708.0);
Gstr{i,1} = 'PIO2'; Gstr{i,2} = 'MO2'; 
fPIO2(i)=fPIO2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+0.750; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fRCHO(i)=fRCHO(i)+0.750; fMEK(i)=fMEK(i)+0.750; 

i=i+1;
Rnames{i} = 'PIO2 + MCO3 = 0.500HO2 + 0.500MO2 + RCHO + MEK + RCOOH';
k(:,i) = GCARR_ac(T, 7.40E-13, 765.0);
Gstr{i,1} = 'PIO2'; Gstr{i,2} = 'MCO3'; 
fPIO2(i)=fPIO2(i)-1; fMCO3(i)=fMCO3(i)-1; fHO2(i)=fHO2(i)+0.500; fMO2(i)=fMO2(i)+0.500; fRCHO(i)=fRCHO(i)+1; fMEK(i)=fMEK(i)+1; fRCOOH(i)=fRCOOH(i)+1; 

i=i+1;
Rnames{i} = 'PIO2 + NO3 = HO2 + NO2 + RCHO + MEK';
k(:,i) = 1.20E-12;
Gstr{i,1} = 'PIO2'; Gstr{i,2} = 'NO3'; 
fPIO2(i)=fPIO2(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fRCHO(i)=fRCHO(i)+1; fMEK(i)=fMEK(i)+1; 

i=i+1;
Rnames{i} = 'MTPA + O3 = 0.850OH + 0.100HO2 + 0.620KO2 + 0.140CO + 0.020H2O2 + 0.650RCHO + 0.530MEK';
k(:,i) = GCARR_ac(T, 5.00E-16, -530.0);
Gstr{i,1} = 'MTPA'; Gstr{i,2} = 'O3'; 
fMTPA(i)=fMTPA(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+0.850; fHO2(i)=fHO2(i)+0.100; fKO2(i)=fKO2(i)+0.620; fCO(i)=fCO(i)+0.140; fH2O2(i)=fH2O2(i)+0.020; fRCHO(i)=fRCHO(i)+0.650; fMEK(i)=fMEK(i)+0.530; 

i=i+1;
Rnames{i} = 'MTPO + O3 = 0.850OH + 0.100HO2 + 0.620KO2 + 0.140CO + 0.020H2O2 + 0.650RCHO + 0.530MEK';
k(:,i) = GCARR_ac(T, 5.00E-16, -530.0);
Gstr{i,1} = 'MTPO'; Gstr{i,2} = 'O3'; 
fMTPO(i)=fMTPO(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+0.850; fHO2(i)=fHO2(i)+0.100; fKO2(i)=fKO2(i)+0.620; fCO(i)=fCO(i)+0.140; fH2O2(i)=fH2O2(i)+0.020; fRCHO(i)=fRCHO(i)+0.650; fMEK(i)=fMEK(i)+0.530; 

i=i+1;
Rnames{i} = 'MTPA + NO3 = 0.100OLNN + 0.900OLND';
k(:,i) = GCARR_ac(T, 8.33E-13, 490.0);
Gstr{i,1} = 'MTPA'; Gstr{i,2} = 'NO3'; 
fMTPA(i)=fMTPA(i)-1; fNO3(i)=fNO3(i)-1; fOLNN(i)=fOLNN(i)+0.100; fOLND(i)=fOLND(i)+0.900; 

i=i+1;
Rnames{i} = 'MTPO + NO3 = 0.100OLNN + 0.900OLND';
k(:,i) = GCARR_ac(T, 8.33E-13, 490.0);
Gstr{i,1} = 'MTPO'; Gstr{i,2} = 'NO3'; 
fMTPO(i)=fMTPO(i)-1; fNO3(i)=fNO3(i)-1; fOLNN(i)=fOLNN(i)+0.100; fOLND(i)=fOLND(i)+0.900; 

i=i+1;
Rnames{i} = 'LIMO + OH = LIMO2';
k(:,i) = GCARR_ac(T, 4.20E-11, 401.0);
Gstr{i,1} = 'LIMO'; Gstr{i,2} = 'OH'; 
fLIMO(i)=fLIMO(i)-1; fOH(i)=fOH(i)-1; fLIMO2(i)=fLIMO2(i)+1; 

i=i+1;
Rnames{i} = 'LIMO + O3 = 0.850OH + 0.100HO2 + 0.160OTHRO2 + 0.420KO2 + 0.020H2O2 + 0.140CO + 0.460PRPE + 0.040CH2O + 0.790MACR + 0.010HCOOH + 0.070RCOOH';
k(:,i) = GCARR_ac(T, 2.95E-15, -783.0);
Gstr{i,1} = 'LIMO'; Gstr{i,2} = 'O3'; 
fLIMO(i)=fLIMO(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+0.850; fHO2(i)=fHO2(i)+0.100; fOTHRO2(i)=fOTHRO2(i)+0.160; fKO2(i)=fKO2(i)+0.420; fH2O2(i)=fH2O2(i)+0.020; fCO(i)=fCO(i)+0.140; fPRPE(i)=fPRPE(i)+0.460; fCH2O(i)=fCH2O(i)+0.040; fMACR(i)=fMACR(i)+0.790; fHCOOH(i)=fHCOOH(i)+0.010; fRCOOH(i)=fRCOOH(i)+0.070; 

i=i+1;
Rnames{i} = 'LIMO + NO3 = 0.500OLNN + 0.500OLND';
k(:,i) = 1.22E-11;
Gstr{i,1} = 'LIMO'; Gstr{i,2} = 'NO3'; 
fLIMO(i)=fLIMO(i)-1; fNO3(i)=fNO3(i)-1; fOLNN(i)=fOLNN(i)+0.500; fOLND(i)=fOLND(i)+0.500; 

i=i+1;
Rnames{i} = 'LIMO2 + NO = 0.686HO2 + 0.780NO2 + 0.220MONITU + 0.289PRPE + 0.231CH2O + 0.491RCHO + 0.058HAC + 0.289MEK';
k(:,i) = 4.00E-12;
Gstr{i,1} = 'LIMO2'; Gstr{i,2} = 'NO'; 
fLIMO2(i)=fLIMO2(i)-1; fNO(i)=fNO(i)-1; fHO2(i)=fHO2(i)+0.686; fNO2(i)=fNO2(i)+0.780; fMONITU(i)=fMONITU(i)+0.220; fPRPE(i)=fPRPE(i)+0.289; fCH2O(i)=fCH2O(i)+0.231; fRCHO(i)=fRCHO(i)+0.491; fHAC(i)=fHAC(i)+0.058; fMEK(i)=fMEK(i)+0.289; 

i=i+1;
Rnames{i} = 'LIMO2 + HO2 = PIP';
k(:,i) = 1.50E-11;
Gstr{i,1} = 'LIMO2'; Gstr{i,2} = 'HO2'; 
fLIMO2(i)=fLIMO2(i)-1; fHO2(i)=fHO2(i)-1; fPIP(i)=fPIP(i)+1; 

i=i+1;
Rnames{i} = 'LIMO2 + MO2 = HO2 + 0.192PRPE + 1.040CH2O + 0.308MACR + 0.250MOH + 0.250ROH';
k(:,i) = GCARR_ac(T, 3.56E-14, 708.0);
Gstr{i,1} = 'LIMO2'; Gstr{i,2} = 'MO2'; 
fLIMO2(i)=fLIMO2(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+1; fPRPE(i)=fPRPE(i)+0.192; fCH2O(i)=fCH2O(i)+1.040; fMACR(i)=fMACR(i)+0.308; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; 

i=i+1;
Rnames{i} = 'LIMO2 + MCO3 = 0.500HO2 + 0.500MO2 + 0.192PRPE + 0.385CH2O + 0.308MACR + 0.500RCOOH';
k(:,i) = GCARR_ac(T, 7.40E-13, 765.0);
Gstr{i,1} = 'LIMO2'; Gstr{i,2} = 'MCO3'; 
fLIMO2(i)=fLIMO2(i)-1; fMCO3(i)=fMCO3(i)-1; fHO2(i)=fHO2(i)+0.500; fMO2(i)=fMO2(i)+0.500; fPRPE(i)=fPRPE(i)+0.192; fCH2O(i)=fCH2O(i)+0.385; fMACR(i)=fMACR(i)+0.308; fRCOOH(i)=fRCOOH(i)+0.500; 

i=i+1;
Rnames{i} = 'LIMO2 + NO3 = HO2 + NO2 + 0.385PRPE + 0.385CH2O + 0.615MACR';
k(:,i) = 1.20E-12;
Gstr{i,1} = 'LIMO2'; Gstr{i,2} = 'NO3'; 
fLIMO2(i)=fLIMO2(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fPRPE(i)=fPRPE(i)+0.385; fCH2O(i)=fCH2O(i)+0.385; fMACR(i)=fMACR(i)+0.615; 

i=i+1;
Rnames{i} = 'PIP + OH = 0.490OH + 0.440R4O2 + 0.080RCHO + 0.410MEK';
k(:,i) = GCARR_ac(T, 3.40E-12, 190.0);
Gstr{i,1} = 'PIP'; Gstr{i,2} = 'OH'; 
fPIP(i)=fPIP(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.490; fR4O2(i)=fR4O2(i)+0.440; fRCHO(i)=fRCHO(i)+0.080; fMEK(i)=fMEK(i)+0.410; 

i=i+1;
Rnames{i} = 'OLNN + NO = HO2 + NO2 + MONITS';
k(:,i) = 4.00E-12;
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'NO'; 
fOLNN(i)=fOLNN(i)-1; fNO(i)=fNO(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fMONITS(i)=fMONITS(i)+1; 

i=i+1;
Rnames{i} = 'OLND + NO = 2.000NO2 + 0.287CH2O + 1.240RCHO + 0.464MEK';
k(:,i) = 4.00E-12;
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'NO'; 
fOLND(i)=fOLND(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2.000; fCH2O(i)=fCH2O(i)+0.287; fRCHO(i)=fRCHO(i)+1.240; fMEK(i)=fMEK(i)+0.464; 

i=i+1;
Rnames{i} = 'OLNN + HO2 = 0.700MONITS + 0.300MONITU';
k(:,i) = GCARR_ac(T, 1.66E-13, 1300.0);
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'HO2'; 
fOLNN(i)=fOLNN(i)-1; fHO2(i)=fHO2(i)-1; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'OLND + HO2 = 0.700MONITS + 0.300MONITU';
k(:,i) = GCARR_ac(T, 1.66E-13, 1300.0);
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'HO2'; 
fOLND(i)=fOLND(i)-1; fHO2(i)=fHO2(i)-1; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'OLNN + MO2 = 2.000HO2 + CH2O + 0.700MONITS + 0.300MONITU';
k(:,i) = GCARR_ac(T, 1.60E-13, 708.0);
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'MO2'; 
fOLNN(i)=fOLNN(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+2.000; fCH2O(i)=fCH2O(i)+1; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'OLND + MO2 = 0.500HO2 + 0.500NO2 + 0.965CH2O + 0.930RCHO + 0.348MEK + 0.250MOH + 0.250ROH + 0.350MONITS + 0.150MONITU';
k(:,i) = GCARR_ac(T, 9.68E-14, 708.0);
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'MO2'; 
fOLND(i)=fOLND(i)-1; fMO2(i)=fMO2(i)-1; fHO2(i)=fHO2(i)+0.500; fNO2(i)=fNO2(i)+0.500; fCH2O(i)=fCH2O(i)+0.965; fRCHO(i)=fRCHO(i)+0.930; fMEK(i)=fMEK(i)+0.348; fMOH(i)=fMOH(i)+0.250; fROH(i)=fROH(i)+0.250; fMONITS(i)=fMONITS(i)+0.350; fMONITU(i)=fMONITU(i)+0.150; 

i=i+1;
Rnames{i} = 'OLNN + MCO3 = HO2 + MO2 + 0.700MONITS + 0.300MONITU';
k(:,i) = GCARR_ac(T, 8.85E-13, 765.0);
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'MCO3'; 
fOLNN(i)=fOLNN(i)-1; fMCO3(i)=fMCO3(i)-1; fHO2(i)=fHO2(i)+1; fMO2(i)=fMO2(i)+1; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'OLND + MCO3 = 0.500MO2 + NO2 + 0.287CH2O + 1.240RCHO + 0.464MEK + 0.500RCOOH';
k(:,i) = GCARR_ac(T, 5.37E-13, 765.0);
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'MCO3'; 
fOLND(i)=fOLND(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+0.500; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.287; fRCHO(i)=fRCHO(i)+1.240; fMEK(i)=fMEK(i)+0.464; fRCOOH(i)=fRCOOH(i)+0.500; 

i=i+1;
Rnames{i} = 'OLNN + NO3 = HO2 + NO2 + 0.700MONITS + 0.300MONITU';
k(:,i) = 1.20E-12;
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'NO3'; 
fOLNN(i)=fOLNN(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'OLND + NO3 = 2.000NO2 + 0.287CH2O + 1.240RCHO + 0.464MEK';
k(:,i) = 1.20E-12;
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'NO3'; 
fOLND(i)=fOLND(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2.000; fCH2O(i)=fCH2O(i)+0.287; fRCHO(i)=fRCHO(i)+1.240; fMEK(i)=fMEK(i)+0.464; 

i=i+1;
Rnames{i} = 'OLNN + OLNN = HO2 + 1.400MONITS + 0.600MONITU';
k(:,i) = GCARR_ac(T, 7.00E-14, 1000.0);
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'OLNN'; 
fOLNN(i)=fOLNN(i)-1; fOLNN(i)=fOLNN(i)-1; fHO2(i)=fHO2(i)+1; fMONITS(i)=fMONITS(i)+1.400; fMONITU(i)=fMONITU(i)+0.600; 

i=i+1;
Rnames{i} = 'OLNN + OLND = 0.500HO2 + 0.500NO2 + 0.202CH2O + 0.640RCHO + 0.149MEK + 1.050MONITS + 0.450MONITU';
k(:,i) = GCARR_ac(T, 4.25E-14, 1000.0);
Gstr{i,1} = 'OLNN'; Gstr{i,2} = 'OLND'; 
fOLNN(i)=fOLNN(i)-1; fOLND(i)=fOLND(i)-1; fHO2(i)=fHO2(i)+0.500; fNO2(i)=fNO2(i)+0.500; fCH2O(i)=fCH2O(i)+0.202; fRCHO(i)=fRCHO(i)+0.640; fMEK(i)=fMEK(i)+0.149; fMONITS(i)=fMONITS(i)+1.050; fMONITU(i)=fMONITU(i)+0.450; 

i=i+1;
Rnames{i} = 'OLND + OLND = NO2 + 0.504CH2O + 1.210RCHO + 0.285MEK + 0.700MONITS + 0.300MONITU';
k(:,i) = GCARR_ac(T, 2.96E-14, 1000.0);
Gstr{i,1} = 'OLND'; Gstr{i,2} = 'OLND'; 
fOLND(i)=fOLND(i)-1; fOLND(i)=fOLND(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.504; fRCHO(i)=fRCHO(i)+1.210; fMEK(i)=fMEK(i)+0.285; fMONITS(i)=fMONITS(i)+0.700; fMONITU(i)=fMONITU(i)+0.300; 

i=i+1;
Rnames{i} = 'MONITS + OH = HONIT';
k(:,i) = 4.80E-12;
Gstr{i,1} = 'MONITS'; Gstr{i,2} = 'OH'; 
fMONITS(i)=fMONITS(i)-1; fOH(i)=fOH(i)-1; fHONIT(i)=fHONIT(i)+1; 

i=i+1;
Rnames{i} = 'MONITU + OH = HONIT';
k(:,i) = 7.29E-11;
Gstr{i,1} = 'MONITU'; Gstr{i,2} = 'OH'; 
fMONITU(i)=fMONITU(i)-1; fOH(i)=fOH(i)-1; fHONIT(i)=fHONIT(i)+1; 

i=i+1;
Rnames{i} = 'MONITU + O3 = HONIT';
k(:,i) = 1.67E-16;
Gstr{i,1} = 'MONITU'; Gstr{i,2} = 'O3'; 
fMONITU(i)=fMONITU(i)-1; fO3(i)=fO3(i)-1; fHONIT(i)=fHONIT(i)+1; 

i=i+1;
Rnames{i} = 'MONITU + NO3 = HONIT';
k(:,i) = GCARR_ac(T, 3.15E-13, -448.0);
Gstr{i,1} = 'MONITU'; Gstr{i,2} = 'NO3'; 
fMONITU(i)=fMONITU(i)-1; fNO3(i)=fNO3(i)-1; fHONIT(i)=fHONIT(i)+1; 

i=i+1;
Rnames{i} = 'MONITS + NO3 = HONIT';
k(:,i) = GCARR_ac(T, 3.15E-13, -448.0);
Gstr{i,1} = 'MONITS'; Gstr{i,2} = 'NO3'; 
fMONITS(i)=fMONITS(i)-1; fNO3(i)=fNO3(i)-1; fHONIT(i)=fHONIT(i)+1; 

i=i+1;
Rnames{i} = 'IONITA = INDIOL + HNO3';
k(:,i) = 2.78E-04;
Gstr{i,1} = 'IONITA'; 
fIONITA(i)=fIONITA(i)-1; fINDIOL(i)=fINDIOL(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'MONITA = INDIOL + HNO3';
k(:,i) = 2.78E-04;
Gstr{i,1} = 'MONITA'; 
fMONITA(i)=fMONITA(i)-1; fINDIOL(i)=fINDIOL(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'HONIT + OH = NO3 + HAC';
k(:,i) = GC_OHHNO3_acacac(M,T, 2.41E-14, 460.0, 2.69E-17, 2199.0, 6.51E-34, 1335.0);
Gstr{i,1} = 'HONIT'; Gstr{i,2} = 'OH'; 
fHONIT(i)=fHONIT(i)-1; fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)+1; fHAC(i)=fHAC(i)+1; 

i=i+1;
Rnames{i} = 'MENO3 + OH = CH2O + NO2';
k(:,i) = GCARR_ac(T, 8.00E-13, -1000.0);
Gstr{i,1} = 'MENO3'; Gstr{i,2} = 'OH'; 
fMENO3(i)=fMENO3(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ETNO3 + OH = ALD2 + NO2';
k(:,i) = GCARR_ac(T, 1.00E-12, -490.0);
Gstr{i,1} = 'ETNO3'; Gstr{i,2} = 'OH'; 
fETNO3(i)=fETNO3(i)-1; fOH(i)=fOH(i)-1; fALD2(i)=fALD2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IPRNO3 + OH = ACET + NO2';
k(:,i) = GCARR_ac(T, 1.20E-12, -320.0);
Gstr{i,1} = 'IPRNO3'; Gstr{i,2} = 'OH'; 
fIPRNO3(i)=fIPRNO3(i)-1; fOH(i)=fOH(i)-1; fACET(i)=fACET(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NPRNO3 + OH = RCHO + NO2';
k(:,i) = 7.10E-13;
Gstr{i,1} = 'NPRNO3'; Gstr{i,2} = 'OH'; 
fNPRNO3(i)=fNPRNO3(i)-1; fOH(i)=fOH(i)-1; fRCHO(i)=fRCHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOP + O3 = 0.416MACR + 0.177MVK + 0.28OH + 0.407CO2 + 0.407CO + 0.407MO2 + 0.16HO2 + 0.58CH2OO + 0.827CH2O + 0.013H2O2';
k(:,i) = 1.3E-17;
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'O3'; 
fISOP(i)=fISOP(i)-1; fO3(i)=fO3(i)-1; fMACR(i)=fMACR(i)+0.416; fMVK(i)=fMVK(i)+0.177; fOH(i)=fOH(i)+0.28; fCO2(i)=fCO2(i)+0.407; fCO(i)=fCO(i)+0.407; fMO2(i)=fMO2(i)+0.407; fHO2(i)=fHO2(i)+0.16; fCH2OO(i)=fCH2OO(i)+0.58; fCH2O(i)=fCH2O(i)+0.827; fH2O2(i)=fH2O2(i)+0.013; 

i=i+1;
Rnames{i} = 'ISOP + OH = LISOPOH + IHOO1';
k(:,i) = GC_ISO1(T, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'OH'; 
fISOP(i)=fISOP(i)-1; fOH(i)=fOH(i)-1; fLISOPOH(i)=fLISOPOH(i)+1; fIHOO1(i)=fIHOO1(i)+1; 

i=i+1;
Rnames{i} = 'ISOP + OH = LISOPOH + IHOO4';
k(:,i) = GC_ISO1(T, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'OH'; 
fISOP(i)=fISOP(i)-1; fOH(i)=fOH(i)-1; fLISOPOH(i)=fLISOPOH(i)+1; fIHOO4(i)=fIHOO4(i)+1; 

i=i+1;
Rnames{i} = 'ISOP + OH = 0.3MCO3 + 0.3MGLY + 0.3CH2O + 0.15HPALD3 + 0.25HPALD1 + 0.4HO2 + 0.6CO + 1.5OH + 0.3HPETHNL + LISOPOH';
k(:,i) = GC_ISO2(T, 1.7E-11, 3.90E2, 9.33E-2, 5.05E15, -1.22E4, 1.79E14, -8.830E3);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'OH'; 
fISOP(i)=fISOP(i)-1; fOH(i)=fOH(i)-1; fMCO3(i)=fMCO3(i)+0.3; fMGLY(i)=fMGLY(i)+0.3; fCH2O(i)=fCH2O(i)+0.3; fHPALD3(i)=fHPALD3(i)+0.15; fHPALD1(i)=fHPALD1(i)+0.25; fHO2(i)=fHO2(i)+0.4; fCO(i)=fCO(i)+0.6; fOH(i)=fOH(i)+1.5; fHPETHNL(i)=fHPETHNL(i)+0.3; fLISOPOH(i)=fLISOPOH(i)+1; 

i=i+1;
Rnames{i} = 'ISOP + OH = 0.3CH2O + 0.15HPALD4 + 0.25HPALD2 + 1.5OH + 0.9CO + 0.7HO2 + 0.3MGLY + 0.3ATOOH + LISOPOH';
k(:,i) = GC_ISO2(T, 1.0E-11, 3.90E2, 2.26E-1, 2.22E9, -7.160E3, 1.75E14, -9.054E3);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'OH'; 
fISOP(i)=fISOP(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+0.3; fHPALD4(i)=fHPALD4(i)+0.15; fHPALD2(i)=fHPALD2(i)+0.25; fOH(i)=fOH(i)+1.5; fCO(i)=fCO(i)+0.9; fHO2(i)=fHO2(i)+0.7; fMGLY(i)=fMGLY(i)+0.3; fATOOH(i)=fATOOH(i)+0.3; fLISOPOH(i)=fLISOPOH(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 + HO2 = 0.063MVK + 0.063OH + 0.063HO2 + 0.063CH2O + 0.937RIPA';
k(:,i) = ARRPLUS_abde(T, 2.12E-13, -1300,  1.1644, -7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'HO2'; 
fIHOO1(i)=fIHOO1(i)-1; fHO2(i)=fHO2(i)-1; fMVK(i)=fMVK(i)+0.063; fOH(i)=fOH(i)+0.063; fHO2(i)=fHO2(i)+0.063; fCH2O(i)=fCH2O(i)+0.063; fRIPA(i)=fRIPA(i)+0.937; 

i=i+1;
Rnames{i} = 'IHOO1 + HO2 = RIPC';
k(:,i) = ARRPLUS_abde(T, 2.12E-13, -1300, -0.1644, 7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'HO2'; 
fIHOO1(i)=fIHOO1(i)-1; fHO2(i)=fHO2(i)-1; fRIPC(i)=fRIPC(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 + HO2 = 0.063MACR + 0.063OH + 0.063HO2 + 0.063CH2O + 0.937RIPB';
k(:,i) = ARRPLUS_abde(T, 2.12E-13, -1300, 1.2038, -9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'HO2'; 
fIHOO4(i)=fIHOO4(i)-1; fHO2(i)=fHO2(i)-1; fMACR(i)=fMACR(i)+0.063; fOH(i)=fOH(i)+0.063; fHO2(i)=fHO2(i)+0.063; fCH2O(i)=fCH2O(i)+0.063; fRIPB(i)=fRIPB(i)+0.937; 

i=i+1;
Rnames{i} = 'IHOO4 + HO2 = RIPD';
k(:,i) = ARRPLUS_abde(T, 2.12E-13, -1300, -0.2038, 9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'HO2'; 
fIHOO4(i)=fIHOO4(i)-1; fHO2(i)=fHO2(i)-1; fRIPD(i)=fRIPD(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 = CH2O + OH + MVK';
k(:,i) = ARRPLUS_abde(T, 1.04E11, 9.746E3,  1.1644, -7.0485E-4);
Gstr{i,1} = 'IHOO1'; 
fIHOO1(i)=fIHOO1(i)-1; fCH2O(i)=fCH2O(i)+1; fOH(i)=fOH(i)+1; fMVK(i)=fMVK(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 = 0.15HPALD3 + 0.25HPALD1 + 0.4HO2 + 0.6CO + 1.5OH + 0.3CH2O + 0.3MGLY + 0.3HPETHNL + 0.3MCO3';
k(:,i) = TUNPLUS_abcde(T, 5.05E15, -1.22E4, 1.0E8, -0.0128, 5.1242E-5);
Gstr{i,1} = 'IHOO1'; 
fIHOO1(i)=fIHOO1(i)-1; fHPALD3(i)=fHPALD3(i)+0.15; fHPALD1(i)=fHPALD1(i)+0.25; fHO2(i)=fHO2(i)+0.4; fCO(i)=fCO(i)+0.6; fOH(i)=fOH(i)+1.5; fCH2O(i)=fCH2O(i)+0.3; fMGLY(i)=fMGLY(i)+0.3; fHPETHNL(i)=fHPETHNL(i)+0.3; fMCO3(i)=fMCO3(i)+0.3; 

i=i+1;
Rnames{i} = 'IHOO4 = MACR + OH + CH2O';
k(:,i) = ARRPLUS_abde(T, 1.88E11, 9.752E3, 1.2038, -9.0435E-4);
Gstr{i,1} = 'IHOO4'; 
fIHOO4(i)=fIHOO4(i)-1; fMACR(i)=fMACR(i)+1; fOH(i)=fOH(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 = 0.15HPALD4 + 0.25HPALD2 + 1.5OH + 0.3CH2O + 0.9CO + 0.7HO2 + 0.3MGLY + 0.3ATOOH';
k(:,i) = TUNPLUS_abcde(T, 2.22E9, -7.160E3, 1.0E8, -0.0306, 1.1346E-4);
Gstr{i,1} = 'IHOO4'; 
fIHOO4(i)=fIHOO4(i)-1; fHPALD4(i)=fHPALD4(i)+0.15; fHPALD2(i)=fHPALD2(i)+0.25; fOH(i)=fOH(i)+1.5; fCH2O(i)=fCH2O(i)+0.3; fCO(i)=fCO(i)+0.9; fHO2(i)=fHO2(i)+0.7; fMGLY(i)=fMGLY(i)+0.3; fATOOH(i)=fATOOH(i)+0.3; 

i=i+1;
Rnames{i} = 'IHOO1 + IHOO1 = 2MVK + 2HO2 + 2CH2O';
k(:,i) = ARRPLUS_ade(T, 6.92E-14, 1.1644, -7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'IHOO1'; 
fIHOO1(i)=fIHOO1(i)-1; fIHOO1(i)=fIHOO1(i)-1; fMVK(i)=fMVK(i)+2; fHO2(i)=fHO2(i)+2; fCH2O(i)=fCH2O(i)+2; 

i=i+1;
Rnames{i} = 'IHOO4 + IHOO4 = 2MACR + 2HO2 + 2CH2O';
k(:,i) = ARRPLUS_ade(T, 5.74E-12, 1.2038, -9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'IHOO4'; 
fIHOO4(i)=fIHOO4(i)-1; fIHOO4(i)=fIHOO4(i)-1; fMACR(i)=fMACR(i)+2; fHO2(i)=fHO2(i)+2; fCH2O(i)=fCH2O(i)+2; 

i=i+1;
Rnames{i} = 'IHOO1 + IHOO4 = MACR + MVK + 2HO2 + 2CH2O';
k(:,i) = ARRPLUS_ade(T, 1.54E-12, 2.3682, -1.6092E-3);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'IHOO4'; 
fIHOO1(i)=fIHOO1(i)-1; fIHOO4(i)=fIHOO4(i)-1; fMACR(i)=fMACR(i)+1; fMVK(i)=fMVK(i)+1; fHO2(i)=fHO2(i)+2; fCH2O(i)=fCH2O(i)+2; 

i=i+1;
Rnames{i} = 'IHOO1 + IHOO1 = HO2 + HC5A + CO + OH + MVKHP';
k(:,i) = ARRPLUS_ade(T, 2.49E-12, -0.1644, 7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'IHOO1'; 
fIHOO1(i)=fIHOO1(i)-1; fIHOO1(i)=fIHOO1(i)-1; fHO2(i)=fHO2(i)+1; fHC5A(i)=fHC5A(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fMVKHP(i)=fMVKHP(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 + IHOO4 = HO2 + HC5A + CO + OH + MCRHP';
k(:,i) = ARRPLUS_ade(T, 3.94E-12, -0.2038, 9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'IHOO4'; 
fIHOO4(i)=fIHOO4(i)-1; fIHOO4(i)=fIHOO4(i)-1; fHO2(i)=fHO2(i)+1; fHC5A(i)=fHC5A(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fMCRHP(i)=fMCRHP(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 + IHOO4 = HO2 + HC5A + CO + OH + 0.5MVKHP + 0.5MCRHP';
k(:,i) = ARRPLUS_ade(T, 1.54E-12, -0.3682, 1.6092E-3);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'IHOO4'; 
fIHOO1(i)=fIHOO1(i)-1; fIHOO4(i)=fIHOO4(i)-1; fHO2(i)=fHO2(i)+1; fHC5A(i)=fHC5A(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fMVKHP(i)=fMVKHP(i)+0.5; fMCRHP(i)=fMCRHP(i)+0.5; 

i=i+1;
Rnames{i} = 'IHOO1 + MO2 = MVK + 2HO2 + 2CH2O';
k(:,i) = ARRPLUS_ade(T, 2.0E-12, 1.1644, -7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'MO2'; 
fIHOO1(i)=fIHOO1(i)-1; fMO2(i)=fMO2(i)-1; fMVK(i)=fMVK(i)+1; fHO2(i)=fHO2(i)+2; fCH2O(i)=fCH2O(i)+2; 

i=i+1;
Rnames{i} = 'IHOO1 + MO2 = CH2O + 0.5HC5A + 1.5HO2 + 0.5MVKHP + 0.5CO + 0.5OH';
k(:,i) = ARRPLUS_ade(T, 2.0E-12, -0.1644, 7.0485E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'MO2'; 
fIHOO1(i)=fIHOO1(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fHC5A(i)=fHC5A(i)+0.5; fHO2(i)=fHO2(i)+1.5; fMVKHP(i)=fMVKHP(i)+0.5; fCO(i)=fCO(i)+0.5; fOH(i)=fOH(i)+0.5; 

i=i+1;
Rnames{i} = 'IHOO4 + MO2 = MACR + 2HO2 + 2CH2O';
k(:,i) = ARRPLUS_ade(T, 2.0E-12, 1.2038, -9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'MO2'; 
fIHOO4(i)=fIHOO4(i)-1; fMO2(i)=fMO2(i)-1; fMACR(i)=fMACR(i)+1; fHO2(i)=fHO2(i)+2; fCH2O(i)=fCH2O(i)+2; 

i=i+1;
Rnames{i} = 'IHOO4 + MO2 = CH2O + 0.5HC5A + 1.5HO2 + 0.5MCRHP + 0.5CO + 0.5OH';
k(:,i) = ARRPLUS_ade(T, 2.0E-12, -0.2038, 9.0435E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'MO2'; 
fIHOO4(i)=fIHOO4(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fHC5A(i)=fHC5A(i)+0.5; fHO2(i)=fHO2(i)+1.5; fMCRHP(i)=fMCRHP(i)+0.5; fCO(i)=fCO(i)+0.5; fOH(i)=fOH(i)+0.5; 

i=i+1;
Rnames{i} = 'IHOO1 + NO = IHN2';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 1.19,  6.0, 1.1644, 7.05E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'NO'; 
fIHOO1(i)=fIHOO1(i)-1; fNO(i)=fNO(i)-1; fIHN2(i)=fIHN2(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 + NO = NO2 + MVK + HO2 + CH2O';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 1.19,  6.0, 1.1644, 7.05E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'NO'; 
fIHOO1(i)=fIHOO1(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMVK(i)=fMVK(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 + NO = IHN4';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 1.421, 6.0, -0.1644, -7.05E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'NO'; 
fIHOO1(i)=fIHOO1(i)-1; fNO(i)=fNO(i)-1; fIHN4(i)=fIHN4(i)+1; 

i=i+1;
Rnames{i} = 'IHOO1 + NO = NO2 + 0.45HC5A + 0.45HO2 + 0.55MVKHP + 0.55CO + 0.55OH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 1.421, 6.0, -0.1644, -7.05E-4);
Gstr{i,1} = 'IHOO1'; Gstr{i,2} = 'NO'; 
fIHOO1(i)=fIHOO1(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHC5A(i)=fHC5A(i)+0.45; fHO2(i)=fHO2(i)+0.45; fMVKHP(i)=fMVKHP(i)+0.55; fCO(i)=fCO(i)+0.55; fOH(i)=fOH(i)+0.55; 

i=i+1;
Rnames{i} = 'IHOO4 + NO = IHN3';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 1.297, 6.0, 1.2038, 9.04E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'NO'; 
fIHOO4(i)=fIHOO4(i)-1; fNO(i)=fNO(i)-1; fIHN3(i)=fIHN3(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 + NO = NO2 + MACR + HO2 + CH2O';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 1.297, 6.0, 1.2038, 9.04E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'NO'; 
fIHOO4(i)=fIHOO4(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMACR(i)=fMACR(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 + NO = IHN1';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 1.421, 6.0, -0.2038, -9.04E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'NO'; 
fIHOO4(i)=fIHOO4(i)-1; fNO(i)=fNO(i)-1; fIHN1(i)=fIHN1(i)+1; 

i=i+1;
Rnames{i} = 'IHOO4 + NO = NO2 + 0.45HO2 + 0.45HC5A + 0.55MCRHP + 0.55CO + 0.55OH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 1.421, 6.0, -0.2038, -9.04E-4);
Gstr{i,1} = 'IHOO4'; Gstr{i,2} = 'NO'; 
fIHOO4(i)=fIHOO4(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+0.45; fHC5A(i)=fHC5A(i)+0.45; fMCRHP(i)=fMCRHP(i)+0.55; fCO(i)=fCO(i)+0.55; fOH(i)=fOH(i)+0.55; 

i=i+1;
Rnames{i} = 'HPALD1 + OH = 0.035MVK + 0.315HPALD1OO + 0.15IDC + 0.33MVKHP + 0.085HO2 + 0.085CH2O + 0.085MGLY + 0.085ICHE + 1.085OH + 0.45CO';
k(:,i) = GCARR_ac(T, 1.17E-11, 450.0);
Gstr{i,1} = 'HPALD1'; Gstr{i,2} = 'OH'; 
fHPALD1(i)=fHPALD1(i)-1; fOH(i)=fOH(i)-1; fMVK(i)=fMVK(i)+0.035; fHPALD1OO(i)=fHPALD1OO(i)+0.315; fIDC(i)=fIDC(i)+0.15; fMVKHP(i)=fMVKHP(i)+0.33; fHO2(i)=fHO2(i)+0.085; fCH2O(i)=fCH2O(i)+0.085; fMGLY(i)=fMGLY(i)+0.085; fICHE(i)=fICHE(i)+0.085; fOH(i)=fOH(i)+1.085; fCO(i)=fCO(i)+0.45; 

i=i+1;
Rnames{i} = 'HPALD2 + OH = 0.035MACR + 0.315HPALD2OO + 0.15IDC + 0.17MCRHP + 0.165HO2 + 0.165CH2O + 0.165MGLY + 0.165ICHE + 1.165OH + 0.37CO';
k(:,i) = GCARR_ac(T, 1.17E-11, 450.0);
Gstr{i,1} = 'HPALD2'; Gstr{i,2} = 'OH'; 
fHPALD2(i)=fHPALD2(i)-1; fOH(i)=fOH(i)-1; fMACR(i)=fMACR(i)+0.035; fHPALD2OO(i)=fHPALD2OO(i)+0.315; fIDC(i)=fIDC(i)+0.15; fMCRHP(i)=fMCRHP(i)+0.17; fHO2(i)=fHO2(i)+0.165; fCH2O(i)=fCH2O(i)+0.165; fMGLY(i)=fMGLY(i)+0.165; fICHE(i)=fICHE(i)+0.165; fOH(i)=fOH(i)+1.165; fCO(i)=fCO(i)+0.37; 

i=i+1;
Rnames{i} = 'HPALD3 + OH = OH + 0.230MVK + 0.420CO + 0.190MVKHP + 0.580ICHE';
k(:,i) = GCARR_ac(T, 2.20E-11, 390.0);
Gstr{i,1} = 'HPALD3'; Gstr{i,2} = 'OH'; 
fHPALD3(i)=fHPALD3(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fMVK(i)=fMVK(i)+0.230; fCO(i)=fCO(i)+0.420; fMVKHP(i)=fMVKHP(i)+0.190; fICHE(i)=fICHE(i)+0.580; 

i=i+1;
Rnames{i} = 'HPALD4 + OH = OH + 0.770ICHE + 0.230CO + 0.090MCRHP + 0.140MACR';
k(:,i) = GCARR_ac(T, 3.50E-11, 390.0);
Gstr{i,1} = 'HPALD4'; Gstr{i,2} = 'OH'; 
fHPALD4(i)=fHPALD4(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fICHE(i)=fICHE(i)+0.770; fCO(i)=fCO(i)+0.230; fMCRHP(i)=fMCRHP(i)+0.090; fMACR(i)=fMACR(i)+0.140; 

i=i+1;
Rnames{i} = 'HC5A + OH = 1.065OH + 0.355CO2 + 0.638CO + 0.355MGLY + 0.283HO2 + 0.294IEPOXAOO + 0.125MVKHP + 0.158MCRHP + 0.068IEPOXBOO';
k(:,i) = GCARR_ac(T, 4.64E-12, 650.0);
Gstr{i,1} = 'HC5A'; Gstr{i,2} = 'OH'; 
fHC5A(i)=fHC5A(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1.065; fCO2(i)=fCO2(i)+0.355; fCO(i)=fCO(i)+0.638; fMGLY(i)=fMGLY(i)+0.355; fHO2(i)=fHO2(i)+0.283; fIEPOXAOO(i)=fIEPOXAOO(i)+0.294; fMVKHP(i)=fMVKHP(i)+0.125; fMCRHP(i)=fMCRHP(i)+0.158; fIEPOXBOO(i)=fIEPOXBOO(i)+0.068; 

i=i+1;
Rnames{i} = 'ICHE + OH = OH + 1.5CO + 0.5CH2O + 0.5MGLY + 0.5HAC';
k(:,i) = GCARR_ac(T, 9.85E-12, 410.0);
Gstr{i,1} = 'ICHE'; Gstr{i,2} = 'OH'; 
fICHE(i)=fICHE(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1.5; fCH2O(i)=fCH2O(i)+0.5; fMGLY(i)=fMGLY(i)+0.5; fHAC(i)=fHAC(i)+0.5; 

i=i+1;
Rnames{i} = 'IDC + OH = CO + HO2 + MVKPC';
k(:,i) = GCARR_ac(T, 3.00E-12, 650.0);
Gstr{i,1} = 'IDC'; Gstr{i,2} = 'OH'; 
fIDC(i)=fIDC(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fMVKPC(i)=fMVKPC(i)+1; 

i=i+1;
Rnames{i} = 'RIPA + OH = 0.655IHPOO3 + 0.345IHPOO1 + 0.005LVOC';
k(:,i) = GCARR_ac(T, 2.47E-12, 390.0);
Gstr{i,1} = 'RIPA'; Gstr{i,2} = 'OH'; 
fRIPA(i)=fRIPA(i)-1; fOH(i)=fOH(i)-1; fIHPOO3(i)=fIHPOO3(i)+0.655; fIHPOO1(i)=fIHPOO1(i)+0.345; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPA + OH = 0.67IEPOXA + 0.33IEPOXB + OH + 0.005LVOC';
k(:,i) = GC_EPO_a(M, T, 1.62E-11, 3.90E2, 4.77E-21);
Gstr{i,1} = 'RIPA'; Gstr{i,2} = 'OH'; 
fRIPA(i)=fRIPA(i)-1; fOH(i)=fOH(i)-1; fIEPOXA(i)=fIEPOXA(i)+0.67; fIEPOXB(i)=fIEPOXB(i)+0.33; fOH(i)=fOH(i)+1; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPB + OH = 0.655IHPOO3 + 0.345IHPOO2 + 0.005LVOC';
k(:,i) = GCARR_ac(T, 4.35E-12, 390.0);
Gstr{i,1} = 'RIPB'; Gstr{i,2} = 'OH'; 
fRIPB(i)=fRIPB(i)-1; fOH(i)=fOH(i)-1; fIHPOO3(i)=fIHPOO3(i)+0.655; fIHPOO2(i)=fIHPOO2(i)+0.345; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPB + OH = 0.68IEPOXA + 0.32IEPOXB + OH + 0.005LVOC';
k(:,i) = GC_EPO_a(M, T, 2.85E-11, 390.0, 4.77E-21);
Gstr{i,1} = 'RIPB'; Gstr{i,2} = 'OH'; 
fRIPB(i)=fRIPB(i)-1; fOH(i)=fOH(i)-1; fIEPOXA(i)=fIEPOXA(i)+0.68; fIEPOXB(i)=fIEPOXB(i)+0.32; fOH(i)=fOH(i)+1; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPA + OH = 0.75IHOO1 + 0.125MVK + 0.25CO + 0.125MVKHP + 0.25HO2 + 0.005LVOC';
k(:,i) = GCARR_ac(T, 6.10E-12, 200.0);
Gstr{i,1} = 'RIPA'; Gstr{i,2} = 'OH'; 
fRIPA(i)=fRIPA(i)-1; fOH(i)=fOH(i)-1; fIHOO1(i)=fIHOO1(i)+0.75; fMVK(i)=fMVK(i)+0.125; fCO(i)=fCO(i)+0.25; fMVKHP(i)=fMVKHP(i)+0.125; fHO2(i)=fHO2(i)+0.25; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPB + OH = 0.51IHOO4 + 0.16ICHOO + 0.33CO + 0.33HO2 + 0.165MACR + 0.165MCRHP + 0.005LVOC';
k(:,i) = GCARR_ac(T, 4.10E-12, 200.0);
Gstr{i,1} = 'RIPB'; Gstr{i,2} = 'OH'; 
fRIPB(i)=fRIPB(i)-1; fOH(i)=fOH(i)-1; fIHOO4(i)=fIHOO4(i)+0.51; fICHOO(i)=fICHOO(i)+0.16; fCO(i)=fCO(i)+0.33; fHO2(i)=fHO2(i)+0.33; fMACR(i)=fMACR(i)+0.165; fMCRHP(i)=fMCRHP(i)+0.165; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPC + OH = 0.595IHPOO1 + 0.03IHOO1 + 0.06HC5A + 0.024HO2 + 0.009HPALD3 + 0.015HPALD1 + 0.405OH + 0.036CO + 0.018CH2O + 0.018MGLY + 0.018HPETHNL + 0.018MCO3 + 0.255IEPOXD + 0.005LVOC';
k(:,i) = GCARR_ac(T, 3.53E-11, 390.0);
Gstr{i,1} = 'RIPC'; Gstr{i,2} = 'OH'; 
fRIPC(i)=fRIPC(i)-1; fOH(i)=fOH(i)-1; fIHPOO1(i)=fIHPOO1(i)+0.595; fIHOO1(i)=fIHOO1(i)+0.03; fHC5A(i)=fHC5A(i)+0.06; fHO2(i)=fHO2(i)+0.024; fHPALD3(i)=fHPALD3(i)+0.009; fHPALD1(i)=fHPALD1(i)+0.015; fOH(i)=fOH(i)+0.405; fCO(i)=fCO(i)+0.036; fCH2O(i)=fCH2O(i)+0.018; fMGLY(i)=fMGLY(i)+0.018; fHPETHNL(i)=fHPETHNL(i)+0.018; fMCO3(i)=fMCO3(i)+0.018; fIEPOXD(i)=fIEPOXD(i)+0.255; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'RIPD + OH = 0.255IHPOO2 + 0.03IHOO4 + 0.745OH + 0.06HC5A + 0.009HPALD4 + 0.015HPALD2 + 0.042HO2 + 0.018CH2O + 0.054CO + 0.018MGLY + 0.018ATOOH + 0.595IEPOXD + 0.005LVOC';
k(:,i) = GCARR_ac(T, 3.53E-11, 390.0);
Gstr{i,1} = 'RIPD'; Gstr{i,2} = 'OH'; 
fRIPD(i)=fRIPD(i)-1; fOH(i)=fOH(i)-1; fIHPOO2(i)=fIHPOO2(i)+0.255; fIHOO4(i)=fIHOO4(i)+0.03; fOH(i)=fOH(i)+0.745; fHC5A(i)=fHC5A(i)+0.06; fHPALD4(i)=fHPALD4(i)+0.009; fHPALD2(i)=fHPALD2(i)+0.015; fHO2(i)=fHO2(i)+0.042; fCH2O(i)=fCH2O(i)+0.018; fCO(i)=fCO(i)+0.054; fMGLY(i)=fMGLY(i)+0.018; fATOOH(i)=fATOOH(i)+0.018; fIEPOXD(i)=fIEPOXD(i)+0.595; fLVOC(i)=fLVOC(i)+0.005; 

i=i+1;
Rnames{i} = 'IHPOO1 = 0.176ICPDH + 0.824IDHPE + OH';
k(:,i) = GCARR_ac(T, 1.59E+13, -10000.0);
Gstr{i,1} = 'IHPOO1'; 
fIHPOO1(i)=fIHPOO1(i)-1; fICPDH(i)=fICPDH(i)+0.176; fIDHPE(i)=fIDHPE(i)+0.824; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO1 + NO = 0.716MCRHP + 0.716CH2O + 0.284HPETHNL + 0.284HAC + NO2 + HO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 2.1, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO1'; Gstr{i,2} = 'NO'; 
fIHPOO1(i)=fIHPOO1(i)-1; fNO(i)=fNO(i)-1; fMCRHP(i)=fMCRHP(i)+0.716; fCH2O(i)=fCH2O(i)+0.716; fHPETHNL(i)=fHPETHNL(i)+0.284; fHAC(i)=fHAC(i)+0.284; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO1 + NO = ITHN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 2.1, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO1'; Gstr{i,2} = 'NO'; 
fIHPOO1(i)=fIHPOO1(i)-1; fNO(i)=fNO(i)-1; fITHN(i)=fITHN(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO1 + HO2 = 0.725IDHDP + 0.14MCRHP + 0.14CH2O + 0.135HPETHNL + 0.135HAC + 0.275OH + 0.275HO2';
k(:,i) = GCARR_ac(T, 2.47E-13, 1300.0);
Gstr{i,1} = 'IHPOO1'; Gstr{i,2} = 'HO2'; 
fIHPOO1(i)=fIHPOO1(i)-1; fHO2(i)=fHO2(i)-1; fIDHDP(i)=fIDHDP(i)+0.725; fMCRHP(i)=fMCRHP(i)+0.14; fCH2O(i)=fCH2O(i)+0.14; fHPETHNL(i)=fHPETHNL(i)+0.135; fHAC(i)=fHAC(i)+0.135; fOH(i)=fOH(i)+0.275; fHO2(i)=fHO2(i)+0.275; 

i=i+1;
Rnames{i} = 'IHPOO2 = 0.548ICPDH + 0.452IDHPE + OH';
k(:,i) = GCARR_ac(T, 2.91E+13, -10000.0);
Gstr{i,1} = 'IHPOO2'; 
fIHPOO2(i)=fIHPOO2(i)-1; fICPDH(i)=fICPDH(i)+0.548; fIDHPE(i)=fIDHPE(i)+0.452; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO2 + NO = 0.706MVKHP + 0.706CH2O + 0.294GLYC + 0.294ATOOH + NO2 + HO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 2.315, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO2'; Gstr{i,2} = 'NO'; 
fIHPOO2(i)=fIHPOO2(i)-1; fNO(i)=fNO(i)-1; fMVKHP(i)=fMVKHP(i)+0.706; fCH2O(i)=fCH2O(i)+0.706; fGLYC(i)=fGLYC(i)+0.294; fATOOH(i)=fATOOH(i)+0.294; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO2 + NO = ITHN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 2.315, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO2'; Gstr{i,2} = 'NO'; 
fIHPOO2(i)=fIHPOO2(i)-1; fNO(i)=fNO(i)-1; fITHN(i)=fITHN(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO2 + HO2 = 0.725IDHDP + 0.14MVKHP + 0.14CH2O + 0.135GLYC + 0.135ATOOH + 0.275OH + 0.275HO2';
k(:,i) = GCARR_ac(T, 2.47E-13,  1300.0);
Gstr{i,1} = 'IHPOO2'; Gstr{i,2} = 'HO2'; 
fIHPOO2(i)=fIHPOO2(i)-1; fHO2(i)=fHO2(i)-1; fIDHDP(i)=fIDHDP(i)+0.725; fMVKHP(i)=fMVKHP(i)+0.14; fCH2O(i)=fCH2O(i)+0.14; fGLYC(i)=fGLYC(i)+0.135; fATOOH(i)=fATOOH(i)+0.135; fOH(i)=fOH(i)+0.275; fHO2(i)=fHO2(i)+0.275; 

i=i+1;
Rnames{i} = 'IHPOO3 = IDHPE';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'IHPOO3'; 
fIHPOO3(i)=fIHPOO3(i)-1; fIDHPE(i)=fIDHPE(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO3 + NO = GLYC + HAC + NO2 + OH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 3.079, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO3'; Gstr{i,2} = 'NO'; 
fIHPOO3(i)=fIHPOO3(i)-1; fNO(i)=fNO(i)-1; fGLYC(i)=fGLYC(i)+1; fHAC(i)=fHAC(i)+1; fNO2(i)=fNO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO3 + NO = ITHN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 3.079, 9.0, 1.0, 0.0);
Gstr{i,1} = 'IHPOO3'; Gstr{i,2} = 'NO'; 
fIHPOO3(i)=fIHPOO3(i)-1; fNO(i)=fNO(i)-1; fITHN(i)=fITHN(i)+1; 

i=i+1;
Rnames{i} = 'IHPOO3 + HO2 = 0.35IDHDP + 0.65GLYC + 0.65HAC + 1.3OH';
k(:,i) = GCARR_ac(T, 2.47E-13, 1300.0);
Gstr{i,1} = 'IHPOO3'; Gstr{i,2} = 'HO2'; 
fIHPOO3(i)=fIHPOO3(i)-1; fHO2(i)=fHO2(i)-1; fIDHDP(i)=fIDHDP(i)+0.35; fGLYC(i)=fGLYC(i)+0.65; fHAC(i)=fHAC(i)+0.65; fOH(i)=fOH(i)+1.3; 

i=i+1;
Rnames{i} = 'IEPOXD + OH = 0.75ICHE + 0.75HO2 + 0.25ICHOO';
k(:,i) = GCARR_ac(T, 3.22E-11, -400.0);
Gstr{i,1} = 'IEPOXD'; Gstr{i,2} = 'OH'; 
fIEPOXD(i)=fIEPOXD(i)-1; fOH(i)=fOH(i)-1; fICHE(i)=fICHE(i)+0.75; fHO2(i)=fHO2(i)+0.75; fICHOO(i)=fICHOO(i)+0.25; 

i=i+1;
Rnames{i} = 'IEPOXA + OH = ICHE + HO2';
k(:,i) = GCARR_ac(T, 1.05E-11, -400.0);
Gstr{i,1} = 'IEPOXA'; Gstr{i,2} = 'OH'; 
fIEPOXA(i)=fIEPOXA(i)-1; fOH(i)=fOH(i)-1; fICHE(i)=fICHE(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXA + OH = 0.67IEPOXAOO + 0.33IEPOXBOO';
k(:,i) = GC_EPO_a(M, T, 5.82E-11, -4.00E2, 1.14E-20);
Gstr{i,1} = 'IEPOXA'; Gstr{i,2} = 'OH'; 
fIEPOXA(i)=fIEPOXA(i)-1; fOH(i)=fOH(i)-1; fIEPOXAOO(i)=fIEPOXAOO(i)+0.67; fIEPOXBOO(i)=fIEPOXBOO(i)+0.33; 

i=i+1;
Rnames{i} = 'IEPOXB + OH = ICHE + HO2';
k(:,i) = GCARR_ac(T, 8.25E-12, -400.0);
Gstr{i,1} = 'IEPOXB'; Gstr{i,2} = 'OH'; 
fIEPOXB(i)=fIEPOXB(i)-1; fOH(i)=fOH(i)-1; fICHE(i)=fICHE(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXB + OH = 0.81IEPOXAOO + 0.19IEPOXBOO';
k(:,i) = GC_EPO_a(M, T, 3.75E-11, -4.00E2, 8.91E-21);
Gstr{i,1} = 'IEPOXB'; Gstr{i,2} = 'OH'; 
fIEPOXB(i)=fIEPOXB(i)-1; fOH(i)=fOH(i)-1; fIEPOXAOO(i)=fIEPOXAOO(i)+0.81; fIEPOXBOO(i)=fIEPOXBOO(i)+0.19; 

i=i+1;
Rnames{i} = 'IEPOXAOO = IDCHP + HO2';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'IEPOXAOO'; 
fIEPOXAOO(i)=fIEPOXAOO(i)-1; fIDCHP(i)=fIDCHP(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXAOO = OH + CO + MVKDH';
k(:,i) = GCARR_ac(T, 1.0E+7, -5000.0);
Gstr{i,1} = 'IEPOXAOO'; 
fIEPOXAOO(i)=fIEPOXAOO(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fMVKDH(i)=fMVKDH(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXAOO + HO2 = 0.13CO + 0.65OH + 0.65HO2 + 0.13MVKDH + 0.52GLYC + 0.52MGLY + 0.35ICPDH';
k(:,i) = GCARR_ac(T, 2.38E-13, 1300.0);
Gstr{i,1} = 'IEPOXAOO'; Gstr{i,2} = 'HO2'; 
fIEPOXAOO(i)=fIEPOXAOO(i)-1; fHO2(i)=fHO2(i)-1; fCO(i)=fCO(i)+0.13; fOH(i)=fOH(i)+0.65; fHO2(i)=fHO2(i)+0.65; fMVKDH(i)=fMVKDH(i)+0.13; fGLYC(i)=fGLYC(i)+0.52; fMGLY(i)=fMGLY(i)+0.52; fICPDH(i)=fICPDH(i)+0.35; 

i=i+1;
Rnames{i} = 'IEPOXAOO + NO = 0.2MVKDH + HO2 + NO2 + 0.2CO + 0.8GLYC + 0.8MGLY';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 13.098, 8.0, 1.0, 0.0);
Gstr{i,1} = 'IEPOXAOO'; Gstr{i,2} = 'NO'; 
fIEPOXAOO(i)=fIEPOXAOO(i)-1; fNO(i)=fNO(i)-1; fMVKDH(i)=fMVKDH(i)+0.2; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+0.2; fGLYC(i)=fGLYC(i)+0.8; fMGLY(i)=fMGLY(i)+0.8; 

i=i+1;
Rnames{i} = 'IEPOXAOO + NO = ITCN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 13.098, 8.0, 1.0, 0.0);
Gstr{i,1} = 'IEPOXAOO'; Gstr{i,2} = 'NO'; 
fIEPOXAOO(i)=fIEPOXAOO(i)-1; fNO(i)=fNO(i)-1; fITCN(i)=fITCN(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXBOO = IDCHP + HO2';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'IEPOXBOO'; 
fIEPOXBOO(i)=fIEPOXBOO(i)-1; fIDCHP(i)=fIDCHP(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXBOO = CO + OH + MCRDH';
k(:,i) = GCARR_ac(T, 1.0E+7, -5000.0);
Gstr{i,1} = 'IEPOXBOO'; 
fIEPOXBOO(i)=fIEPOXBOO(i)-1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fMCRDH(i)=fMCRDH(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXBOO + NO = NO2 + HO2 + 0.8GLYX + 0.8HAC + 0.2CO + 0.2MCRDH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 16.463, 8.0, 1.0, 0.0);
Gstr{i,1} = 'IEPOXBOO'; Gstr{i,2} = 'NO'; 
fIEPOXBOO(i)=fIEPOXBOO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fGLYX(i)=fGLYX(i)+0.8; fHAC(i)=fHAC(i)+0.8; fCO(i)=fCO(i)+0.2; fMCRDH(i)=fMCRDH(i)+0.2; 

i=i+1;
Rnames{i} = 'IEPOXBOO + NO = ITCN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 16.463, 8.0, 1.0, 0.0);
Gstr{i,1} = 'IEPOXBOO'; Gstr{i,2} = 'NO'; 
fIEPOXBOO(i)=fIEPOXBOO(i)-1; fNO(i)=fNO(i)-1; fITCN(i)=fITCN(i)+1; 

i=i+1;
Rnames{i} = 'IEPOXBOO + HO2 = 0.13CO + 0.65OH + 0.65HO2 + 0.13MCRDH + 0.52HAC + 0.52GLYX + 0.35ICPDH';
k(:,i) = GCARR_ac(T, 2.38E-13, 1300.0);
Gstr{i,1} = 'IEPOXBOO'; Gstr{i,2} = 'HO2'; 
fIEPOXBOO(i)=fIEPOXBOO(i)-1; fHO2(i)=fHO2(i)-1; fCO(i)=fCO(i)+0.13; fOH(i)=fOH(i)+0.65; fHO2(i)=fHO2(i)+0.65; fMCRDH(i)=fMCRDH(i)+0.13; fHAC(i)=fHAC(i)+0.52; fGLYX(i)=fGLYX(i)+0.52; fICPDH(i)=fICPDH(i)+0.35; 

i=i+1;
Rnames{i} = 'ICHOO + HO2 = 0.35ICPDH + 0.65OH + 0.52CO + 0.13MVKHC + 0.65CH2O + 0.65HO2 + 0.52HAC';
k(:,i) = GCARR_ac(T, 2.38E-13, 1300.0);
Gstr{i,1} = 'ICHOO'; Gstr{i,2} = 'HO2'; 
fICHOO(i)=fICHOO(i)-1; fHO2(i)=fHO2(i)-1; fICPDH(i)=fICPDH(i)+0.35; fOH(i)=fOH(i)+0.65; fCO(i)=fCO(i)+0.52; fMVKHC(i)=fMVKHC(i)+0.13; fCH2O(i)=fCH2O(i)+0.65; fHO2(i)=fHO2(i)+0.65; fHAC(i)=fHAC(i)+0.52; 

i=i+1;
Rnames{i} = 'ICHOO + NO = ITCN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 3.50E2, 13.098, 8.0, 1.0, 0.0);
Gstr{i,1} = 'ICHOO'; Gstr{i,2} = 'NO'; 
fICHOO(i)=fICHOO(i)-1; fNO(i)=fNO(i)-1; fITCN(i)=fITCN(i)+1; 

i=i+1;
Rnames{i} = 'ICHOO + NO = NO2 + 0.8HAC + 0.8CO + CH2O + HO2 + 0.2MVKHC';
k(:,i) = GC_ALK(M, T, 2.7E-12, 3.50E2, 13.098, 8.0, 1.0, 0.0);
Gstr{i,1} = 'ICHOO'; Gstr{i,2} = 'NO'; 
fICHOO(i)=fICHOO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHAC(i)=fHAC(i)+0.8; fCO(i)=fCO(i)+0.8; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fMVKHC(i)=fMVKHC(i)+0.2; 

i=i+1;
Rnames{i} = 'ICHOO = HO2 + 2.000CO + HAC + OH';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'ICHOO'; 
fICHOO(i)=fICHOO(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+2.000; fHAC(i)=fHAC(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'HPALD1OO + NO = NO2 + OH + CO2 + MVK';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'HPALD1OO'; Gstr{i,2} = 'NO'; 
fHPALD1OO(i)=fHPALD1OO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; fMVK(i)=fMVK(i)+1; 

i=i+1;
Rnames{i} = 'HPALD1OO + HO2 = OH + OH + CO2 + MVK';
k(:,i) = GCARR_ac(T, 2.38E-13, 1300.0);
Gstr{i,1} = 'HPALD1OO'; Gstr{i,2} = 'HO2'; 
fHPALD1OO(i)=fHPALD1OO(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; fMVK(i)=fMVK(i)+1; 

i=i+1;
Rnames{i} = 'HPALD2OO + NO = NO2 + OH + CO2 + MACR';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'HPALD2OO'; Gstr{i,2} = 'NO'; 
fHPALD2OO(i)=fHPALD2OO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; fMACR(i)=fMACR(i)+1; 

i=i+1;
Rnames{i} = 'HPALD2OO + HO2 = OH + OH + CO2 + MACR';
k(:,i) = GCARR_ac(T, 2.38E-13, 1300.0);
Gstr{i,1} = 'HPALD2OO'; Gstr{i,2} = 'HO2'; 
fHPALD2OO(i)=fHPALD2OO(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; fMACR(i)=fMACR(i)+1; 

i=i+1;
Rnames{i} = 'IHN2 + OH = ISOPNOO1';
k(:,i) = GCARR_ac(T, 7.14E-12, 390.0);
Gstr{i,1} = 'IHN2'; Gstr{i,2} = 'OH'; 
fIHN2(i)=fIHN2(i)-1; fOH(i)=fOH(i)-1; fISOPNOO1(i)=fISOPNOO1(i)+1; 

i=i+1;
Rnames{i} = 'IHN2 + OH = 0.67IEPOXA + 0.33IEPOXB + NO2';
k(:,i) = GC_EPO_a(M, T, 6.30E-12, 390.0, 1.62E-19);
Gstr{i,1} = 'IHN2'; Gstr{i,2} = 'OH'; 
fIHN2(i)=fIHN2(i)-1; fOH(i)=fOH(i)-1; fIEPOXA(i)=fIEPOXA(i)+0.67; fIEPOXB(i)=fIEPOXB(i)+0.33; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN3 + OH = ISOPNOO2';
k(:,i) = GCARR_ac(T, 1.02E-11, 390.0);
Gstr{i,1} = 'IHN3'; Gstr{i,2} = 'OH'; 
fIHN3(i)=fIHN3(i)-1; fOH(i)=fOH(i)-1; fISOPNOO2(i)=fISOPNOO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN3 + OH = 0.67IEPOXA + 0.33IEPOXB + NO2';
k(:,i) = GC_EPO_a(M, T, 1.05E-11, 390.0, 2.49E-19);
Gstr{i,1} = 'IHN3'; Gstr{i,2} = 'OH'; 
fIHN3(i)=fIHN3(i)-1; fOH(i)=fOH(i)-1; fIEPOXA(i)=fIEPOXA(i)+0.67; fIEPOXB(i)=fIEPOXB(i)+0.33; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN1 + OH = IEPOXD + NO2';
k(:,i) = GC_EPO_a(M, T, 1.55E-11, 390.0, 2.715E-19);
Gstr{i,1} = 'IHN1'; Gstr{i,2} = 'OH'; 
fIHN1(i)=fIHN1(i)-1; fOH(i)=fOH(i)-1; fIEPOXD(i)=fIEPOXD(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN1 + OH = IDHNDOO1';
k(:,i) = GCARR_ac(T, 2.04E-11, 390.0);
Gstr{i,1} = 'IHN1'; Gstr{i,2} = 'OH'; 
fIHN1(i)=fIHN1(i)-1; fOH(i)=fOH(i)-1; fIDHNDOO1(i)=fIDHNDOO1(i)+1; 

i=i+1;
Rnames{i} = 'IHN4 + OH = IEPOXD + NO2';
k(:,i) = GC_EPO_a(M, T, 9.52E-12, 390.0, 2.715E-19);
Gstr{i,1} = 'IHN4'; Gstr{i,2} = 'OH'; 
fIHN4(i)=fIHN4(i)-1; fOH(i)=fOH(i)-1; fIEPOXD(i)=fIEPOXD(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN4 + OH = IDHNDOO2';
k(:,i) = GCARR_ac(T, 2.95E-11, 390.0);
Gstr{i,1} = 'IHN4'; Gstr{i,2} = 'OH'; 
fIHN4(i)=fIHN4(i)-1; fOH(i)=fOH(i)-1; fIDHNDOO2(i)=fIDHNDOO2(i)+1; 

i=i+1;
Rnames{i} = 'IHN1 + OH = 0.6OH + 0.6CO + 0.6MCRHNB + 0.4HO2 + 0.4ICN';
k(:,i) = GCARR_ac(T, 7.5E-12, 20.0);
Gstr{i,1} = 'IHN1'; Gstr{i,2} = 'OH'; 
fIHN1(i)=fIHN1(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.6; fCO(i)=fCO(i)+0.6; fMCRHNB(i)=fMCRHNB(i)+0.6; fHO2(i)=fHO2(i)+0.4; fICN(i)=fICN(i)+0.4; 

i=i+1;
Rnames{i} = 'IHN4 + OH = 0.6OH + 0.6CO + 0.6MVKN + 0.4HO2 + 0.4ICN';
k(:,i) = GCARR_ac(T, 7.5E-12, 20.0);
Gstr{i,1} = 'IHN4'; Gstr{i,2} = 'OH'; 
fIHN4(i)=fIHN4(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.6; fCO(i)=fCO(i)+0.6; fMVKN(i)=fMVKN(i)+0.6; fHO2(i)=fHO2(i)+0.4; fICN(i)=fICN(i)+0.4; 

i=i+1;
Rnames{i} = 'ISOPNOO1 = ITCN + HO2';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'ISOPNOO1'; 
fISOPNOO1(i)=fISOPNOO1(i)-1; fITCN(i)=fITCN(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOPNOO1 + HO2 = 0.482ITHN + 0.059MCRHN + 0.059CH2O + 0.459GLYC + 0.459HAC + 0.059HO2 + 0.459NO2 + 0.518OH';
k(:,i) = GCARR_ac(T, 2.60E-13, 1300.0);
Gstr{i,1} = 'ISOPNOO1'; Gstr{i,2} = 'HO2'; 
fISOPNOO1(i)=fISOPNOO1(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.482; fMCRHN(i)=fMCRHN(i)+0.059; fCH2O(i)=fCH2O(i)+0.059; fGLYC(i)=fGLYC(i)+0.459; fHAC(i)=fHAC(i)+0.459; fHO2(i)=fHO2(i)+0.059; fNO2(i)=fNO2(i)+0.459; fOH(i)=fOH(i)+0.518; 

i=i+1;
Rnames{i} = 'ISOPNOO1 + NO = 0.272MCRHN + 0.272CH2O + 0.728GLYC + 0.728HAC + 0.272HO2 + 1.728NO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 6.32, 11.0, 1.0, 0.0);
Gstr{i,1} = 'ISOPNOO1'; Gstr{i,2} = 'NO'; 
fISOPNOO1(i)=fISOPNOO1(i)-1; fNO(i)=fNO(i)-1; fMCRHN(i)=fMCRHN(i)+0.272; fCH2O(i)=fCH2O(i)+0.272; fGLYC(i)=fGLYC(i)+0.728; fHAC(i)=fHAC(i)+0.728; fHO2(i)=fHO2(i)+0.272; fNO2(i)=fNO2(i)+1.728; 

i=i+1;
Rnames{i} = 'ISOPNOO1 + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 6.32, 11.0, 1.0, 0.0);
Gstr{i,1} = 'ISOPNOO1'; Gstr{i,2} = 'NO'; 
fISOPNOO1(i)=fISOPNOO1(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'ISOPNOO2 = ITCN + HO2';
k(:,i) = GCARR_ac(T, 1.875E+13, -10000.0);
Gstr{i,1} = 'ISOPNOO2'; 
fISOPNOO2(i)=fISOPNOO2(i)-1; fITCN(i)=fITCN(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOPNOO2 + HO2 = 0.401ITHN + 0.599MVKN + 0.599CH2O + 0.599HO2 + 0.599OH';
k(:,i) = GCARR_ac(T, 2.60E-13,  1300.0);
Gstr{i,1} = 'ISOPNOO2'; Gstr{i,2} = 'HO2'; 
fISOPNOO2(i)=fISOPNOO2(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.401; fMVKN(i)=fMVKN(i)+0.599; fCH2O(i)=fCH2O(i)+0.599; fHO2(i)=fHO2(i)+0.599; fOH(i)=fOH(i)+0.599; 

i=i+1;
Rnames{i} = 'ISOPNOO2 + NO = MVKN + CH2O + HO2 + NO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 7.941, 11.0, 1.0, 0.0);
Gstr{i,1} = 'ISOPNOO2'; Gstr{i,2} = 'NO'; 
fISOPNOO2(i)=fISOPNOO2(i)-1; fNO(i)=fNO(i)-1; fMVKN(i)=fMVKN(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ISOPNOO2 + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 7.941, 11.0, 1.0, 0.0);
Gstr{i,1} = 'ISOPNOO2'; Gstr{i,2} = 'NO'; 
fISOPNOO2(i)=fISOPNOO2(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO1 = ITCN + HO2';
k(:,i) = GCARR_ac(T, 1.256E+13, -10000.0);
Gstr{i,1} = 'IDHNDOO1'; 
fIDHNDOO1(i)=fIDHNDOO1(i)-1; fITCN(i)=fITCN(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO2 = ITCN + HO2';
k(:,i) = GCARR_ac(T, 5.092E+12, -10000.0);
Gstr{i,1} = 'IDHNDOO2'; 
fIDHNDOO2(i)=fIDHNDOO2(i)-1; fITCN(i)=fITCN(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO1 + HO2 = 0.418ITHN + 0.551PROPNN + 0.551GLYC + 0.031MCRHNB + 0.031CH2O + 0.582HO2 + 0.582OH';
k(:,i) = GCARR_ac(T, 2.60E-13, 1300.0);
Gstr{i,1} = 'IDHNDOO1'; Gstr{i,2} = 'HO2'; 
fIDHNDOO1(i)=fIDHNDOO1(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.418; fPROPNN(i)=fPROPNN(i)+0.551; fGLYC(i)=fGLYC(i)+0.551; fMCRHNB(i)=fMCRHNB(i)+0.031; fCH2O(i)=fCH2O(i)+0.031; fHO2(i)=fHO2(i)+0.582; fOH(i)=fOH(i)+0.582; 

i=i+1;
Rnames{i} = 'IDHNDOO1 + NO = 0.935PROPNN + 0.935GLYC + 0.065MCRHNB + 0.065CH2O + HO2 + NO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 4.712, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNDOO1'; Gstr{i,2} = 'NO'; 
fIDHNDOO1(i)=fIDHNDOO1(i)-1; fNO(i)=fNO(i)-1; fPROPNN(i)=fPROPNN(i)+0.935; fGLYC(i)=fGLYC(i)+0.935; fMCRHNB(i)=fMCRHNB(i)+0.065; fCH2O(i)=fCH2O(i)+0.065; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO1 + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 4.712, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNDOO1'; Gstr{i,2} = 'NO'; 
fIDHNDOO1(i)=fIDHNDOO1(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO2 + HO2 = 0.494ITHN + 0.441HAC + 0.441ETHLN + 0.065MVKN + 0.065CH2O + 0.506OH + 0.506HO2';
k(:,i) = GCARR_ac(T, 2.60E-13, 1300.0);
Gstr{i,1} = 'IDHNDOO2'; Gstr{i,2} = 'HO2'; 
fIDHNDOO2(i)=fIDHNDOO2(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.494; fHAC(i)=fHAC(i)+0.441; fETHLN(i)=fETHLN(i)+0.441; fMVKN(i)=fMVKN(i)+0.065; fCH2O(i)=fCH2O(i)+0.065; fOH(i)=fOH(i)+0.506; fHO2(i)=fHO2(i)+0.506; 

i=i+1;
Rnames{i} = 'IDHNDOO2 + NO = 0.858HAC + 0.858ETHLN + 0.142MVKN + 0.142CH2O + HO2 + NO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 2.258, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNDOO2'; Gstr{i,2} = 'NO'; 
fIDHNDOO2(i)=fIDHNDOO2(i)-1; fNO(i)=fNO(i)-1; fHAC(i)=fHAC(i)+0.858; fETHLN(i)=fETHLN(i)+0.858; fMVKN(i)=fMVKN(i)+0.142; fCH2O(i)=fCH2O(i)+0.142; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IDHNDOO2 + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 2.258, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNDOO2'; Gstr{i,2} = 'NO'; 
fIDHNDOO2(i)=fIDHNDOO2(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'IDHNBOO + HO2 = 0.379HO2 + 0.379OH + 0.621ITHN + 0.094MCRHNB + 0.242GLYC + 0.242PROPNN + 0.010MVKN + 0.033HAC + 0.033ETHLN + 0.104CH2O';
k(:,i) = GCARR_ac(T, 2.60E-13, 1300.0);
Gstr{i,1} = 'IDHNBOO'; Gstr{i,2} = 'HO2'; 
fIDHNBOO(i)=fIDHNBOO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+0.379; fOH(i)=fOH(i)+0.379; fITHN(i)=fITHN(i)+0.621; fMCRHNB(i)=fMCRHNB(i)+0.094; fGLYC(i)=fGLYC(i)+0.242; fPROPNN(i)=fPROPNN(i)+0.242; fMVKN(i)=fMVKN(i)+0.010; fHAC(i)=fHAC(i)+0.033; fETHLN(i)=fETHLN(i)+0.033; fCH2O(i)=fCH2O(i)+0.104; 

i=i+1;
Rnames{i} = 'IDHNBOO + NO = 0.355MCRHNB + 0.546PROPNN + 0.546GLYC + 0.028MVKN + 0.071ETHLN + 0.071HAC + HO2 + NO2 + 0.383CH2O';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 1.851, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNBOO'; Gstr{i,2} = 'NO'; 
fIDHNBOO(i)=fIDHNBOO(i)-1; fNO(i)=fNO(i)-1; fMCRHNB(i)=fMCRHNB(i)+0.355; fPROPNN(i)=fPROPNN(i)+0.546; fGLYC(i)=fGLYC(i)+0.546; fMVKN(i)=fMVKN(i)+0.028; fETHLN(i)=fETHLN(i)+0.071; fHAC(i)=fHAC(i)+0.071; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+0.383; 

i=i+1;
Rnames{i} = 'IDHNBOO + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 1.851, 11.0, 1.0, 0.0);
Gstr{i,1} = 'IDHNBOO'; Gstr{i,2} = 'NO'; 
fIDHNBOO(i)=fIDHNBOO(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'ISOP + NO3 = 0.465INO2B + 0.535INO2D + LISOPNO3';
k(:,i) = GCARR_ac(T, 2.95E-12, 450.0);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'NO3'; 
fISOP(i)=fISOP(i)-1; fNO3(i)=fNO3(i)-1; fINO2B(i)=fINO2B(i)+0.465; fINO2D(i)=fINO2D(i)+0.535; fLISOPNO3(i)=fLISOPNO3(i)+1; 

i=i+1;
Rnames{i} = 'INO2B + HO2 = 0.473INPB + 0.048MACR + 0.479MVK + 0.527OH + 0.527CH2O + 0.527NO2';
k(:,i) = GCARR_ac(T, 2.47E-13, 1300.0);
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'HO2'; 
fINO2B(i)=fINO2B(i)-1; fHO2(i)=fHO2(i)-1; fINPB(i)=fINPB(i)+0.473; fMACR(i)=fMACR(i)+0.048; fMVK(i)=fMVK(i)+0.479; fOH(i)=fOH(i)+0.527; fCH2O(i)=fCH2O(i)+0.527; fNO2(i)=fNO2(i)+0.527; 

i=i+1;
Rnames{i} = 'INO2D + HO2 = INPD';
k(:,i) = GCARR_ac(T, 2.47E-13, 1300.0);
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'HO2'; 
fINO2D(i)=fINO2D(i)-1; fHO2(i)=fHO2(i)-1; fINPD(i)=fINPD(i)+1; 

i=i+1;
Rnames{i} = 'INO2B + INO2B = 1.737MVK + 0.123MACR + 1.860CH2O + 1.860NO2 + 0.070INPB + 0.070ICN';
k(:,i) = 1.61E-12;
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'INO2B'; 
fINO2B(i)=fINO2B(i)-1; fINO2B(i)=fINO2B(i)-1; fMVK(i)=fMVK(i)+1.737; fMACR(i)=fMACR(i)+0.123; fCH2O(i)=fCH2O(i)+1.860; fNO2(i)=fNO2(i)+1.860; fINPB(i)=fINPB(i)+0.070; fICN(i)=fICN(i)+0.070; 

i=i+1;
Rnames{i} = 'INO2B + INO2D = 0.399INPB + 0.544MVK + 0.532ICN + 0.563NO2 + 0.474INA + 0.089HO2 + 0.019MACR + 0.563CH2O + 0.032IHN1';
k(:,i) = 2.56E-12;
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'INO2D'; 
fINO2B(i)=fINO2B(i)-1; fINO2D(i)=fINO2D(i)-1; fINPB(i)=fINPB(i)+0.399; fMVK(i)=fMVK(i)+0.544; fICN(i)=fICN(i)+0.532; fNO2(i)=fNO2(i)+0.563; fINA(i)=fINA(i)+0.474; fHO2(i)=fHO2(i)+0.089; fMACR(i)=fMACR(i)+0.019; fCH2O(i)=fCH2O(i)+0.563; fIHN1(i)=fIHN1(i)+0.032; 

i=i+1;
Rnames{i} = 'INO2D + INO2D = 0.064HO2 + 0.340INA + 0.861ICN + 0.671IHN1 + 0.127IHN4';
k(:,i) = 3.71E-12;
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'INO2D'; 
fINO2D(i)=fINO2D(i)-1; fINO2D(i)=fINO2D(i)-1; fHO2(i)=fHO2(i)+0.064; fINA(i)=fINA(i)+0.340; fICN(i)=fICN(i)+0.861; fIHN1(i)=fIHN1(i)+0.671; fIHN4(i)=fIHN4(i)+0.127; 

i=i+1;
Rnames{i} = 'INO2D + MO2 = 0.298IHN1 + 0.057IHN4 + 0.244INA + 0.401ICN + 0.355MOH + 0.336HO2 + 0.645CH2O';
k(:,i) = 1.18E-12;
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'MO2'; 
fINO2D(i)=fINO2D(i)-1; fMO2(i)=fMO2(i)-1; fIHN1(i)=fIHN1(i)+0.298; fIHN4(i)=fIHN4(i)+0.057; fINA(i)=fINA(i)+0.244; fICN(i)=fICN(i)+0.401; fMOH(i)=fMOH(i)+0.355; fHO2(i)=fHO2(i)+0.336; fCH2O(i)=fCH2O(i)+0.645; 

i=i+1;
Rnames{i} = 'INO2B + MO2 = 0.355INPB + 0.583MVK + 0.028MACR + 0.034ICN + 0.611HO2 + 1.577CH2O + 0.611NO2 + 0.034MOH';
k(:,i) = 2.80E-13;
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'MO2'; 
fINO2B(i)=fINO2B(i)-1; fMO2(i)=fMO2(i)-1; fINPB(i)=fINPB(i)+0.355; fMVK(i)=fMVK(i)+0.583; fMACR(i)=fMACR(i)+0.028; fICN(i)=fICN(i)+0.034; fHO2(i)=fHO2(i)+0.611; fCH2O(i)=fCH2O(i)+1.577; fNO2(i)=fNO2(i)+0.611; fMOH(i)=fMOH(i)+0.034; 

i=i+1;
Rnames{i} = 'INO2B + MCO3 = CH2O + NO2 + MO2 + 0.903MVK + 0.097MACR';
k(:,i) = 1.92E-12;
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'MCO3'; 
fINO2B(i)=fINO2B(i)-1; fMCO3(i)=fMCO3(i)-1; fCH2O(i)=fCH2O(i)+1; fNO2(i)=fNO2(i)+1; fMO2(i)=fMO2(i)+1; fMVK(i)=fMVK(i)+0.903; fMACR(i)=fMACR(i)+0.097; 

i=i+1;
Rnames{i} = 'INO2D + MCO3 = MO2 + 0.841INA + 0.159HO2 + 0.159ICN';
k(:,i) = 7.71E-12;
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'MCO3'; 
fINO2D(i)=fINO2D(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fINA(i)=fINA(i)+0.841; fHO2(i)=fHO2(i)+0.159; fICN(i)=fICN(i)+0.159; 

i=i+1;
Rnames{i} = 'INO2B + NO3 = CH2O + 2NO2 + 0.903MVK + 0.097MACR';
k(:,i) = 2.3E-12;
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'NO3'; 
fINO2B(i)=fINO2B(i)-1; fNO3(i)=fNO3(i)-1; fCH2O(i)=fCH2O(i)+1; fNO2(i)=fNO2(i)+2; fMVK(i)=fMVK(i)+0.903; fMACR(i)=fMACR(i)+0.097; 

i=i+1;
Rnames{i} = 'INO2D + NO3 = NO2 + 0.841INA + 0.159HO2 + 0.159ICN';
k(:,i) = 2.3E-12;
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'NO3'; 
fINO2D(i)=fINO2D(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fINA(i)=fINA(i)+0.841; fHO2(i)=fHO2(i)+0.159; fICN(i)=fICN(i)+0.159; 

i=i+1;
Rnames{i} = 'INO2B + NO = 2NO2 + CH2O + 0.096MACR + 0.904MVK';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 12.915, 9.0, 1.0, 0.0);
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'NO'; 
fINO2B(i)=fINO2B(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2; fCH2O(i)=fCH2O(i)+1; fMACR(i)=fMACR(i)+0.096; fMVK(i)=fMVK(i)+0.904; 

i=i+1;
Rnames{i} = 'INO2B + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 12.915, 9.0, 1.0, 0.0);
Gstr{i,1} = 'INO2B'; Gstr{i,2} = 'NO'; 
fINO2B(i)=fINO2B(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'INO2D + NO = NO2 + 0.159HO2 + 0.159ICN + 0.841INA';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 1.412, 9.0, 1.0, 0.0);
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'NO'; 
fINO2D(i)=fINO2D(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+0.159; fICN(i)=fICN(i)+0.159; fINA(i)=fINA(i)+0.841; 

i=i+1;
Rnames{i} = 'INO2D + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 1.412, 9.0, 1.0, 0.0);
Gstr{i,1} = 'INO2D'; Gstr{i,2} = 'NO'; 
fINO2D(i)=fINO2D(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'INA + O2 = ICN + HO2';
k(:,i) = GCARR_ac(T, 2.50E-14, -300.0).*0.21.*M;
Gstr{i,1} = 'INA'; 
fINA(i)=fINA(i)-1; fICN(i)=fICN(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'INA = IDHNBOO';
k(:,i) = GCARR_ac(T, 1.00E+20, -10000.0);
Gstr{i,1} = 'INA'; 
fINA(i)=fINA(i)-1; fIDHNBOO(i)=fIDHNBOO(i)+1; 

i=i+1;
Rnames{i} = 'INPB + OH = 0.670IHPNBOO + 0.33IDHNBOO';
k(:,i) = GCARR_ac(T, 5.88E-12, 390.0);
Gstr{i,1} = 'INPB'; Gstr{i,2} = 'OH'; 
fINPB(i)=fINPB(i)-1; fOH(i)=fOH(i)-1; fIHPNBOO(i)=fIHPNBOO(i)+0.670; fIDHNBOO(i)=fIDHNBOO(i)+0.33; 

i=i+1;
Rnames{i} = 'INPD + OH = IHPNDOO';
k(:,i) = GCARR_ac(T, 1.61E-11, 390.0);
Gstr{i,1} = 'INPD'; Gstr{i,2} = 'OH'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)-1; fIHPNDOO(i)=fIHPNDOO(i)+1; 

i=i+1;
Rnames{i} = 'INPB + OH = OH + ITHN';
k(:,i) = GC_EPO_a(M, T, 4.471E-12, 390.0, 2.28E-20);
Gstr{i,1} = 'INPB'; Gstr{i,2} = 'OH'; 
fINPB(i)=fINPB(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fITHN(i)=fITHN(i)+1; 

i=i+1;
Rnames{i} = 'INPD + OH = OH + ITHN';
k(:,i) = GC_EPO_a(M, T, 8.77E-12,  390.0, 2.185E-20);
Gstr{i,1} = 'INPD'; Gstr{i,2} = 'OH'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fITHN(i)=fITHN(i)+1; 

i=i+1;
Rnames{i} = 'INPD + OH = NO2 + ICHE';
k(:,i) = GC_EPO_a(M, T, 1.493E-11, 390.0, 2.715E-19);
Gstr{i,1} = 'INPD'; Gstr{i,2} = 'OH'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; fICHE(i)=fICHE(i)+1; 

i=i+1;
Rnames{i} = 'INPB + OH = INO2B';
k(:,i) = GCARR_ac(T, 2.278E-12, 200.0);
Gstr{i,1} = 'INPB'; Gstr{i,2} = 'OH'; 
fINPB(i)=fINPB(i)-1; fOH(i)=fOH(i)-1; fINO2B(i)=fINO2B(i)+1; 

i=i+1;
Rnames{i} = 'INPD + OH = INO2D';
k(:,i) = GCARR_ac(T, 3.40E-12, 200.0);
Gstr{i,1} = 'INPD'; Gstr{i,2} = 'OH'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)-1; fINO2D(i)=fINO2D(i)+1; 

i=i+1;
Rnames{i} = 'INPD + OH = ICN + OH';
k(:,i) = GCARR_ac(T, 7.50E-12, 20.0);
Gstr{i,1} = 'INPD'; Gstr{i,2} = 'OH'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)-1; fICN(i)=fICN(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'IHPNDOO = OH + ITCN';
k(:,i) = GCARR_ac(T, 6.55E+12, -10000.0);
Gstr{i,1} = 'IHPNDOO'; 
fIHPNDOO(i)=fIHPNDOO(i)-1; fOH(i)=fOH(i)+1; fITCN(i)=fITCN(i)+1; 

i=i+1;
Rnames{i} = 'IHPNBOO = OH + 0.5ITCN + 0.5ITHN';
k(:,i) = GCARR_ac(T, 8.72E+12, -10000.0);
Gstr{i,1} = 'IHPNBOO'; 
fIHPNBOO(i)=fIHPNBOO(i)-1; fOH(i)=fOH(i)+1; fITCN(i)=fITCN(i)+0.5; fITHN(i)=fITHN(i)+0.5; 

i=i+1;
Rnames{i} = 'IHPNBOO + HO2 = 0.234ITHN + 0.060MCRHNB + 0.340GLYC + 0.249HPETHNL + 0.004MCRHP + 0.008MVKN + 0.009ATOOH + 0.054MVKHP + 0.042HAC + 1.147OH + 0.326HO2 + 0.058NO2 + 0.126CH2O + 0.589PROPNN + 0.051ETHLN';
k(:,i) = GCARR_ac(T, 2.64E-13, 1300.0);
Gstr{i,1} = 'IHPNBOO'; Gstr{i,2} = 'HO2'; 
fIHPNBOO(i)=fIHPNBOO(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.234; fMCRHNB(i)=fMCRHNB(i)+0.060; fGLYC(i)=fGLYC(i)+0.340; fHPETHNL(i)=fHPETHNL(i)+0.249; fMCRHP(i)=fMCRHP(i)+0.004; fMVKN(i)=fMVKN(i)+0.008; fATOOH(i)=fATOOH(i)+0.009; fMVKHP(i)=fMVKHP(i)+0.054; fHAC(i)=fHAC(i)+0.042; fOH(i)=fOH(i)+1.147; fHO2(i)=fHO2(i)+0.326; fNO2(i)=fNO2(i)+0.058; fCH2O(i)=fCH2O(i)+0.126; fPROPNN(i)=fPROPNN(i)+0.589; fETHLN(i)=fETHLN(i)+0.051; 

i=i+1;
Rnames{i} = 'IHPNDOO + HO2 = 0.387ITHN + 0.073MCRHNB + 0.471HPETHNL + 0.015MVKN + 0.054ATOOH + 0.646OH + 0.580HO2 + 0.088CH2O + 0.471PROPNN + 0.054ETHLN';
k(:,i) = GCARR_ac(T, 2.64E-13, 1300.0);
Gstr{i,1} = 'IHPNDOO'; Gstr{i,2} = 'HO2'; 
fIHPNDOO(i)=fIHPNDOO(i)-1; fHO2(i)=fHO2(i)-1; fITHN(i)=fITHN(i)+0.387; fMCRHNB(i)=fMCRHNB(i)+0.073; fHPETHNL(i)=fHPETHNL(i)+0.471; fMVKN(i)=fMVKN(i)+0.015; fATOOH(i)=fATOOH(i)+0.054; fOH(i)=fOH(i)+0.646; fHO2(i)=fHO2(i)+0.580; fCH2O(i)=fCH2O(i)+0.088; fPROPNN(i)=fPROPNN(i)+0.471; fETHLN(i)=fETHLN(i)+0.054; 

i=i+1;
Rnames{i} = 'IHPNBOO + NO = 0.384GLYC + 0.170MCRHNB + 0.303HPETHNL + 0.014MVKN + 0.051HAC + 0.013ATOOH + 0.059MVKHP + 0.006MCRHP + 0.687PROPNN + 0.064ETHLN + 0.249CH2O + 1.065NO2 + 0.500HO2 + 0.435OH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 6.092, 12.0, 1.0, 0.0);
Gstr{i,1} = 'IHPNBOO'; Gstr{i,2} = 'NO'; 
fIHPNBOO(i)=fIHPNBOO(i)-1; fNO(i)=fNO(i)-1; fGLYC(i)=fGLYC(i)+0.384; fMCRHNB(i)=fMCRHNB(i)+0.170; fHPETHNL(i)=fHPETHNL(i)+0.303; fMVKN(i)=fMVKN(i)+0.014; fHAC(i)=fHAC(i)+0.051; fATOOH(i)=fATOOH(i)+0.013; fMVKHP(i)=fMVKHP(i)+0.059; fMCRHP(i)=fMCRHP(i)+0.006; fPROPNN(i)=fPROPNN(i)+0.687; fETHLN(i)=fETHLN(i)+0.064; fCH2O(i)=fCH2O(i)+0.249; fNO2(i)=fNO2(i)+1.065; fHO2(i)=fHO2(i)+0.500; fOH(i)=fOH(i)+0.435; 

i=i+1;
Rnames{i} = 'IHPNBOO + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 6.092, 12.0, 1.0, 0.0);
Gstr{i,1} = 'IHPNBOO'; Gstr{i,2} = 'NO'; 
fIHPNBOO(i)=fIHPNBOO(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'IHPNDOO + NO = 0.291MCRHNB + 0.590HPETHNL + 0.070ATOOH + 0.049MVKN + 0.590PROPNN + 0.070ETHLN + 0.340CH2O + 1.000NO2 + 0.904HO2 + 0.096OH';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 4.383, 12.0, 1.0, 0.0);
Gstr{i,1} = 'IHPNDOO'; Gstr{i,2} = 'NO'; 
fIHPNDOO(i)=fIHPNDOO(i)-1; fNO(i)=fNO(i)-1; fMCRHNB(i)=fMCRHNB(i)+0.291; fHPETHNL(i)=fHPETHNL(i)+0.590; fATOOH(i)=fATOOH(i)+0.070; fMVKN(i)=fMVKN(i)+0.049; fPROPNN(i)=fPROPNN(i)+0.590; fETHLN(i)=fETHLN(i)+0.070; fCH2O(i)=fCH2O(i)+0.340; fNO2(i)=fNO2(i)+1.000; fHO2(i)=fHO2(i)+0.904; fOH(i)=fOH(i)+0.096; 

i=i+1;
Rnames{i} = 'IHPNDOO + NO = IDN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 4.383, 12.0, 1.0, 0.0);
Gstr{i,1} = 'IHPNDOO'; Gstr{i,2} = 'NO'; 
fIHPNDOO(i)=fIHPNDOO(i)-1; fNO(i)=fNO(i)-1; fIDN(i)=fIDN(i)+1; 

i=i+1;
Rnames{i} = 'ICN + OH = NO2 + ICHE';
k(:,i) = GC_EPO_a(M, T, 2.97E-12, 390.0, 2.715E-19);
Gstr{i,1} = 'ICN'; Gstr{i,2} = 'OH'; 
fICN(i)=fICN(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; fICHE(i)=fICHE(i)+1; 

i=i+1;
Rnames{i} = 'ICN + OH = 0.244OH + 0.539CO + 0.295HO2 + 0.378MCRHNB + 0.461ICNOO + 0.161MVKN';
k(:,i) = GCARR_ac(T, 9.35E-12, 390.0);
Gstr{i,1} = 'ICN'; Gstr{i,2} = 'OH'; 
fICN(i)=fICN(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.244; fCO(i)=fCO(i)+0.539; fHO2(i)=fHO2(i)+0.295; fMCRHNB(i)=fMCRHNB(i)+0.378; fICNOO(i)=fICNOO(i)+0.461; fMVKN(i)=fMVKN(i)+0.161; 

i=i+1;
Rnames{i} = 'ICNOO + NO = 0.67ICNOO + 0.33CO2 + 0.33CO + 0.33HO2 + 0.231PROPNN + NO2 + 0.099ETHLN';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'ICNOO'; Gstr{i,2} = 'NO'; 
fICNOO(i)=fICNOO(i)-1; fNO(i)=fNO(i)-1; fICNOO(i)=fICNOO(i)+0.67; fCO2(i)=fCO2(i)+0.33; fCO(i)=fCO(i)+0.33; fHO2(i)=fHO2(i)+0.33; fPROPNN(i)=fPROPNN(i)+0.231; fNO2(i)=fNO2(i)+1; fETHLN(i)=fETHLN(i)+0.099; 

i=i+1;
Rnames{i} = 'ICNOO + HO2 = 0.67ICNOO + 0.33CO2 + 0.33CO + 0.33HO2 + 0.231PROPNN + OH + 0.099ETHLN';
k(:,i) = GCARR_ac(T, 2.54E-13, 1300.0);
Gstr{i,1} = 'ICNOO'; Gstr{i,2} = 'HO2'; 
fICNOO(i)=fICNOO(i)-1; fHO2(i)=fHO2(i)-1; fICNOO(i)=fICNOO(i)+0.67; fCO2(i)=fCO2(i)+0.33; fCO(i)=fCO(i)+0.33; fHO2(i)=fHO2(i)+0.33; fPROPNN(i)=fPROPNN(i)+0.231; fOH(i)=fOH(i)+1; fETHLN(i)=fETHLN(i)+0.099; 

i=i+1;
Rnames{i} = 'IDN + OH = 0.565NO2 + 0.565ITHN + 0.435IDNOO';
k(:,i) = GCARR_ac(T, 1.00E-11, 0.0);
Gstr{i,1} = 'IDN'; Gstr{i,2} = 'OH'; 
fIDN(i)=fIDN(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+0.565; fITHN(i)=fITHN(i)+0.565; fIDNOO(i)=fIDNOO(i)+0.435; 

i=i+1;
Rnames{i} = 'IDNOO + NO = PROPNN + 1.11NO2 + 0.11GLYC + 0.89ETHLN + 0.89HO2';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'IDNOO'; Gstr{i,2} = 'NO'; 
fIDNOO(i)=fIDNOO(i)-1; fNO(i)=fNO(i)-1; fPROPNN(i)=fPROPNN(i)+1; fNO2(i)=fNO2(i)+1.11; fGLYC(i)=fGLYC(i)+0.11; fETHLN(i)=fETHLN(i)+0.89; fHO2(i)=fHO2(i)+0.89; 

i=i+1;
Rnames{i} = 'IDNOO + HO2 = 0.18IDN + 0.09NO2 + 0.09GLYC + 0.82OH + 0.73HO2 + 0.82PROPNN + 0.73ETHLN';
k(:,i) = GCARR_ac(T, 2.71E-13, 1300.0);
Gstr{i,1} = 'IDNOO'; Gstr{i,2} = 'HO2'; 
fIDNOO(i)=fIDNOO(i)-1; fHO2(i)=fHO2(i)-1; fIDN(i)=fIDN(i)+0.18; fNO2(i)=fNO2(i)+0.09; fGLYC(i)=fGLYC(i)+0.09; fOH(i)=fOH(i)+0.82; fHO2(i)=fHO2(i)+0.73; fPROPNN(i)=fPROPNN(i)+0.82; fETHLN(i)=fETHLN(i)+0.73; 

i=i+1;
Rnames{i} = 'MVK + OH = MVKOHOO';
k(:,i) = GCARR_ac(T, 2.60E-12, 610.0);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'OH'; 
fMVK(i)=fMVK(i)-1; fOH(i)=fOH(i)-1; fMVKOHOO(i)=fMVKOHOO(i)+1; 

i=i+1;
Rnames{i} = 'MVK + O3 = 0.545MGLY + 0.500CH2OO + 0.600CH2O + 0.380MCO3 + 0.100HO2 + 0.080OH + 0.180CO + 0.075PYAC + 0.045H2O2';
k(:,i) = GCARR_ac(T, 8.50E-16, -1520.0);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'O3'; 
fMVK(i)=fMVK(i)-1; fO3(i)=fO3(i)-1; fMGLY(i)=fMGLY(i)+0.545; fCH2OO(i)=fCH2OO(i)+0.500; fCH2O(i)=fCH2O(i)+0.600; fMCO3(i)=fMCO3(i)+0.380; fHO2(i)=fHO2(i)+0.100; fOH(i)=fOH(i)+0.080; fCO(i)=fCO(i)+0.180; fPYAC(i)=fPYAC(i)+0.075; fH2O2(i)=fH2O2(i)+0.045; 

i=i+1;
Rnames{i} = 'MACR + OH = 0.036ATOOH + 0.036CO + 0.036HO2 + 0.964MCROHOO';
k(:,i) = GCARR_ac(T, 4.40E-12, 380.0);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'OH'; 
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)-1; fATOOH(i)=fATOOH(i)+0.036; fCO(i)=fCO(i)+0.036; fHO2(i)=fHO2(i)+0.036; fMCROHOO(i)=fMCROHOO(i)+0.964; 

i=i+1;
Rnames{i} = 'MACR + OH = MACR1OO';
k(:,i) = GCARR_ac(T, 2.70E-12, 470.0);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'OH'; 
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)-1; fMACR1OO(i)=fMACR1OO(i)+1; 

i=i+1;
Rnames{i} = 'MACR + O3 = 0.880MGLY + 0.880CH2OO + 0.120CH2O + 0.120OH + 0.120CO + 0.120MCO3';
k(:,i) = GCARR_ac(T, 1.40E-15, -2100.0);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'O3'; 
fMACR(i)=fMACR(i)-1; fO3(i)=fO3(i)-1; fMGLY(i)=fMGLY(i)+0.880; fCH2OO(i)=fCH2OO(i)+0.880; fCH2O(i)=fCH2O(i)+0.120; fOH(i)=fOH(i)+0.120; fCO(i)=fCO(i)+0.120; fMCO3(i)=fMCO3(i)+0.120; 

i=i+1;
Rnames{i} = 'MACR + NO3 = 0.320HNO3 + 0.320MACR1OO + 0.680OH + 0.680CO + 0.680PROPNN';
k(:,i) = GCARR_ac(T, 1.80E-13, -1190.0);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'NO3'; 
fMACR(i)=fMACR(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+0.320; fMACR1OO(i)=fMACR1OO(i)+0.320; fOH(i)=fOH(i)+0.680; fCO(i)=fCO(i)+0.680; fPROPNN(i)=fPROPNN(i)+0.680; 

i=i+1;
Rnames{i} = 'MVKN + OH = 0.241CH2O + 0.690NO3 + 0.020OH + 0.449MGLY + 0.449HCOOH + 0.241PYAC + 0.290MVKHCB + 0.310NO2 + 0.040MCO3';
k(:,i) = GCARR_ac(T, 1.24E-12, 380.0);
Gstr{i,1} = 'MVKN'; Gstr{i,2} = 'OH'; 
fMVKN(i)=fMVKN(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+0.241; fNO3(i)=fNO3(i)+0.690; fOH(i)=fOH(i)+0.020; fMGLY(i)=fMGLY(i)+0.449; fHCOOH(i)=fHCOOH(i)+0.449; fPYAC(i)=fPYAC(i)+0.241; fMVKHCB(i)=fMVKHCB(i)+0.290; fNO2(i)=fNO2(i)+0.310; fMCO3(i)=fMCO3(i)+0.040; 

i=i+1;
Rnames{i} = 'MVKHP + OH = 0.53MVKHC + 0.47MVKHCB + OH';
k(:,i) = 5.77E-11;
Gstr{i,1} = 'MVKHP'; Gstr{i,2} = 'OH'; 
fMVKHP(i)=fMVKHP(i)-1; fOH(i)=fOH(i)-1; fMVKHC(i)=fMVKHC(i)+0.53; fMVKHCB(i)=fMVKHCB(i)+0.47; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MCRHP + OH = 0.77CO + OH + 0.77HAC + 0.23ATOOH + 0.23CO2';
k(:,i) = GCARR_ac(T, 2.70E-12, 470.0);
Gstr{i,1} = 'MCRHP'; Gstr{i,2} = 'OH'; 
fMCRHP(i)=fMCRHP(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+0.77; fOH(i)=fOH(i)+1; fHAC(i)=fHAC(i)+0.77; fATOOH(i)=fATOOH(i)+0.23; fCO2(i)=fCO2(i)+0.23; 

i=i+1;
Rnames{i} = 'MCRHN + OH = MACRNO2';
k(:,i) = GCARR_ac(T, 1.39E-11, 380.0);
Gstr{i,1} = 'MCRHN'; Gstr{i,2} = 'OH'; 
fMCRHN(i)=fMCRHN(i)-1; fOH(i)=fOH(i)-1; fMACRNO2(i)=fMACRNO2(i)+1; 

i=i+1;
Rnames{i} = 'MCRHNB + OH = 0.250CO + OH + PROPNN + 0.750CO2';
k(:,i) = GCARR_ac(T, 2.70E-12, 470.0);
Gstr{i,1} = 'MCRHNB'; Gstr{i,2} = 'OH'; 
fMCRHNB(i)=fMCRHNB(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+0.250; fOH(i)=fOH(i)+1; fPROPNN(i)=fPROPNN(i)+1; fCO2(i)=fCO2(i)+0.750; 

i=i+1;
Rnames{i} = 'C4HVP1 + NO = NO2 + MVKOHOO';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'C4HVP1'; Gstr{i,2} = 'NO'; 
fC4HVP1(i)=fC4HVP1(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMVKOHOO(i)=fMVKOHOO(i)+1; 

i=i+1;
Rnames{i} = 'C4HVP1 + HO2 = OH + MVKOHOO';
k(:,i) = GCARR_ac(T, 1.93E-13, 1300.0);
Gstr{i,1} = 'C4HVP1'; Gstr{i,2} = 'HO2'; 
fC4HVP1(i)=fC4HVP1(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fMVKOHOO(i)=fMVKOHOO(i)+1; 

i=i+1;
Rnames{i} = 'C4HVP1 + NO2 = MVKN';
k(:,i) = 9.00E-12;
Gstr{i,1} = 'C4HVP1'; Gstr{i,2} = 'NO2'; 
fC4HVP1(i)=fC4HVP1(i)-1; fNO2(i)=fNO2(i)-1; fMVKN(i)=fMVKN(i)+1; 

i=i+1;
Rnames{i} = 'C4HVP2 + NO = NO2 + MCROHOO';
k(:,i) = GCARR_ac(T, 2.70E-12, 350.0);
Gstr{i,1} = 'C4HVP2'; Gstr{i,2} = 'NO'; 
fC4HVP2(i)=fC4HVP2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMCROHOO(i)=fMCROHOO(i)+1; 

i=i+1;
Rnames{i} = 'C4HVP2 + HO2 = OH + MCROHOO';
k(:,i) = GCARR_ac(T, 1.93E-13, 1300.0);
Gstr{i,1} = 'C4HVP2'; Gstr{i,2} = 'HO2'; 
fC4HVP2(i)=fC4HVP2(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fMCROHOO(i)=fMCROHOO(i)+1; 

i=i+1;
Rnames{i} = 'C4HVP2 + NO2 = MCRHN';
k(:,i) = 9.00E-12;
Gstr{i,1} = 'C4HVP2'; Gstr{i,2} = 'NO2'; 
fC4HVP2(i)=fC4HVP2(i)-1; fNO2(i)=fNO2(i)-1; fMCRHN(i)=fMCRHN(i)+1; 

i=i+1;
Rnames{i} = 'MCRENOL + OH = 0.75CO + 0.285OH + 0.715HO2 + 0.653PYAC  + 0.097CO2 + 0.097MCO3 + 0.063MVKHCB + 0.187MGLY + 0.187HCOOH';
k(:,i) = GCARR_ac(T, 3.71E-12, 983.0);
Gstr{i,1} = 'MCRENOL'; Gstr{i,2} = 'OH'; 
fMCRENOL(i)=fMCRENOL(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+0.75; fOH(i)=fOH(i)+0.285; fHO2(i)=fHO2(i)+0.715; fPYAC (i)=fPYAC (i)+0.653; fCO2(i)=fCO2(i)+0.097; fMCO3(i)=fMCO3(i)+0.097; fMVKHCB(i)=fMVKHCB(i)+0.063; fMGLY(i)=fMGLY(i)+0.187; fHCOOH(i)=fHCOOH(i)+0.187; 

i=i+1;
Rnames{i} = 'MVKPC + OH = OH + CO + MGLY';
k(:,i) = GCARR_ac(T, 5.00E-12, 470.0);
Gstr{i,1} = 'MVKPC'; Gstr{i,2} = 'OH'; 
fMVKPC(i)=fMVKPC(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fMGLY(i)=fMGLY(i)+1; 

i=i+1;
Rnames{i} = 'MVKDH + OH = 0.4MVKHCB + 0.6MVKHC + HO2';
k(:,i) = GCARR_ac(T, 8.70E-12, 70.0);
Gstr{i,1} = 'MVKDH'; Gstr{i,2} = 'OH'; 
fMVKDH(i)=fMVKDH(i)-1; fOH(i)=fOH(i)-1; fMVKHCB(i)=fMVKHCB(i)+0.4; fMVKHC(i)=fMVKHC(i)+0.6; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MVKHCB + OH = OH + MGLY';
k(:,i) = GCARR_ac(T, 5.00E-12, 470.0);
Gstr{i,1} = 'MVKHCB'; Gstr{i,2} = 'OH'; 
fMVKHCB(i)=fMVKHCB(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fMGLY(i)=fMGLY(i)+1; 

i=i+1;
Rnames{i} = 'MVKHC + OH = 2CO + HO2 + MCO3';
k(:,i) = GCARR_ac(T, 2.00E-12, 70.0);
Gstr{i,1} = 'MVKHC'; Gstr{i,2} = 'OH'; 
fMVKHC(i)=fMVKHC(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+2; fHO2(i)=fHO2(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'MCRDH + OH = 0.16MVKHCB + HO2 + 0.84HAC + 0.84CO';
k(:,i) = GCARR_ac(T, 2.4E-11, 70.0);
Gstr{i,1} = 'MCRDH'; Gstr{i,2} = 'OH'; 
fMCRDH(i)=fMCRDH(i)-1; fOH(i)=fOH(i)-1; fMVKHCB(i)=fMVKHCB(i)+0.16; fHO2(i)=fHO2(i)+1; fHAC(i)=fHAC(i)+0.84; fCO(i)=fCO(i)+0.84; 

i=i+1;
Rnames{i} = 'MVKOHOO + HO2 = 0.360MCO3 + 0.360GLYC + 0.665OH + 0.305HO2 + 0.255MVKHC + 0.335MVKHP + 0.050MGLY + 0.050CH2O';
k(:,i) = GCARR_ac(T, 2.12E-13, 1300.0);
Gstr{i,1} = 'MVKOHOO'; Gstr{i,2} = 'HO2'; 
fMVKOHOO(i)=fMVKOHOO(i)-1; fHO2(i)=fHO2(i)-1; fMCO3(i)=fMCO3(i)+0.360; fGLYC(i)=fGLYC(i)+0.360; fOH(i)=fOH(i)+0.665; fHO2(i)=fHO2(i)+0.305; fMVKHC(i)=fMVKHC(i)+0.255; fMVKHP(i)=fMVKHP(i)+0.335; fMGLY(i)=fMGLY(i)+0.050; fCH2O(i)=fCH2O(i)+0.050; 

i=i+1;
Rnames{i} = 'MVKOHOO + NO = 0.758MCO3 + 0.758GLYC + 0.242MGLY + 0.242CH2O + 0.242HO2 + NO2';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 4.573, 6.0, 1.0, 0.0);
Gstr{i,1} = 'MVKOHOO'; Gstr{i,2} = 'NO'; 
fMVKOHOO(i)=fMVKOHOO(i)-1; fNO(i)=fNO(i)-1; fMCO3(i)=fMCO3(i)+0.758; fGLYC(i)=fGLYC(i)+0.758; fMGLY(i)=fMGLY(i)+0.242; fCH2O(i)=fCH2O(i)+0.242; fHO2(i)=fHO2(i)+0.242; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MVKOHOO + NO = 0.438MVKN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 4.573, 6.0, 1.0, 0.0);
Gstr{i,1} = 'MVKOHOO'; Gstr{i,2} = 'NO'; 
fMVKOHOO(i)=fMVKOHOO(i)-1; fNO(i)=fNO(i)-1; fMVKN(i)=fMVKN(i)+0.438; 

i=i+1;
Rnames{i} = 'MCROHOO + HO2 = 0.41MCRHP + 0.507HAC + 0.507CO + 0.507HO2 + 0.59OH + 0.59O2 + 0.083MGLY + 0.083CH2O';
k(:,i) = GCARR_ac(T, 2.12E-13, 1300.0);
Gstr{i,1} = 'MCROHOO'; Gstr{i,2} = 'HO2'; 
fMCROHOO(i)=fMCROHOO(i)-1; fHO2(i)=fHO2(i)-1; fMCRHP(i)=fMCRHP(i)+0.41; fHAC(i)=fHAC(i)+0.507; fCO(i)=fCO(i)+0.507; fHO2(i)=fHO2(i)+0.507; fOH(i)=fOH(i)+0.59; fMGLY(i)=fMGLY(i)+0.083; fCH2O(i)=fCH2O(i)+0.083; 

i=i+1;
Rnames{i} = 'MACR1OO + HO2 = 0.5MACR1OOH + 0.5CH2O + 0.325CO + 0.325MO2 + 0.175MCO3 + 0.5CO2 + 0.5OH + 0.13O3';
k(:,i) = GCARR_ac(T, 3.14E-12, 580.0);
Gstr{i,1} = 'MACR1OO'; Gstr{i,2} = 'HO2'; 
fMACR1OO(i)=fMACR1OO(i)-1; fHO2(i)=fHO2(i)-1; fMACR1OOH(i)=fMACR1OOH(i)+0.5; fCH2O(i)=fCH2O(i)+0.5; fCO(i)=fCO(i)+0.325; fMO2(i)=fMO2(i)+0.325; fMCO3(i)=fMCO3(i)+0.175; fCO2(i)=fCO2(i)+0.5; fOH(i)=fOH(i)+0.5; fO3(i)=fO3(i)+0.13; 

i=i+1;
Rnames{i} = 'MACR1OOH + OH = 0.165MACR1OO + 0.585OH + 0.488HAC + 0.488CO + 0.098HMML + 0.415CO2 + 0.25CH2O + 0.087MCO3 + 0.162MO2';
k(:,i) = 1.66E-11;
Gstr{i,1} = 'MACR1OOH'; Gstr{i,2} = 'OH'; 
fMACR1OOH(i)=fMACR1OOH(i)-1; fOH(i)=fOH(i)-1; fMACR1OO(i)=fMACR1OO(i)+0.165; fOH(i)=fOH(i)+0.585; fHAC(i)=fHAC(i)+0.488; fCO(i)=fCO(i)+0.488; fHMML(i)=fHMML(i)+0.098; fCO2(i)=fCO2(i)+0.415; fCH2O(i)=fCH2O(i)+0.25; fMCO3(i)=fMCO3(i)+0.087; fMO2(i)=fMO2(i)+0.162; 

i=i+1;
Rnames{i} = 'MCROHOO = HAC + CO + OH';
k(:,i) = GCARR_ac(T, 2.90E+7, -5297.0);
Gstr{i,1} = 'MCROHOO'; 
fMCROHOO(i)=fMCROHOO(i)-1; fHAC(i)=fHAC(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MCROHOO + NO = 0.86HAC + 0.86CO + 0.86HO2 + NO2 + 0.14MGLY + 0.14CH2O';
k(:,i) = GC_ALK(M, T, 2.7E-12, 350.0, 2.985, 6.0, 1.0, 0.0);
Gstr{i,1} = 'MCROHOO'; Gstr{i,2} = 'NO'; 
fMCROHOO(i)=fMCROHOO(i)-1; fNO(i)=fNO(i)-1; fHAC(i)=fHAC(i)+0.86; fCO(i)=fCO(i)+0.86; fHO2(i)=fHO2(i)+0.86; fNO2(i)=fNO2(i)+1; fMGLY(i)=fMGLY(i)+0.14; fCH2O(i)=fCH2O(i)+0.14; 

i=i+1;
Rnames{i} = 'MCROHOO + NO = MCRHN';
k(:,i) = GC_NIT(M, T, 2.7E-12, 350.0, 2.985, 6.0, 1.0, 0.0);
Gstr{i,1} = 'MCROHOO'; Gstr{i,2} = 'NO'; 
fMCROHOO(i)=fMCROHOO(i)-1; fNO(i)=fNO(i)-1; fMCRHN(i)=fMCRHN(i)+1; 

i=i+1;
Rnames{i} = 'MACR1OO + NO = 0.35MCO3 + 0.65MO2 + 0.65CO + CH2O + CO2 + NO2';
k(:,i) = GCARR_ac(T, 8.7E-12, 290.0);
Gstr{i,1} = 'MACR1OO'; Gstr{i,2} = 'NO'; 
fMACR1OO(i)=fMACR1OO(i)-1; fNO(i)=fNO(i)-1; fMCO3(i)=fMCO3(i)+0.35; fMO2(i)=fMO2(i)+0.65; fCO(i)=fCO(i)+0.65; fCH2O(i)=fCH2O(i)+1; fCO2(i)=fCO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MACR1OO + NO2 = MPAN';
k(:,i) = GC_PAN_acac(M, T, 2.591E-28, -6.87, 1.125E-11, -1.105, 0.3);
Gstr{i,1} = 'MACR1OO'; Gstr{i,2} = 'NO2'; 
fMACR1OO(i)=fMACR1OO(i)-1; fNO2(i)=fNO2(i)-1; fMPAN(i)=fMPAN(i)+1; 

i=i+1;
Rnames{i} = 'MACRNO2 + HO2 = 0.5HAC + 0.5OH + 0.5CO2 + 0.5NO2 + 0.13O3 + 0.37MCRHN + 0.13MCRHNB';
k(:,i) = GCARR_ac(T, 3.14E-12, 580.0);
Gstr{i,1} = 'MACRNO2'; Gstr{i,2} = 'HO2'; 
fMACRNO2(i)=fMACRNO2(i)-1; fHO2(i)=fHO2(i)-1; fHAC(i)=fHAC(i)+0.5; fOH(i)=fOH(i)+0.5; fCO2(i)=fCO2(i)+0.5; fNO2(i)=fNO2(i)+0.5; fO3(i)=fO3(i)+0.13; fMCRHN(i)=fMCRHN(i)+0.37; fMCRHNB(i)=fMCRHNB(i)+0.13; 

i=i+1;
Rnames{i} = 'MACRNO2 + NO = HAC + 2NO2 + CO2';
k(:,i) = GCARR_ac(T, 7.50E-12, 290.0);
Gstr{i,1} = 'MACRNO2'; Gstr{i,2} = 'NO'; 
fMACRNO2(i)=fMACRNO2(i)-1; fNO(i)=fNO(i)-1; fHAC(i)=fHAC(i)+1; fNO2(i)=fNO2(i)+2; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'MACRNO2 + NO2 = MPAN + NO2';
k(:,i) = GC_PAN_acac(M, T, 2.591E-28, -6.87, 1.125E-11, -1.105, 0.3);
Gstr{i,1} = 'MACRNO2'; Gstr{i,2} = 'NO2'; 
fMACRNO2(i)=fMACRNO2(i)-1; fNO2(i)=fNO2(i)-1; fMPAN(i)=fMPAN(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MACRNO2 + NO3 = HAC + 2NO2 + CO2';
k(:,i) = 4.00E-12;
Gstr{i,1} = 'MACRNO2'; Gstr{i,2} = 'NO3'; 
fMACRNO2(i)=fMACRNO2(i)-1; fNO3(i)=fNO3(i)-1; fHAC(i)=fHAC(i)+1; fNO2(i)=fNO2(i)+2; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'MACRNO2 + MO2 = 0.7HAC + 0.7CO2 + 0.7NO2 + 0.7HO2 + CH2O + 0.3MCRHNB';
k(:,i) = GCARR_ac(T, 2.9E-12, 500.0);
Gstr{i,1} = 'MACRNO2'; Gstr{i,2} = 'MO2'; 
fMACRNO2(i)=fMACRNO2(i)-1; fMO2(i)=fMO2(i)-1; fHAC(i)=fHAC(i)+0.7; fCO2(i)=fCO2(i)+0.7; fNO2(i)=fNO2(i)+0.7; fHO2(i)=fHO2(i)+0.7; fCH2O(i)=fCH2O(i)+1; fMCRHNB(i)=fMCRHNB(i)+0.3; 

i=i+1;
Rnames{i} = 'MPAN = MACR1OO + NO2';
k(:,i) = GCARR_ac(T, 1.58E+16, -13500.0);
Gstr{i,1} = 'MPAN'; 
fMPAN(i)=fMPAN(i)-1; fMACR1OO(i)=fMACR1OO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MPAN + OH = 0.75HMML + NO3 + 0.25HAC + 0.25CO';
k(:,i) = 2.90E-11;
Gstr{i,1} = 'MPAN'; Gstr{i,2} = 'OH'; 
fMPAN(i)=fMPAN(i)-1; fOH(i)=fOH(i)-1; fHMML(i)=fHMML(i)+0.75; fNO3(i)=fNO3(i)+1; fHAC(i)=fHAC(i)+0.25; fCO(i)=fCO(i)+0.25; 

i=i+1;
Rnames{i} = 'HMML + OH = 0.700MGLY + 0.700OH + 0.300MCO3 + 0.300HCOOH';
k(:,i) = 4.33E-12;
Gstr{i,1} = 'HMML'; Gstr{i,2} = 'OH'; 
fHMML(i)=fHMML(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+0.700; fOH(i)=fOH(i)+0.700; fMCO3(i)=fMCO3(i)+0.300; fHCOOH(i)=fHCOOH(i)+0.300; 

i=i+1;
Rnames{i} = 'ICPDH + OH = CO + 0.5HO2 + 0.5OH + 0.5MCRHP + 0.35MVKDH + 0.15MCRDH';
k(:,i) = 1.00E-11;
Gstr{i,1} = 'ICPDH'; Gstr{i,2} = 'OH'; 
fICPDH(i)=fICPDH(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+0.5; fOH(i)=fOH(i)+0.5; fMCRHP(i)=fMCRHP(i)+0.5; fMVKDH(i)=fMVKDH(i)+0.35; fMCRDH(i)=fMCRDH(i)+0.15; 

i=i+1;
Rnames{i} = 'IDCHP + OH = 0.888CO + 0.444OH + 0.444HO2 + 0.318MVKHC + 0.08IEPOXAOO + 0.126MVKHCB + 0.444MVKPC + 0.032IEPOXBOO';
k(:,i) = 2.25E-11;
Gstr{i,1} = 'IDCHP'; Gstr{i,2} = 'OH'; 
fIDCHP(i)=fIDCHP(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+0.888; fOH(i)=fOH(i)+0.444; fHO2(i)=fHO2(i)+0.444; fMVKHC(i)=fMVKHC(i)+0.318; fIEPOXAOO(i)=fIEPOXAOO(i)+0.08; fMVKHCB(i)=fMVKHCB(i)+0.126; fMVKPC(i)=fMVKPC(i)+0.444; fIEPOXBOO(i)=fIEPOXBOO(i)+0.032; 

i=i+1;
Rnames{i} = 'IDHDP + OH = OH + 0.333ICPDH + 0.667IDHPE';
k(:,i) = 3.00E-12;
Gstr{i,1} = 'IDHDP'; Gstr{i,2} = 'OH'; 
fIDHDP(i)=fIDHDP(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fICPDH(i)=fICPDH(i)+0.333; fIDHPE(i)=fIDHPE(i)+0.667; 

i=i+1;
Rnames{i} = 'IDHPE + OH = OH + CO2 + 0.571MCRHP + 0.429MVKHP';
k(:,i) = 3.00E-12;
Gstr{i,1} = 'IDHPE'; Gstr{i,2} = 'OH'; 
fIDHPE(i)=fIDHPE(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; fMCRHP(i)=fMCRHP(i)+0.571; fMVKHP(i)=fMVKHP(i)+0.429; 

i=i+1;
Rnames{i} = 'ITCN + OH = CO + NO2 + 0.75MVKHP + 0.25MCRHP';
k(:,i) = 1.00E-11;
Gstr{i,1} = 'ITCN'; Gstr{i,2} = 'OH'; 
fITCN(i)=fITCN(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; fMVKHP(i)=fMVKHP(i)+0.75; fMCRHP(i)=fMCRHP(i)+0.25; 

i=i+1;
Rnames{i} = 'ITHN + OH = 0.300OH + 0.620HO2 + 0.920ITCN + 0.037IDHNBOO + 0.041ICNOO + 0.022MCRENOL + 0.022NO2 + 0.022CH2O';
k(:,i) = 3.00E-12;
Gstr{i,1} = 'ITHN'; Gstr{i,2} = 'OH'; 
fITHN(i)=fITHN(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+0.300; fHO2(i)=fHO2(i)+0.620; fITCN(i)=fITCN(i)+0.920; fIDHNBOO(i)=fIDHNBOO(i)+0.037; fICNOO(i)=fICNOO(i)+0.041; fMCRENOL(i)=fMCRENOL(i)+0.022; fNO2(i)=fNO2(i)+0.022; fCH2O(i)=fCH2O(i)+0.022; 

i=i+1;
Rnames{i} = 'ETHLN + NO3 = HNO3 + NO2 + MCO3';
k(:,i) = GCARR_ac(T, 1.40E-12, -1860.0);
Gstr{i,1} = 'ETHLN'; Gstr{i,2} = 'NO3'; 
fETHLN(i)=fETHLN(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fNO2(i)=fNO2(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'PYAC + OH = MCO3 + CO2';
k(:,i) = 8.00E-13;
Gstr{i,1} = 'PYAC'; Gstr{i,2} = 'OH'; 
fPYAC(i)=fPYAC(i)-1; fOH(i)=fOH(i)-1; fMCO3(i)=fMCO3(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'HMHP + OH = 0.5CH2O + 0.5HO2 + 0.5HCOOH + 0.5OH';
k(:,i) = GCARR_ac(T, 1.30E-12, 500.0);
Gstr{i,1} = 'HMHP'; Gstr{i,2} = 'OH'; 
fHMHP(i)=fHMHP(i)-1; fOH(i)=fOH(i)-1; fCH2O(i)=fCH2O(i)+0.5; fHO2(i)=fHO2(i)+0.5; fHCOOH(i)=fHCOOH(i)+0.5; fOH(i)=fOH(i)+0.5; 

i=i+1;
Rnames{i} = 'MCO3 + HO2 = 0.13O3 + 0.13ACTA + 0.37MAP + 0.5MO2 + 0.5CO2 + 0.5OH';
k(:,i) = GCARR_ac(T, 3.14E-12, 580.0);
Gstr{i,1} = 'MCO3'; Gstr{i,2} = 'HO2'; 
fMCO3(i)=fMCO3(i)-1; fHO2(i)=fHO2(i)-1; fO3(i)=fO3(i)+0.13; fACTA(i)=fACTA(i)+0.13; fMAP(i)=fMAP(i)+0.37; fMO2(i)=fMO2(i)+0.5; fCO2(i)=fCO2(i)+0.5; fOH(i)=fOH(i)+0.5; 

i=i+1;
Rnames{i} = 'HPETHNL + OH = CO + OH + CH2O';
k(:,i) = GCARR_ac(T, 1.55E-12, 340.0);
Gstr{i,1} = 'HPETHNL'; Gstr{i,2} = 'OH'; 
fHPETHNL(i)=fHPETHNL(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'HPETHNL + OH = GLYX + OH';
k(:,i) = 2.91E-11;
Gstr{i,1} = 'HPETHNL'; Gstr{i,2} = 'OH'; 
fHPETHNL(i)=fHPETHNL(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'NAP + OH = NRO2 + OH';
k(:,i) = GCARR_ac(T, 1.56E-11, 117.0);
Gstr{i,1} = 'NAP'; Gstr{i,2} = 'OH'; 
fNAP(i)=fNAP(i)-1; fOH(i)=fOH(i)-1; fNRO2(i)=fNRO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'NRO2 + HO2 = LNRO2H + HO2';
k(:,i) = GCARR_ac(T, 1.40E-12, 700.0);
Gstr{i,1} = 'NRO2'; Gstr{i,2} = 'HO2'; 
fNRO2(i)=fNRO2(i)-1; fHO2(i)=fHO2(i)-1; fLNRO2H(i)=fLNRO2H(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'NRO2 + NO = LNRO2N + NO';
k(:,i) = GCARR_ac(T, 2.60E-12, 350.0);
Gstr{i,1} = 'NRO2'; Gstr{i,2} = 'NO'; 
fNRO2(i)=fNRO2(i)-1; fNO(i)=fNO(i)-1; fLNRO2N(i)=fLNRO2N(i)+1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'C2H4 + O3 = CH2O + CH2OO';
k(:,i) = GCARR_abc(T, 9.10E-15, 0.0, -2580.0);
Gstr{i,1} = 'C2H4'; Gstr{i,2} = 'O3'; 
fC2H4(i)=fC2H4(i)-1; fO3(i)=fO3(i)-1; fCH2O(i)=fCH2O(i)+1; fCH2OO(i)=fCH2OO(i)+1; 

i=i+1;
Rnames{i} = 'C2H4 + OH = ETOO';
k(:,i) = GCJPLPR_abab(M, T, 1.10E-28, 3.5E+00, 8.4E-12, 1.75, 0.5);
Gstr{i,1} = 'C2H4'; Gstr{i,2} = 'OH'; 
fC2H4(i)=fC2H4(i)-1; fOH(i)=fOH(i)-1; fETOO(i)=fETOO(i)+1; 

i=i+1;
Rnames{i} = 'C2H2 + OH = 0.636GLYX + 0.636OH + 0.364CO + 0.364HO2 + 0.364HCOOH';
k(:,i) = GCJPLPR_abab(M, T, 5.50E-30, 0.0, 8.3E-13, -2.0, 0.5);
Gstr{i,1} = 'C2H2'; Gstr{i,2} = 'OH'; 
fC2H2(i)=fC2H2(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+0.636; fOH(i)=fOH(i)+0.636; fCO(i)=fCO(i)+0.364; fHO2(i)=fHO2(i)+0.364; fHCOOH(i)=fHCOOH(i)+0.364; 

i=i+1;
Rnames{i} = 'ETOO + HO2 = ETHP';
k(:,i) = GCARR_abc(T, 1.53E-13, 0.0, 1300.0);
Gstr{i,1} = 'ETOO'; Gstr{i,2} = 'HO2'; 
fETOO(i)=fETOO(i)-1; fHO2(i)=fHO2(i)-1; fETHP(i)=fETHP(i)+1; 

i=i+1;
Rnames{i} = 'ETOO + NO = 0.995ETO + 0.995NO2 + 0.005ETHN';
k(:,i) = GCARR_abc(T, 2.7E-12, 0.0E+00, 360.0);
Gstr{i,1} = 'ETOO'; Gstr{i,2} = 'NO'; 
fETOO(i)=fETOO(i)-1; fNO(i)=fNO(i)-1; fETO(i)=fETO(i)+0.995; fNO2(i)=fNO2(i)+0.995; fETHN(i)=fETHN(i)+0.005; 

i=i+1;
Rnames{i} = 'ETOO + NO3 = ETO + NO2';
k(:,i) = 2.3E-12;
Gstr{i,1} = 'ETOO'; Gstr{i,2} = 'NO3'; 
fETOO(i)=fETOO(i)-1; fNO3(i)=fNO3(i)-1; fETO(i)=fETO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ETOO + MO2 = 0.6ETO + 0.6HO2 + 0.8CH2O + 0.2MOH + 0.2ETHP + 0.2GLYC';
k(:,i) = 6.00E-13;
Gstr{i,1} = 'ETOO'; Gstr{i,2} = 'MO2'; 
fETOO(i)=fETOO(i)-1; fMO2(i)=fMO2(i)-1; fETO(i)=fETO(i)+0.6; fHO2(i)=fHO2(i)+0.6; fCH2O(i)=fCH2O(i)+0.8; fMOH(i)=fMOH(i)+0.2; fETHP(i)=fETHP(i)+0.2; fGLYC(i)=fGLYC(i)+0.2; 

i=i+1;
Rnames{i} = 'ETO = HO2 + 2.000CH2O';
k(:,i) = GCARR_abc(T, 9.5E-13, 0.0, -5988.0);
Gstr{i,1} = 'ETO'; 
fETO(i)=fETO(i)-1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+2.000; 

i=i+1;
Rnames{i} = 'ETO + O2 = GLYC + HO2';
k(:,i) = GCARR_abc(T, 2.5E-14, 0.0, -300.0).*0.21.*M;
Gstr{i,1} = 'ETO'; 
fETO(i)=fETO(i)-1; fGLYC(i)=fGLYC(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ETHN + OH = GLYC + NO2';
k(:,i) = 8.40E-13;
Gstr{i,1} = 'ETHN'; Gstr{i,2} = 'OH'; 
fETHN(i)=fETHN(i)-1; fOH(i)=fOH(i)-1; fGLYC(i)=fGLYC(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ETHP + OH = ETOO';
k(:,i) = GCARR_abc(T, 1.90E-12, 0.0E+00, 190.0);
Gstr{i,1} = 'ETHP'; Gstr{i,2} = 'OH'; 
fETHP(i)=fETHP(i)-1; fOH(i)=fOH(i)-1; fETOO(i)=fETOO(i)+1; 

i=i+1;
Rnames{i} = 'ETHP + OH = OH + GLYC';
k(:,i) = 1.38E-11;
Gstr{i,1} = 'ETHP'; Gstr{i,2} = 'OH'; 
fETHP(i)=fETHP(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fGLYC(i)=fGLYC(i)+1; 

i=i+1;
Rnames{i} = 'BENZ + OH = BRO2 + 0.54PHEN + 0.54HO2 + 0.46AROMRO2 + 0.18GLYX + 0.2CO + 0.56AROMP4';
k(:,i) = GCARR_abc(T, 2.3E-12, 0.0, -193.0);
Gstr{i,1} = 'BENZ'; Gstr{i,2} = 'OH'; 
fBENZ(i)=fBENZ(i)-1; fOH(i)=fOH(i)-1; fBRO2(i)=fBRO2(i)+1; fPHEN(i)=fPHEN(i)+0.54; fHO2(i)=fHO2(i)+0.54; fAROMRO2(i)=fAROMRO2(i)+0.46; fGLYX(i)=fGLYX(i)+0.18; fCO(i)=fCO(i)+0.2; fAROMP4(i)=fAROMP4(i)+0.56; 

i=i+1;
Rnames{i} = 'TOLU + OH = TRO2 + 0.19CSL + 0.19HO2 + 0.81AROMRO2 + 0.06BALD + 0.12GLYX + 0.12MGLY + 0.27CO + 0.04MVK + 0.3AROMP5 + 0.68AROMP4';
k(:,i) = GCARR_abc(T, 1.8E-12, 0.0, 340.0);
Gstr{i,1} = 'TOLU'; Gstr{i,2} = 'OH'; 
fTOLU(i)=fTOLU(i)-1; fOH(i)=fOH(i)-1; fTRO2(i)=fTRO2(i)+1; fCSL(i)=fCSL(i)+0.19; fHO2(i)=fHO2(i)+0.19; fAROMRO2(i)=fAROMRO2(i)+0.81; fBALD(i)=fBALD(i)+0.06; fGLYX(i)=fGLYX(i)+0.12; fMGLY(i)=fMGLY(i)+0.12; fCO(i)=fCO(i)+0.27; fMVK(i)=fMVK(i)+0.04; fAROMP5(i)=fAROMP5(i)+0.3; fAROMP4(i)=fAROMP4(i)+0.68; 

i=i+1;
Rnames{i} = 'XYLE + OH = XRO2 + 0.15CSL + 0.15HO2 + 0.85AROMRO2 + 0.06BALD + 0.1GLYX + 0.2MGLY + 0.3CO + 0.04MVK + 0.56AROMP5 + 0.28AROMP4 + 0.45RCOOH';
k(:,i) = 1.7E-11;
Gstr{i,1} = 'XYLE'; Gstr{i,2} = 'OH'; 
fXYLE(i)=fXYLE(i)-1; fOH(i)=fOH(i)-1; fXRO2(i)=fXRO2(i)+1; fCSL(i)=fCSL(i)+0.15; fHO2(i)=fHO2(i)+0.15; fAROMRO2(i)=fAROMRO2(i)+0.85; fBALD(i)=fBALD(i)+0.06; fGLYX(i)=fGLYX(i)+0.1; fMGLY(i)=fMGLY(i)+0.2; fCO(i)=fCO(i)+0.3; fMVK(i)=fMVK(i)+0.04; fAROMP5(i)=fAROMP5(i)+0.56; fAROMP4(i)=fAROMP4(i)+0.28; fRCOOH(i)=fRCOOH(i)+0.45; 

i=i+1;
Rnames{i} = 'AROMRO2 + HO2 = OH + HO2';
k(:,i) = 2.91E-13 * exp( 1300.0 / T ) * 0.82;
Gstr{i,1} = 'AROMRO2'; Gstr{i,2} = 'HO2'; 
fAROMRO2(i)=fAROMRO2(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'AROMRO2 + NO = NO2 + HO2';
k(:,i) = GCARR_abc(T, 2.60E-12, 0.0E+00, 365.0);
Gstr{i,1} = 'AROMRO2'; Gstr{i,2} = 'NO'; 
fAROMRO2(i)=fAROMRO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'AROMRO2 + NO3 = NO2 + HO2';
k(:,i) = 2.30E-12;
Gstr{i,1} = 'AROMRO2'; Gstr{i,2} = 'NO3'; 
fAROMRO2(i)=fAROMRO2(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'AROMRO2 + MO2 = CH2O + HO2 + HO2';
k(:,i) = GCARR_abc(T, 1.70E-14, 0.0, 220.0);
Gstr{i,1} = 'AROMRO2'; Gstr{i,2} = 'MO2'; 
fAROMRO2(i)=fAROMRO2(i)-1; fMO2(i)=fMO2(i)-1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'AROMRO2 + MCO3 = MO2 + HO2';
k(:,i) = GCARR_abc(T, 4.20E-14, 0.0, 220.0);
Gstr{i,1} = 'AROMRO2'; Gstr{i,2} = 'MCO3'; 
fAROMRO2(i)=fAROMRO2(i)-1; fMCO3(i)=fMCO3(i)-1; fMO2(i)=fMO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'PHEN + OH = 0.06BENZO + 0.06GLYX + 0.18AROMP4 + 0.14AROMRO2 + 0.8MCT + 0.8HO2';
k(:,i) = GCARR_abc(T, 4.70E-13, 0.0, 1220.0);
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'OH'; 
fPHEN(i)=fPHEN(i)-1; fOH(i)=fOH(i)-1; fBENZO(i)=fBENZO(i)+0.06; fGLYX(i)=fGLYX(i)+0.06; fAROMP4(i)=fAROMP4(i)+0.18; fAROMRO2(i)=fAROMRO2(i)+0.14; fMCT(i)=fMCT(i)+0.8; fHO2(i)=fHO2(i)+0.8; 

i=i+1;
Rnames{i} = 'PHEN + NO3 = 0.258NPHEN + 0.742HNO3 + 0.742BENZO';
k(:,i) = 3.8E-12;
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'NO3'; 
fPHEN(i)=fPHEN(i)-1; fNO3(i)=fNO3(i)-1; fNPHEN(i)=fNPHEN(i)+0.258; fHNO3(i)=fHNO3(i)+0.742; fBENZO(i)=fBENZO(i)+0.742; 

i=i+1;
Rnames{i} = 'CSL + OH = 0.727MCT + 0.727HO2 + 0.2AROMRO2 + 0.073BENZO + 0.44AROMP5';
k(:,i) = 4.7E-11;
Gstr{i,1} = 'CSL'; Gstr{i,2} = 'OH'; 
fCSL(i)=fCSL(i)-1; fOH(i)=fOH(i)-1; fMCT(i)=fMCT(i)+0.727; fHO2(i)=fHO2(i)+0.727; fAROMRO2(i)=fAROMRO2(i)+0.2; fBENZO(i)=fBENZO(i)+0.073; fAROMP5(i)=fAROMP5(i)+0.44; 

i=i+1;
Rnames{i} = 'CSL + NO3 = 0.5NPHEN + 0.2AROMRO2 + 0.5HNO3 + 0.3BENZO + 0.44AROMP5';
k(:,i) = 1.4E-11;
Gstr{i,1} = 'CSL'; Gstr{i,2} = 'NO3'; 
fCSL(i)=fCSL(i)-1; fNO3(i)=fNO3(i)-1; fNPHEN(i)=fNPHEN(i)+0.5; fAROMRO2(i)=fAROMRO2(i)+0.2; fHNO3(i)=fHNO3(i)+0.5; fBENZO(i)=fBENZO(i)+0.3; fAROMP5(i)=fAROMP5(i)+0.44; 

i=i+1;
Rnames{i} = 'MCT + OH = 0.3BENZO + 0.7AROMRO2 + 1.05AROMP4';
k(:,i) = 2.0E-11;
Gstr{i,1} = 'MCT'; Gstr{i,2} = 'OH'; 
fMCT(i)=fMCT(i)-1; fOH(i)=fOH(i)-1; fBENZO(i)=fBENZO(i)+0.3; fAROMRO2(i)=fAROMRO2(i)+0.7; fAROMP4(i)=fAROMP4(i)+1.05; 

i=i+1;
Rnames{i} = 'MCT + O3 = GLYC + HO2 + OH + AROMP4';
k(:,i) = 9.2E-18;
Gstr{i,1} = 'MCT'; Gstr{i,2} = 'O3'; 
fMCT(i)=fMCT(i)-1; fO3(i)=fO3(i)-1; fGLYC(i)=fGLYC(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; fAROMP4(i)=fAROMP4(i)+1; 

i=i+1;
Rnames{i} = 'MCT + NO3 = 0.5NPHEN + 0.5HNO3 + 0.3BENZO + 0.2AROMRO2 + 0.3AROMP4';
k(:,i) = 9.9E-11;
Gstr{i,1} = 'MCT'; Gstr{i,2} = 'NO3'; 
fMCT(i)=fMCT(i)-1; fNO3(i)=fNO3(i)-1; fNPHEN(i)=fNPHEN(i)+0.5; fHNO3(i)=fHNO3(i)+0.5; fBENZO(i)=fBENZO(i)+0.3; fAROMRO2(i)=fAROMRO2(i)+0.2; fAROMP4(i)=fAROMP4(i)+0.3; 

i=i+1;
Rnames{i} = 'BALD + OH = BZCO3';
k(:,i) = GCARR_abc(T, 5.90E-12, 0.0, 225.0);
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'OH'; 
fBALD(i)=fBALD(i)-1; fOH(i)=fOH(i)-1; fBZCO3(i)=fBZCO3(i)+1; 

i=i+1;
Rnames{i} = 'BALD + NO3 = BZCO3 + HNO3';
k(:,i) = 2.4E-15;
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'NO3'; 
fBALD(i)=fBALD(i)-1; fNO3(i)=fNO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'BZCO3 + HO2 = 0.35CO2 + 0.2BENZO2 + 0.15O3 + 0.2OH + 0.15BENZP + 0.65BZCO3H';
k(:,i) = GCARR_abc(T, 1.10E-11, 0.0, 340.0);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'HO2'; 
fBZCO3(i)=fBZCO3(i)-1; fHO2(i)=fHO2(i)-1; fCO2(i)=fCO2(i)+0.35; fBENZO2(i)=fBENZO2(i)+0.2; fO3(i)=fO3(i)+0.15; fOH(i)=fOH(i)+0.2; fBENZP(i)=fBENZP(i)+0.15; fBZCO3H(i)=fBZCO3H(i)+0.65; 

i=i+1;
Rnames{i} = 'BZCO3 + NO = NO2 + CO2 + BENZO2';
k(:,i) = GCARR_abc(T, 7.50E-12, 0.0, 290.0);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO'; 
fBZCO3(i)=fBZCO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fBENZO2(i)=fBENZO2(i)+1; 

i=i+1;
Rnames{i} = 'BZCO3 + NO2 = BZPAN';
k(:,i) = GC_PAN_acac(M, T, 3.28E-28, -6.87, 1.125E-11, -1.105, 0.3);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO2'; 
fBZCO3(i)=fBZCO3(i)-1; fNO2(i)=fNO2(i)-1; fBZPAN(i)=fBZPAN(i)+1; 

i=i+1;
Rnames{i} = 'BZCO3H + OH = BZCO3';
k(:,i) = 4.66E-12;
Gstr{i,1} = 'BZCO3H'; Gstr{i,2} = 'OH'; 
fBZCO3H(i)=fBZCO3H(i)-1; fOH(i)=fOH(i)-1; fBZCO3(i)=fBZCO3(i)+1; 

i=i+1;
Rnames{i} = 'BZPAN = BZCO3 + NO2';
k(:,i) = GC_PAN_abab(M, T, 1.10E-5, -10100.0, 1.90E+17, -14100.0, 0.3)*0.67;
Gstr{i,1} = 'BZPAN'; 
fBZPAN(i)=fBZPAN(i)-1; fBZCO3(i)=fBZCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BZPAN + OH = BENZP + CO2 + NO2';
k(:,i) = 1.06E-12;
Gstr{i,1} = 'BZPAN'; Gstr{i,2} = 'OH'; 
fBZPAN(i)=fBZPAN(i)-1; fOH(i)=fOH(i)-1; fBENZP(i)=fBENZP(i)+1; fCO2(i)=fCO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZO2 + NO2 = BENZO + NO3';
k(:,i) = 7.00E-12;
Gstr{i,1} = 'BENZO2'; Gstr{i,2} = 'NO2'; 
fBENZO2(i)=fBENZO2(i)-1; fNO2(i)=fNO2(i)-1; fBENZO(i)=fBENZO(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'BENZO2 + NO = BENZO + NO2';
k(:,i) = GCARR_abc(T, 2.670E-12, 0.0, 365.0);
Gstr{i,1} = 'BENZO2'; Gstr{i,2} = 'NO'; 
fBENZO2(i)=fBENZO2(i)-1; fNO(i)=fNO(i)-1; fBENZO(i)=fBENZO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZO2 + NO3 = BENZO + NO2';
k(:,i) = 2.30E-12;
Gstr{i,1} = 'BENZO2'; Gstr{i,2} = 'NO3'; 
fBENZO2(i)=fBENZO2(i)-1; fNO3(i)=fNO3(i)-1; fBENZO(i)=fBENZO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZO2 + HO2 = BENZP';
k(:,i) = GCARR_abc(T, 2.24E-13, 0.0, 1300.0);
Gstr{i,1} = 'BENZO2'; Gstr{i,2} = 'HO2'; 
fBENZO2(i)=fBENZO2(i)-1; fHO2(i)=fHO2(i)-1; fBENZP(i)=fBENZP(i)+1; 

i=i+1;
Rnames{i} = 'BENZP + OH = BENZO2';
k(:,i) = 3.60E-12;
Gstr{i,1} = 'BENZP'; Gstr{i,2} = 'OH'; 
fBENZP(i)=fBENZP(i)-1; fOH(i)=fOH(i)-1; fBENZO2(i)=fBENZO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZO + O3 = BENZO2';
k(:,i) = 2.86E-13;
Gstr{i,1} = 'BENZO'; Gstr{i,2} = 'O3'; 
fBENZO(i)=fBENZO(i)-1; fO3(i)=fO3(i)-1; fBENZO2(i)=fBENZO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZO + NO2 = NPHEN';
k(:,i) = 2.08E-12;
Gstr{i,1} = 'BENZO'; Gstr{i,2} = 'NO2'; 
fBENZO(i)=fBENZO(i)-1; fNO2(i)=fNO2(i)-1; fNPHEN(i)=fNPHEN(i)+1; 

i=i+1;
Rnames{i} = 'NPHEN + OH = 0.5R4N1 + AROMP4 + 0.5NO2';
k(:,i) = 3.47E-12;
Gstr{i,1} = 'NPHEN'; Gstr{i,2} = 'OH'; 
fNPHEN(i)=fNPHEN(i)-1; fOH(i)=fOH(i)-1; fR4N1(i)=fR4N1(i)+0.5; fAROMP4(i)=fAROMP4(i)+1; fNO2(i)=fNO2(i)+0.5; 

i=i+1;
Rnames{i} = 'NPHEN + NO3 = 0.5HNO3 + NO2 + 0.5R4N1 + AROMP4';
k(:,i) = 2.60E-12;
Gstr{i,1} = 'NPHEN'; Gstr{i,2} = 'NO3'; 
fNPHEN(i)=fNPHEN(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+0.5; fNO2(i)=fNO2(i)+1; fR4N1(i)=fR4N1(i)+0.5; fAROMP4(i)=fAROMP4(i)+1; 

i=i+1;
Rnames{i} = 'BENZO2 + MO2 = BENZO + HO2 + CH2O';
k(:,i) = GCARR_abc(T, 2.670E-13, 0.0, 365.0);
Gstr{i,1} = 'BENZO2'; Gstr{i,2} = 'MO2'; 
fBENZO2(i)=fBENZO2(i)-1; fMO2(i)=fMO2(i)-1; fBENZO(i)=fBENZO(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'BZCO3 + MO2 = BENZO2 + CO2 + HO2 + CH2O';
k(:,i) = GCARR_abc(T, 2.670E-12, 0.0, 365.0);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'MO2'; 
fBZCO3(i)=fBZCO3(i)-1; fMO2(i)=fMO2(i)-1; fBENZO2(i)=fBENZO2(i)+1; fCO2(i)=fCO2(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'AROMP4 + OH = 0.6GLYX + 0.25CO + 0.25HCOOH + 0.25OH + 0.33HO2 + 0.33RCO3 + 0.45RCOOH';
k(:,i) = 5.0E-11;
Gstr{i,1} = 'AROMP4'; Gstr{i,2} = 'OH'; 
fAROMP4(i)=fAROMP4(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+0.6; fCO(i)=fCO(i)+0.25; fHCOOH(i)=fHCOOH(i)+0.25; fOH(i)=fOH(i)+0.25; fHO2(i)=fHO2(i)+0.33; fRCO3(i)=fRCO3(i)+0.33; fRCOOH(i)=fRCOOH(i)+0.45; 

i=i+1;
Rnames{i} = 'AROMP4 + O3 = 0.5HCOOH + 0.5CO + 0.6GLYX + 0.9GLYC + 0.1HO2 + 0.1OH';
k(:,i) = 8.0E-16;
Gstr{i,1} = 'AROMP4'; Gstr{i,2} = 'O3'; 
fAROMP4(i)=fAROMP4(i)-1; fO3(i)=fO3(i)-1; fHCOOH(i)=fHCOOH(i)+0.5; fCO(i)=fCO(i)+0.5; fGLYX(i)=fGLYX(i)+0.6; fGLYC(i)=fGLYC(i)+0.9; fHO2(i)=fHO2(i)+0.1; fOH(i)=fOH(i)+0.1; 

i=i+1;
Rnames{i} = 'AROMP4 = 0.2HO2 + 0.2GLYX + 1.2RCHO';
k(:,i) = 1.5E-3;
Gstr{i,1} = 'AROMP4'; 
fAROMP4(i)=fAROMP4(i)-1; fHO2(i)=fHO2(i)+0.2; fGLYX(i)=fGLYX(i)+0.2; fRCHO(i)=fRCHO(i)+1.2; 

i=i+1;
Rnames{i} = 'AROMP5 + OH = 0.6MGLY + 0.15ACTA + 0.1HCOOH + 0.25OH + 0.33HO2 + 0.33RCO3 + 0.25CO + 0.52RCOOH';
k(:,i) = 5.0E-11;
Gstr{i,1} = 'AROMP5'; Gstr{i,2} = 'OH'; 
fAROMP5(i)=fAROMP5(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+0.6; fACTA(i)=fACTA(i)+0.15; fHCOOH(i)=fHCOOH(i)+0.1; fOH(i)=fOH(i)+0.25; fHO2(i)=fHO2(i)+0.33; fRCO3(i)=fRCO3(i)+0.33; fCO(i)=fCO(i)+0.25; fRCOOH(i)=fRCOOH(i)+0.52; 

i=i+1;
Rnames{i} = 'AROMP5 + O3 = 0.6MGLY + 0.3ACTA + 0.2HCOOH + 0.5CO + 0.95GLYC + 0.1HO2 + 0.1OH';
k(:,i) = 8.0E-16;
Gstr{i,1} = 'AROMP5'; Gstr{i,2} = 'O3'; 
fAROMP5(i)=fAROMP5(i)-1; fO3(i)=fO3(i)-1; fMGLY(i)=fMGLY(i)+0.6; fACTA(i)=fACTA(i)+0.3; fHCOOH(i)=fHCOOH(i)+0.2; fCO(i)=fCO(i)+0.5; fGLYC(i)=fGLYC(i)+0.95; fHO2(i)=fHO2(i)+0.1; fOH(i)=fOH(i)+0.1; 

i=i+1;
Rnames{i} = 'AROMP5 = 0.2HO2 + 0.2R4O2 + 0.2MGLY + 1.2RCHO';
k(:,i) = 1.5E-3;
Gstr{i,1} = 'AROMP5'; 
fAROMP5(i)=fAROMP5(i)-1; fHO2(i)=fHO2(i)+0.2; fR4O2(i)=fR4O2(i)+0.2; fMGLY(i)=fMGLY(i)+0.2; fRCHO(i)=fRCHO(i)+1.2; 

i=i+1;
Rnames{i} = 'BRO2 + HO2 = HO2 + LBRO2H';
k(:,i) = GCARR_abc(T, 1.40E-12, 0.0, 700.0);
Gstr{i,1} = 'BRO2'; Gstr{i,2} = 'HO2'; 
fBRO2(i)=fBRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fLBRO2H(i)=fLBRO2H(i)+1; 

i=i+1;
Rnames{i} = 'BRO2 + NO  = NO + LBRO2N ';
k(:,i) = GCARR_abc(T, 2.60E-12, 0.0, 350.0);
Gstr{i,1} = 'BRO2'; Gstr{i,2} = 'NO'; 
fBRO2(i)=fBRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fLBRO2N (i)=fLBRO2N (i)+1; 

i=i+1;
Rnames{i} = 'TRO2 + HO2 = HO2 + LTRO2H';
k(:,i) = GCARR_abc(T, 1.40E-12, 0.0, 700.0);
Gstr{i,1} = 'TRO2'; Gstr{i,2} = 'HO2'; 
fTRO2(i)=fTRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fLTRO2H(i)=fLTRO2H(i)+1; 

i=i+1;
Rnames{i} = 'TRO2 + NO  = NO + LTRO2N ';
k(:,i) = GCARR_abc(T, 2.60E-12, 0.0, 350.0);
Gstr{i,1} = 'TRO2'; Gstr{i,2} = 'NO'; 
fTRO2(i)=fTRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fLTRO2N (i)=fLTRO2N (i)+1; 

i=i+1;
Rnames{i} = 'XRO2 + HO2 = HO2 + LXRO2H';
k(:,i) = GCARR_abc(T, 1.40E-12, 0.0, 700.0);
Gstr{i,1} = 'XRO2'; Gstr{i,2} = 'HO2'; 
fXRO2(i)=fXRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fLXRO2H(i)=fLXRO2H(i)+1; 

i=i+1;
Rnames{i} = 'XRO2 + NO  = NO + LXRO2N ';
k(:,i) = GCARR_abc(T, 2.60E-12, 0.0, 350.0);
Gstr{i,1} = 'XRO2'; Gstr{i,2} = 'NO'; 
fXRO2(i)=fXRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fLXRO2N (i)=fLXRO2N (i)+1; 

i=i+1;
Rnames{i} = 'O3 + hv = O + O2';
k(:,i) = JO3P;
Gstr{i,1} = 'O3'; 
fO3(i)=fO3(i)-1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'O3 + hv = O1D + O2';
k(:,i) = JO1D;
Gstr{i,1} = 'O3'; 
fO3(i)=fO3(i)-1; fO1D(i)=fO1D(i)+1; 

i=i+1;
Rnames{i} = 'NO2 + hv = NO + O';
k(:,i) = JNO2;
Gstr{i,1} = 'NO2'; 
fNO2(i)=fNO2(i)-1; fNO(i)=fNO(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'H2O2 + hv = OH + OH';
k(:,i) = JH2O2;
Gstr{i,1} = 'H2O2'; 
fH2O2(i)=fH2O2(i)-1; fOH(i)=fOH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MP + hv = CH2O + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MP'; 
fMP(i)=fMP(i)-1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'CH2O + hv = HO2 + H + CO';
k(:,i) = JHCHO_HO2;
Gstr{i,1} = 'CH2O'; 
fCH2O(i)=fCH2O(i)-1; fHO2(i)=fHO2(i)+1; fH(i)=fH(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'CH2O + hv = H2 + CO';
k(:,i) = JHCHO_H2;
Gstr{i,1} = 'CH2O'; 
fCH2O(i)=fCH2O(i)-1; fH2(i)=fH2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HNO3 + hv = OH + NO2';
k(:,i) = JHNO3;
Gstr{i,1} = 'HNO3'; 
fHNO3(i)=fHNO3(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HNO2 + hv = OH + NO';
k(:,i) = JHONO;
Gstr{i,1} = 'HNO2'; 
fHNO2(i)=fHNO2(i)-1; fOH(i)=fOH(i)+1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'HNO4 + hv = OH + NO3';
k(:,i) = JHNO4_a;
Gstr{i,1} = 'HNO4'; 
fHNO4(i)=fHNO4(i)-1; fOH(i)=fOH(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'HNO4 + hv = HO2 + NO2';
k(:,i) = JHNO4_b;
Gstr{i,1} = 'HNO4'; 
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + hv = NO2 + O';
k(:,i) = JNO3_NO2;
Gstr{i,1} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + hv = NO + O2';
k(:,i) = JNO3_NO;
Gstr{i,1} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'N2O5 + hv = NO3 + NO2';
k(:,i) = JN2O5_NO2;
Gstr{i,1} = 'N2O5'; 
fN2O5(i)=fN2O5(i)-1; fNO3(i)=fNO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ALD2 + hv = 0.880MO2 + HO2 + 0.880CO + 0.120MCO3';
k(:,i) = JALD2a;
Gstr{i,1} = 'ALD2'; 
fALD2(i)=fALD2(i)-1; fMO2(i)=fMO2(i)+0.880; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+0.880; fMCO3(i)=fMCO3(i)+0.120; 

i=i+1;
Rnames{i} = 'ALD2 + hv = CH4 + CO';
k(:,i) = JALD2b;
Gstr{i,1} = 'ALD2'; 
fALD2(i)=fALD2(i)-1; fCH4(i)=fCH4(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'PAN + hv = 0.700MCO3 + 0.700NO2 + 0.300MO2 + 0.300NO3';
k(:,i) = JPAN;
Gstr{i,1} = 'PAN'; 
fPAN(i)=fPAN(i)-1; fMCO3(i)=fMCO3(i)+0.700; fNO2(i)=fNO2(i)+0.700; fMO2(i)=fMO2(i)+0.300; fNO3(i)=fNO3(i)+0.300; 

i=i+1;
Rnames{i} = 'RCHO + hv = 0.500OTHRO2 + HO2 + CO + 0.070A3O2 + 0.270B3O2';
k(:,i) = JPrAld;
Gstr{i,1} = 'RCHO'; 
fRCHO(i)=fRCHO(i)-1; fOTHRO2(i)=fOTHRO2(i)+0.500; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fA3O2(i)=fA3O2(i)+0.070; fB3O2(i)=fB3O2(i)+0.270; 

i=i+1;
Rnames{i} = 'ACET + hv = MCO3 + MO2';
k(:,i) = JACETa;
Gstr{i,1} = 'ACET'; 
fACET(i)=fACET(i)-1; fMCO3(i)=fMCO3(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'ACET + hv = 2.000MO2 + CO';
k(:,i) = JACETb;
Gstr{i,1} = 'ACET'; 
fACET(i)=fACET(i)-1; fMO2(i)=fMO2(i)+2.000; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MEK + hv = 0.850MCO3 + 0.425OTHRO2 + 0.150MO2 + 0.150RCO3 + 0.060A3O2 + 0.230B3O2';
k(:,i) = JMEK;
Gstr{i,1} = 'MEK'; 
fMEK(i)=fMEK(i)-1; fMCO3(i)=fMCO3(i)+0.850; fOTHRO2(i)=fOTHRO2(i)+0.425; fMO2(i)=fMO2(i)+0.150; fRCO3(i)=fRCO3(i)+0.150; fA3O2(i)=fA3O2(i)+0.060; fB3O2(i)=fB3O2(i)+0.230; 

i=i+1;
Rnames{i} = 'GLYC + hv = 0.900CH2O + 1.730HO2 + CO + 0.070OH + 0.100MOH';
k(:,i) = JGLYC;
Gstr{i,1} = 'GLYC'; 
fGLYC(i)=fGLYC(i)-1; fCH2O(i)=fCH2O(i)+0.900; fHO2(i)=fHO2(i)+1.730; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+0.070; fMOH(i)=fMOH(i)+0.100; 

i=i+1;
Rnames{i} = 'GLYX + hv = 2.000HO2 + 2.000CO';
k(:,i) = JGLYXa;
Gstr{i,1} = 'GLYX'; 
fGLYX(i)=fGLYX(i)-1; fHO2(i)=fHO2(i)+2.000; fCO(i)=fCO(i)+2.000; 

i=i+1;
Rnames{i} = 'GLYX + hv = H2 + 2.000CO';
k(:,i) = JGLYXb;
Gstr{i,1} = 'GLYX'; 
fGLYX(i)=fGLYX(i)-1; fH2(i)=fH2(i)+1; fCO(i)=fCO(i)+2.000; 

i=i+1;
Rnames{i} = 'GLYX + hv = CH2O + CO';
k(:,i) = JGLYXc;
Gstr{i,1} = 'GLYX'; 
fGLYX(i)=fGLYX(i)-1; fCH2O(i)=fCH2O(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MGLY + hv = MCO3 + CO + HO2';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'MGLY'; 
fMGLY(i)=fMGLY(i)-1; fMCO3(i)=fMCO3(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MVK + hv = PRPE + CO';
k(:,i) = JMVK*0.6;
Gstr{i,1} = 'MVK'; 
fMVK(i)=fMVK(i)-1; fPRPE(i)=fPRPE(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MVK + hv = MCO3 + CH2O + CO + HO2';
k(:,i) = JMVK*0.2;
Gstr{i,1} = 'MVK'; 
fMVK(i)=fMVK(i)-1; fMCO3(i)=fMCO3(i)+1; fCH2O(i)=fCH2O(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MVK + hv = MO2 + RCO3';
k(:,i) = JMVK*0.2;
Gstr{i,1} = 'MVK'; 
fMVK(i)=fMVK(i)-1; fMO2(i)=fMO2(i)+1; fRCO3(i)=fRCO3(i)+1; 

i=i+1;
Rnames{i} = 'MACR + hv = CO + HO2 + CH2O + MCO3';
k(:,i) = JMACR;
Gstr{i,1} = 'MACR'; 
fMACR(i)=fMACR(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'HAC + hv = MCO3 + CH2O + HO2';
k(:,i) = JHAC*0.6;
Gstr{i,1} = 'HAC'; 
fHAC(i)=fHAC(i)-1; fMCO3(i)=fMCO3(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'PRPN + hv = OH + HO2 + RCHO + NO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'PRPN'; 
fPRPN(i)=fPRPN(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ETP + hv = OH + HO2 + ALD2';
k(:,i) = JCH3OOH*0.5;
Gstr{i,1} = 'ETP'; 
fETP(i)=fETP(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'RA3P + hv = OH + HO2 + RCHO';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RA3P'; 
fRA3P(i)=fRA3P(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'RB3P + hv = OH + HO2 + ACET';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RB3P'; 
fRB3P(i)=fRB3P(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fACET(i)=fACET(i)+1; 

i=i+1;
Rnames{i} = 'R4P + hv = OH + HO2 + RCHO';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'R4P'; 
fR4P(i)=fR4P(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'PP + hv = OH + HO2 + ALD2 + CH2O';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'PP'; 
fPP(i)=fPP(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'RP + hv = OH + HO2 + ALD2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RP'; 
fRP(i)=fRP(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'R4N2 + hv = NO2 + 0.320ACET + 0.190MEK + 0.180MO2 + 0.270HO2 + 0.320ALD2 + 0.130RCHO + 0.050A3O2 + 0.180B3O2 + 0.320OTHRO2';
k(:,i) = JCH3NO3;
Gstr{i,1} = 'R4N2'; 
fR4N2(i)=fR4N2(i)-1; fNO2(i)=fNO2(i)+1; fACET(i)=fACET(i)+0.320; fMEK(i)=fMEK(i)+0.190; fMO2(i)=fMO2(i)+0.180; fHO2(i)=fHO2(i)+0.270; fALD2(i)=fALD2(i)+0.320; fRCHO(i)=fRCHO(i)+0.130; fA3O2(i)=fA3O2(i)+0.050; fB3O2(i)=fB3O2(i)+0.180; fOTHRO2(i)=fOTHRO2(i)+0.320; 

i=i+1;
Rnames{i} = 'MAP + hv = OH + MO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MAP'; 
fMAP(i)=fMAP(i)-1; fOH(i)=fOH(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'Br2 + hv = 2.000Br';
k(:,i) = JBr2;
Gstr{i,1} = 'Br2'; 
fBr2(i)=fBr2(i)-1; fBr(i)=fBr(i)+2.000; 

i=i+1;
Rnames{i} = 'BrO + hv = Br + O';
k(:,i) = JBrO;
Gstr{i,1} = 'BrO'; 
fBrO(i)=fBrO(i)-1; fBr(i)=fBr(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'HOBr + hv = Br + OH';
k(:,i) = JHOBr;
Gstr{i,1} = 'HOBr'; 
fHOBr(i)=fHOBr(i)-1; fBr(i)=fBr(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'BrNO3 + hv = Br + NO3';
k(:,i) = JBrNO3_Br;
Gstr{i,1} = 'BrNO3'; 
fBrNO3(i)=fBrNO3(i)-1; fBr(i)=fBr(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'BrNO3 + hv = BrO + NO2';
k(:,i) = JBrNO3_BrO;
Gstr{i,1} = 'BrNO3'; 
fBrNO3(i)=fBrNO3(i)-1; fBrO(i)=fBrO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'BrNO2 + hv = Br + NO2';
k(:,i) = JBrNO2;
Gstr{i,1} = 'BrNO2'; 
fBrNO2(i)=fBrNO2(i)-1; fBr(i)=fBr(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'CHBr3 + hv = 3.000Br';
k(:,i) = JCHBr3;
Gstr{i,1} = 'CHBr3'; 
fCHBr3(i)=fCHBr3(i)-1; fBr(i)=fBr(i)+3.000; 

i=i+1;
Rnames{i} = 'BrCl + hv = Br + Cl';
k(:,i) = JBrCl;
Gstr{i,1} = 'BrCl'; 
fBrCl(i)=fBrCl(i)-1; fBr(i)=fBr(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'Cl2 + hv = 2.000Cl';
k(:,i) = JCl2;
Gstr{i,1} = 'Cl2'; 
fCl2(i)=fCl2(i)-1; fCl(i)=fCl(i)+2.000; 

i=i+1;
Rnames{i} = 'ClO + hv = Cl + O';
k(:,i) = JClO;
Gstr{i,1} = 'ClO'; 
fClO(i)=fClO(i)-1; fCl(i)=fCl(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'OClO + hv = ClO + O';
k(:,i) = JOClO;
Gstr{i,1} = 'OClO'; 
fOClO(i)=fOClO(i)-1; fClO(i)=fClO(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'Cl2O2 + hv = Cl + ClOO';
k(:,i) = JCl2O2;
Gstr{i,1} = 'Cl2O2'; 
fCl2O2(i)=fCl2O2(i)-1; fCl(i)=fCl(i)+1; fClOO(i)=fClOO(i)+1; 

i=i+1;
Rnames{i} = 'ClNO2 + hv = Cl + NO2';
k(:,i) = JClNO2;
Gstr{i,1} = 'ClNO2'; 
fClNO2(i)=fClNO2(i)-1; fCl(i)=fCl(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ClNO3 + hv = Cl + NO3';
k(:,i) = JClNO3_Cl;
Gstr{i,1} = 'ClNO3'; 
fClNO3(i)=fClNO3(i)-1; fCl(i)=fCl(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'ClNO3 + hv = ClO + NO2';
k(:,i) = JClNO3_ClO;
Gstr{i,1} = 'ClNO3'; 
fClNO3(i)=fClNO3(i)-1; fClO(i)=fClO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HOCl + hv = Cl + OH';
k(:,i) = JHOCl;
Gstr{i,1} = 'HOCl'; 
fHOCl(i)=fHOCl(i)-1; fCl(i)=fCl(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ClOO + hv = Cl + O2';
k(:,i) = JClOO;
Gstr{i,1} = 'ClOO'; 
fClOO(i)=fClOO(i)-1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'I2 + hv = 2.000I';
k(:,i) = JI2;
Gstr{i,1} = 'I2'; 
fI2(i)=fI2(i)-1; fI(i)=fI(i)+2.000; 

i=i+1;
Rnames{i} = 'HOI + hv = I + OH';
k(:,i) = JHOI;
Gstr{i,1} = 'HOI'; 
fHOI(i)=fHOI(i)-1; fI(i)=fI(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'IO + hv = I + O';
k(:,i) = JIO;
Gstr{i,1} = 'IO'; 
fIO(i)=fIO(i)-1; fI(i)=fI(i)+1; fO(i)=fO(i)+1; 

i=i+1;
Rnames{i} = 'OIO + hv = I + O2';
k(:,i) = JOIO;
Gstr{i,1} = 'OIO'; 
fOIO(i)=fOIO(i)-1; fI(i)=fI(i)+1; 

i=i+1;
Rnames{i} = 'INO + hv = I + NO';
k(:,i) = JINO;
Gstr{i,1} = 'INO'; 
fINO(i)=fINO(i)-1; fI(i)=fI(i)+1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'IONO + hv = I + NO2';
k(:,i) = JIONO;
Gstr{i,1} = 'IONO'; 
fIONO(i)=fIONO(i)-1; fI(i)=fI(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'IONO2 + hv = I + NO3';
k(:,i) = JIONO2;
Gstr{i,1} = 'IONO2'; 
fIONO2(i)=fIONO2(i)-1; fI(i)=fI(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'I2O2 + hv = I + OIO';
k(:,i) = JI2O2;
Gstr{i,1} = 'I2O2'; 
fI2O2(i)=fI2O2(i)-1; fI(i)=fI(i)+1; fOIO(i)=fOIO(i)+1; 

i=i+1;
Rnames{i} = 'I2O4 + hv = 2.000OIO';
k(:,i) = JI2O4;
Gstr{i,1} = 'I2O4'; 
fI2O4(i)=fI2O4(i)-1; fOIO(i)=fOIO(i)+2.000; 

i=i+1;
Rnames{i} = 'I2O3 + hv = OIO + IO';
k(:,i) = JI2O3;
Gstr{i,1} = 'I2O3'; 
fI2O3(i)=fI2O3(i)-1; fOIO(i)=fOIO(i)+1; fIO(i)=fIO(i)+1; 

i=i+1;
Rnames{i} = 'IBr + hv = I + Br';
k(:,i) = JIBr;
Gstr{i,1} = 'IBr'; 
fIBr(i)=fIBr(i)-1; fI(i)=fI(i)+1; fBr(i)=fBr(i)+1; 

i=i+1;
Rnames{i} = 'ICl + hv = I + Cl';
k(:,i) = JICl;
Gstr{i,1} = 'ICl'; 
fICl(i)=fICl(i)-1; fI(i)=fI(i)+1; fCl(i)=fCl(i)+1; 

i=i+1;
Rnames{i} = 'MPN + hv = CH2O + NO3 + HO2';
k(:,i) = JMPN*0.05;
Gstr{i,1} = 'MPN'; 
fMPN(i)=fMPN(i)-1; fCH2O(i)=fCH2O(i)+1; fNO3(i)=fNO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MPN + hv = MO2 + NO2';
k(:,i) = JMPN*0.95;
Gstr{i,1} = 'MPN'; 
fMPN(i)=fMPN(i)-1; fMO2(i)=fMO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ATOOH + hv = OH + CH2O + MCO3';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ATOOH'; 
fATOOH(i)=fATOOH(i)-1; fOH(i)=fOH(i)+1; fCH2O(i)=fCH2O(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'PIP + hv = RCHO + OH + HO2';
k(:,i) = JH2O2;
Gstr{i,1} = 'PIP'; 
fPIP(i)=fPIP(i)-1; fRCHO(i)=fRCHO(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ETHLN + hv = NO2 + CH2O + CO + HO2';
k(:,i) = JETHLN;
Gstr{i,1} = 'ETHLN'; 
fETHLN(i)=fETHLN(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MONITS + hv = MEK + NO2';
k(:,i) = JONIT1;
Gstr{i,1} = 'MONITS'; 
fMONITS(i)=fMONITS(i)-1; fMEK(i)=fMEK(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MONITU + hv = RCHO + NO2';
k(:,i) = JONIT1;
Gstr{i,1} = 'MONITU'; 
fMONITU(i)=fMONITU(i)-1; fRCHO(i)=fRCHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HONIT + hv = HAC + NO2';
k(:,i) = JONIT1;
Gstr{i,1} = 'HONIT'; 
fHONIT(i)=fHONIT(i)-1; fHAC(i)=fHAC(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MENO3 + hv = NO2 + HO2 + CH2O';
k(:,i) = JMENO3;
Gstr{i,1} = 'MENO3'; 
fMENO3(i)=fMENO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'ETNO3 + hv = NO2 + HO2 + ALD2';
k(:,i) = JETNO3;
Gstr{i,1} = 'ETNO3'; 
fETNO3(i)=fETNO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'IPRNO3 + hv = NO2 + HO2 + ACET';
k(:,i) = JIPRNO3;
Gstr{i,1} = 'IPRNO3'; 
fIPRNO3(i)=fIPRNO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fACET(i)=fACET(i)+1; 

i=i+1;
Rnames{i} = 'NPRNO3 + hv = NO2 + HO2 + RCHO';
k(:,i) = JNPRNO3;
Gstr{i,1} = 'NPRNO3'; 
fNPRNO3(i)=fNPRNO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fRCHO(i)=fRCHO(i)+1; 

i=i+1;
Rnames{i} = 'HMHP + hv = 2OH + CH2O';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HMHP'; 
fHMHP(i)=fHMHP(i)-1; fOH(i)=fOH(i)+2; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'HPETHNL + hv = OH + CO + HO2 + CH2O';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HPETHNL'; 
fHPETHNL(i)=fHPETHNL(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'PYAC + hv = MCO3 + CO2 + HO2';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'PYAC'; 
fPYAC(i)=fPYAC(i)-1; fMCO3(i)=fMCO3(i)+1; fCO2(i)=fCO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'PROPNN + hv = NO2 + CH2O + MCO3';
k(:,i) = JPROPNN;
Gstr{i,1} = 'PROPNN'; 
fPROPNN(i)=fPROPNN(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'MVKHC + hv = CO + HO2 + CH2O + MCO3';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'MVKHC'; 
fMVKHC(i)=fMVKHC(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'MVKHCB + hv = 0.5GLYX + 1.5HO2 + 0.5MCO3 + 0.5CO + 0.5MGLY';
k(:,i) = JPrAld;
Gstr{i,1} = 'MVKHCB'; 
fMVKHCB(i)=fMVKHCB(i)-1; fGLYX(i)=fGLYX(i)+0.5; fHO2(i)=fHO2(i)+1.5; fMCO3(i)=fMCO3(i)+0.5; fCO(i)=fCO(i)+0.5; fMGLY(i)=fMGLY(i)+0.5; 

i=i+1;
Rnames{i} = 'MVKHP + hv = 0.53MCO3 + 0.53GLYC + OH + 0.47HO2 + 0.47CH2O + 0.47MGLY';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MVKHP'; 
fMVKHP(i)=fMVKHP(i)-1; fMCO3(i)=fMCO3(i)+0.53; fGLYC(i)=fGLYC(i)+0.53; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+0.47; fCH2O(i)=fCH2O(i)+0.47; fMGLY(i)=fMGLY(i)+0.47; 

i=i+1;
Rnames{i} = 'MVKPC + hv = OH + 0.571CO + 0.571MGLY + 0.571HO2 + 0.429GLYX + 0.429MCO3';
k(:,i) = JMVKN;
Gstr{i,1} = 'MVKPC'; 
fMVKPC(i)=fMVKPC(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+0.571; fMGLY(i)=fMGLY(i)+0.571; fHO2(i)=fHO2(i)+0.571; fGLYX(i)=fGLYX(i)+0.429; fMCO3(i)=fMCO3(i)+0.429; 

i=i+1;
Rnames{i} = 'MCRENOL + hv = 0.875CO + 0.75PYAC + 1.75OH + 0.125MGLY + 0.125HO2 + 0.125MCO3 + 0.125GLYX';
k(:,i) = JONIT1;
Gstr{i,1} = 'MCRENOL'; 
fMCRENOL(i)=fMCRENOL(i)-1; fCO(i)=fCO(i)+0.875; fPYAC(i)=fPYAC(i)+0.75; fOH(i)=fOH(i)+1.75; fMGLY(i)=fMGLY(i)+0.125; fHO2(i)=fHO2(i)+0.125; fMCO3(i)=fMCO3(i)+0.125; fGLYX(i)=fGLYX(i)+0.125; 

i=i+1;
Rnames{i} = 'MCRHP + hv = OH + 0.77CO + HO2 + 0.77HAC + 0.23MGLY + 0.23CH2O';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MCRHP'; 
fMCRHP(i)=fMCRHP(i)-1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+0.77; fHO2(i)=fHO2(i)+1; fHAC(i)=fHAC(i)+0.77; fMGLY(i)=fMGLY(i)+0.23; fCH2O(i)=fCH2O(i)+0.23; 

i=i+1;
Rnames{i} = 'MACR1OOH + hv = 0.75OH + 1.238CO2 + 0.488MO2 + 0.75CH2O + 0.262MCO3 + 0.25MACR1OOH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MACR1OOH'; 
fMACR1OOH(i)=fMACR1OOH(i)-1; fOH(i)=fOH(i)+0.75; fCO2(i)=fCO2(i)+1.238; fMO2(i)=fMO2(i)+0.488; fCH2O(i)=fCH2O(i)+0.75; fMCO3(i)=fMCO3(i)+0.262; fMACR1OOH(i)=fMACR1OOH(i)+0.25; 

i=i+1;
Rnames{i} = 'MVKN + hv = 0.290HO2 + 0.010OH + 0.700NO2 + 1.010MCO3 + 0.690GLYC + 0.300ETHLN';
k(:,i) = JMVKN;
Gstr{i,1} = 'MVKN'; 
fMVKN(i)=fMVKN(i)-1; fHO2(i)=fHO2(i)+0.290; fOH(i)=fOH(i)+0.010; fNO2(i)=fNO2(i)+0.700; fMCO3(i)=fMCO3(i)+1.010; fGLYC(i)=fGLYC(i)+0.690; fETHLN(i)=fETHLN(i)+0.300; 

i=i+1;
Rnames{i} = 'MCRHN + hv = HAC + CO + HO2 + NO2';
k(:,i) = JMACRN;
Gstr{i,1} = 'MCRHN'; 
fMCRHN(i)=fMCRHN(i)-1; fHAC(i)=fHAC(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MCRHNB + hv = PROPNN + OH + CO + HO2';
k(:,i) = JMACR;
Gstr{i,1} = 'MCRHNB'; 
fMCRHNB(i)=fMCRHNB(i)-1; fPROPNN(i)=fPROPNN(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'RIPA + hv = MVK + CH2O + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RIPA'; 
fRIPA(i)=fRIPA(i)-1; fMVK(i)=fMVK(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'RIPB + hv = MACR + CH2O + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RIPB'; 
fRIPB(i)=fRIPB(i)-1; fMACR(i)=fMACR(i)+1; fCH2O(i)=fCH2O(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'RIPC + hv = OH + HO2 + HC5A';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RIPC'; 
fRIPC(i)=fRIPC(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fHC5A(i)=fHC5A(i)+1; 

i=i+1;
Rnames{i} = 'RIPD + hv = OH + HO2 + HC5A';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'RIPD'; 
fRIPD(i)=fRIPD(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fHC5A(i)=fHC5A(i)+1; 

i=i+1;
Rnames{i} = 'HPALD1 + hv = 0.888CO + 1.662OH + 0.112HO2 + 0.112IDC + 0.112MVKPC + 0.552MCRENOL + 0.224C4HVP1';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HPALD1'; 
fHPALD1(i)=fHPALD1(i)-1; fCO(i)=fCO(i)+0.888; fOH(i)=fOH(i)+1.662; fHO2(i)=fHO2(i)+0.112; fIDC(i)=fIDC(i)+0.112; fMVKPC(i)=fMVKPC(i)+0.112; fMCRENOL(i)=fMCRENOL(i)+0.552; fC4HVP1(i)=fC4HVP1(i)+0.224; 

i=i+1;
Rnames{i} = 'HPALD2 + hv = 0.818CO + 1.637OH + 0.182HO2 + 0.182IDC + 0.182MVKPC + 0.455MCRENOL + 0.182C4HVP2';
k(:,i) = JHPALD2;
Gstr{i,1} = 'HPALD2'; 
fHPALD2(i)=fHPALD2(i)-1; fCO(i)=fCO(i)+0.818; fOH(i)=fOH(i)+1.637; fHO2(i)=fHO2(i)+0.182; fIDC(i)=fIDC(i)+0.182; fMVKPC(i)=fMVKPC(i)+0.182; fMCRENOL(i)=fMCRENOL(i)+0.455; fC4HVP2(i)=fC4HVP2(i)+0.182; 

i=i+1;
Rnames{i} = 'HPALD3 + hv = CO + OH + HO2 + MVK';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HPALD3'; 
fHPALD3(i)=fHPALD3(i)-1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fMVK(i)=fMVK(i)+1; 

i=i+1;
Rnames{i} = 'HPALD4 + hv = CO + OH + HO2 + MACR';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HPALD4'; 
fHPALD4(i)=fHPALD4(i)-1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fMACR(i)=fMACR(i)+1; 

i=i+1;
Rnames{i} = 'IHN1 + hv = NO2 + 0.45HC5A + 0.45HO2 + 0.55MVKHP + 0.55CO + 0.55OH';
k(:,i) = JONIT1;
Gstr{i,1} = 'IHN1'; 
fIHN1(i)=fIHN1(i)-1; fNO2(i)=fNO2(i)+1; fHC5A(i)=fHC5A(i)+0.45; fHO2(i)=fHO2(i)+0.45; fMVKHP(i)=fMVKHP(i)+0.55; fCO(i)=fCO(i)+0.55; fOH(i)=fOH(i)+0.55; 

i=i+1;
Rnames{i} = 'IHN2 + hv = NO2 + MVK + HO2 + CH2O';
k(:,i) = JONIT1;
Gstr{i,1} = 'IHN2'; 
fIHN2(i)=fIHN2(i)-1; fNO2(i)=fNO2(i)+1; fMVK(i)=fMVK(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'IHN3 + hv = NO2 + MACR + HO2 + CH2O';
k(:,i) = JONIT1;
Gstr{i,1} = 'IHN3'; 
fIHN3(i)=fIHN3(i)-1; fNO2(i)=fNO2(i)+1; fMACR(i)=fMACR(i)+1; fHO2(i)=fHO2(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'IHN4 + hv = NO2 + 0.45HC5A + 0.45HO2 + 0.55MCRHP + 0.55CO + 0.55OH';
k(:,i) = JONIT1;
Gstr{i,1} = 'IHN4'; 
fIHN4(i)=fIHN4(i)-1; fNO2(i)=fNO2(i)+1; fHC5A(i)=fHC5A(i)+0.45; fHO2(i)=fHO2(i)+0.45; fMCRHP(i)=fMCRHP(i)+0.55; fCO(i)=fCO(i)+0.55; fOH(i)=fOH(i)+0.55; 

i=i+1;
Rnames{i} = 'INPB + hv = NO2 + CH2O + 0.097MACR + 0.903MVK + 0.67OH + 0.33HO2';
k(:,i) = JNITP;
Gstr{i,1} = 'INPB'; 
fINPB(i)=fINPB(i)-1; fNO2(i)=fNO2(i)+1; fCH2O(i)=fCH2O(i)+1; fMACR(i)=fMACR(i)+0.097; fMVK(i)=fMVK(i)+0.903; fOH(i)=fOH(i)+0.67; fHO2(i)=fHO2(i)+0.33; 

i=i+1;
Rnames{i} = 'INPD + hv = OH + 0.159HO2 + 0.159ICN + 0.841INA';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'INPD'; 
fINPD(i)=fINPD(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+0.159; fICN(i)=fICN(i)+0.159; fINA(i)=fINA(i)+0.841; 

i=i+1;
Rnames{i} = 'INPD + hv = NO2 + 0.841IHOO1 + 0.159IHOO4';
k(:,i) = JONIT1;
Gstr{i,1} = 'INPD'; 
fINPD(i)=fINPD(i)-1; fNO2(i)=fNO2(i)+1; fIHOO1(i)=fIHOO1(i)+0.841; fIHOO4(i)=fIHOO4(i)+0.159; 

i=i+1;
Rnames{i} = 'ICN + hv = NO2 + 0.839CO + 0.645OH + 0.161HO2 + 0.161IDC + 0.162MVKPC + 0.481MCRENOL + 0.128C4HVP2 + 0.068C4HVP1';
k(:,i) = JPAN;
Gstr{i,1} = 'ICN'; 
fICN(i)=fICN(i)-1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+0.839; fOH(i)=fOH(i)+0.645; fHO2(i)=fHO2(i)+0.161; fIDC(i)=fIDC(i)+0.161; fMVKPC(i)=fMVKPC(i)+0.162; fMCRENOL(i)=fMCRENOL(i)+0.481; fC4HVP2(i)=fC4HVP2(i)+0.128; fC4HVP1(i)=fC4HVP1(i)+0.068; 

i=i+1;
Rnames{i} = 'IDN + hv = 1.555NO2 + 0.5GLYC + 0.5HAC + 0.05MVK + 0.005MACR + 0.055CH2O + 0.227INA + 0.228ICN + 0.228HO2';
k(:,i) = JONIT2;
Gstr{i,1} = 'IDN'; 
fIDN(i)=fIDN(i)-1; fNO2(i)=fNO2(i)+1.555; fGLYC(i)=fGLYC(i)+0.5; fHAC(i)=fHAC(i)+0.5; fMVK(i)=fMVK(i)+0.05; fMACR(i)=fMACR(i)+0.005; fCH2O(i)=fCH2O(i)+0.055; fINA(i)=fINA(i)+0.227; fICN(i)=fICN(i)+0.228; fHO2(i)=fHO2(i)+0.228; 

i=i+1;
Rnames{i} = 'ICPDH + hv = CO + 1.5HO2 + 0.5OH + 0.5MCRHP + 0.35MVKDH + 0.15MCRDH';
k(:,i) = JPrAld;
Gstr{i,1} = 'ICPDH'; 
fICPDH(i)=fICPDH(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1.5; fOH(i)=fOH(i)+0.5; fMCRHP(i)=fMCRHP(i)+0.5; fMVKDH(i)=fMVKDH(i)+0.35; fMCRDH(i)=fMCRDH(i)+0.15; 

i=i+1;
Rnames{i} = 'ICPDH + hv = OH + HO2 + 0.122CO + 0.1CH2O + 0.1MVKHCB + 0.438HAC + 0.438GLYX + 0.088GLYC + 0.088MGLY + 0.122MCRDH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ICPDH'; 
fICPDH(i)=fICPDH(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+0.122; fCH2O(i)=fCH2O(i)+0.1; fMVKHCB(i)=fMVKHCB(i)+0.1; fHAC(i)=fHAC(i)+0.438; fGLYX(i)=fGLYX(i)+0.438; fGLYC(i)=fGLYC(i)+0.088; fMGLY(i)=fMGLY(i)+0.088; fMCRDH(i)=fMCRDH(i)+0.122; 

i=i+1;
Rnames{i} = 'IDHDP + hv = 1.25OH + 0.25GLYC + 0.25HAC + 0.75ICPDH + 0.75HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'IDHDP'; 
fIDHDP(i)=fIDHDP(i)-1; fOH(i)=fOH(i)+1.25; fGLYC(i)=fGLYC(i)+0.25; fHAC(i)=fHAC(i)+0.25; fICPDH(i)=fICPDH(i)+0.75; fHO2(i)=fHO2(i)+0.75; 

i=i+1;
Rnames{i} = 'IDHPE + hv = OH + HO2 + 0.429MGLY + 0.429GLYC + 0.571GLYX + 0.571HAC';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'IDHPE'; 
fIDHPE(i)=fIDHPE(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fMGLY(i)=fMGLY(i)+0.429; fGLYC(i)=fGLYC(i)+0.429; fGLYX(i)=fGLYX(i)+0.571; fHAC(i)=fHAC(i)+0.571; 

i=i+1;
Rnames{i} = 'IDCHP + hv = 0.546OH + CO + 1.454HO2 + 0.391MVKHC + 0.155MVKHCB + 0.454MVKPC';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'IDCHP'; 
fIDCHP(i)=fIDCHP(i)-1; fOH(i)=fOH(i)+0.546; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1.454; fMVKHC(i)=fMVKHC(i)+0.391; fMVKHCB(i)=fMVKHCB(i)+0.155; fMVKPC(i)=fMVKPC(i)+0.454; 

i=i+1;
Rnames{i} = 'ITHN + hv = OH + 0.7HO2 + 0.55CH2O + 0.5MCRHN + 0.3GLYC + 0.45HAC + 0.3NO2 + 0.15ETHLN + 0.05MVKN';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ITHN'; 
fITHN(i)=fITHN(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+0.7; fCH2O(i)=fCH2O(i)+0.55; fMCRHN(i)=fMCRHN(i)+0.5; fGLYC(i)=fGLYC(i)+0.3; fHAC(i)=fHAC(i)+0.45; fNO2(i)=fNO2(i)+0.3; fETHLN(i)=fETHLN(i)+0.15; fMVKN(i)=fMVKN(i)+0.05; 

i=i+1;
Rnames{i} = 'ITHN + hv = NO2 + 0.8HAC + 0.7HO2 + 0.5HPETHNL + 0.35GLYC + 0.15CH2O + 0.15MCRHP + 0.05ATOOH + 0.3OH';
k(:,i) = JONIT1;
Gstr{i,1} = 'ITHN'; 
fITHN(i)=fITHN(i)-1; fNO2(i)=fNO2(i)+1; fHAC(i)=fHAC(i)+0.8; fHO2(i)=fHO2(i)+0.7; fHPETHNL(i)=fHPETHNL(i)+0.5; fGLYC(i)=fGLYC(i)+0.35; fCH2O(i)=fCH2O(i)+0.15; fMCRHP(i)=fMCRHP(i)+0.15; fATOOH(i)=fATOOH(i)+0.05; fOH(i)=fOH(i)+0.3; 

i=i+1;
Rnames{i} = 'ITCN + hv = MGLY + OH + NO2 + GLYC';
k(:,i) = JMACRNP;
Gstr{i,1} = 'ITCN'; 
fITCN(i)=fITCN(i)-1; fMGLY(i)=fMGLY(i)+1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; fGLYC(i)=fGLYC(i)+1; 

i=i+1;
Rnames{i} = 'ITCN + hv = 0.5MVKHP + 0.5MCRHP + CO + NO2 + HO2';
k(:,i) = JPrAld;
Gstr{i,1} = 'ITCN'; 
fITCN(i)=fITCN(i)-1; fMVKHP(i)=fMVKHP(i)+0.5; fMCRHP(i)=fMCRHP(i)+0.5; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ETHP + hv = ETO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ETHP'; 
fETHP(i)=fETHP(i)-1; fETO(i)=fETO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'BALD + hv = BENZO2 + CO + HO2';
k(:,i) = JBALD;
Gstr{i,1} = 'BALD'; 
fBALD(i)=fBALD(i)-1; fBENZO2(i)=fBENZO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'BZCO3H + hv = BENZO2 + OH + CO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'BZCO3H'; 
fBZCO3H(i)=fBZCO3H(i)-1; fBENZO2(i)=fBENZO2(i)+1; fOH(i)=fOH(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = 'BENZP + hv = BENZO';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'BENZP'; 
fBENZP(i)=fBENZP(i)-1; fBENZO(i)=fBENZO(i)+1; 

i=i+1;
Rnames{i} = 'NPHEN + hv = HNO2 + CO + CO2 + AROMP4 + HO2';
k(:,i) = JPROPNN;
Gstr{i,1} = 'NPHEN'; 
fNPHEN(i)=fNPHEN(i)-1; fHNO2(i)=fHNO2(i)+1; fCO(i)=fCO(i)+1; fCO2(i)=fCO2(i)+1; fAROMP4(i)=fAROMP4(i)+1; fHO2(i)=fHO2(i)+1; 



%%%%%%%%%%%%%%%%%%%
% Furans 
%%%%%%%%%%%%%%%%%%%
%Lixu, 20220221
%butadiene/C4H6
i=i+1;
%Rnames{i} = 'OH + C4H6 = 0.217*BUTDAO2 + 0.649*BUTDBO2 + 0.134*BUTDCO2';
Rnames{i} = 'OH + C4H6 = C4H6O2';
k(:,i) = 1.48e-11.*exp(448./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'C4H6'; 
%fOH(i)=fOH(i)-1; fC4H6(i)=fC4H6(i)-1; fBUTDAO2(i)=fBUTDAO2(i)+0.217; fBUTDBO2(i)=fBUTDBO2(i)+0.649; fBUTDCO2(i)=fBUTDCO2(i)+0.134 
fOH(i)=fOH(i)-1; fC4H6(i)=fC4H6(i)-1; fC4H6O2(i)=fC4H6O2(i)+1;

%Acrolein
i=i+1;
%Rnames{i} = 'ACR + OH = 0.68*ACO3+0.065*ACRO2 + 0.255*OCCOHCO2';
Rnames{i} = 'ACR + OH = ACRO2';
k(:,i) = 2.00E-11;
Gstr{i,1} = 'ACR'; Gstr{i,2} = 'OH'; 
%fACR(i)=fACR(i)-1; fOH(i)=fOH(i)-1; fACO3(i)=fACO3(i)+0.68; fACO3(i)=fACO3(i)+0.065; fOCCOHCO2(i)=fOCCOHCO2(i)+0.255;
fACR(i)=fACR(i)-1; fOH(i)=fOH(i)-1; fACRO2(i)=fACRO2(i)+1;


i=i+1;
Rnames{i} = 'FURAN + OH = MALDIAL + HO2';
k(:,i) = 4.2e-11.*0.7;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fMALDIAL(i)=fMALDIAL(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURAN + OH = HYDFURANO2';
k(:,i) = 4.2e-11.*0.3;
Gstr{i,1} = 'FURAN'; Gstr{i,2} = 'OH'; 
fFURAN(i)=fFURAN(i)-1; fOH(i)=fOH(i)-1; fHYDFURANO2(i)=fHYDFURANO2(i)+1; 

%% MALDIAL and HYDFURANO2
i=i+1;
Rnames{i} = 'MALDIAL + OH = MALDIALCO3';
k(:,i) = 5.20e-11.*0.83;
Gstr{i,1} = 'MALDIAL'; Gstr{i,2} = 'OH'; 
fMALDIAL(i)=fMALDIAL(i)-1; fOH(i)=fOH(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; 

i=i+1;
Rnames{i} = 'MALDIAL + OH = MALDIALO2';
k(:,i) = 5.20e-11.*0.17;
Gstr{i,1} = 'MALDIAL'; Gstr{i,2} = 'OH'; 
fMALDIAL(i)=fMALDIAL(i)-1; fOH(i)=fOH(i)-1; fMALDIALO2(i)=fMALDIALO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURANO2 + NO = MALDALCO2H + NO2 + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDFURANO2'; Gstr{i,2} = 'NO'; 
fHYDFURANO2(i)=fHYDFURANO2(i)-1; fNO(i)=fNO(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURANO2 + HO2 = HYDFURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'HYDFURANO2'; Gstr{i,2} = 'HO2'; 
fHYDFURANO2(i)=fHYDFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDFURANOOH(i)=fHYDFURANOOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURANO2 + RO2 = MALDALCO2H + HO2';
k(:,i) = 5e-13;
Gstr{i,1} = 'HYDFURANO2'; Gstr{i,2} = 'RO2';
fHYDFURANO2(i)=fHYDFURANO2(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fHO2(i)=fHO2(i)+1; 

%%% MALDIALCO3, HYDFURANOOH and MALDIALO2
i=i+1;
Rnames{i} = 'MALDIALCO3 + HO2 = MALDALCO2H + O3';
k(:,i) = KAPHO2.*0.15;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'HO2'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fHO2(i)=fHO2(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + HO2 = MALDALCO3H';
k(:,i) = KAPHO2.*0.41;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'HO2'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fHO2(i)=fHO2(i)-1; fMALDALCO3H(i)=fMALDALCO3H(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + HO2 = MALDIALCO2 + OH';
k(:,i) = KAPHO2.*0.44;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'HO2'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fHO2(i)=fHO2(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + NO = MALDIALCO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'NO'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fNO(i)=fNO(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + NO2 = MALDIALPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'NO2'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fNO2(i)=fNO2(i)-1; fMALDIALPAN(i)=fMALDIALPAN(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + NO3 = MALDIALCO2 + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'NO3'; 
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fNO3(i)=fNO3(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + RO2 = MALDALCO2H';
k(:,i) = 1.00e-11.*0.30;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'RO2';
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO3 + RO2 = MALDIALCO2';
k(:,i) = 1.00e-11.*0.70;
Gstr{i,1} = 'MALDIALCO3'; Gstr{i,2} = 'RO2';
fMALDIALCO3(i)=fMALDIALCO3(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURANOOH + hv = MALDALCO2H + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HYDFURANOOH'; 
fHYDFURANOOH(i)=fHYDFURANOOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURANOOH + OH = MALDALCO2H + OH';
k(:,i) = 4e-11;
Gstr{i,1} = 'HYDFURANOOH'; Gstr{i,2} = 'OH'; 
fHYDFURANOOH(i)=fHYDFURANOOH(i)-1; fOH(i)=fOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + HO2 = MALDIALOOH';
k(:,i) = KRO2HO2.*0.625;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'HO2'; 
fMALDIALO2(i)=fMALDIALO2(i)-1; fHO2(i)=fHO2(i)-1; fMALDIALOOH(i)=fMALDIALOOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + NO = MALDIALO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'NO'; 
fMALDIALO2(i)=fMALDIALO2(i)-1; fNO(i)=fNO(i)-1; fMALDIALO(i)=fMALDIALO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + NO3 = MALDIALO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'NO3'; 
fMALDIALO2(i)=fMALDIALO2(i)-1; fNO3(i)=fNO3(i)-1; fMALDIALO(i)=fMALDIALO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + RO2 = HOCOC4DIAL';
k(:,i) = 8.80e-13.*0.20;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'RO2';
fMALDIALO2(i)=fMALDIALO2(i)-1; fHOCOC4DIAL(i)=fHOCOC4DIAL(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + RO2 = HOHOC4DIAL';
k(:,i) = 8.80e-13.*0.20;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'RO2';
fMALDIALO2(i)=fMALDIALO2(i)-1; fHOHOC4DIAL(i)=fHOHOC4DIAL(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO2 + RO2 = MALDIALO';
k(:,i) = 8.80e-13.*0.60;
Gstr{i,1} = 'MALDIALO2'; Gstr{i,2} = 'RO2';
fMALDIALO2(i)=fMALDIALO2(i)-1; fMALDIALO(i)=fMALDIALO(i)+1; 

%%%% MALDALCO2H, MALDALCO3H, MALDIALCO2, MALDIALPAN, MALDIALOOH, MALDIALO, HOCOC4DIAL, and HOHOC4DIAL
i=i+1;
Rnames{i} = 'MALDALCO2H + OH = MALDIALCO2';
k(:,i) = 3.70e-11;
Gstr{i,1} = 'MALDALCO2H'; Gstr{i,2} = 'OH'; 
fMALDALCO2H(i)=fMALDALCO2H(i)-1; fOH(i)=fOH(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDALCO2H + hv = HCOCO2H + HO2 + CO + HO2 + CO';
k(:,i) = JMACR;
Gstr{i,1} = 'MALDALCO2H'; 
fMALDALCO2H(i)=fMALDALCO2H(i)-1; fHCOCO2H(i)=fHCOCO2H(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MALDALCO3H + OH = MALDIALCO3';
k(:,i) = 4.00e-11;
Gstr{i,1} = 'MALDALCO3H'; Gstr{i,2} = 'OH'; 
fMALDALCO3H(i)=fMALDALCO3H(i)-1; fOH(i)=fOH(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; 

i=i+1;
Rnames{i} = 'MALDALCO3H + hv = MALDIALCO2 + OH';
k(:,i) = JHPALD.*2;
Gstr{i,1} = 'MALDALCO3H'; 
fMALDALCO3H(i)=fMALDALCO3H(i)-1; fMALDIALCO2(i)=fMALDIALCO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO2 = GLYX + HO2 + CO';
k(:,i) = KDEC.*0.40;
Gstr{i,1} = 'MALDIALCO2'; 
fMALDIALCO2(i)=fMALDIALCO2(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALCO2 = MALANHY + HO2';
k(:,i) = KDEC.*0.60;
Gstr{i,1} = 'MALDIALCO2'; 
fMALDIALCO2(i)=fMALDIALCO2(i)-1; fMALANHY(i)=fMALANHY(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALPAN + OH = GLYX + CO + CO + NO2';
k(:,i) = 3.70e-11;
Gstr{i,1} = 'MALDIALPAN'; Gstr{i,2} = 'OH'; 
fMALDIALPAN(i)=fMALDIALPAN(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALPAN = MALDIALCO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'MALDIALPAN'; 
fMALDIALPAN(i)=fMALDIALPAN(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALOOH + OH = HOCOC4DIAL + OH';
k(:,i) = 1.22e-10;
Gstr{i,1} = 'MALDIALOOH'; Gstr{i,2} = 'OH'; 
fMALDIALOOH(i)=fMALDIALOOH(i)-1; fOH(i)=fOH(i)-1; fHOCOC4DIAL(i)=fHOCOC4DIAL(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALOOH + OH = MALDIALO2';
k(:,i) = 1.90e-12.*exp(190./T);
Gstr{i,1} = 'MALDIALOOH'; Gstr{i,2} = 'OH'; 
fMALDIALOOH(i)=fMALDIALOOH(i)-1; fOH(i)=fOH(i)-1; fMALDIALO2(i)=fMALDIALO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALOOH + hv = C32OH13CO + CO + OH + HO2';
k(:,i) = JHPALD2.*2;
Gstr{i,1} = 'MALDIALOOH'; 
fMALDIALOOH(i)=fMALDIALOOH(i)-1; fC32OH13CO(i)=fC32OH13CO(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALOOH + hv = MALDIALO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MALDIALOOH'; 
fMALDIALOOH(i)=fMALDIALOOH(i)-1; fMALDIALO(i)=fMALDIALO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALDIALO = GLYX + GLYX + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'MALDIALO'; 
fMALDIALO(i)=fMALDIALO(i)-1; fGLYX(i)=fGLYX(i)+1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HOCOC4DIAL + OH = CO2C4DIAL + HO2';
k(:,i) = 3.67e-11;
Gstr{i,1} = 'HOCOC4DIAL'; Gstr{i,2} = 'OH'; 
fHOCOC4DIAL(i)=fHOCOC4DIAL(i)-1; fOH(i)=fOH(i)-1; fCO2C4DIAL(i)=fCO2C4DIAL(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HOCOC4DIAL + hv = HCOCOHCO3 + HO2 + CO';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'HOCOC4DIAL'; 
fHOCOC4DIAL(i)=fHOCOC4DIAL(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HOCOC4DIAL + hv = HCOCOHCO3 + HO2 + CO';
k(:,i) = JHPALD2;
Gstr{i,1} = 'HOCOC4DIAL'; 
fHOCOC4DIAL(i)=fHOCOC4DIAL(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HOHOC4DIAL + OH = HOCOC4DIAL + HO2';
k(:,i) = 8.13e-11;
Gstr{i,1} = 'HOHOC4DIAL'; Gstr{i,2} = 'OH'; 
fHOHOC4DIAL(i)=fHOHOC4DIAL(i)-1; fOH(i)=fOH(i)-1; fHOCOC4DIAL(i)=fHOCOC4DIAL(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HOHOC4DIAL + hv = C32OH13CO + HO2 + HO2 + CO';
k(:,i) = JHPALD2.*2;
Gstr{i,1} = 'HOHOC4DIAL'; 
fHOHOC4DIAL(i)=fHOHOC4DIAL(i)-1; fC32OH13CO(i)=fC32OH13CO(i)+1; fHO2(i)=fHO2(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 



%%%%% HCOCO2H, MALANHY, C32OH13CO, CO2C4DIAL, HCOCOHCO3
i=i+1;
Rnames{i} = 'OH + HCOCO2H = CO + HO2';
k(:,i) = 1.23e-11;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCOCO2H'; 
fOH(i)=fOH(i)-1; fHCOCO2H(i)=fHCOCO2H(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MALANHY + OH = MALANHYO2';
k(:,i) = 1.4e-12;
Gstr{i,1} = 'MALANHY'; Gstr{i,2} = 'OH'; 
fMALANHY(i)=fMALANHY(i)-1; fOH(i)=fOH(i)-1; fMALANHYO2(i)=fMALANHYO2(i)+1; 

i=i+1;
Rnames{i} = 'C32OH13CO + OH = HCOCOHCO3';
k(:,i) = 1.36e-10;
Gstr{i,1} = 'C32OH13CO'; Gstr{i,2} = 'OH'; 
fC32OH13CO(i)=fC32OH13CO(i)-1; fOH(i)=fOH(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; 

i=i+1;
Rnames{i} = 'C32OH13CO + hv = GLYX + HO2 + HO2 + CO';
k(:,i) = JHPALD2.*2;
Gstr{i,1} = 'C32OH13CO'; 
fC32OH13CO(i)=fC32OH13CO(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'CO2C4DIAL + OH = CO + CO + CO + CO + HO2';
k(:,i) = 2.45e-11;
Gstr{i,1} = 'CO2C4DIAL'; Gstr{i,2} = 'OH'; 
fCO2C4DIAL(i)=fCO2C4DIAL(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'CO2C4DIAL + hv = CO + CO + HO2 + HO2 + CO + CO';
k(:,i) = JMGlyxl.*2;
Gstr{i,1} = 'CO2C4DIAL'; 
fCO2C4DIAL(i)=fCO2C4DIAL(i)-1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + HO2 = GLYX + HO2 + OH';
k(:,i) = KAPHO2.*0.44;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'HO2'; 
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fHO2(i)=fHO2(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + HO2 = HCOCOHCO3H';
k(:,i) = KAPHO2.*0.56;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'HO2'; 
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fHO2(i)=fHO2(i)-1; fHCOCOHCO3H(i)=fHCOCOHCO3H(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + NO = GLYX + HO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'NO'; 
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fNO(i)=fNO(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + NO2 = HCOCOHPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'NO2'; 
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fNO2(i)=fNO2(i)-1; fHCOCOHPAN(i)=fHCOCOHPAN(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + NO3 = GLYX + HO2 + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'NO3'; 
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fNO3(i)=fNO3(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3 + RO2 = GLYX + HO2';
k(:,i) = 1.00e-11;
Gstr{i,1} = 'HCOCOHCO3'; Gstr{i,2} = 'RO2';
fHCOCOHCO3(i)=fHCOCOHCO3(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1;

%%%%%% MALANHYO2, HCOCOHCO3H, and HCOCOHPAN
i=i+1;
Rnames{i} = 'MALANHYO2 + HO2 = MALANHYOOH';
k(:,i) = KRO2HO2.*0.625;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'HO2'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fHO2(i)=fHO2(i)-1; fMALANHYOOH(i)=fMALANHYOOH(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + NO = MALANHYO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'NO'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fNO(i)=fNO(i)-1; fMALANHYO(i)=fMALANHYO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + NO3 = MALANHYO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'NO3'; 
fMALANHYO2(i)=fMALANHYO2(i)-1; fNO3(i)=fNO3(i)-1; fMALANHYO(i)=fMALANHYO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + RO2 = MALANHY2OH';
k(:,i) = 8.80e-13.*0.2;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'RO2';
fMALANHYO2(i)=fMALANHYO2(i)-1; fMALANHY2OH(i)=fMALANHY2OH(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + RO2 = MALANHYO';
k(:,i) = 8.80e-13.*0.6;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'RO2';
fMALANHYO2(i)=fMALANHYO2(i)-1; fMALANHYO(i)=fMALANHYO(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO2 + RO2 = MALNHYOHCO';
k(:,i) = 8.80e-13.*0.2;
Gstr{i,1} = 'MALANHYO2'; Gstr{i,2} = 'RO2';
fMALANHYO2(i)=fMALANHYO2(i)-1; fMALNHYOHCO(i)=fMALNHYOHCO(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3H + OH = HCOCOHCO3';
k(:,i) = 7.33e-11;
Gstr{i,1} = 'HCOCOHCO3H'; Gstr{i,2} = 'OH'; 
fHCOCOHCO3H(i)=fHCOCOHCO3H(i)-1; fOH(i)=fOH(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHCO3H + hv = GLYX + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HCOCOHCO3H'; 
fHCOCOHCO3H(i)=fHCOCOHCO3H(i)-1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHPAN + OH = GLYX + CO + NO2';
k(:,i) = 6.97e-11;
Gstr{i,1} = 'HCOCOHPAN'; Gstr{i,2} = 'OH'; 
fHCOCOHPAN(i)=fHCOCOHPAN(i)-1; fOH(i)=fOH(i)-1; fGLYX(i)=fGLYX(i)+1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HCOCOHPAN = HCOCOHCO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'HCOCOHPAN'; 
fHCOCOHPAN(i)=fHCOCOHPAN(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; fNO2(i)=fNO2(i)+1; 

%%%%%% MALANHYOOH, MALANHYO, MALANHY2OH, and MALNHYOHCO
i=i+1;
Rnames{i} = 'MALANHYOOH + OH = MALNHYOHCO + OH';
k(:,i) = 4.66e-11;
Gstr{i,1} = 'MALANHYOOH'; Gstr{i,2} = 'OH'; 
fMALANHYOOH(i)=fMALANHYOOH(i)-1; fOH(i)=fOH(i)-1; fMALNHYOHCO(i)=fMALNHYOHCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYOOH + hv = MALANHYO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MALANHYOOH'; 
fMALANHYOOH(i)=fMALANHYOOH(i)-1; fMALANHYO(i)=fMALANHYO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MALANHYO = HCOCOHCO3';
k(:,i) = KDEC;
Gstr{i,1} = 'MALANHYO'; 
fMALANHYO(i)=fMALANHYO(i)-1; fHCOCOHCO3(i)=fHCOCOHCO3(i)+1; 

i=i+1;
Rnames{i} = 'MALANHY2OH + OH = MALNHYOHCO + HO2';
k(:,i) = 2.55e-11;
Gstr{i,1} = 'MALANHY2OH'; Gstr{i,2} = 'OH'; 
fMALANHY2OH(i)=fMALANHY2OH(i)-1; fOH(i)=fOH(i)-1; fMALNHYOHCO(i)=fMALNHYOHCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MALNHYOHCO + OH = CO + CO + CO + HO2';
k(:,i) = 5.68e-12;
Gstr{i,1} = 'MALNHYOHCO'; Gstr{i,2} = 'OH'; 
fMALNHYOHCO(i)=fMALNHYOHCO(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 


% M2FURAN
i=i+1;
Rnames{i} = 'M2FURAN + OH = C5DICARB + HO2';
k(:,i) = 6.19e-11.*0.31;
Gstr{i,1} = 'M2FURAN'; Gstr{i,2} = 'OH'; 
fM2FURAN(i)=fM2FURAN(i)-1; fOH(i)=fOH(i)-1; fC5DICARB(i)=fC5DICARB(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'M2FURAN + OH = HYDMEFURANO2';
k(:,i) = 6.19e-11.*0.3;
Gstr{i,1} = 'M2FURAN'; Gstr{i,2} = 'OH'; 
fM2FURAN(i)=fM2FURAN(i)-1; fOH(i)=fOH(i)-1; fHYDMEFURANO2(i)=fHYDMEFURANO2(i)+1; 

i=i+1;
Rnames{i} = 'M2FURAN + OH = C5HYDCARBO2';
k(:,i) = 6.19e-11.*0.39;
Gstr{i,1} = 'M2FURAN'; Gstr{i,2} = 'OH'; 
fM2FURAN(i)=fM2FURAN(i)-1; fOH(i)=fOH(i)-1; fC5HYDCARBO2(i)=fC5HYDCARBO2(i)+1; 

%% C5DICARB, HYDMEFURANO2, and C5HYDCARBO2
i=i+1;
Rnames{i} = 'C5DICARB + OH = C5CO14O2';
k(:,i) = 6.2e-11.*0.48;
Gstr{i,1} = 'C5DICARB'; Gstr{i,2} = 'OH'; 
fC5DICARB(i)=fC5DICARB(i)-1; fOH(i)=fOH(i)-1; fC5CO14O2(i)=fC5CO14O2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARB + OH = C5DICARBO2';
k(:,i) = 6.2e-11.*0.52;
Gstr{i,1} = 'C5DICARB'; Gstr{i,2} = 'OH'; 
fC5DICARB(i)=fC5DICARB(i)-1; fOH(i)=fOH(i)-1; fC5DICARBO2(i)=fC5DICARBO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARB + hv = C5CO14O2 + HO2';
k(:,i) = JNO2.*0.2.*0.6;
Gstr{i,1} = 'C5DICARB'; 
fC5DICARB(i)=fC5DICARB(i)-1; fC5CO14O2(i)=fC5CO14O2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARB + hv = TLFUONE';
k(:,i) = JNO2.*0.2.*0.4;
Gstr{i,1} = 'C5DICARB'; 
fC5DICARB(i)=fC5DICARB(i)-1; fTLFUONE(i)=fTLFUONE(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANO2 + NO = C5CO14OH + HO2 + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDMEFURANO2'; Gstr{i,2} = 'NO'; 
fHYDMEFURANO2(i)=fHYDMEFURANO2(i)-1; fNO(i)=fNO(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANO2 + HO2 = HYDMEFURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'HYDMEFURANO2'; Gstr{i,2} = 'HO2'; 
fHYDMEFURANO2(i)=fHYDMEFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDMEFURANOOH(i)=fHYDMEFURANOOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANO2 + RO2 = C5CO14OH + HO2';
k(:,i) = 5e-13;
Gstr{i,1} = 'HYDMEFURANO2'; Gstr{i,2} = 'RO2';
fHYDMEFURANO2(i)=fHYDMEFURANO2(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5HYDCARBO2 + NO = MALDALCO2H + NO2 + MO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'C5HYDCARBO2'; Gstr{i,2} = 'NO'; 
fC5HYDCARBO2(i)=fC5HYDCARBO2(i)-1; fNO(i)=fNO(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fNO2(i)=fNO2(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'C5HYDCARBO2 + HO2 = C5HYDCARBOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'C5HYDCARBO2'; Gstr{i,2} = 'HO2'; 
fC5HYDCARBO2(i)=fC5HYDCARBO2(i)-1; fHO2(i)=fHO2(i)-1; fC5HYDCARBOOH(i)=fC5HYDCARBOOH(i)+1; 

i=i+1;
Rnames{i} = 'C5HYDCARBO2 + RO2 = MALDALCO2H + HO2 + MO2';
k(:,i) = 1e-14;
Gstr{i,1} = 'C5HYDCARBO2'; Gstr{i,2} = 'RO2';
fC5HYDCARBO2(i)=fC5HYDCARBO2(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fHO2(i)=fHO2(i)+1; fMO2(i)=fMO2(i)+1; 

%%% C5CO14O2, C5DICARBO2, TLFUONE, C5CO14OH, HYDMEFURANOOH, and C5HYDCARBOOH
i=i+1;
Rnames{i} = 'C5CO14O2 + HO2 = C5CO14OH + O3';
k(:,i) = KAPHO2.*0.15;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'HO2'; 
fC5CO14O2(i)=fC5CO14O2(i)-1; fHO2(i)=fHO2(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + HO2 = C5CO14OOH';
k(:,i) = KAPHO2.*0.41;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'HO2'; 
fC5CO14O2(i)=fC5CO14O2(i)-1; fHO2(i)=fHO2(i)-1; fC5CO14OOH(i)=fC5CO14OOH(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + NO = C5CO14CO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'NO'; 
fC5CO14O2(i)=fC5CO14O2(i)-1; fNO(i)=fNO(i)-1; fC5CO14CO2(i)=fC5CO14CO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + NO2 = C5COO2NO2';
k(:,i) = KFPAN;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'NO2'; 
fC5CO14O2(i)=fC5CO14O2(i)-1; fNO2(i)=fNO2(i)-1; fC5COO2NO2(i)=fC5COO2NO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + NO3 = C5CO14CO2 + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'NO3'; 
fC5CO14O2(i)=fC5CO14O2(i)-1; fNO3(i)=fNO3(i)-1; fC5CO14CO2(i)=fC5CO14CO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + RO2 = C5CO14CO2';
k(:,i) = 1.00e-11.*0.70;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'RO2';
fC5CO14O2(i)=fC5CO14O2(i)-1; fC5CO14CO2(i)=fC5CO14CO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14O2 + RO2 = C5CO14OH';
k(:,i) = 1.00e-11.*0.30;
Gstr{i,1} = 'C5CO14O2'; Gstr{i,2} = 'RO2';
fC5CO14O2(i)=fC5CO14O2(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + HO2 = C5DICAROOH';
k(:,i) = KRO2HO2.*0.706;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'HO2'; 
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fHO2(i)=fHO2(i)-1; fC5DICAROOH(i)=fC5DICAROOH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + NO = C5DICARBO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'NO'; 
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fNO(i)=fNO(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + NO3 = C5DICARBO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'NO3'; 
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fNO3(i)=fNO3(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + RO2 = C5134CO2OH';
k(:,i) = 1.40e-12.*0.20;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'RO2';
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fC5134CO2OH(i)=fC5134CO2OH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + RO2 = C514CO23OH';
k(:,i) = 1.40e-12.*0.20;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'RO2';
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fC514CO23OH(i)=fC514CO23OH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO2 + RO2 = C5DICARBO';
k(:,i) = 1.40e-12.*0.60;
Gstr{i,1} = 'C5DICARBO2'; Gstr{i,2} = 'RO2';
fC5DICARBO2(i)=fC5DICARBO2(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1;

i=i+1;
Rnames{i} = 'TLFUONE + NO3 = NTLFUO2';
k(:,i) = 1.00e-12;
Gstr{i,1} = 'TLFUONE'; Gstr{i,2} = 'NO3'; 
fTLFUONE(i)=fTLFUONE(i)-1; fNO3(i)=fNO3(i)-1; fNTLFUO2(i)=fNTLFUO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONE + O3 = TLFUONOOA';
k(:,i) = 8.00e-19;
Gstr{i,1} = 'TLFUONE'; Gstr{i,2} = 'O3'; 
fTLFUONE(i)=fTLFUONE(i)-1; fO3(i)=fO3(i)-1; fTLFUONOOA(i)=fTLFUONOOA(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONE + OH = TLFUO2';
k(:,i) = 6.90e-11;
Gstr{i,1} = 'TLFUONE'; Gstr{i,2} = 'OH'; 
fTLFUONE(i)=fTLFUONE(i)-1; fOH(i)=fOH(i)-1; fTLFUO2(i)=fTLFUO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14OH + OH = C5CO14CO2';
k(:,i) = 5.44e-11;
Gstr{i,1} = 'C5CO14OH'; Gstr{i,2} = 'OH'; 
fC5CO14OH(i)=fC5CO14OH(i)-1; fOH(i)=fOH(i)-1; fC5CO14CO2(i)=fC5CO14CO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14OH + hv = MCO3 + HCOCO2H + HO2 + CO';
k(:,i) = JMVK;
Gstr{i,1} = 'C5CO14OH'; 
fC5CO14OH(i)=fC5CO14OH(i)-1; fMCO3(i)=fMCO3(i)+1; fHCOCO2H(i)=fHCOCO2H(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANOOH + hv = C5CO14OH + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HYDMEFURANOOH'; 
fHYDMEFURANOOH(i)=fHYDMEFURANOOH(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURANOOH + OH = C5CO14OH + OH';
k(:,i) = 4e-11;
Gstr{i,1} = 'HYDMEFURANOOH'; Gstr{i,2} = 'OH'; 
fHYDMEFURANOOH(i)=fHYDMEFURANOOH(i)-1; fOH(i)=fOH(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5HYDCARBOOH + hv = MALDALCO2H + OH + MO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'C5HYDCARBOOH'; 
fC5HYDCARBOOH(i)=fC5HYDCARBOOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fOH(i)=fOH(i)+1; fMO2(i)=fMO2(i)+1; 

%%%% C5CO14OOH, C5CO14CO2, C5COO2NO2, C5DICAROOH, C5134CO2OH, C514CO23OH, NTLFUO2, TLFUONOOA, TLFUO2
i=i+1;
Rnames{i} = 'C5CO14OOH + OH = C5CO14O2';
k(:,i) = 3.59e-12;
Gstr{i,1} = 'C5CO14OOH'; Gstr{i,2} = 'OH'; 
fC5CO14OOH(i)=fC5CO14OOH(i)-1; fOH(i)=fOH(i)-1; fC5CO14O2(i)=fC5CO14O2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14OOH + hv = C5CO14CO2 + OH';
k(:,i) = JHPALD.*2;
Gstr{i,1} = 'C5CO14OOH'; 
fC5CO14OOH(i)=fC5CO14OOH(i)-1; fC5CO14CO2(i)=fC5CO14CO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14CO2 = MALANHY + MO2';
k(:,i) = KDEC.*0.83;
Gstr{i,1} = 'C5CO14CO2'; 
fC5CO14CO2(i)=fC5CO14CO2(i)-1; fMALANHY(i)=fMALANHY(i)+1; fMO2(i)=fMO2(i)+1; 

i=i+1;
Rnames{i} = 'C5CO14CO2 = MGLY + HO2 + CO';
k(:,i) = KDEC.*0.17;
Gstr{i,1} = 'C5CO14CO2'; 
fC5CO14CO2(i)=fC5CO14CO2(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'C5COO2NO2 + OH = MGLY + CO + CO + NO2';
k(:,i) = 5.43e-11;
Gstr{i,1} = 'C5COO2NO2'; Gstr{i,2} = 'OH'; 
fC5COO2NO2(i)=fC5COO2NO2(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'C5COO2NO2 = C5CO14O2 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'C5COO2NO2'; 
fC5COO2NO2(i)=fC5COO2NO2(i)-1; fC5CO14O2(i)=fC5CO14O2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'C5DICAROOH + OH = C5134CO2OH + OH';
k(:,i) = 1.21e-10;
Gstr{i,1} = 'C5DICAROOH'; Gstr{i,2} = 'OH'; 
fC5DICAROOH(i)=fC5DICAROOH(i)-1; fOH(i)=fOH(i)-1; fC5134CO2OH(i)=fC5134CO2OH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICAROOH + OH = C5DICARBO2';
k(:,i) = 1.90e-12.*exp(190./T);
Gstr{i,1} = 'C5DICAROOH'; Gstr{i,2} = 'OH'; 
fC5DICAROOH(i)=fC5DICAROOH(i)-1; fOH(i)=fOH(i)-1; fC5DICARBO2(i)=fC5DICARBO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DICAROOH + hv = C5DICARBO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'C5DICAROOH'; 
fC5DICAROOH(i)=fC5DICAROOH(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICAROOH + hv = C5DICARBO + OH';
k(:,i) = JHPALD2;
Gstr{i,1} = 'C5DICAROOH'; 
fC5DICAROOH(i)=fC5DICAROOH(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICAROOH + hv = C5DICARBO + OH';
k(:,i) = JMEK;
Gstr{i,1} = 'C5DICAROOH'; 
fC5DICAROOH(i)=fC5DICAROOH(i)-1; fC5DICARBO(i)=fC5DICARBO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'C5DICARBO = MGLY + GLYX + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'C5DICARBO'; 
fC5DICARBO(i)=fC5DICARBO(i)-1; fMGLY(i)=fMGLY(i)+1; fGLYX(i)=fGLYX(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5134CO2OH + OH = C54CO + HO2';
k(:,i) = 7.48e-11;
Gstr{i,1} = 'C5134CO2OH'; Gstr{i,2} = 'OH'; 
fC5134CO2OH(i)=fC5134CO2OH(i)-1; fOH(i)=fOH(i)-1; fC54CO(i)=fC54CO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5134CO2OH + hv = CO23C3CHO + HO2 + CO + HO2';
k(:,i) = JHPALD2;
Gstr{i,1} = 'C5134CO2OH'; 
fC5134CO2OH(i)=fC5134CO2OH(i)-1; fCO23C3CHO(i)=fCO23C3CHO(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5134CO2OH + hv = CO23C3CHO + HO2 + CO + HO2';
k(:,i) = JC54CO;
Gstr{i,1} = 'C5134CO2OH'; 
fC5134CO2OH(i)=fC5134CO2OH(i)-1; fCO23C3CHO(i)=fCO23C3CHO(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C514CO23OH + OH = C5134CO2OH + HO2';
k(:,i) = 6.26e-11;
Gstr{i,1} = 'C514CO23OH'; Gstr{i,2} = 'OH'; 
fC514CO23OH(i)=fC514CO23OH(i)-1; fOH(i)=fOH(i)-1; fC5134CO2OH(i)=fC5134CO2OH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C514CO23OH + hv = CO2H3CHO + HO2 + CO + HO2';
k(:,i) = JHPALD2;
Gstr{i,1} = 'C514CO23OH'; 
fC514CO23OH(i)=fC514CO23OH(i)-1; fCO2H3CHO(i)=fCO2H3CHO(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C514CO23OH + hv = CO2H3CHO + HO2 + CO + HO2';
k(:,i) = JMEK;
Gstr{i,1} = 'C514CO23OH'; 
fC514CO23OH(i)=fC514CO23OH(i)-1; fCO2H3CHO(i)=fCO2H3CHO(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUO2 + HO2 = NTLFUOOH';
k(:,i) = KRO2HO2.*0.706;
Gstr{i,1} = 'NTLFUO2'; Gstr{i,2} = 'HO2'; 
fNTLFUO2(i)=fNTLFUO2(i)-1; fHO2(i)=fHO2(i)-1; fNTLFUOOH(i)=fNTLFUOOH(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUO2 + NO = NTLFUO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'NTLFUO2'; Gstr{i,2} = 'NO'; 
fNTLFUO2(i)=fNTLFUO2(i)-1; fNO(i)=fNO(i)-1; fNTLFUO(i)=fNTLFUO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUO2 + NO3 = NTLFUO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'NTLFUO2'; Gstr{i,2} = 'NO3'; 
fNTLFUO2(i)=fNTLFUO2(i)-1; fNO3(i)=fNO3(i)-1; fNTLFUO(i)=fNTLFUO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUO2 + RO2 = NTLFUO';
k(:,i) = 9.20e-14;
Gstr{i,1} = 'NTLFUO2'; Gstr{i,2} = 'RO2';
fNTLFUO2(i)=fNTLFUO2(i)-1; fNTLFUO(i)=fNTLFUO(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOOA = CO + OH + MECOACETO2';
k(:,i) = KDEC.*0.5;
Gstr{i,1} = 'TLFUONOOA'; 
fTLFUONOOA(i)=fTLFUONOOA(i)-1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; fMECOACETO2(i)=fMECOACETO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOOA = TLFUONOO';
k(:,i) = KDEC.*0.5;
Gstr{i,1} = 'TLFUONOOA'; 
fTLFUONOOA(i)=fTLFUONOOA(i)-1; fTLFUONOO(i)=fTLFUONOO(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO2 + HO2 = TLFUOOH';
k(:,i) = KRO2HO2.*0.706;
Gstr{i,1} = 'TLFUO2'; Gstr{i,2} = 'HO2'; 
fTLFUO2(i)=fTLFUO2(i)-1; fHO2(i)=fHO2(i)-1; fTLFUOOH(i)=fTLFUOOH(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO2 + NO = TLFUO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'TLFUO2'; Gstr{i,2} = 'NO'; 
fTLFUO2(i)=fTLFUO2(i)-1; fNO(i)=fNO(i)-1; fTLFUO(i)=fTLFUO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO2 + NO3 = TLFUO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'TLFUO2'; Gstr{i,2} = 'NO3'; 
fTLFUO2(i)=fTLFUO2(i)-1; fNO3(i)=fNO3(i)-1; fTLFUO(i)=fTLFUO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO2 + RO2 = TLFUO';
k(:,i) = 9.20e-14.*0.7;
Gstr{i,1} = 'TLFUO2'; Gstr{i,2} = 'RO2';
fTLFUO2(i)=fTLFUO2(i)-1; fTLFUO(i)=fTLFUO(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO2 + RO2 = TLFUOH';
k(:,i) = 9.20e-14.*0.3;
Gstr{i,1} = 'TLFUO2'; Gstr{i,2} = 'RO2';
fTLFUO2(i)=fTLFUO2(i)-1; fTLFUOH(i)=fTLFUOH(i)+1; 

%%%%% C54CO, CO23C3CHO, CO2H3CHO, NTLFUOOH, NTLFUO, MECOACETO2, TLFUONOO, TLFUOOH, TLFUOH
i=i+1;
Rnames{i} = 'C54CO + NO3 = CO + CO + CO + MCO3 + HNO3';
k(:,i) = KNO3AL.*5.5;
Gstr{i,1} = 'C54CO'; Gstr{i,2} = 'NO3'; 
fC54CO(i)=fC54CO(i)-1; fNO3(i)=fNO3(i)-1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'C54CO + OH = CO + CO + CO + MCO3';
k(:,i) = 1.72e-11;
Gstr{i,1} = 'C54CO'; Gstr{i,2} = 'OH'; 
fC54CO(i)=fC54CO(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'C54CO + hv = HO2 + CO + CO + CO + MCO3';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'C54CO'; 
fC54CO(i)=fC54CO(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'C54CO + hv = HO2 + CO + CO + CO + MCO3';
k(:,i) = JC54CO.*2;
Gstr{i,1} = 'C54CO'; 
fC54CO(i)=fC54CO(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + CO23C3CHO = MCO3 + CO + CO + HNO3';
k(:,i) = KNO3AL.*4.0;
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'CO23C3CHO'; 
fNO3(i)=fNO3(i)-1; fCO23C3CHO(i)=fCO23C3CHO(i)-1; fMCO3(i)=fMCO3(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'OH + CO23C3CHO = MCO3 + CO + CO';
k(:,i) = 1.23e-11;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CO23C3CHO'; 
fOH(i)=fOH(i)-1; fCO23C3CHO(i)=fCO23C3CHO(i)-1; fMCO3(i)=fMCO3(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUOOH + OH = NTLFUO2';
k(:,i) = 4.44e-12;
Gstr{i,1} = 'NTLFUOOH'; Gstr{i,2} = 'OH'; 
fNTLFUOOH(i)=fNTLFUOOH(i)-1; fOH(i)=fOH(i)-1; fNTLFUO2(i)=fNTLFUO2(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUOOH + hv = NTLFUO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'NTLFUOOH'; 
fNTLFUOOH(i)=fNTLFUOOH(i)-1; fNTLFUO(i)=fNTLFUO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'NTLFUO = ACCOMECHO + NO2';
k(:,i) = KDEC;
Gstr{i,1} = 'NTLFUO'; 
fNTLFUO(i)=fNTLFUO(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fNO2(i)=fNO2(i)+1; 


i=i+1;
Rnames{i} = 'TLFUOOH + OH = TLFUO2';
k(:,i) = 2.53e-11;
Gstr{i,1} = 'TLFUOOH'; Gstr{i,2} = 'OH'; 
fTLFUOOH(i)=fTLFUOOH(i)-1; fOH(i)=fOH(i)-1; fTLFUO2(i)=fTLFUO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUOOH + hv = TLFUO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'TLFUOOH'; 
fTLFUOOH(i)=fTLFUOOH(i)-1; fTLFUO(i)=fTLFUO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MECOACETO2 + HO2 = MECOACEOOH';
k(:,i) = KRO2HO2.*0.625;
Gstr{i,1} = 'MECOACETO2'; Gstr{i,2} = 'HO2'; 
fMECOACETO2(i)=fMECOACETO2(i)-1; fHO2(i)=fHO2(i)-1; fMECOACEOOH(i)=fMECOACEOOH(i)+1; 

i=i+1;
Rnames{i} = 'MECOACETO2 + NO = MECOACETO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MECOACETO2'; Gstr{i,2} = 'NO'; 
fMECOACETO2(i)=fMECOACETO2(i)-1; fNO(i)=fNO(i)-1; fMECOACETO(i)=fMECOACETO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MECOACETO2 + NO3 = MECOACETO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'MECOACETO2'; Gstr{i,2} = 'NO3'; 
fMECOACETO2(i)=fMECOACETO2(i)-1; fNO3(i)=fNO3(i)-1; fMECOACETO(i)=fMECOACETO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'MECOACETO2 + RO2 = MECOACETO';
k(:,i) = 2.00e-12;
Gstr{i,1} = 'MECOACETO2'; Gstr{i,2} = 'RO2';
fMECOACETO2(i)=fMECOACETO2(i)-1; fMECOACETO(i)=fMECOACETO(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO + CO = ACCOMECHO';
k(:,i) = 1.20e-15;
Gstr{i,1} = 'TLFUONOO'; Gstr{i,2} = 'CO'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fCO(i)=fCO(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO + NO = ACCOMECHO + NO2';
k(:,i) = 1.00e-14;
Gstr{i,1} = 'TLFUONOO'; Gstr{i,2} = 'NO'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fNO(i)=fNO(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO + NO2 = ACCOMECHO + NO3';
k(:,i) = 1.00e-15;
Gstr{i,1} = 'TLFUONOO'; Gstr{i,2} = 'NO2'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fNO2(i)=fNO2(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO + SO2 = ACCOMECHO + SO3';
k(:,i) = 7.00e-14;
Gstr{i,1} = 'TLFUONOO'; Gstr{i,2} = 'SO2'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fSO2(i)=fSO2(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fSO3(i)=fSO3(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO = ACCOMECHO + H2O2';
k(:,i) = 6.00e-18.*H2O;
Gstr{i,1} = 'TLFUONOO'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fH2O2(i)=fH2O2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUONOO = C24O3CCO2H';
k(:,i) = 1.00e-17.*H2O;
Gstr{i,1} = 'TLFUONOO'; 
fTLFUONOO(i)=fTLFUONOO(i)-1; fC24O3CCO2H(i)=fC24O3CCO2H(i)+1; 

i=i+1;
Rnames{i} = 'TLFUOH + OH = TLFUO';
k(:,i) = 2.19e-11;
Gstr{i,1} = 'TLFUOH'; Gstr{i,2} = 'OH'; 
fTLFUOH(i)=fTLFUOH(i)-1; fOH(i)=fOH(i)-1; fTLFUO(i)=fTLFUO(i)+1; 

%%%%%% ACCOMECHO, MECOACEOOH, MECOACETO, C24O3CCO2H, and TLFUO
i=i+1;
Rnames{i} = 'ACCOMECHO + NO3 = ACCOMECO3 + HNO3';
k(:,i) = KNO3AL.*5.5;
Gstr{i,1} = 'ACCOMECHO'; Gstr{i,2} = 'NO3'; 
fACCOMECHO(i)=fACCOMECHO(i)-1; fNO3(i)=fNO3(i)-1; fACCOMECO3(i)=fACCOMECO3(i)+1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECHO + OH = ACCOMECO3';
k(:,i) = 7.09e-11;
Gstr{i,1} = 'ACCOMECHO'; Gstr{i,2} = 'OH'; 
fACCOMECHO(i)=fACCOMECHO(i)-1; fOH(i)=fOH(i)-1; fACCOMECO3(i)=fACCOMECO3(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECHO + hv = MECOACETO2 + HO2 + CO';
k(:,i) = JHPALD2;
Gstr{i,1} = 'ACCOMECHO'; 
fACCOMECHO(i)=fACCOMECHO(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MECOACEOOH + OH = MECOACETO2';
k(:,i) = 3.59e-12;
Gstr{i,1} = 'MECOACEOOH'; Gstr{i,2} = 'OH'; 
fMECOACEOOH(i)=fMECOACEOOH(i)-1; fOH(i)=fOH(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; 

i=i+1;
Rnames{i} = 'MECOACEOOH + hv = MECOACETO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MECOACEOOH'; 
fMECOACEOOH(i)=fMECOACEOOH(i)-1; fMECOACETO(i)=fMECOACETO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MECOACETO = MCO3 + CH2O';
k(:,i) = KDEC;
Gstr{i,1} = 'MECOACETO'; 
fMECOACETO(i)=fMECOACETO(i)-1; fMCO3(i)=fMCO3(i)+1; fCH2O(i)=fCH2O(i)+1; 

i=i+1;
Rnames{i} = 'C24O3CCO2H + OH = MECOACETO2';
k(:,i) = 8.76e-13;
Gstr{i,1} = 'C24O3CCO2H'; Gstr{i,2} = 'OH'; 
fC24O3CCO2H(i)=fC24O3CCO2H(i)-1; fOH(i)=fOH(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; 

i=i+1;
Rnames{i} = 'TLFUO = ACCOMECHO + HO2';
k(:,i) = KDEC;
Gstr{i,1} = 'TLFUO'; 
fTLFUO(i)=fTLFUO(i)-1; fACCOMECHO(i)=fACCOMECHO(i)+1; fHO2(i)=fHO2(i)+1; 

%%%%%%%% ACCOMECO3
i=i+1;
Rnames{i} = 'ACCOMECO3 + HO2 = ACCOMECO3H';
k(:,i) = KAPHO2.*0.56;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'HO2'; 
fACCOMECO3(i)=fACCOMECO3(i)-1; fHO2(i)=fHO2(i)-1; fACCOMECO3H(i)=fACCOMECO3H(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3 + HO2 = MECOACETO2 + OH';
k(:,i) = KAPHO2.*0.44;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'HO2'; 
fACCOMECO3(i)=fACCOMECO3(i)-1; fHO2(i)=fHO2(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3 + NO = MECOACETO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'NO'; 
fACCOMECO3(i)=fACCOMECO3(i)-1; fNO(i)=fNO(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3 + NO2 = ACCOMEPAN';
k(:,i) = KFPAN;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'NO2'; 
fACCOMECO3(i)=fACCOMECO3(i)-1; fNO2(i)=fNO2(i)-1; fACCOMEPAN(i)=fACCOMEPAN(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3 + NO3 = MECOACETO2 + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'NO3'; 
fACCOMECO3(i)=fACCOMECO3(i)-1; fNO3(i)=fNO3(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3 + RO2 = MECOACETO2';
k(:,i) = 1.00e-11;
Gstr{i,1} = 'ACCOMECO3'; Gstr{i,2} = 'RO2';
fACCOMECO3(i)=fACCOMECO3(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; 

%%%%%%%%%% ACCOMEPAN and MECOACETO2
i=i+1;
Rnames{i} = 'ACCOMECO3H + OH = ACCOMECO3';
k(:,i) = 3.59e-12;
Gstr{i,1} = 'ACCOMECO3H'; Gstr{i,2} = 'OH'; 
fACCOMECO3H(i)=fACCOMECO3H(i)-1; fOH(i)=fOH(i)-1; fACCOMECO3(i)=fACCOMECO3(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMECO3H + hv = MECOACETO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ACCOMECO3H'; 
fACCOMECO3H(i)=fACCOMECO3H(i)-1; fMECOACETO2(i)=fMECOACETO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMEPAN + OH = METACETHO + CO + CO + NO2';
k(:,i) = 1.00e-14;
Gstr{i,1} = 'ACCOMEPAN'; Gstr{i,2} = 'OH'; 
fACCOMEPAN(i)=fACCOMEPAN(i)-1; fOH(i)=fOH(i)-1; fMETACETHO(i)=fMETACETHO(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ACCOMEPAN = ACCOMECO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'ACCOMEPAN'; 
fACCOMEPAN(i)=fACCOMEPAN(i)-1; fACCOMECO3(i)=fACCOMECO3(i)+1; fNO2(i)=fNO2(i)+1; 

%%%%%%%%%%% METACETHO
i=i+1;
Rnames{i} = 'METACETHO + OH = MCO3';
k(:,i) = 9.82e-11;
Gstr{i,1} = 'METACETHO'; Gstr{i,2} = 'OH'; 
fMETACETHO(i)=fMETACETHO(i)-1; fOH(i)=fOH(i)-1; fMCO3(i)=fMCO3(i)+1; 

% DIMEFURAN
i=i+1;
Rnames{i} = 'DIMEFURAN + OH = C4DBDIKET + HO2';
k(:,i) = 1.32e-10.*0.27;
Gstr{i,1} = 'DIMEFURAN'; Gstr{i,2} = 'OH'; 
fDIMEFURAN(i)=fDIMEFURAN(i)-1; fOH(i)=fOH(i)-1; fC4DBDIKET(i)=fC4DBDIKET(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'DIMEFURAN + OH = HYDDIMEFURANO2';
k(:,i) = 1.32e-10.*0.73;
Gstr{i,1} = 'DIMEFURAN'; Gstr{i,2} = 'OH'; 
fDIMEFURAN(i)=fDIMEFURAN(i)-1; fOH(i)=fOH(i)-1; fHYDDIMEFURANO2(i)=fHYDDIMEFURANO2(i)+1; 

%% C4DBDIKET and HYDDIMEFURANO2
i=i+1;
Rnames{i} = 'C4DBDIKET + O3 = MGLOOB + MGLY';
k(:,i) = 5.00e-18;
Gstr{i,1} = 'C4DBDIKET'; Gstr{i,2} = 'O3'; 
fC4DBDIKET(i)=fC4DBDIKET(i)-1; fO3(i)=fO3(i)-1; fMGLOOB(i)=fMGLOOB(i)+1; fMGLY(i)=fMGLY(i)+1; 

i=i+1;
Rnames{i} = 'C4DBDIKET + OH = DMKOHO2';
k(:,i) = 4.90e-11;
Gstr{i,1} = 'C4DBDIKET'; Gstr{i,2} = 'OH'; 
fC4DBDIKET(i)=fC4DBDIKET(i)-1; fOH(i)=fOH(i)-1; fDMKOHO2(i)=fDMKOHO2(i)+1; 

i=i+1;
Rnames{i} = 'C4DBDIKET + hv = MGLY + MCO3 + HO2 + CO';
k(:,i) = JNO2.*0.0057;
Gstr{i,1} = 'C4DBDIKET'; 
fC4DBDIKET(i)=fC4DBDIKET(i)-1; fMGLY(i)=fMGLY(i)+1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'HYDDIMEFURANO2 + NO = C5CO14OH + NO2 + MCO3';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDDIMEFURANO2'; Gstr{i,2} = 'NO'; 
fHYDDIMEFURANO2(i)=fHYDDIMEFURANO2(i)-1; fNO(i)=fNO(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fNO2(i)=fNO2(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'HYDDIMEFURANO2 + HO2 = HYDDIMEFURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'HYDDIMEFURANO2'; Gstr{i,2} = 'HO2'; 
fHYDDIMEFURANO2(i)=fHYDDIMEFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDDIMEFURANOOH(i)=fHYDDIMEFURANOOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDDIMEFURANO2 + RO2 = C5CO14OH + MCO3';
k(:,i) = 1e-14;
Gstr{i,1} = 'HYDDIMEFURANO2'; Gstr{i,2} = 'RO2';
fHYDDIMEFURANO2(i)=fHYDDIMEFURANO2(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fMCO3(i)=fMCO3(i)+1; 

%%% MGLOOB, DMKOHO2, and HYDDIMEFURANOOH
i=i+1;
Rnames{i} = 'MGLOOB = ALD2';
k(:,i) = KDEC.*0.125;
Gstr{i,1} = 'MGLOOB'; 
fMGLOOB(i)=fMGLOOB(i)-1; fALD2(i)=fALD2(i)+1; 

i=i+1;
Rnames{i} = 'MGLOOB = MCO3 + CO + OH';
k(:,i) = KDEC.*0.57;
Gstr{i,1} = 'MGLOOB'; 
fMGLOOB(i)=fMGLOOB(i)-1; fMCO3(i)=fMCO3(i)+1; fCO(i)=fCO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'MGLOOB = MCO3 + HO2';
k(:,i) = KDEC.*0.125;
Gstr{i,1} = 'MGLOOB'; 
fMGLOOB(i)=fMGLOOB(i)-1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MGLOOB = MGLOO';
k(:,i) = KDEC.*0.18;
Gstr{i,1} = 'MGLOOB'; 
fMGLOOB(i)=fMGLOOB(i)-1; fMGLOO(i)=fMGLOO(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + HO2 = DMKOHOOH';
k(:,i) = KRO2HO2.*0.770;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'HO2'; 
fDMKOHO2(i)=fDMKOHO2(i)-1; fHO2(i)=fHO2(i)-1; fDMKOHOOH(i)=fDMKOHOOH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + NO = DMKOHO + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'NO'; 
fDMKOHO2(i)=fDMKOHO2(i)-1; fNO(i)=fNO(i)-1; fDMKOHO(i)=fDMKOHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + NO3 = DMKOHO + NO2';
k(:,i) = KRO2NO3;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'NO3'; 
fDMKOHO2(i)=fDMKOHO2(i)-1; fNO3(i)=fNO3(i)-1; fDMKOHO(i)=fDMKOHO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + RO2 = DMK2OH';
k(:,i) = 8.80e-13.*0.20;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'RO2';
fDMKOHO2(i)=fDMKOHO2(i)-1; fDMK2OH(i)=fDMK2OH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + RO2 = DMKCOOH';
k(:,i) = 8.80e-13.*0.20;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'RO2';
fDMKOHO2(i)=fDMKOHO2(i)-1; fDMKCOOH(i)=fDMKCOOH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO2 + RO2 = DMKOHO';
k(:,i) = 8.80e-13.*0.60;
Gstr{i,1} = 'DMKOHO2'; Gstr{i,2} = 'RO2';
fDMKOHO2(i)=fDMKOHO2(i)-1; fDMKOHO(i)=fDMKOHO(i)+1; 

i=i+1;
Rnames{i} = 'HYDDIMEFURANOOH + hv = C5CO14OH + OH + MO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HYDDIMEFURANOOH'; 
fHYDDIMEFURANOOH(i)=fHYDDIMEFURANOOH(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fOH(i)=fOH(i)+1; fMO2(i)=fMO2(i)+1; 

%%%% MGLOO, DMKOHOOH, DMKOHO, DMK2OH, DMKCOOH
i=i+1;
Rnames{i} = 'MGLOO = CH3COCO2H';
k(:,i) = 1.0e-17.*H2O;
Gstr{i,1} = 'MGLOO'; 
fMGLOO(i)=fMGLOO(i)-1; fCH3COCO2H(i)=fCH3COCO2H(i)+1; 

i=i+1;
Rnames{i} = 'MGLOO = MGLY + H2O2';
k(:,i) = 6.0e-18.*H2O;
Gstr{i,1} = 'MGLOO'; 
fMGLOO(i)=fMGLOO(i)-1; fMGLY(i)=fMGLY(i)+1; fH2O2(i)=fH2O2(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHOOH + OH = DMKCOOH + OH';
k(:,i) = 9.75e-11;
Gstr{i,1} = 'DMKOHOOH'; Gstr{i,2} = 'OH'; 
fDMKOHOOH(i)=fDMKOHOOH(i)-1; fOH(i)=fOH(i)-1; fDMKCOOH(i)=fDMKCOOH(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHOOH + OH = DMKOHO2';
k(:,i) = 1.90e-12.*exp(190./T);
Gstr{i,1} = 'DMKOHOOH'; Gstr{i,2} = 'OH'; 
fDMKOHOOH(i)=fDMKOHOOH(i)-1; fOH(i)=fOH(i)-1; fDMKOHO2(i)=fDMKOHO2(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHOOH + hv = CO2H3CHO + MCO3 + OH';
k(:,i) = JMEK.*2;
Gstr{i,1} = 'DMKOHOOH'; 
fDMKOHOOH(i)=fDMKOHOOH(i)-1; fCO2H3CHO(i)=fCO2H3CHO(i)+1; fMCO3(i)=fMCO3(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHOOH + hv = DMKOHO + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'DMKOHOOH'; 
fDMKOHOOH(i)=fDMKOHOOH(i)-1; fDMKOHO(i)=fDMKOHO(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO = CO2H3CHO + MCO3';
k(:,i) = KDEC.*0.7;
Gstr{i,1} = 'DMKOHO'; 
fDMKOHO(i)=fDMKOHO(i)-1; fCO2H3CHO(i)=fCO2H3CHO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'DMKOHO = MGLY + MGLY + HO2';
k(:,i) = KDEC.*0.3;
Gstr{i,1} = 'DMKOHO'; 
fDMKOHO(i)=fDMKOHO(i)-1; fMGLY(i)=fMGLY(i)+1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'DMK2OH + OH = DMKCOOH + HO2';
k(:,i) = 4.00e-11;
Gstr{i,1} = 'DMK2OH'; Gstr{i,2} = 'OH'; 
fDMK2OH(i)=fDMK2OH(i)-1; fOH(i)=fOH(i)-1; fDMKCOOH(i)=fDMKCOOH(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'DMK2OH + hv = CO2H3CHO + MCO3 + HO2';
k(:,i) = JMEK.*2;
Gstr{i,1} = 'DMK2OH'; 
fDMK2OH(i)=fDMK2OH(i)-1; fCO2H3CHO(i)=fCO2H3CHO(i)+1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'DMKCOOH + OH = C62O';
k(:,i) = 9.04e-12;
Gstr{i,1} = 'DMKCOOH'; Gstr{i,2} = 'OH'; 
fDMKCOOH(i)=fDMKCOOH(i)-1; fOH(i)=fOH(i)-1; fC62O(i)=fC62O(i)+1; 

i=i+1;
Rnames{i} = 'DMKCOOH + hv = CO23C3CHO + MCO3 + HO2';
k(:,i) = JMEK;
Gstr{i,1} = 'DMKCOOH'; 
fDMKCOOH(i)=fDMKCOOH(i)-1; fCO23C3CHO(i)=fCO23C3CHO(i)+1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'DMKCOOH + hv = CO2H3CO3 + MCO3';
k(:,i) = JC54CO;
Gstr{i,1} = 'DMKCOOH'; 
fDMKCOOH(i)=fDMKCOOH(i)-1; fCO2H3CO3(i)=fCO2H3CO3(i)+1; fMCO3(i)=fMCO3(i)+1; 

%%%%% CH3COCO2H, C62O, and CO2H3CO3
i=i+1;
Rnames{i} = 'CH3COCO2H + hv = MCO3 + HO2';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'CH3COCO2H'; 
fCH3COCO2H(i)=fCH3COCO2H(i)-1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + CH3COCO2H = MCO3';
k(:,i) = 8.0e-13;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CH3COCO2H'; 
fOH(i)=fOH(i)-1; fCH3COCO2H(i)=fCH3COCO2H(i)-1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'C62O = MGLY + CO + MCO3';
k(:,i) = KDEC;
Gstr{i,1} = 'C62O'; 
fC62O(i)=fC62O(i)-1; fMGLY(i)=fMGLY(i)+1; fCO(i)=fCO(i)+1; fMCO3(i)=fMCO3(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + HO2 = CO2H3CO3H';
k(:,i) = KAPHO2.*0.56;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'HO2'; 
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fHO2(i)=fHO2(i)-1; fCO2H3CO3H(i)=fCO2H3CO3H(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + HO2 = MGLY + HO2 + OH';
k(:,i) = KAPHO2.*0.44;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'HO2'; 
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fHO2(i)=fHO2(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + NO = MGLY + HO2 + NO2';
k(:,i) = KAPNO;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'NO'; 
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fNO(i)=fNO(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + NO2 = C4PAN6';
k(:,i) = KFPAN;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'NO2'; 
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fNO2(i)=fNO2(i)-1; fC4PAN6(i)=fC4PAN6(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + NO3 = MGLY + HO2 + NO2';
k(:,i) = KRO2NO3.*1.74;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'NO3'; 
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fNO3(i)=fNO3(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3 + RO2 = MGLY + HO2';
k(:,i) = 1.00e-11;
Gstr{i,1} = 'CO2H3CO3'; Gstr{i,2} = 'RO2';
fCO2H3CO3(i)=fCO2H3CO3(i)-1; fMGLYOX(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; 

%%%%%%%%%%%%%%%%CO2H3CO3H and C4PAN6
i=i+1;
Rnames{i} = 'CO2H3CO3H + hv = MCO3 + HO2 + HCOCO3H';
k(:,i) = JMEK;
Gstr{i,1} = 'CO2H3CO3H'; 
fCO2H3CO3H(i)=fCO2H3CO3H(i)-1; fMCO3(i)=fMCO3(i)+1; fHO2(i)=fHO2(i)+1; fHCOCO3H(i)=fHCOCO3H(i)+1; 

i=i+1;
Rnames{i} = 'CO2H3CO3H + hv = MGLY + HO2 + OH';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'CO2H3CO3H'; 
fCO2H3CO3H(i)=fCO2H3CO3H(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = 'OH + CO2H3CO3H = CO2H3CO3';
k(:,i) = 7.34e-12;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CO2H3CO3H'; 
fOH(i)=fOH(i)-1; fCO2H3CO3H(i)=fCO2H3CO3H(i)-1; fCO2H3CO3(i)=fCO2H3CO3(i)+1; 


i=i+1;
Rnames{i} = 'C4PAN6 = CO2H3CO3 + NO2';
k(:,i) = KBPAN;
Gstr{i,1} = 'C4PAN6'; 
fC4PAN6(i)=fC4PAN6(i)-1; fCO2H3CO3(i)=fCO2H3CO3(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'OH + C4PAN6 = MGLY + CO + NO2';
k(:,i) = 3.74e-12;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'C4PAN6'; 
fOH(i)=fOH(i)-1; fC4PAN6(i)=fC4PAN6(i)-1; fMGLY(i)=fMGLY(i)+1; fCO(i)=fCO(i)+1; fNO2(i)=fNO2(i)+1; 

% Furfural
i=i+1;
Rnames{i} = 'FURFURAL + hv = FURAN + CO';
k(:,i) = JFURURAL.*0.15;
Gstr{i,1} = 'FURFURAL'; 
fFURFURAL(i)=fFURFURAL(i)-1; fFURAN(i)=fFURAN(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'FURFURAL + hv = C3H4 + CO + CO';
k(:,i) = JFURURAL.*0.85;
Gstr{i,1} = 'FURFURAL'; 
fFURFURAL(i)=fFURFURAL(i)-1; fC3H4(i)=fC3H4(i)+1; fCO(i)=fCO(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'FURFURAL + OH = FURFURALO2';
k(:,i) = 3.50e-11.*0.01;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fFURFURALO2(i)=fFURFURALO2(i)+1; 

i=i+1;
Rnames{i} = 'FURFURAL + OH = C5DIALCO + HO2';
k(:,i) = 3.50e-11.*0.4351;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fC5DIALCO(i)=fC5DIALCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURFURAL + OH = HYDFURFURALO2';
k(:,i) = 3.50e-11.*0.5269;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fHYDFURFURALO2(i)=fHYDFURFURALO2(i)+1; 

i=i+1;
Rnames{i} = 'FURFURAL + OH = ALDFURFURALO2 + HO2';
k(:,i) = 3.50e-11.*0.028;
Gstr{i,1} = 'FURFURAL'; Gstr{i,2} = 'OH'; 
fFURFURAL(i)=fFURFURAL(i)-1; fOH(i)=fOH(i)-1; fALDFURFURALO2(i)=fALDFURFURALO2(i)+1; fHO2(i)=fHO2(i)+1; 

%% C3H4, FURFURALO2, C5DIALCO, HYDFURFURALO2, and ALDFURFURALO2
i=i+1;
Rnames{i} = 'FURFURALO2 + NO = MALDALCO2H + NO2 + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'FURFURALO2'; Gstr{i,2} = 'NO'; 
fFURFURALO2(i)=fFURFURALO2(i)-1; fNO(i)=fNO(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURFURALO2 + HO2 = FURFURALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'FURFURALO2'; Gstr{i,2} = 'HO2'; 
fFURFURALO2(i)=fFURFURALO2(i)-1; fHO2(i)=fHO2(i)-1; fFURFURALOOH(i)=fFURFURALOOH(i)+1; 

i=i+1;
Rnames{i} = 'FURFURALO2 + RO2 = MALDALCO2H + CO + HO2';
k(:,i) = 1e-14;
Gstr{i,1} = 'FURFURALO2'; Gstr{i,2} = 'RO2';
fFURFURALO2(i)=fFURFURALO2(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DIALCO + OH = MALDIALCO3 + CO';
k(:,i) = 4.90e-11;
Gstr{i,1} = 'C5DIALCO'; Gstr{i,2} = 'OH'; 
fC5DIALCO(i)=fC5DIALCO(i)-1; fOH(i)=fOH(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'C5DIALCO + hv = MALDIALCO3 + CO + HO2';
k(:,i) = JMGlyxl;
Gstr{i,1} = 'C5DIALCO'; 
fC5DIALCO(i)=fC5DIALCO(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'C5DIALCO + hv = MALDIALCO3 + CO + HO2';
k(:,i) = JMACR;
Gstr{i,1} = 'C5DIALCO'; 
fC5DIALCO(i)=fC5DIALCO(i)-1; fMALDIALCO3(i)=fMALDIALCO3(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURFURALO2 + HO2 = HYDFURFURALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'HYDFURFURALO2'; Gstr{i,2} = 'HO2'; 
fHYDFURFURALO2(i)=fHYDFURFURALO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDFURFURALOOH(i)=fHYDFURFURALOOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURFURALO2 + NO = MALDALCO2H + NO2 + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDFURFURALO2'; Gstr{i,2} = 'NO'; 
fHYDFURFURALO2(i)=fHYDFURFURALO2(i)-1; fNO(i)=fNO(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURFURALO2 + RO2 = MALDALCO2H + CO + HO2';
k(:,i) = 1e-14;
Gstr{i,1} = 'HYDFURFURALO2'; Gstr{i,2} = 'RO2';
fHYDFURFURALO2(i)=fHYDFURFURALO2(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ALDFURFURALO2 + NO = FURANO2 + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'ALDFURFURALO2'; Gstr{i,2} = 'NO'; 
fALDFURFURALO2(i)=fALDFURFURALO2(i)-1; fNO(i)=fNO(i)-1; fFURANO2(i)=fFURANO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'ALDFURFURALO2 + HO2 = ALDFURFURALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'ALDFURFURALO2'; Gstr{i,2} = 'HO2'; 
fALDFURFURALO2(i)=fALDFURFURALO2(i)-1; fHO2(i)=fHO2(i)-1; fALDFURFURALOOH(i)=fALDFURFURALOOH(i)+1; 

i=i+1;
Rnames{i} = 'ALDFURFURALO2 + RO2 = FURANO2 + HO2';
k(:,i) = 1e-11;
Gstr{i,1} = 'ALDFURFURALO2'; Gstr{i,2} = 'RO2';
fALDFURFURALO2(i)=fALDFURFURALO2(i)-1; fFURANO2(i)=fFURANO2(i)+1; fHO2(i)=fHO2(i)+1; 

%%% FURFURALOOH, HYDFURFURALOOH, FURANO2, and ALDFURFURALOOH
i=i+1;
Rnames{i} = 'FURFURALOOH + hv = MALDALCO2H + OH + CO + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'FURFURALOOH'; 
fFURFURALOOH(i)=fFURFURALOOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDFURFURALOOH + hv = MALDALCO2H + OH + CO + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HYDFURFURALOOH'; 
fHYDFURFURALOOH(i)=fHYDFURFURALOOH(i)-1; fMALDALCO2H(i)=fMALDALCO2H(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURANO2 + NO = CARBFURANO2 + NO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'NO'; 
fFURANO2(i)=fFURANO2(i)-1; fNO(i)=fNO(i)-1; fCARBFURANO2(i)=fCARBFURANO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = 'FURANO2 + HO2 = FURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'HO2'; 
fFURANO2(i)=fFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fFURANOOH(i)=fFURANOOH(i)+1; 

i=i+1;
Rnames{i} = 'FURANO2 + RO2 = CARBFURANO2 + HO2';
k(:,i) = 5e-13;
Gstr{i,1} = 'FURANO2'; Gstr{i,2} = 'RO2';
fFURANO2(i)=fFURANO2(i)-1; fCARBFURANO2(i)=fCARBFURANO2(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'ALDFURFURALOOH + hv = FURANO2 + OH + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'ALDFURFURALOOH'; 
fALDFURFURALOOH(i)=fALDFURFURALOOH(i)-1; fFURANO2(i)=fFURANO2(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

%%%% CARBFURANO2 and FURANOOH
i=i+1;
Rnames{i} = 'CARBFURANO2 + NO = MALANHY + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'CARBFURANO2'; Gstr{i,2} = 'NO'; 
fCARBFURANO2(i)=fCARBFURANO2(i)-1; fNO(i)=fNO(i)-1; fMALANHY(i)=fMALANHY(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'CARBFURANO2 + HO2 = CARBFURANOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'CARBFURANO2'; Gstr{i,2} = 'HO2'; 
fCARBFURANO2(i)=fCARBFURANO2(i)-1; fHO2(i)=fHO2(i)-1; fCARBFURANOOH(i)=fCARBFURANOOH(i)+1; 

i=i+1;
Rnames{i} = 'CARBFURANO2 + RO2 =  MALANHY + HO2';
k(:,i) = 5e-13;
Gstr{i,1} = 'CARBFURANO2'; Gstr{i,2} = 'RO2';
fCARBFURANO2(i)=fCARBFURANO2(i)-1; fMALANHY(i)=fMALANHY(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'FURANOOH + hv = CARBFURANO2 + OH + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'FURANOOH'; 
fFURANOOH(i)=fFURANOOH(i)-1; fCARBFURANO2(i)=fCARBFURANO2(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

%%%%% CARBFURANOOH
i=i+1;
Rnames{i} = 'CARBFURANOOH + hv = MALANHY + OH + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'CARBFURANOOH'; 
fCARBFURANOOH(i)=fCARBFURANOOH(i)-1; fMALANHY(i)=fMALANHY(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; 

% MEFURFURAL
i=i+1;
Rnames{i} = 'MEFURFURAL + OH = MEFURFURALO2';
k(:,i) = 5.1e-11.*0.01;
Gstr{i,1} = 'MEFURFURAL'; Gstr{i,2} = 'OH'; 
fMEFURFURAL(i)=fMEFURFURAL(i)-1; fOH(i)=fOH(i)-1; fMEFURFURALO2(i)=fMEFURFURALO2(i)+1; 

i=i+1;
Rnames{i} = 'MEFURFURAL + OH = HYDMEFURFURALO2';
k(:,i) = 5.1e-11.*0.532;
Gstr{i,1} = 'MEFURFURAL'; Gstr{i,2} = 'OH'; 
fMEFURFURAL(i)=fMEFURFURAL(i)-1; fOH(i)=fOH(i)-1; fHYDMEFURFURALO2(i)=fHYDMEFURFURALO2(i)+1; 

i=i+1;
Rnames{i} = 'MEFURFURAL + OH = C5MCO3DB + HO2';
k(:,i) = 5.1e-11.*0.458;
Gstr{i,1} = 'MEFURFURAL'; Gstr{i,2} = 'OH'; 
fMEFURFURAL(i)=fMEFURFURAL(i)-1; fOH(i)=fOH(i)-1; fC5MCO3DB(i)=fC5MCO3DB(i)+1; fHO2(i)=fHO2(i)+1; 

%% MEFURFURALO2, HYDMEFURFURALO2, and C5MCO3DB (C5MCO3DB doesn't have further products)
i=i+1;
Rnames{i} = 'MEFURFURALO2 + NO = C3MCOCO2H + NO2 + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'MEFURFURALO2'; Gstr{i,2} = 'NO'; 
fMEFURFURALO2(i)=fMEFURFURALO2(i)-1; fNO(i)=fNO(i)-1; fC3MCOCO2H(i)=fC3MCOCO2H(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MEFURFURALO2 + HO2 = MEFURFURALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'MEFURFURALO2'; Gstr{i,2} = 'HO2'; 
fMEFURFURALO2(i)=fMEFURFURALO2(i)-1; fHO2(i)=fHO2(i)-1; fMEFURFURALOOH(i)=fMEFURFURALOOH(i)+1; 

i=i+1;
Rnames{i} = 'MEFURFURALO2 + RO2 = C3MCOCO2H + CO + HO2';
k(:,i) = 1e-14;
Gstr{i,1} = 'MEFURFURALO2'; Gstr{i,2} = 'RO2';
fMEFURFURALO2(i)=fMEFURFURALO2(i)-1; fC3MCOCO2H(i)=fC3MCOCO2H(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURFURALO2 + NO = C5CO14OH + NO2 + CO + HO2';
k(:,i) = KRO2NO;
Gstr{i,1} = 'HYDMEFURFURALO2'; Gstr{i,2} = 'NO'; 
fHYDMEFURFURALO2(i)=fHYDMEFURFURALO2(i)-1; fNO(i)=fNO(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fNO2(i)=fNO2(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURFURALO2 + HO2 = HYDMEFURFURALOOH';
k(:,i) = KRO2HO2;
Gstr{i,1} = 'HYDMEFURFURALO2'; Gstr{i,2} = 'HO2'; 
fHYDMEFURFURALO2(i)=fHYDMEFURFURALO2(i)-1; fHO2(i)=fHO2(i)-1; fHYDMEFURFURALOOH(i)=fHYDMEFURFURALOOH(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURFURALO2 + RO2 = C5CO14OH + CO + HO2';
k(:,i) = 1e-14;
Gstr{i,1} = 'HYDMEFURFURALO2'; Gstr{i,2} = 'RO2';
fHYDMEFURFURALO2(i)=fHYDMEFURFURALO2(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

%%% C3MCOCO2H, MEFURFURALOOH, and HYDMEFURFURALOOH
i=i+1;
Rnames{i} = 'C3MCOCO2H + OH = MGLY + HO2 + CO';
k(:,i) = 4.66e-11;
Gstr{i,1} = 'C3MCOCO2H'; Gstr{i,2} = 'OH'; 
fC3MCOCO2H(i)=fC3MCOCO2H(i)-1; fOH(i)=fOH(i)-1; fMGLY(i)=fMGLY(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'C3MCOCO2H + hv = HCOCO2H + HO2 + CO + MO2 + CO';
k(:,i) = JMACR;
Gstr{i,1} = 'C3MCOCO2H'; 
fC3MCOCO2H(i)=fC3MCOCO2H(i)-1; fHCOCO2H(i)=fHCOCO2H(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fMO2(i)=fMO2(i)+1; fCO(i)=fCO(i)+1; 

i=i+1;
Rnames{i} = 'MEFURFURALOOH + hv = C3MCOCO2H + OH + CO + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'MEFURFURALOOH'; 
fMEFURFURALOOH(i)=fMEFURFURALOOH(i)-1; fC3MCOCO2H(i)=fC3MCOCO2H(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'HYDMEFURFURALOOH + hv = C5CO14OH + OH + CO + HO2';
k(:,i) = JCH3OOH;
Gstr{i,1} = 'HYDMEFURFURALOOH'; 
fHYDMEFURFURALOOH(i)=fHYDMEFURFURALOOH(i)-1; fC5CO14OH(i)=fC5CO14OH(i)+1; fOH(i)=fOH(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; 

%END OF REACTION LIST


