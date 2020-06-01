classdef Bread < handle
	properties
		height;
		width;
		faces;
		points;
		numPoints;
		data;
		bread_h;
	end

	methods
		function self = Bread(width, height, breadTr)
			[faces, points, data] = getPolyData(self);
			self.faces = faces;
			self.points = points;
			numPoints = size(points);
			self.numPoints = numPoints(1);
			self.data = data;
			self.bread_h = init_bread(self, breadTr, faces, points);
			self.height = height;
			self.width = width;
		end
		
		function  [breadPoints, numPoints] = getBreadPoints(self)
			breadPoints = self.points;
			numPoints = self.numPoints;
		end
		
		function [faces, points, data] = getPolyData(self)
			[faces, points, data] = plyread("bread.ply", "tri");
		end

		function bread_h = initBread(self, breadTr, faces, points)
			hold on
			bread_h=trisurf(faces,points(:,1),points(:,2),points(:,3),"LineStyle","none","Facecolor","green");
			hold off
			for j=1:self.numPoints
				bread_h.Vertices(j,:)=transl(breadTr*transl(points(j,:)))';
			end
			drawnow();
		end
		
		function update_pos(self, breadTr)
	
			for j=1:self.numPoints
				self.bread_h.Vertices(j,:)=transl(breadTr*transl(self.points(j,:)))';
			end
		end
		
	end
end
