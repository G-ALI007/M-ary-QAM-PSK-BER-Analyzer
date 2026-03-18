function z = pskdemod_gray(y, M)
% PSK Demodulation with Gray Decoding
% Input:
% y: Received PSK symbols (complex values)
% M: Modulation order (must be a power of 2)
% Output:
% z: Decoded integers (Gray-decoded)
% Check inputs
if mod(log2(M), 1) ~= 0
error('M must be a power of 2.');
end
% Estimate transmitted integers from received signal
z = round((angle(y) * M / (2 * pi))); % Convert phase to integer values
% Handle negative indices by mapping them into the range [0, M-1]
z(z < 0) = z(z < 0) + M;
% Perform Gray decoding
[~, gray_map] = gray2bin(0:M-1, 'psk', M); % Generate Gray-to-binary map
temp = gray_map(z + 1); % Map estimated symbols to decoded binary integers
z(:) = temp(:);
end
