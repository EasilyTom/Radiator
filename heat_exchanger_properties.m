%https://uk.mathworks.com/help/hydro/ug/modeling-heat-exchangers.html

% Radiator specs
radiator_L = 0.3; % [m]
radiator_W = 0.05; % [m]
radiator_H = 0.2; % [m]
tubes_N = 23;
tube_H = 0.002; % [m]
fin_spacing = 0.002; % [m]
wall_thickness = 1e-4; % [m]
wall_conductivity = 240; % [W/(m*K)]
liquid_pipe_D = 0.0215; % [m]

% Derived specs
tube_H_internal = tube_H - 2*wall_thickness; % [m]
tube_W_internal = radiator_W - 2*wall_thickness; % [m]
gap_H = (radiator_H - tubes_N * tube_H) / (tubes_N - 1); % [m]
air_area_flow = (tubes_N - 1) * radiator_L * gap_H; % [m^2]
air_area_primary = tubes_N * 2 * (radiator_W + tube_H) * radiator_L; % [m^2]
fins_N = (tubes_N - 1) * radiator_L / fin_spacing;
air_area_fins = 2 * fins_N * radiator_W * gap_H; % [m^2]
thermal_resistance_primary = wall_thickness / air_area_primary / wall_conductivity; % [K/kW]
liquid_pipe_A = pi * liquid_pipe_D^2 / 4; % [m^2]

% Other values
component_start_temp = 30; % [degC]

coeffs = Simulink.Parameter;
coeffs.Value = [-4.1874738305272504E-27 1.0441207052012313E-22 -1.0515838796622882E-18 ...
                5.4773684554889017E-15 -1.571089680457229E-11 2.4105596763382539E-8 ...
                -1.6914328862345285E-5 0.021452216508469291 -0.77253102108807559 ...
                ];
coeffs.Complexity = 'real';
coeffs.HasCoderInfo = false;
coeffs.Description = '';
coeffs.DataType = 'auto';
coeffs.Min = [];
coeffs.Max = [];
coeffs.DocUnits = '';
