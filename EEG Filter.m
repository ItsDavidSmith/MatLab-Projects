%% 
%Written by David Smith-Morales

% - PantherID:6445534

%Load '2_second_EEG-1' before running script


%Plot original signal
subplot(3,3,2)
plot(sig2)
title('Unfiltered Data')
xlabel('Time[2]')
xticks([0, 250, 500])
xticklabels({'0', '1', '2'})
ylabel('Amplitude (mV)')
yticks([-100, -50, 0 , 50])
yticklabels({'-100', '-50', '0', '50'})
xlim([0 500])

%% 
%Setup of variables
Fs = 250; % Sampling Frequency - 500 samples/2sec
T = 1/Fs; % Sampling Period 
L = 500; % Length of Signal -  500 data points
Samples = 0:L-1; % Create sample vector 
t = Samples*T; %samples into time vector
f = Fs*Samples/L;
f = f(1:L/2);

%Plot frequency spectrum (Fourier transform original)
y = fft(sig2);
yHalf = y(1:250);
y_abs = abs(yHalf);

subplot(3,3,1)
plot(f,y_abs)
title('Frequency Spectrum')
xlabel('Frequency [Hz]')
xlim([0 100])
ylabel('Amplitude')
yticks([0,500,1000,1500,2000,2500,3000,3500,4000,4500,5000])

%% 
%Plot Delta (0.5-4Hz)
Delta = zeros(1,250);
for ii=1:length(f)
    if f(ii)>0.5 && f(ii)<4
        Delta(ii) = y(ii);
    else
        Delta(ii)=0;
        
    end
end
Delta_Band = ifft(Delta,L);

subplot(3,3,3)
plot(t,Delta_Band)
title('Delta Band')
xlabel('Time (seconds)')
ylabel('Amplitude (mV)')

%%
%Plot Theta (4-8Hz)
Theta = zeros(1,250);
for ii=1:length(f)
    if f(ii)>4 && f(ii)<8
        Theta(ii) = y(ii);
    else
        Theta(ii)=0;
        
    end
end
Theta_Band = ifft(Theta,L);

subplot(3,3,4)
plot(t,Theta_Band)
title('Theta Band')
xlabel('Time (seconds)')
ylabel('Amplitude (mV)')


%%
%Plot Alpha (8-16Hz)
Alpha = zeros(1,250);
for ii=1:length(f)
    if f(ii)>8 && f(ii)<16
        Alpha(ii) = y(ii);
    else
        Alpha(ii)=0;
        
    end
end
Alpha_Band = ifft(Alpha,L);

subplot(3,3,5)
plot(t,Alpha_Band)
title('Alpha Band')
xlabel('Time (seconds)')
ylabel('Amplitude (mV)')


%%
%Plot Beta (16-32Hz)
Beta = zeros(1,250);
for ii=1:length(f)
    if f(ii)>16 && f(ii)<32
        Beta(ii) = y(ii);
    else
        Beta(ii)=0;
        
    end
end
Beta_Band = ifft(Beta,L);

subplot(3,3,6)
plot(t,Beta_Band)
title('Beta Band')
xlabel('Time (seconds)')
ylabel('Amplitude (mV)')


%%
%Plot Gamma (32-64Hz)
Gamma = zeros(1,250);
for ii=1:length(f)
    if f(ii)>32 && f(ii)<64
        Gamma(ii) = y(ii);
    else
        Gamma(ii)=0;
        
    end
end
Gamma_Band = ifft(Gamma,L);

subplot(3,3,7)
plot(t,Gamma_Band)
title('Gamma Band')
xlabel('Time (seconds)')
ylabel('Amplitude (mV)')
