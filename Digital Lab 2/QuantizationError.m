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
