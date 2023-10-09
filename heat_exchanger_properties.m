%https://uk.mathworks.com/help/hydro/ug/modeling-heat-exchangers.html

% Radiator specs
radiator_L = 0.6; % [m]
radiator_W = 0.015; % [m]
radiator_H = 0.5; % [m]
tubes_N = 50;
tube_H = 0.0015; % [m]
fin_spacing = 0.002; % [m]
wall_thickness = 1e-4; % [m]
wall_conductivity = 240; % [W/(m*K)]
liquid_pipe_D = 0.01; % [m]
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
coolant_hot_temp = 350; % [K]
coolant_flow_rate = 15 /60; % [L/min]
p_diff_across_radiator = 25000; % [Pa]

% Motor specs
motor_min_efficiency = 0.9;
motor_peak_power = 86000; % [W]
motor_max_heat = 1800;%motor_peak_power * (1 - motor_min_efficiency); % [W]

% Inverter specs
inverter_efficiency = 0.95;
inverter_max_heat = (motor_peak_power/inverter_efficiency) * (1 - inverter_efficiency); % [W]

% Total heat
total_max_heat = motor_max_heat + inverter_max_heat; % [W]
