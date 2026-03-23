function [dCap]=demodulate(r,MOD_TYPE,M)
 % functin to call various digital demodulation techniques
 % MOD_TYPE - 'PSK','QAM','PAM','FSK'
 % M - modulation order, For BPSK M=2, QPSK M=4, 256-QAM M=256 etc..,
 % r - received modulated symbols

switch lower(MOD_TYPE)

 case 'psk'
 dCap= pskdemod_gray(r,M);
 case 'qam'
 dCap= mqam_detector(r,M);
 case 'mqam'
 dCap= mqam_detector(r,M);
 otherwise
 error('Invalid Modulation specified');
end