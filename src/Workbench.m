
clf
qMax = [2.5 1.8 2.5 1.8 1.8 1.8 2.5];
qMin = -qMax;
robot = HansCute;
endEffectorVelocities = transpose([0 0 0 0 0 0]);
qVelocities = zeros(1, 7);
%q = [28.8 21.6 36 28.8 64.8 50.4 21.6]*pi/180;
q = zeros(1, 7);
robot.model.animate(q);
breadTr = transl(0.1, 0.1, 0);
bread = Bread(46, 60, breadTr);
testAnimate(robot, q)

function testAnimate(robot, q, qVelocities)
   %first location above toast
    endEffectorLocationTr = transl(0.1, 0.1, 0.2) * trotx(pi)
	goalJoints = robot.model.ikine(endEffectorLocationTr, q, [1 1 1 1 1 1])
	numSteps = 120
    qMatrix = robot.GetListOfPoses(q, goalJoints, numSteps)
	AnimateRobotMovement(qMatrix, robot, numSteps, false, 0, 0, 0)
	
	%now toast has been grabbed
end



% while true
% 	w = JointsTools.get_weighted_matrix(q, qMax, qMin, qVelocities, ones(1,7));
% 	j = robot.model.jacob0(q);
% 	qVelocities = JointsTools.getJointVelocities(q, j, endEffectorVelocities, w);
% 	q = q + transpose(qVelocities);
% 	robot.model.animate(q);
% 	pause(0.01)
% end

