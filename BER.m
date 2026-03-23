
 clear; clc;
 %---------Input Fields------------------------
 nSym=10^5;%Number of symbols to transmit
 EbN0dB = -5:20; % Eb/N0 range in dB for simulation
 F=25;
 MOD_TYPE='qam'; %Set 'PSK' or 'QAM' 
%  arrayOfM=[2,4,8,16,32]; %array of M values to simulate
 arrayOfM=[4,16,64,256]; %uncomment this line if MOD_TYPE='QAM'
 plotColor =['b','g','r','c','m','k']; p=1; %plot colors
 legendString = cell(1,length(arrayOfM)*2); %for legend entries

 for M = arrayOfM
 %-----Initialization of various parameters----
 k=log2(M);
 EsN0dB = 10*log10(k)+EbN0dB;      %EsN0dB calculation
 BER_sim = zeros(1,length(EbN0dB)); %simulated Symbol error rates


 for i=1:length(EsN0dB)
     n=0;
     for f=1:F
         fprintf('EbN0dB = %f, frame = %d  \n', EbN0dB(i), f);
          % -------- Transmitter -------------------
         d = randsrc(1,nSym,0:M-1);           %uniform random symbols from 1:M
         s=modulate(d,MOD_TYPE,M); 
         % -------- Channel -------------------
         r = add_noise(s,EsN0dB(i));      %add AWGN noise
         % -------- Receiver -------------------
         d_dem = demodulate(r,MOD_TYPE,M);
         n=n+ biterr(d,d_dem);
     end
      BER_sim(i) = n/nSym/F;
 end
 
 BER_theory = Theoretical_BER(EbN0dB,MOD_TYPE,M); %theoretical BER
 semilogy(EbN0dB,BER_sim,[plotColor(p) 'o'],'LineWidth',1.2); hold on;
 semilogy(EbN0dB,BER_theory,plotColor(p));
 ylim([ 10^-6 5])
 xlim auto;
 legendString{2*p-1}=['Sim ',num2str(M),'-',MOD_TYPE];
 legendString{2*p}=['Theory ',num2str(M),'-',MOD_TYPE]; p=p+1;
 end
 
 legend(legendString);xlabel('Eb/N0(dB)');ylabel('BER');
 title(['Probability of Bit Error for M-',MOD_TYPE]);
 
 
 
 
 
 