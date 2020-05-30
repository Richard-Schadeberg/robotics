import PackageName.JointsTools.*
q_max = [pi pi pi pi pi pi pi];
q_min = [-pi -pi -pi -pi -pi -pi -pi];
robot = HansCute;
q = [28.8 28.8 -43.2 -36 36 50 -50.4]*pi/180;
robot.model.animate(q);
q_velocities = ones(1, 7);
end_effector_velocities = transpose([0 0 1 0 0 0]);
j = robot.model.jacob0(q);
jT = transpose(j);
w = JointsTools.get_weighted_matrix(q, q_max, q_min, q_velocities, ones(1,7));
joint_velocities = JointsTools.get_joint_velocities(q, robot.model.jacob0(q), end_effector_velocities, wT);
