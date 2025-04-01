classdef Node
    properties
        value
        position 
        children % Array to hold associated nodes
    endproperties

    methods
        % Constructor
        function obj = Node(value, position)
            if nargin > 0
                obj.value = value; % Reference value
                obj.position = position; % Initial position of the node works for any dimension
                obj.children; % Initialize an empty array of associated nodes
            endif
        end
        
        % Method to add a child node
        function [obj, childNode] = addChild(obj, childNode)
            if isempty(obj.children)
                obj.children = {childNode};
                childNode = childNode.addChild(obj);
                %fprintf('obj has no children \n');
            elseif ~areConnected(obj, childNode)
                obj.children(end+1) = childNode;
                childNode = childNode.addChild(obj);
                %fprintf(' They are not connected so adding. \n');
            end
        end

        % Method to remove a child node
        function obj = removeChild(obj, index)
            obj.children(index) = [];
        end
        
        % Method to display the node's value and associated nodes
        function display(obj)
            fprintf('Node value: %d\n', obj.value);
            fprintf('Position: ');
            disp(obj.position);
            if ~isempty(obj.children)
                fprintf('Associated Nodes:\n');
                for i = 1:length(obj.children)
                    fprintf('%d\n', obj.children{i}.value);
                end
            else
                fprintf('No associated nodes.\n');
            end
        end
        
        % Method to calculate distance to another node if connected
        function distance = calculateDistance(obj, otherNode)
            if !areConnected(obj, otherNode)
                distance = NaN; % Nodes are not connected
                return;
            endif
            
            % Calculate distance based on position
            distance = norm(obj.position - otherNode.position);
        end

        function connected = areConnected(obj, node2)
            if ~isempty(obj.children)
                for i = 1:length(obj.children)
                    if areEqual(obj, obj.children{i})
                        connected = true;
                        return;
                    end
                end
            end

            if ~isempty(node2.children)
                for i = 1:length(node2.children)
                    if areEqual(obj, node2.children{i})
                        connected = true;
                        return;
                    end
                end
            end

            connected = false;
        end


         function result = areEqual(obj, node2)
            if obj.value == node2.value && all(obj.position == node2.position)
                result = true;
            else
                result = false;
            end
        end

    end
end