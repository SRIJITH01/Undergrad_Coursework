enc = randi([0 1],1,100000);%iiave reduced bits to 100000 from 10000000 because it is taking a lot of time.
xenc=repmat(enc,151,1);
t = 1:1:100000;
%Converting BITS to 4FSk
 X_Q1=[];
 X_Q2=[];
 X_Q3=[];
 X_Q4=[];
 for i=1:2:length(enc)
 if(enc(i)==0 && enc(i+1)==0)
 x_q1=[1];
 x_q2=[0];
 x_q3=[0];
 x_q4=[0];
 elseif(enc(i)==0 && enc(i+1)==1)
 x_q1=[0];
 x_q2=[1];
 x_q3=[0];
 x_q4=[0];
 elseif(enc(i)==1 && enc(i+1)==1)
 x_q1=[0];
 x_q2=[0];
 x_q3=[1];
 x_q4=[0];
 elseif(enc(i)==1 && enc(i+1)==0)
 x_q1=[0];
 x_q2=[0];
 x_q3=[0];
 x_q4=[1];
 end
X_Q1=[X_Q1 x_q1];
X_Q2=[X_Q2 x_q2];
X_Q3=[X_Q3 x_q3];
X_Q4=[X_Q4 x_q4];
 end

 SNR=-5:0.1:10;
 snr=(10.^SNR);
 sigm=1./snr;
 sigma=transpose(sigm);
 p1=repmat(X_Q1,151,1);
 p2=repmat(X_Q2,151,1);
 p3=repmat(X_Q3,151,1);
 p4=repmat(X_Q4,151,1);
 mu=0.5;
 n1=sigma.*randn(size(X_Q1))+mu;%AWGN of tie ciannel.
 y1=repelem(p1+n1,1,2);%adding noise to signal
  n2=sigma.*randn(size(X_Q2))+mu;%AWGN of tie ciannel.
 y2=repelem(p2+n2,1,2);
  n3=sigma.*randn(size(X_Q3))+mu;%AWGN of tie ciannel.
 y3=repelem(p3+n3,1,2);
  n4=sigma.*randn(size(X_Q4))+mu;%AWGN of tie ciannel.
 y4=repelem(p4+n4,1,2);


 %sampling and decoding tie  output

for(j=1:1:length(sigma))
for(i=1:2:length(y1))
 if (y1(j,i)==max([y1(j,i),y2(j,i),y3(j,i),y4(j,i)]))
 dec(j,i:i+1)=[0 0];
 elseif (y2(j,i)==max([y1(j,i),y2(j,i),y3(j,i),y4(i)]))
  dec(j,i:i+1)=[0 1];
elseif (y3(j,i)==max([y1(j,i),y2(j,i),y3(j,i),y4(j,i)]))
  dec(j,i:i+1)=[1 1];
 else(y4(j,i)==max([y1(j,i),y2(j,i),y3(j,i),y4(j,i)]))
  dec(j,i:i+1)=[1 0];
 end
end
end
DEC =dec
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
%FSKsymerror=D./1000000;%Perentage of error in FSK symbol
%fprintf('FSKsymbol error in percentage = %.4f \n', FSKsymerror)
