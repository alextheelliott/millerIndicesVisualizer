classdef unitAxes < graphics
    properties
        c = {'red','green','blue'}
        a = 1
    end
    methods
        function obj = setup(~, obj, l) 
            obj.length = l;
            obj.verticesToRender = [-l/2 -l/2 -l/2; l/4-l/2 -l/2 -l/2; -l/2 l/4-l/2 -l/2; -l/2 -l/2 l/4-l/2];
            %obj.facesToRender = [1 2; 1 3; 1 4];
        end
    end
end