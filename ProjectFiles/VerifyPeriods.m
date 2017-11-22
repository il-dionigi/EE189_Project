load('Signals/RealSignals/RealSignals.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicInCompleteFewHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteManyHighNoise.mat');
load('Signals/Noisy/HighNoise/PeriodicCompleteFewHighNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicInCompleteFewLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteManyLowNoise.mat');
load('Signals/Noisy/LowNoise/PeriodicCompleteFewLowNoise.mat');

verbose = 0;

errorTotal = 0;

errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicCompleteFewHighNoise{i});
    periodActual = Answers_PeriodicCompleteFewHighNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
    fprintf("Number wrong in PeriodicCompleteFewHighNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicCompleteFewHighNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicCompleteFewLowNoise{i});
    periodActual = Answers_PeriodicCompleteFewLowNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
    fprintf("Number wrong in PeriodicCompleteFewLowNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicCompleteFewLowNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicCompleteManyHighNoise{i});
    periodActual = Answers_PeriodicCompleteManyHighNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
    fprintf("Number wrong in PeriodicCompleteManyHighNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicCompleteManyHighNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicCompleteManyLowNoise{i});
    periodActual = Answers_PeriodicCompleteManyLowNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
    fprintf("Number wrong in PeriodicCompleteManyLowNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicCompleteManyLowNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicInCompleteFewHighNoise{i});
    periodActual = Answers_PeriodicInCompleteFewHighNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
    fprintf("Number wrong in PeriodicInCompleteFewHighNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicInCompleteFewHighNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicInCompleteFewLowNoise{i});
    periodActual = Answers_PeriodicInCompleteFewLowNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
fprintf("Number wrong in PeriodicInCompleteFewLowNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicInCompleteFewLowNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicInCompleteManyHighNoise{i});
    periodActual = Answers_PeriodicInCompleteManyHighNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
fprintf("Number wrong in PeriodicInCompleteManyHighNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicInCompleteManyHighNoise!\n");
end
errorTotal = errorTotal + errors;
errors = 0;
for i = 1:1:8
    periodEstimated = PeriodDetector(Y_PeriodicInCompleteManyLowNoise{i});
    periodActual = Answers_PeriodicInCompleteManyLowNoise(i);
    if abs(periodEstimated-periodActual)>=periodActual*0.2
       errors = errors + 1;
       if verbose
          fprintf("The index of the incorrect vector was %d\n", i);
       end
    end
end
if errors
   fprintf("Number wrong in PeriodicInCompleteManyLowNoise:\n%d/8\n", errors);
else
   fprintf("None wrong in PeriodicInCompleteManyLowNoise!\n");
end
errorTotal = errorTotal + errors;
fprintf("Number wrong in total:\n%d\n", errorTotal);
fprintf("This equates to %.2f percent wrong\n", (errorTotal / 64) * 100);