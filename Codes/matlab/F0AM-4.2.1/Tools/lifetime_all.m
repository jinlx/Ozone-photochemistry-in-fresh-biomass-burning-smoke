function tau = lifetime_all(S, sumEq, varargin)
% function tau = lifetime_all(S,sumEq,varargin)
% Calculates the lifetime of a chemicial species.
% NOTE: does not currently include/account for dilution losses.
%
% INPUTS:
% Spname: Species name, string.
% S:      Model structure
% sumEq:  optional flag for combining equilibria reactions. 0=no (default), 1=yes.
%
% OUTPUT:
% tau:  chemical lifetime, seconds.
%
% 20160324 GMW
% 20230329 LJ, saving the lifetime of available species in the matlab dataset

% get all avaialbe names in the S data strcuture
names = S.Cnames;

% Preallocate structure array
Lifetime(length(names)) = struct('name', '', 'tau', [], 'Time', []);

% Read names
for i=1:length(S.Cnames)
    name = S.Cnames{i};
    tau = lifetime(name,S,sumEq);
    % Assign current structure to corresponding index in Test array
    Lifetime(i).name = name;
    Lifetime(i).tau = tau;
    Lifetime(i).Time = S.Time; % workaround...
    % save out the data, Lixu
    Flight_ID      = varargin{end-2};
    MECHANISM      = varargin{end-1};
    FixNOx_postfix = varargin{end};
end

%%%%%OUTPUT%%%%%
% Lixu, 2023/03/29, modified.
switch Flight_ID
    case {'FN06', 'FN19'}
        filename = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/FIREX-AQ/output_data/FIREX_LGPlume_Lifetime_all', MECHANISM, '_', FixNOx_postfix, Flight_ID, '.mat'];
        save(filename, 'Lifetime')
        disp('save out Lifetime data')
    case {'RF03', 'RF07', 'RF09'}
        filename = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/WE-CAN/output_data/WECAN_Lifetime_all', MECHANISM, Flight_ID, '_', FixNOx_postfix, '.mat'];
        save(filename, 'Lifetime')
        disp('save out Lifetime data')
    case {'P3B'}
        filename = ['/glade/u/home/lixujin/matlab/F0AM-4.2.1/Setups/Examples/Lixu/P-3B/output_data/FIREXAQ_Lifetime_all', MECHANISM, Flight_ID, '_', FixNOx_postfix, '.mat'];
        save(filename, 'Lifetime')
        disp('save out Lifetime data')
    otherwise
end    
end

