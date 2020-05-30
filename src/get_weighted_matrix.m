classdef weighted_matrix < handle

    methods
function weighted_matrix = get_weighted_matrix(q, q_max, q_min, q_velocities)
    w = ones(1, 7)
    c = ones(1, 7)
    for i = 1:7
        h_of_q = get_h_of_q(q(i), q_max(i), q_min(i), c(i));s
        mid_point = get_mid_point(q_max(i), q_min(i));
        weight = get_weight(q(i), h_of_q, q_velocities(i), mid_point);
        w(1, i) = weight;
    end

function h_of_q = get_h_of_q(q, q_max, q_min, c)
    h_of_q = ((q_max - q_min) * (2*q - q_max - q_min)/(c*(q_max - q).^2)*((q-q_min).^2));
end

function mid_point = get_mid_point(q_max, q_min)
    mid_point = (q_max+q_min)/2;
end

function weight = get_weight(q, h_of_q, q_velocity, mid_point)
	if q > mid_point && q_velocity > 0 || q < mid_point && q_velocity < 0
        weight = 1 + abs(h_of_q);
	else 
		weight = 1;
	end
end