
nSym=10^4;%Number of symbols to transmit
EbN0dB = 12; % Eb/N0 range in dB for simulation
% arrayOfM=[2,4,8,16]; %array of M values to simulate
arrayOfM=[4,16,64,256]; %uncomment this line if MOD_TYPE='QAM'
k=log2(arrayOfM);
MOD_TYPE='qam';
EsN0dB = 10*log10(k)+EbN0dB;      %EsN0dB calculation
j=1;
figure;
for M=arrayOfM
BER_sim = zeros(1,length(EbN0dB)); %simulated Symbol error rates
d = randsrc(1,nSym,0:M-1);           %uniform random symbols from 1:M
s=modulate(d,MOD_TYPE,M); 
r = add_noise(s,EsN0dB(j));      %add AWGN noise
subplot(2,2,j);
scatter(real(r),imag(r),1,'r','LineWidth', 0.1);hold on;
scatter(real(s),imag(s),100,'filled','gd','LineWidth',4);
hold off;
title(['Constellation ideal ',num2str(M),'-',MOD_TYPE,...
    '(green) Vs Noisy signal for EbN0dB =',...
    num2str(EbN0dB),'dB']);
xlabel('real axis')
ylabel('imaginary axis');
j=j+1;
end