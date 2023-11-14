%https://uk.mathworks.com/help/hydro/ug/modeling-heat-exchangers.html


% Radiator specs
% https://www.watercoolinguk.co.uk/p/Barrow-Dabel-60D-Series-360mm-3x120-Thick-Copper-Radiator-Black_80928.html
radiator_L = 0.366; % [m]
radiator_W = 0.060; % [m]
radiator_H = 0.1266; % [m]
tubes_N = 12;
tube_H = 0.0015; % [m]
fin_spacing = 0.002; % [m]
wall_thickness = 1e-4; % [m]
wall_conductivity = 400; % [W/(m*K)]
liquid_pipe_D = 0.01; % [m]

% % Radiator specs
% % https://www.mishimoto.co.uk/yamaha-yfz350-banshee-aluminium-radiator-87-06.html
% radiator_L = 0.304; % [m]
% radiator_W = 0.0399; % [m]
% radiator_H = 0.208; % [m]
% tubes_N = 20;
% tube_H = 0.0015; % [m]
% fin_spacing = 0.002; % [m]
% wall_thickness = 1e-4; % [m]
% wall_conductivity = 240; % [W/(m*K)]
% liquid_pipe_D = 0.01; % [m]


% % IC Radiator specs
% radiator_L = 0.6; % [m]
% radiator_W = 0.05; % [m]
% radiator_H = 0.5; % [m]
% tubes_N = 22;
% tube_H = 0.0015; % [m]
% fin_spacing = 0.002; % [m]
% wall_thickness = 1e-4; % [m]
% wall_conductivity = 240; % [W/(m*K)]
% liquid_pipe_D = 0.01; % [m]

% Derived specs
tube_H_internal = tube_H - 2*wall_thickness; % [m]
tube_W_internal = radiator_W - 2*wall_thickness; % [m]
gap_H = (radiator_H - tubes_N * tube_H) / (tubes_N - 1); % [m] Fin height
air_area_flow = (tubes_N - 1) * radiator_L * gap_H; % [m^2]
air_area_primary = tubes_N * 2 * (radiator_W + tube_H) * radiator_L; % [m^2] Tube surface area
fins_N = (tubes_N + 1) * radiator_L / fin_spacing;
air_area_fins = 2 * fins_N * radiator_W * gap_H; % [m^2]
thermal_resistance_primary = wall_thickness / air_area_primary / wall_conductivity; % [K/W]
liquid_pipe_A = pi * liquid_pipe_D^2 / 4; % [m^2]

% Other values
component_start_temp = 35; % [degC]
% 
% coeffs = Simulink.Parameter;
% coeffs.Value = [-4.1874738305272504E-27 1.0441207052012313E-22 -1.0515838796622882E-18 ...
%                5.4773684554889017E-15 -1.571089680457229E-11 2.4105596763382539E-8 ...
%                -1.6914328862345285E-5 0.021452216508469291 -0.77253102108807559 ...
%                ];
% coeffs.Complexity = 'real';
% coeffs.HasCoderInfo = false;
% coeffs.Description = '';
% coeffs.DataType = 'auto';
% coeffs.Min = [];
% coeffs.Max = [];
% coeffs.DocUnits = '';
load('cont_power_coeffs.mat');