% Evaluate Algorithm
AlgoResult = [];
AlgoMax = [];
for Algo = 1 : 100
    Pole_Balancing_GeneticAlgorithm
     AlgoResult(:,Algo) = meanPerf;
     AlgoMax(:,Algo) = maxPerf;
     disp(Algo);
end
    
