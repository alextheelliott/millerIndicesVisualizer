classdef unitPlane < graphics
    properties
        c = 'black'
        a = .6
    end
    methods
        function obj = setup(~, obj, l, abc, c) 
            obj.c = c;
            z = 0;
            for j = 1:3
                if abc(j) == 0
                    z = z + 1;
                end
            end
            if z == 0
                obj.verticesToRender = [(1/abc(1))-l/2 -l/2 -l/2; 
                    -l/2 (1/abc(2))-l/2 -l/2;
                    -l/2 -l/2 (1/abc(3))-l/2];
                for j = 1:3
                    if obj.verticesToRender(j,j) < 0
                        obj.verticesToRender(1,j) = obj.verticesToRender(1,j)+1;
                        obj.verticesToRender(2,j) = obj.verticesToRender(2,j)+1;
                        obj.verticesToRender(3,j) = obj.verticesToRender(3,j)+1;
                    end
                end
                obj.facesToRender = [1 2 3];
            elseif z==1
                obj.verticesToRender = [];
                obj.facesToRender = [1 2 3 4];
            else
                obj.verticesToRender = [];
                obj.facesToRender = [1 2 3 4];
            end
        end
    end
end