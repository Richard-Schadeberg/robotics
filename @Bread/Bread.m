classdef Bread < handle
	properties
		height;
		width;
		faces;
		points;
		num_points;
		data;
		bread_h;
	end

	methods
		function self = Bread(width, height, bread_tr)
			[faces, points, data] = get_poly_data(self);
			self.faces = faces;
			self.points = points;
			num_points = size(points);
			self.num_points = num_points(1);
			self.data = data;
			self.bread_h = init_bread(self, bread_tr, faces, points);
			self.height = height;
			self.width = width;
		end
		
		function [faces, points, data] = get_poly_data(self)
			[faces, points, data] = plyread("bread.ply", "tri");
		end

		function bread_h = init_bread(self, bread_tr, faces, points)
			hold on
			bread_h=trisurf(faces,points(:,1),points(:,2),points(:,3),"LineStyle","none","Facecolor","green");
			hold off
			for j=1:self.num_points
				bread_h.Vertices(j,:)=transl(bread_tr*transl(points(j,:)))';
			end
			drawnow();
		end
		
		function update_pos(self, bread_tr)
	
			for j=1:self.num_points
				self.bread_h.Vertices(j,:)=transl(bread_tr*transl(self.points(j,:)))';
			end
		end
		
	end
end
