load('Signals/RealSignals/RealSignals.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteFewHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteFewHighNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteFewLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteFewLowNoise.mat');

verbose = 1; % Change this to limit or delimit the ammount of info returned

correctTotal = 0;
percentErrorAverage = [0, 0];

disp('Verifying PeriodicCompleteFewHighNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicCompleteFewHighNoise, ...
    Answers_PeriodicCompleteFewHighNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteFewLowNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicCompleteFewLowNoise, ...
    Answers_PeriodicCompleteFewLowNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteManyHighNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicCompleteManyHighNoise, ...
    Answers_PeriodicCompleteManyHighNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteManyLowNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicCompleteManyLowNoise, ...
    Answers_PeriodicCompleteManyLowNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteFewHighNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicInCompleteFewHighNoise, ...
    Answers_PeriodicInCompleteFewHighNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteFewLowNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicInCompleteFewLowNoise, ...
    Answers_PeriodicInCompleteFewLowNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteManyHighNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicInCompleteManyHighNoise, ...
    Answers_PeriodicInCompleteManyHighNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteManyLowNoise...');
[correct, percentIncorrect] = verify(Y_PeriodicInCompleteManyLowNoise, ...
    Answers_PeriodicInCompleteManyLowNoise, verbose);
correctTotal = correctTotal + correct;
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

fprintf('Number correct in total: %d\n', correctTotal);
fprintf('This equates to %.2f percent correct\n', (correctTotal / 64) * 100);
fprintf('with an average percent error of %.2f\n', percentErrorAverage(1));

function [ numCorrect, percentErrorAverage ] = verify(signals, answers, verbose)
    totalNumber = length(signals);
    percentIncorrect = zeros(totalNumber, 1);
    for i = 1:1:totalNumber
        percentIncorrect(i) = (abs(answers(i)-PeriodDetector(signals{i}))/answers(i))*100;
    end
    numCorrect = sum(percentIncorrect <= 0.2);
    percentErrorAverage = mean(percentIncorrect);
    indices = find(percentIncorrect > 0.2);
    if verbose
        fprintf('Number correct out of %d was %d\n', totalNumber, numCorrect);
        fprintf('Average percent error was %.2f\n', percentErrorAverage);
        if numCorrect ~= totalNumber
            fprintf('Indices of incorrect periods: ');
            fprintf('%d ', indices);
            fprintf('\n\n');
        end
    end
end