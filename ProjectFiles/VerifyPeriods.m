load('Signals/RealSignals/RealSignals.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteFewHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteFewHighNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteFewLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteFewLowNoise.mat');

clear figures;

isVerbose = 0; % Change this to limit or delimit the ammount of info returned
isTimed = 1; % Change this to track or not track time taken
samplingRate = 1; % Only examines every nth value from the input data

pDetectorHandle = @(input) PeriodDetector(input, samplingRate);

makeComparison = 1; % Change this to compare PeriodDetectorComparison
graphTimes = 1; % Change to graph the time vs input size
graphErrors = 1; % Change to graph the percent error vs input size
sameScale = 0; % Change to use same scale between comparisons
samplingRateComparison = 2; % Only examine every nyth value from input data

pDetectorComparisonHandle = @(inputComparison) PeriodDetectorComparison(inputComparison, samplingRateComparison);

correctTotal = 0;
timeTaken = struct('lengths',zeros(64,1), 'times',zeros(64,1));
percentError = struct('lengths',zeros(64,1), 'errors',zeros(64,1));

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
percentError.lengths(1:8) = percentIncorrect.lengths(:);
percentError.errors(1:8) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteFewHighNoise, Answers_PeriodicCompleteFewHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(1:8) = timeInfo.lengths(:);
    timeTakenComparison.times(1:8) = timeInfo.times(:);
    percentErrorComparison.lengths(1:8) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(1:8) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicCompleteFewLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteFewLowNoise, Answers_PeriodicCompleteFewLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(9:16) = timeInfo.lengths(:);
timeTaken.times(9:16) = timeInfo.times(:);
percentError.lengths(9:16) = percentIncorrect.lengths(:);
percentError.errors(9:16) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteFewLowNoise, Answers_PeriodicCompleteFewLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(9:16) = timeInfo.lengths(:);
    timeTakenComparison.times(9:16) = timeInfo.times(:);
    percentErrorComparison.lengths(9:16) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(9:16) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicCompleteManyHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteManyHighNoise, Answers_PeriodicCompleteManyHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(17:24) = timeInfo.lengths(:);
timeTaken.times(17:24) = timeInfo.times(:);
percentError.lengths(17:24) = percentIncorrect.lengths(:);
percentError.errors(17:24) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteManyHighNoise, Answers_PeriodicCompleteManyHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(17:24) = timeInfo.lengths(:);
    timeTakenComparison.times(17:24) = timeInfo.times(:);
    percentErrorComparison.lengths(17:24) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(17:24) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicCompleteManyLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicCompleteManyLowNoise, Answers_PeriodicCompleteManyLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(25:32) = timeInfo.lengths(:);
timeTaken.times(25:32) = timeInfo.times(:);
percentError.lengths(25:32) = percentIncorrect.lengths(:);
percentError.errors(25:32) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicCompleteManyLowNoise, Answers_PeriodicCompleteManyLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(25:32) = timeInfo.lengths(:);
    timeTakenComparison.times(25:32) = timeInfo.times(:);
    percentErrorComparison.lengths(25:32) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(25:32) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicInCompleteFewHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteFewHighNoise, Answers_PeriodicInCompleteFewHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(33:40) = timeInfo.lengths(:);
timeTaken.times(33:40) = timeInfo.times(:);
percentError.lengths(33:40) = percentIncorrect.lengths(:);
percentError.errors(33:40) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteFewHighNoise, Answers_PeriodicInCompleteFewHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(33:40) = timeInfo.lengths(:);
    timeTakenComparison.times(33:40) = timeInfo.times(:);
    percentErrorComparison.lengths(33:40) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(33:40) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicInCompleteFewLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteFewLowNoise, Answers_PeriodicInCompleteFewLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(41:48) = timeInfo.lengths(:);
timeTaken.times(41:48) = timeInfo.times(:);
percentError.lengths(41:48) = percentIncorrect.lengths(:);
percentError.errors(41:48) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteFewLowNoise, Answers_PeriodicInCompleteFewLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(41:48) = timeInfo.lengths(:);
    timeTakenComparison.times(41:48) = timeInfo.times(:);
    percentErrorComparison.lengths(41:48) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(41:48) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicInCompleteManyHighNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteManyHighNoise, Answers_PeriodicInCompleteManyHighNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(49:56) = timeInfo.lengths(:);
timeTaken.times(49:56) = timeInfo.times(:);
percentError.lengths(49:56) = percentIncorrect.lengths(:);
percentError.errors(49:56) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteManyHighNoise, Answers_PeriodicInCompleteManyHighNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(49:56) = timeInfo.lengths(:);
    timeTakenComparison.times(49:56) = timeInfo.times(:);
    percentErrorComparison.lengths(49:56) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(49:56) = percentIncorrect.errors(:);
end

disp('Verifying PeriodicInCompleteManyLowNoise...');

[correct, percentIncorrect, timeInfo] = ...
    verify(pDetectorHandle, Y_PeriodicInCompleteManyLowNoise, Answers_PeriodicInCompleteManyLowNoise, ...
    isVerbose, isTimed, makeComparison);
correctTotal = correctTotal + correct;
timeTaken.lengths(57:64) = timeInfo.lengths(:);
timeTaken.times(57:64) = timeInfo.times(:);
percentError.lengths(57:64) = percentIncorrect.lengths(:);
percentError.errors(57:64) = percentIncorrect.errors(:);

if makeComparison
    [correct, percentIncorrect, timeInfo] = ...
        verify(pDetectorComparisonHandle, Y_PeriodicInCompleteManyLowNoise, Answers_PeriodicInCompleteManyLowNoise, ...
        isVerbose, isTimed, makeComparison);
    correctTotalComparison = correctTotalComparison + correct;
    timeTakenComparison.lengths(57:64) = timeInfo.lengths(:);
    timeTakenComparison.times(57:64) = timeInfo.times(:);
    percentErrorComparison.lengths(57:64) = percentIncorrect.lengths(:);
    percentErrorComparison.errors(57:64) = percentIncorrect.errors(:);
end

percentErrorAverage = mean(percentError.errors(:));
timeTakenAverage = mean(timeTaken.times(:));

% Max plots to plot
subplotMax = 2*graphTimes + 2*graphErrors;
subplotCur = 0;
    
if ~makeComparison
    % Max plots to plot
    subplotMax = graphTimes + graphErrors;
    subplotCur = 0;

    if isTimed
       fprintf('\nOverall average time taken was: %.4f\n', timeTakenAverage);
       scatter(timeTaken.lengths(:), timeTaken.times(:));
       title('Time Elapsed vs Input Size for Period Detector');
       xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
       ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
    end
    fprintf('Number correct in total: %d\n', correctTotal);
    fprintf('This equates to %.2f percent correct\n', (correctTotal / 64) * 100);
    fprintf('with an average percent error of %.2f\n', percentErrorAverage);
    
    if graphTimes
        subplotCur = subplotCur + 1;
        subplot(2,ceil(subplotCur/2),subplotCur);
        scatter(timeTaken.lengths(:), timeTaken.times(:));
        hlineT = refline([0 timeTakenAverage]);
        hlineT.Color = 'r';
        legend(hlineT, texlabel(strcat('mu=', num2str(timeTakenAverage))));
        title('Time Elapsed vs Input Size for Period Detector');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
    end
    
    if graphErrors
        subplotCur = subplotCur + 1;
        subplot(2,ceil(subplotCur/2),subplotCur);
        scatter(percentError.lengths(:), percentError.errors(:));
        hlineE = refline([0 percentErrorAverage]);
        hlineE.Color = 'r';
        legend(hlineE, texlabel(strcat('mu=', num2str(percentErrorAverage))));
        title('Absolute Percent Error vs Input Size for Period Detector');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Percent~Error,~percent~(arb)$', 'Interpreter', 'latex');
    end
else
    % Max plots to plot
    subplotMax = 2*graphTimes + 2*graphErrors;
    subplotCur = 0;

    percentErrorAverageComparison = mean(percentErrorComparison.errors(:));
    timeTakenAverageComparison = mean(timeTakenComparison.times(:));

    fprintf('\nOverall average time taken was: %.4f vs %.4f\n', timeTakenAverage, timeTakenAverageComparison);
    fprintf('Number correct in total was: %d vs %d\n', correctTotal, correctTotalComparison);
    fprintf('This equates to %.2f vs %.2f percent correct\n', (correctTotal / 64) * 100, (correctTotalComparison / 64) * 100);
    fprintf('with an average percent error of %.2f vs %.2f\n', percentErrorAverage, percentErrorAverageComparison);
    
    if graphTimes
        subplotCur = subplotCur + 1;
        p1 = subplot(2,subplotMax/2,subplotCur);
        scatter(timeTaken.lengths(:), timeTaken.times(:));
        hline1 = refline([0 timeTakenAverage]);
        hline1.Color = 'r';
        legend(hline1, texlabel(strcat('mu=', num2str(timeTakenAverage))));
        title('Time Elapsed vs Input Size for Period Detector');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
        
        subplotCur = subplotCur + 1;
        p2 = subplot(2,subplotMax/2,subplotCur);
        scatter(timeTakenComparison.lengths(:), timeTakenComparison.times(:));
        hline2 = refline([0 timeTakenAverageComparison]);
        hline2.Color = 'r';
        legend(hline2, texlabel(strcat('mu=', num2str(timeTakenAverageComparison))));
        title('Time Elapsed vs Input Size for Period Detector Comparison');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Time~Elapsed,~seconds~(s)$', 'Interpreter', 'latex');
        if sameScale
            linkaxes([p1,p2],'y');
        end
    end
    
    if graphErrors
        subplotCur = subplotCur + 1;
        p3 = subplot(2,subplotMax/2,subplotCur);
        scatter(percentError.lengths(:), percentError.errors(:));
        hline3 = refline([0 percentErrorAverage]);
        hline3.Color = 'r';
        legend(hline3, texlabel(strcat('mu=', num2str(percentErrorAverage))));
        title('Absolute Percent Error vs Input Size for Period Detector');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Percent~Error,~percent~(arb)$', 'Interpreter', 'latex');
        
        subplotCur = subplotCur + 1;
        p4 = subplot(2,subplotMax/2,subplotCur);
        scatter(percentErrorComparison.lengths(:), percentErrorComparison.errors(:));
        hline4 = refline([0 percentErrorAverageComparison]);
        hline4.Color = 'r';
        legend(hline4, texlabel(strcat('mu=', num2str(percentErrorAverageComparison))));
        title('TAbsolute Percent Error vs Input Size for Period Detector Comparison');
        xlabel('$Input~Size,~length~(n)$', 'Interpreter', 'latex');
        ylabel('$Percent~Error,~percent~(arb)$', 'Interpreter', 'latex');
        
        if sameScale
            linkaxes([p3,p4],'y');
        end
    end
end

function [ numCorrect, percentError, timeInfo ] = verify(func, signals, answers, verbose, timed, comparison)
    totalNumber = length(signals);
    timeInfo = struct('lengths',[], 'times',[]);
    percentError = struct('lengths',[], 'errors',[]);
    timeInfo.lengths = cellfun('length', signals);
    percentError.lengths = cellfun('length', signals);
    timeInfo.times = double(-1 * ones(totalNumber, 1));
    for i = 1:1:totalNumber
        f = @()func(signals{i}); % handle to function
        if (timed)
            timeInfo.times(i) = double(timeit(f));
        end
        percentError.errors(i) = ...
            (abs(answers(i)-func(signals{i}))/answers(i))*100;
    end
    tElapsed = mean(timeInfo.times(:));
    numCorrect = sum(percentError.errors(:) <= 20);
    percentErrorAverage = mean(percentError.errors(:));
    indices = find(percentError.errors(:) > 20);
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