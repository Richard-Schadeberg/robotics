import PackageName.JointsTools.*
clf
q_max = [2.5 1.8 2.5 1.8 1.8 1.8 2.5];
q_min = -q_max;
robot = HansCute;
end_effector_velocities = transpose([0 0 0 0 0 0]);
q_velocities = zeros(1, 7);
%q = [28.8 21.6 36 28.8 64.8 50.4 21.6]*pi/180;
q = zeros(1, 7);
robot.model.animate(q);
bread_tr = transl(0.2, 0.2, 0);
bread = Bread(46, 60, bread_tr);


% 
% while true
% 	w = JointsTools.get_weighted_matrix(q, q_max, q_min, q_velocities, ones(1,7));
% 	j = robot.model.jacob0(q);
% 	q_velocities = JointsTools.get_joint_velocities(q, j, end_effector_velocities, w);
% 	q = q + transpose(q_velocities);
% 	robot.model.animate(q);
% 	pause(0.01)
% end