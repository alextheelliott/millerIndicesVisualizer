classdef renderer
    properties 
        angles = [0 0 0];
    end
    methods (Static)
        function p = genPath(a0,a1,n) 
            a = linspace(a0(1),a1(1),n).';
            b = linspace(a0(2),a1(2),n).';
            c = linspace(a0(3),a1(3),n).';
            
            p = [a b c];
        end
    end
    methods 
        function obj = update(~,obj,p,n) 
            obj.angles = [p(n,1) p(n,2) p(n,3)];
        end
        function obj = rotate(r,obj)
            %Rotation about x, y, z
            rx = [1 0 0; 0 cos(r.angles(1)) -sin(r.angles(1)); 0 sin(r.angles(1)) cos(r.angles(1))];
            ry = [cos(r.angles(2)) 0 -sin(r.angles(2)); 0 1 0; sin(r.angles(2)) 0 cos(r.angles(2))];
            rz = [cos(r.angles(3)) -sin(r.angles(3)) 0; sin(r.angles(3)) cos(r.angles(3)) 0; 0 0 1];

            obj.verticesToRender = (rz*(ry*(rx*(obj.verticesToRender.')))).';
        end
        function obj = flatten(~,obj)
            obj.verticesToRender = obj.verticesToRender(:,1:2);
        end
        function renderFace(r,obj)
            rotObj = rotate(r,obj); %Rotate Obj
            patch('Faces',rotObj.facesToRender,'Vertices',rotObj.verticesToRender,'FaceColor',rotObj.c,'FaceAlpha',rotObj.a);
        end
        function renderLine(r,obj)
            rotObj = rotate(r,obj); %Rotate Obj
            for j = 2:length(rotObj.verticesToRender)
                plot3([rotObj.verticesToRender(1,1) rotObj.verticesToRender(j,1)], ...
                    [rotObj.verticesToRender(1,2) rotObj.verticesToRender(j,2)], ...
                    [rotObj.verticesToRender(1,3) rotObj.verticesToRender(j,3)], ...
                    strcat(rotObj.c(j-1),"-."),'LineWidth',5,'MarkerSize',20);
            end
        end
    end
end