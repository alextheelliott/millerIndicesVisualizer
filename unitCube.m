classdef unitCube < graphics
    properties
        c = 'blue'
        a = 0.1
    end
    methods
        function obj = setup(~, obj, l) 
            obj.length = l;
            obj.verticesToRender = [l/2 l/2 l/2; l/2 -l/2 l/2; -l/2 -l/2 l/2; -l/2 l/2 l/2; ...
                l/2 l/2 -l/2; l/2 -l/2 -l/2; -l/2 -l/2 -l/2; -l/2 l/2 -l/2];
            obj.facesToRender = [1 4 8 5; 3 4 8 7; 1 2 3 4; 1 5 6 2; 2 3 7 6; 5 6 7 8];
        end
    end
end