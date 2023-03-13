% Generate a sine wave signal
% Sampling rate
fs = 100; 
% Time vector
%t = 0:1/fs:1;
%t = linspace(0,1, fs);
% Signal frequency
f = 20; 
% Sine wave signal
x = sin(2*pi*f*t); 

% Quantization 
% Number of bits 
%bits = [1 2 4 8]; 
bits = 1:1:8;
msqe = zeros(1,length(bits)); 
for i = 1:length(bits)
    n = bits(i);
    % Quantize signal
    q = round(x*2^(n-1))/(2^(n-1));
    % Calculate the MSQE
    msqe(i) = mean((double(x) - double(q)).^2);
end

% Plot the quantization error versus number of bits
figure
plot(bits, msqe)
xlabel('n bits')
ylabel('MSQE')
title('Quantization error vs number of bits')
