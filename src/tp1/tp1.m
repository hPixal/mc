function [tp1] = tp1()
    %    % TEST BLOCK ---
    %    
    %    % Create nodes
    %    node1 = Node(1, [0, 0]);
    %    node2 = Node(2, [3, 4]);
    %    node3 = Node(3, [0, 5]);
    %    
    %    % Connect nodes
    %    [node1,node2] = addChild(node1,node2);
    %    [node1,node3] = addChild(node1,node3);
    %    
    %    
    %    % Display nodes
    %    array = {node1, node2, node3};
    %    for i = 1:length(array)
    %        array{i}.display();
    %    end
    %    
    %    
    %    % Calculate total distance
    %    totalDistance = calculateDistance(node1,node2);
    %    fprintf('Total distance between nodes: %.2f\n', totalDistance);
    %    totalDistance = calculateDistance(node1,node3);
    %    fprintf('Total distance between nodes: %.2f\n', totalDistance);

    value = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"];
    pos = [0, 0; 1, 0; 2, 0; 3, 0; 4, 0; 5, 0; 6, 0; 7, 0; 8, 0; 9, 0; 10, 0; 11, 0; 12, 0; 13, 0; 14, 0; 15, 0; 16, 0; 17, 0; 18, 0; 19, 0];
    associated = {{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"};{"B","D"};{"C"}};
    length(associated)
    externalForces = {0, "x", 0; 0, "y", 0; 0, "z", 0};
    sys = System(value, pos, associated, externalForces);
    
    sys.display();
end