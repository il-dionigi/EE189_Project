load('Signals/RealSignals/RealSignals.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteFewHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteFewHighNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteFewLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteFewLowNoise.mat');

isVerbose = 0; % Change this to limit or delimit the ammount of info returned
isTimed = 1; % Change this to track or not track time taken

correctTotal = 0;
percentErrorAverage = [0, 0];
timeTaken = struct('lengths',zeros(64,1), 'times',zeros(64,1));

disp('Verifying PeriodicCompleteFewHighNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicCompleteFewHighNoise, ...
    Answers_PeriodicCompleteFewHighNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(1:8) = timeInfo.lengths(:);
timeTaken.times(1:8) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteFewLowNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicCompleteFewLowNoise, ...
    Answers_PeriodicCompleteFewLowNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(9:16) = timeInfo.lengths(:);
timeTaken.times(9:16) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteManyHighNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicCompleteManyHighNoise, ...
    Answers_PeriodicCompleteManyHighNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(17:24) = timeInfo.lengths(:);
timeTaken.times(17:24) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicCompleteManyLowNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicCompleteManyLowNoise, ...
    Answers_PeriodicCompleteManyLowNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(25:32) = timeInfo.lengths(:);
timeTaken.times(25:32) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteFewHighNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicInCompleteFewHighNoise, ...
    Answers_PeriodicInCompleteFewHighNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(33:40) = timeInfo.lengths(:);
timeTaken.times(33:40) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteFewLowNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicInCompleteFewLowNoise, ...
    Answers_PeriodicInCompleteFewLowNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(41:48) = timeInfo.lengths(:);
timeTaken.times(41:48) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteManyHighNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicInCompleteManyHighNoise, ...
    Answers_PeriodicInCompleteManyHighNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(49:56) = timeInfo.lengths(:);
timeTaken.times(49:56) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

disp('Verifying PeriodicInCompleteManyLowNoise...');
[correct, percentIncorrect, timeInfo] = verify(Y_PeriodicInCompleteManyLowNoise, ...
    Answers_PeriodicInCompleteManyLowNoise, isVerbose, isTimed);
correctTotal = correctTotal + correct;
timeTaken.lengths(57:64) = timeInfo.lengths(:);
timeTaken.times(57:64) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if isTimed
   fprintf('\nOverall average time taken was: %.4f\n', mean(timeTaken.times(:)));
   scatter(timeTaken.lengths(:), timeTaken.times(:));
   title('Time Elapsed vs Input Size for Period Detector');
   xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
   ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
end
fprintf('Number correct in total: %d\n', correctTotal);
fprintf('This equates to %.2f percent correct\n', (correctTotal / 64) * 100);
fprintf('with an average percent error of %.2f\n', percentErrorAverage(1));

function [ numCorrect, percentErrorAverage, timeInfo ] = verify(signals, answers, verbose, timed)
    totalNumber = length(signals);
    percentIncorrect = zeros(totalNumber, 1);
    timeInfo = struct('lengths',[], 'times',[]);
    timeInfo.lengths = cellfun('length', signals);
    timeInfo.times = double(-1 * ones(totalNumber, 1));
    for i = 1:1:totalNumber
        f = @() PeriodDetector(signals{i}); % handle to function
        if (timed)
            timeInfo.times(i) = double(timeit(f));
        end
        percentIncorrect(i) = (abs(answers(i)-PeriodDetector(signals{i}))/answers(i))*100;
    end
    tElapsed = mean(timeInfo.times(:));
    numCorrect = sum(percentIncorrect <= 0.2);
    percentErrorAverage = mean(percentIncorrect);
    indices = find(percentIncorrect > 0.2);
    if timed
       fprintf('Average time taken was %.4f\n', tElapsed); 
    end
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