% Generate a sine wave signal
% Sampling rate
fs = 4000; 
% Time vector
t = 0:1/fs:1;
% Signal frequency
f = 2; 
% Sine wave signal
x = sin(2*pi*f*t); 

% Quantization
n = [3, 4, 5, 10];
msqe = zeros(1,length(n));
for i = 1:length(n)
    m = 2*n(i) + 1;
    % Quantize x
    q = fi(x, 1, m, n(i));
    % Convert the quantized samples to binary
    bin_q = bin(q);
    % Calculate MSQE
    msqe(i) = mean((double(x) - double(q)).^2);
end

% Plot the MSQE for each number of bits
figure;
plot(n,msqe);
xlabel('n bits')
ylabel('MSQE')
title('Quantization error vs number of bits')
% this part below must be copied to your m file and complete the 
%required
% reconstruction from oversampling
t=0:0.001:1;% time signal
y=2*cos(2*pi*5*t);
[B,A] = butter(3,1000/100000,'low' ); % butter fly filter
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
% Adding zeros enhances the signal display and don't change the
%spectrum,it changes sampling freq. only
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
figure(2)
plot(t,filtered_signal,'r' )
xlabel('time')
ylabel('oversampled signals')
% construction from minimum sampling
figure
t=0:0.1:1; % replace ?? with the suitable number
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.1,'low' );
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' )
xlabel('time')
ylabel('minimum sampled signals')
s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));
figure
plot(freq,abs(s))
xlabel('freq')
ylabel('magnitude of minimum sampled signals')
% construction from undersampling sampling
figure
t=0:0.2:1;
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.2,'low' );
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' )
xlabel('time')
ylabel('minimum sampled signals')
s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));
figure
plot(freq,abs(s))
xlabel('freq')
ylabel('magnitude of minimum sampled signals')