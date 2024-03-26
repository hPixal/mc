classdef System
    properties
        nodes = {} % Array to hold associated nodes
        externalForces % Array to hold external forces
    endproperties

    methods
        % Constructor
        function obj = System(value,pos,associated,mass,externalForces)
            if nargin > 0
                for i = 1:length(value)
                    obj.nodes(i) = Node(value(i),pos(i,:));
                endfor
                % external forces format [ Positive value [Newtons] , Direction [x,y,z] , Reference value of associated node ["A"] ]
                obj.externalForces = externalForces;

                for i = 1:length(associated)
                    for j = 1:length(associated{i})
                        for k = 1:length(obj.nodes)
                            if associated{i}{j} == obj.nodes{k}.value
                                [obj.nodes{k},obj.nodes{i}] = obj.nodes{i}.addChild(obj.nodes{k});
                            endif
                        endfor
                    endfor
                endfor

            endif
        end
        
        % Method to display the node's value and associated nodes
        function display(obj)
            for i = 1:length(obj.nodes)
                obj.nodes{i}.display();
            endfor
            for i = 1:length(obj.externalForces)
                fprintf('External Force: %d, %s, %d\n', obj.externalForces(i,1), obj.externalForces(i,2), obj.externalForces(i,3));
            endfor
        end
    end
end