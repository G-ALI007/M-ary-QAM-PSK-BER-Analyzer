function [r,n,N0] = add_noise(s,SNRdB)
 %Function to add AWGN to the given signal
 %[r,n,N0]= add_awgn_noise(s,SNRdB) adds AWGN noise vector to signal
 %'s' to generate a %resulting signal vector 'r' of specified SNR
 %in dB. It also returns the noise vector 'n' that is added to the
 %signal 's' and the spectral density N0 of noise added
 %
 %[r,n,N0]= add_awgn_noise(s,SNRdB,L) adds AWGN noise vector to
 %signal 's' to generate a resulting signal vector 'r' of specified
 %SNR in dB. The parameter 'L' specifies the oversampling ratio used
 %in the system (for waveform simulation). It also returns the noise
 %vector 'n' that is added to the signal 's' and the spectral
 %density N0 of noise added

 gamma = 10.^(SNRdB/10);        %SNR to linear scale
 P=sum(abs(s).^2)/length(s);   %Actual power in the vector
 N0=P/gamma;                 %Find the noise spectral density
 if(isreal(s))
 n = sqrt(N0/2)*randn(size(s));%computed noise
 else
 n = sqrt(N0/2)*(randn(size(s))+1i*randn(size(s)));%computed noise
 end
 
 r = s + n; %received signal

end