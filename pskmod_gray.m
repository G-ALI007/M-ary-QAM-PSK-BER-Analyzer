function y = pskmod_gray(x, M)
% Check inputs
if mod(log2(M), 1) ~= 0
error('M must be a power of 2.');
end
% Apply Gray encoding
[~, gray_map] = bin2gray(x, 'psk', M); % Encode data symbols to Gray-coded integers
% x_gray: Gray-coded values corresponding to x
% gray_map: The mapping from binary to Gray-coded integers
% Map input symbols to their Gray-coded equivalents
[~, index] = ismember(x, gray_map); % Find positions in the Gray map
if any(index == 0)
error('Input data contains invalid symbols for the given modulation order.');
end
x_mapped = index - 1; % Adjust indices to start from 0
% PSK modulation
y = exp(1j * 2 * pi * x_mapped / M); % Map symbols to constellation points
end