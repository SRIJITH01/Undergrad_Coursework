c = randi([0 1],1,100000);

t = 1:1:100000;
%Converting BITS to 4 BPSK
 X_Q=[];
 for i=1:1:length(c)
 if(c(i)==0)
 x_q(i)=-1;
 else(c(i)==1)
 x_q(i)=+1;
 end
 
 end
 p=repmat(x_q,16,1);
 
 SNR=-5:1:10;
 snr=(10.^SNR);
 sigm=1./snr;
 sigma=transpose(sigm);
 mu=0;
 n=sigma.*randn(size(x_q))+mu;
 o=p+n;
 Dec=[];%sampling and decoding the  output
for(j=1:1:length(sigma))
for(i=1:1:length(o))
 if (o(j,i)>0)
 o_q(j,i)=1;
 else (o(j,i)<0)
 o_q(j,i)=-1;
 end
end
end


%finding error of BPSK SYMBOL
for(j=1:1:length(sigma))
 for i=1:1:length(o);
  if (o_q(j,i) == p(j,i))
      d(j,i)=0;
  else (o_q(j,i) ~= p(j,i))
      d(j,i)=1;
  end  
 end
end
D=sum(d,2);
  plot(SNR,D,'b');
 title('BER')
%BPSKsymerror=D./1000;%Perentage of error in BPSK symbol
%fprintf('BPSKsymbol error in percentage = %.4f \n', BPSKsymerror)
