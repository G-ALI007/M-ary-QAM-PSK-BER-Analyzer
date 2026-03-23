function [BER] = Theoretical_BER(EbN0dB,MOD_TYPE,M)
 %Theoretical Symbol Error Rate for various modulations over AWGN
 %EbN0dB - list of SNR per bit values
 %MOD_TYPE - 'BPSK','PSK','QAM'
 %M - Modulation level for the chosen modulation

 gamma_b = 10.^(EbN0dB/10); %SNR per bit in linear scale
 BER = zeros(size(EbN0dB));
switch lower(MOD_TYPE)
 case 'bpsk'
    BER=qfunc(sqrt(2*gamma_b));
 case {'psk','mpsk'}
    if M==2 %for BPSK
        BER=qfunc(sqrt(2*gamma_b));
    else
        BER=2*qfunc(sqrt(2*gamma_b*log2(M))*sin(pi/M));  
    end
 case {'qam','mqam'}
 BER = 1-(1-2*(1-1/sqrt(M))*qfunc(sqrt(3*gamma_b*log2(M)/(M-1)))).^2;
% k = sqrt(1/((2/3)*(M-1))); % normalizing factor
% BER = 2*(1-1/sqrt(M))*erfc(k*sqrt(gamma_b)) ...
%               - (1-2/sqrt(M) + 1/M)*(erfc(k*sqrt(gamma_b))).^2;
 otherwise
 disp (' Invalid modulation (MOD_TYPE) selected');
 end
end