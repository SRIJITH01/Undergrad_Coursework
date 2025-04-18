enc = randi([0 1],1,1000);%ihave reduced bits to 1000 from 100000 because it is taking a lot of time.
xenc=repmat(enc,16,1);
t = 1:1:1000;
%Converting BITS to 4QAM
 X_Q1=[];
 X_Q2=[];
 for i=1:4:length(enc)-3
 if(enc(i)==0 && enc(i+1)==0 && enc(i+2)==0 && enc(i+3)==0)
 x_q1=[-3];
 x_q2=[-3];
 elseif(enc(i)==0 && enc(i+1)==0 && enc(i+2)==0 && enc(i+3)==1)
 x_q1=[-1];
 x_q2=[-3];
 elseif(enc(i)==0 && enc(i+1)==0 && enc(i+2)==1 && enc(i+3)==1)
 x_q1=[1];
 x_q2=[-3];
 elseif(enc(i)==0 && enc(i+1)==0 && enc(i+2)==1 && enc(i+3)==0)
 x_q1=[3];
 x_q2=[-3];
 elseif(enc(i)==0 && enc(i+1)==1 && enc(i+2)==0 && enc(i+3)==0)
 x_q1=[-3];
 x_q2=[-1];
 elseif(enc(i)==0 && enc(i+1)==1 && enc(i+2)==0 && enc(i+3)==1)
 x_q1=[-1];
 x_q2=[-1];
 elseif(enc(i)==0 && enc(i+1)==1 && enc(i+2)==1 && enc(i+3)==1)
 x_q1=[1];
 x_q2=[-1];
 elseif(enc(i)==0 && enc(i+1)==1 && enc(i+2)==1 && enc(i+3)==0)
 x_q1=[3];
 x_q2=[-1];
 elseif(enc(i)==1 && enc(i+1)==1 && enc(i+2)==0 && enc(i+3)==0)
 x_q1=[-3];
 x_q2=[1];
 elseif(enc(i)==1 && enc(i+1)==1 && enc(i+2)==0 && enc(i+3)==1)
 x_q1=[-1];
 x_q2=[1];
 elseif(enc(i)==1 && enc(i+1)==1 && enc(i+2)==1 && enc(i+3)==1)
 x_q1=[1];
 x_q2=[1];
 elseif(enc(i)==1 && enc(i+1)==1 && enc(i+2)==1 && enc(i+3)==0)
 x_q1=[3];
 x_q2=[1];
 elseif(enc(i)==1 && enc(i+1)==0 && enc(i+2)==0 && enc(i+3)==0)
 x_q1=[-3];
 x_q2=[3];
 elseif(enc(i)==1 && enc(i+1)==0 && enc(i+2)==0 && enc(i+3)==1)
 x_q1=[-1];
 x_q2=[3];
 elseif(enc(i)==1 && enc(i+1)==0 && enc(i+2)==1 && enc(i+3)==1)
 x_q1=[1];
 x_q2=[3];
 else(enc(i)==1 && enc(i+1)==0 && enc(i+2)==1 && enc(i+3)==0)
 x_q1=[3];
 x_q2=[3];
 end
X_Q1=[X_Q1 x_q1];
X_Q2=[X_Q2 x_q2];
 end

 SNR=-5:1:10;
 snr=(10.^SNR);
 sigm=1./snr;
 sigma=transpose(sigm);
 p1=repmat(X_Q1,16,1);
 p2=repmat(X_Q2,16,1);
 mu=0.5;
 n1=sigma.*randn(size(X_Q1))+mu;%AWGN of the channel.
 y1=p1+n1;%adding noise to signal
  n2=sigma.*randn(size(X_Q2))+mu;%AWGN of the channel.
 y2=p2+n2;
 

 Dec=[];%sampling and decoding the  output
for(j=1:1:length(sigma))
for(i=1:1:length(X_Q1))
 if (norm([y1(j,i)+3,y2(j,i)+3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
 dec=[0 0 0 0];
 elseif(norm([y1(j,i)+1,y2(j,i)+3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 0 0 1];
elseif (norm([y1(j,i)-1,y2(j,i)+3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 0 1 1];
 elseif(norm([y1(j,i)-3,y2(j,i)+3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 0 1 0];
 elseif (norm([y1(j,i)+3,y2(j,i)+1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
 dec=[0 1 0 0];
 elseif(norm([y1(j,i)+1,y2(j,i)+1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 1 0 1];
elseif (norm([y1(j,i)-1,y2(j,i)+1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 1 1 1];
 elseif(norm([y1(j,i)-3,y2(j,i)+1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[0 1 1 0];
 elseif (norm([y1(j,i)+3,y2(j,i)-1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
 dec=[1 1 0 0];
 elseif(norm([y1(j,i)+1,y2(j,i)-1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 1 0 1];
elseif (norm([y1(j,i)-1,y2(j,i)-1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 1 1 1];
 elseif(norm([y1(j,i)-3,y2(j,i)-1])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 1 1 0];
 elseif(norm([y1(j,i)+3,y2(j,i)-3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
 dec=[1 0 0 0];
 elseif(norm([y1(j,i)+1,y2(j,i)-3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 0 0 1];
elseif (norm([y1(j,i)-1,y2(j,i)-3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 0 1 1];
 else(norm([y1(j,i)-3,y2(j,i)-3])== min([norm([y1(j,i)-3,y2(j,i)-3]),norm([y1(j,i)-3,y2(j,i)-1]),norm([y1(j,i)-3,y2(j,i)+1]),norm([y1(j,i)-3,y2(j,i)+3]),norm([y1(j,i)-1,y2(j,i)-3]),norm([y1(j,i)-1,y2(j,i)-1]),norm([y1(j,i)-1,y2(j,i)+1]),norm([y1(j,i)-1,y2(j,i)+3]),norm([y1(j,i)+1,y2(j,i)-3]),norm([y1(j,i)+1,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)-3]),norm([y1(j,i)+3,y2(j,i)-1]),norm([y1(j,i)+3,y2(j,i)+1]),norm([y1(j,i)+3,y2(j,i)+3])]))
  dec=[1 0 1 0];
 end
 Dec=[Dec dec]
end
end
for (j=1:1:length(sigma))
DEC(j,1:1000)=Dec(1,(1+(j-1)*1000):(j*1000));
end
for(j=1:1:length(sigma))
 for i=1:1:length(enc);
  if (DEC(j,i) == xenc(j,i))
      d(j,i)=0;
  else (DEC(j,i) ~= xenc(j,i))
      d(j,i)=1;
  end  
 end
end
 D=sum(d,2);
 plot(SNR,D./10,'b');
 title('BER');
%QAMsymerror=D./10000;%Perentage of error in QAM symbol
%fprintf('QAMsymbol error in percentage = %.4f \n', QAMsymerror)
