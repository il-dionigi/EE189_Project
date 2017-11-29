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
samplingRate = 2; % Only examines every nth value from the input data

pDetectorHandle = @(input) PeriodDetector(input, samplingRate);

makeComparison = 1; % Change this to compare PeriodDetectorComparison
samplingRateComparison = 2; % Only examine every nyth value from input data

pDetectorComparisonHandle = @(inputComparison) PeriodDetectorComparison(inputComparison, samplingRateComparison);

correctTotal = 0;
percentErrorAverage = [0, 0];
timeTaken = struct('lengths',zeros(64,1), 'times',zeros(64,1));

correctTotalComparison = 0;
percentErrorAverageComparison = [0, 0];
timeTakenComparison = struct('lengths',zeros(64,1), 'times',zeros(64,1));

disp('Verifying PeriodicCompleteFewHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteFewHighNoise, Answers_PeriodicCompleteFewHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(1:8) = timeInfo.lengths(:);
timeTaken.times(1:8) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteFewHighNoise, Answers_PeriodicCompleteFewHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(1:8) = timeInfo.lengths(:);
    timeTakenComparison.times(1:8) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicCompleteFewLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteFewLowNoise, Answers_PeriodicCompleteFewLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(9:16) = timeInfo.lengths(:);
timeTaken.times(9:16) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteFewLowNoise, Answers_PeriodicCompleteFewLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(9:16) = timeInfo.lengths(:);
    timeTakenComparison.times(9:16) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicCompleteManyHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteManyHighNoise, Answers_PeriodicCompleteManyHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(17:24) = timeInfo.lengths(:);
timeTaken.times(17:24) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteManyHighNoise, Answers_PeriodicCompleteManyHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(17:24) = timeInfo.lengths(:);
    timeTakenComparison.times(17:24) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicCompleteManyLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteManyLowNoise, Answers_PeriodicCompleteManyLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(25:32) = timeInfo.lengths(:);
timeTaken.times(25:32) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteManyLowNoise, Answers_PeriodicCompleteManyLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(25:32) = timeInfo.lengths(:);
    timeTakenComparison.times(25:32) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicInCompleteFewHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteFewHighNoise, Answers_PeriodicInCompleteFewHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(33:40) = timeInfo.lengths(:);
timeTaken.times(33:40) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteFewHighNoise, Answers_PeriodicInCompleteFewHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(33:40) = timeInfo.lengths(:);
    timeTakenComparison.times(33:40) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicInCompleteFewLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteFewLowNoise, Answers_PeriodicInCompleteFewLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(41:48) = timeInfo.lengths(:);
timeTaken.times(41:48) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteFewLowNoise, Answers_PeriodicInCompleteFewLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(41:48) = timeInfo.lengths(:);
    timeTakenComparison.times(41:48) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicInCompleteManyHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteManyHighNoise, Answers_PeriodicInCompleteManyHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(49:56) = timeInfo.lengths(:);
timeTaken.times(49:56) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteManyHighNoise, Answers_PeriodicInCompleteManyHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(49:56) = timeInfo.lengths(:);
    timeTakenComparison.times(49:56) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

disp('Verifying PeriodicInCompleteManyLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteManyLowNoise, Answers_PeriodicInCompleteManyLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(57:64) = timeInfo.lengths(:);
timeTaken.times(57:64) = timeInfo.times(:);
percentErrorAverage(1) = ((percentErrorAverage(1) * percentErrorAverage(2)) ...
    + percentIncorrect) / (percentErrorAverage(2) + 1);
percentErrorAverage(2) = percentErrorAverage(2) + 1;

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteManyLowNoise, Answers_PeriodicInCompleteManyLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(57:64) = timeInfo.lengths(:);
    timeTakenComparison.times(57:64) = timeInfo.times(:);
    percentErrorAverageComparison(1) = ((percentErrorAverageComparison(1) * percentErrorAverageComparison(2)) ...
        + percentIncorrect) / (percentErrorAverageComparison(2) + 1);
    percentErrorAverageComparison(2) = percentErrorAverageComparison(2) + 1;
end

if ~makeComparison
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
    subplot(1,1,1);
    scatter(timeTaken.lengths(:), timeTaken.times(:));
    title('Time Elapsed vs Input Size for Period Detector');
    xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
    ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
else
    fprintf('\nOverall average time taken was: %.4f vs %.4f\n', mean(timeTaken.times(:)), mean(timeTakenComparison.times(:)));
    fprintf('Number correct in total was: %d vs %d\n', correctTotal, correctTotalComparison);
    fprintf('This equates to %.2f vs %.2f percent correct\n', (correctTotal / 64) * 100, (correctTotalComparison / 64) * 100);
    fprintf('with an average percent error of %.2f vs %.2f\n', percentErrorAverage(1), percentErrorAverageComparison(1));
    p1 = subplot(2,1,1);
    scatter(timeTaken.lengths(:), timeTaken.times(:));
    title('Time Elapsed vs Input Size for Period Detector');
    xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
    ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
    p2 = subplot(2,1,2);
    scatter(timeTakenComparison.lengths(:), timeTakenComparison.times(:));
    title('Time Elapsed vs Input Size for Period Detector Comparison');
    xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
    ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
    linkaxes([p1,p2],'y');
end

function [ numCorrect, percentErrorAverage, timeInfo ] = verify(func, signals, answers, verbose, timed, comparison)
    totalNumber = length(signals);
    percentIncorrect = zeros(totalNumber, 1);
    timeInfo = struct('lengths',[], 'times',[]);
    timeInfo.lengths = cellfun('length', signals);
    timeInfo.times = double(-1 * ones(totalNumber, 1));
    for i = 1:1:totalNumber
        f = @()func(signals{i}); % handle to function
        if (timed)
            timeInfo.times(i) = double(timeit(f));
        end
        percentIncorrect(i) = ...
            (abs(answers(i)-func(signals{i}))/answers(i))*100;
    end
    tElapsed = mean(timeInfo.times(:));
    numCorrect = sum(percentIncorrect <= 20);
    percentErrorAverage = mean(percentIncorrect);
    indices = find(percentIncorrect > 20);
    if timed && ~comparison
       fprintf('Average time taken was %.4f\n', tElapsed); 
    end
    if verbose && ~comparison
        fprintf('Number correct out of %d was %d\n', totalNumber, numCorrect);
        fprintf('Average percent error was %.2f\n', percentErrorAverage);
        if numCorrect ~= totalNumber
            fprintf('Indices of incorrect periods: ');
            fprintf('%d ', indices);
            fprintf('\n\n');
        end
    end
end