%% Update_StateValue_By_Self_Learn
%   @knowblesse
%   Created on : 2016-11-02
%   Last Modified on : 2016-11-02
%   주어진 StateValue를 가지고 혼자서 배워가며 StateValue를 수정합니다.

%% Constants
repeat = 1000; % Number of Games to let them play
LearningRate = 0.05; % Learning Rate
Randomness = 1; % 1 : Fully Random, 0 : Fully Greedy, (0,1) : Mixed
File_Name_Of_StateValue_File = 'StateValue.mat'; % 사용할 StateValue 파일 이름. 
File_Name_Of_New_StateValue_File = 'StateValue.mat'; % 새로운 StateValue를 저장할 파일 이름.

%% Load State Table and State Value
load('StateTable.mat');
load(File_Name_Of_StateValue_File);

%% Self Learning
tic; % Start Measuring Single Play Execution Time
    SelfLearn(StateTable,StateValue,LearningRate);
eta = toc * repeat; % End Measuring Single Play Execution Time
fprintf('Estimated Execution Time : %d Hours %d Minutes %d Seconds\n',floor(eta/3600),floor(rem(eta,3600)/60),rem(eta,60));
if input('Continue? (Type true or false)\n')
    tic
        for iteration = 1 : repeat
            StateValue = SelfLearn(StateTable,StateValue,LearningRate,Randomness);
            clc
            fprintf('Estimated Time : %d Hours %d Minutes %d Seconds\n',floor(eta/3600),floor(rem(eta,3600)/60),rem(eta,60));
            fprintf('%f %% Complete ......\n',iteration/repeat*100);
        end
        save('StateValue1.mat','StateValue');
    toc
end