%Renders a Miller plane.
%Parameters:
%   This,        obj
%   Side length, l
%   Intercepts,  abc
%   Colour,      c
classdef unitPlane < graphics
    properties
        c = 'black'
        a = .6
    end
    methods
        function obj = setup(~, obj, l, abc, c) 
            obj.c = c;
            z = 0;
            %Counts axes w/o intercepts
            for j = 1:3
                if abc(j) == 0
                    z = z + 1;
                end
            end
            %Setup if all axis have intercepts
            if z == 0
                obj.verticesToRender = [(1/abc(1))-l/2 -l/2 -l/2; 
                                        -l/2 (1/abc(2))-l/2 -l/2;
                                        -l/2 -l/2 (1/abc(3))-l/2];
                %Adjust for the negative intercepts
                for j = 1:3
                    if abc(j) < 0
                        for k = 1:3
                            obj.verticesToRender(k,j) = obj.verticesToRender(k,j)+1;
                        end
                    end
                end
                obj.facesToRender = [1 2 3];
            %Setup if one axis doesn't have an intercept
            elseif z==1
                adj = 0;
                for j = 1:3
                    if abc(1) == 0
                        adj = 0;
                    elseif abc(2) == 0
                        adj = 1;
                    else
                        adj = 2;
                    end
                end
                obj.verticesToRender(:,mod(0+adj,3)+1) = [-l/2 -l/2  l/2  l/2];
                obj.verticesToRender(:,mod(1+adj,3)+1) = [-l/2 (1/abc(mod(1+adj,3)+1))-l/2 ...
                                                          (1/abc(mod(1+adj,3)+1))-l/2 -l/2];
                obj.verticesToRender(:,mod(2+adj,3)+1) = [(1/abc(mod(2+adj,3)+1))-l/2 -l/2 ...
                                                          -l/2 (1/abc(mod(2+adj,3)+1))-l/2];
                %Adjust for the negative intercepts
                for j = 1:3
                    if abc(j) < 0
                        for k=1:4
                            obj.verticesToRender(k,j) = obj.verticesToRender(k,j)+1;
                        end
                    end
                end
                obj.facesToRender = [1 2 3 4];
            %Setup if two axes don't have intercepts
            else
                adj = 0;
                for j = 1:3
                    if abc(1) == 0 && abc(2) == 0
                        adj = 0;
                    elseif abc(2) == 0 && abc(3) == 0
                        adj = 1;
                    else
                        adj = 2;
                    end
                end
                obj.verticesToRender(:,mod(0+adj,3)+1) = [-l/2 -l/2  l/2  l/2];
                obj.verticesToRender(:,mod(1+adj,3)+1) = [-l/2  l/2  l/2 -l/2];
                obj.verticesToRender(:,mod(2+adj,3)+1) = [(1/abc(mod(2+adj,3)+1))-l/2 (1/abc(mod(2+adj,3)+1))-l/2 ...
                                                          (1/abc(mod(2+adj,3)+1))-l/2 (1/abc(mod(2+adj,3)+1))-l/2];
                %Adjust for the negative intercepts
                for j = 1:3
                    if abc(j) < 0
                        for k=1:4
                            obj.verticesToRender(k,j) = obj.verticesToRender(k,j)+1;
                        end
                    end
                end
                obj.facesToRender = [1 2 3 4];
            end
            %If three axes don't have intercepts you do not have a plane
        end
    end
end