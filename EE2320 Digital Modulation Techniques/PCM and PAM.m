%generation of 100 samples.
a = -32;
b = 32;
x = (b-a).*rand(100,1) + a;%generating 100 random samples 

enc=[];%quantizing the samples and assigning bits
for(i=1:1:length(x))
 if (x(i)>0 && x(i)<=1)
 e=[1 0 0 0 0 0];
 xq(i)=0.5;
 elseif (x(i)>1 && x(i)<=2)
 e=[1 0 0 0 0 1];
 xq(i)=1.5;
 elseif (x(i)>2 && x(i)<=3)
 e=[1 0 0 0 1 0];
 xq(i)=2.5;
 elseif (x(i)>3 && x(i)<=4)
 e=[1 0 0 0 1 1];
 xq(i)=3.5;
 elseif (x(i)>4 && x(i)<=5)
 e=[1 0 0 1 0 0];
 xq(i)=4.5;
 elseif (x(i)>5 && x(i)<=6)
 e=[1 0 0 1 0 1];
 xq(i)=5.5;
 elseif (x(i)>6 && x(i)<=7)
 e=[1 0 0 1 1 0];
 xq(i)=6.5;
 elseif (x(i)>7 && x(i)<=8)
 e=[1 0 0 1 1 1];
 xq(i)=7.5;
 elseif (x(i)>8 && x(i)<=9)
 e=[1 0 1 0 0 0];
 xq(i)=8.5;
 elseif (x(i)>9 && x(i)<=10)
 e=[1 0 1 0 0 1];
 xq(i)=9.5;
 elseif (x(i)>10 && x(i)<=11)
 e=[1 0 1 0 1 0];
 xq(i)=10.5;
 elseif (x(i)>11 && x(i)<=12)
 e=[1 0 1 0 1 1];
 xq(i)=11.5;
 elseif (x(i)>12 && x(i)<=13)
 e=[1 0 1 1 0 0];
 xq(i)=12.5;
 elseif (x(i)>13 && x(i)<=14)
 e=[1 0 1 1 0 1];
 xq(i)=13.5;
 elseif (x(i)>14 && x(i)<=15)
 e=[1 0 1 1 1 0];
 xq(i)=14.5;
 elseif (x(i)>15 && x(i)<=16)
 e=[1 0 1 1 1 1];
 xq(i)=15.5;
 elseif (x(i)>16 && x(i)<=17)
 e=[1 1 0 0 0 0];
 xq(i)=16.5;
 elseif (x(i)>17 && x(i)<=18)
 e=[1 1 0 0 0 1];
 xq(i)=17.5;
 elseif (x(i)>18 && x(i)<=19)
 e=[1 1 0 0 1 0];
 xq(i)=18.5;
 elseif (x(i)>19 && x(i)<=20)
 e=[1 1 0 0 1 1];
 xq(i)=19.5;
 elseif (x(i)>20 && x(i)<=21)
 e=[1 1 0 1 0 0];
 xq(i)=20.5;
 elseif (x(i)>21 && x(i)<=22)
 e=[1 1 0 1 0 1];
 xq(i)=21.5;
 elseif (x(i)>22 && x(i)<=23)
 e=[1 1 0 1 1 0];
 xq(i)=22.5;
 elseif (x(i)>23 && x(i)<=24)
 e=[1 1 0 1 1 1];
 xq(i)=23.5;
 elseif (x(i)>24 && x(i)<=25)
 e=[1 1 1 0 0 0];
 xq(i)=24.5;
 elseif (x(i)>25 && x(i)<=26)
 e=[1 1 1 0 0 1];
 xq(i)=25.5;
 elseif (x(i)>26 && x(i)<=27)
 e=[1 1 1 0 1 0];
 xq(i)=26.5;
 elseif (x(i)>27 && x(i)<=28)
 e=[1 1 1 0 1 1];
 xq(i)=27.5;
 elseif (x(i)>28 && x(i)<=29)
 e=[1 1 1 1 0 0];
 xq(i)=28.5;
 elseif (x(i)>29 && x(i)<=30)
 e=[1 1 1 1 0 1];
 xq(i)=29.5;
 elseif (x(i)>30 && x(i)<=31)
 e=[1 1 1 1 1 0];
 xq(i)=30.5;
 elseif (x(i)>31 && x(i)<=32)
 e=[1 1 1 1 1 1];
 xq(i)=31.5;
 elseif (x(i)>-32 && x(i)<=-31)
 e=[0 0 0 0 0 0];
 xq(i)=-31.5;
 elseif (x(i)>-31 && x(i)<=-30)
 e=[0 0 0 0 0 1];
 xq(i)=-30.5;
 elseif (x(i)>-30 && x(i)<=-29)
 e=[0 0 0 0 1 0];
 xq(i)=-29.5;
 elseif (x(i)>-29 && x(i)<=-28)
 e=[0 0 0 0 1 1];
 xq(i)=-28.5;
 elseif (x(i)>-28 && x(i)<=-27)
 e=[0 0 0 1 0 0];
 xq(i)=-27.5;
 elseif (x(i)>-27 && x(i)<=-26)
 e=[0 0 0 1 0 1];
 xq(i)=-26.5;
 elseif (x(i)>-26 && x(i)<=-25)
 e=[0 0 0 1 1 0];
 xq(i)=-25.5;
 elseif (x(i)>-25 && x(i)<=-24)
 e=[0 0 0 1 1 1];
 xq(i)=-24.5;
 elseif (x(i)>-24 && x(i)<=-23)
 e=[0 0 1 0 0 0];
 xq(i)=-23.5;
 elseif (x(i)>-23 && x(i)<=-22)
 e=[0 0 1 0 0 1];
 xq(i)=-22.5;
 elseif (x(i)>-22 && x(i)<=-21)
 e=[0 0 1 0 1 0];
 xq(i)=-21.5;
 elseif (x(i)>-21 && x(i)<=-20)
 e=[0 0 1 0 1 1];
 xq(i)=-20.5;
 elseif (x(i)>-20 && x(i)<=-19)
 e=[0 0 1 1 0 0];
 xq(i)=-19.5;
 elseif (x(i)>-19 && x(i)<=-18)
 e=[0 0 1 1 0 1];
 xq(i)=-18.5;
 elseif (x(i)>-18 && x(i)<=-17)
 e=[0 0 1 1 1 0];
 xq(i)=-17.5;
 elseif (x(i)>-17 && x(i)<=-16)
 e=[0 0 1 1 1 1];
 xq(i)=-16.5;
 elseif (x(i)>-16 && x(i)<=-15)
 e=[0 1 0 0 0 0];
 xq(i)=-15.5;
 elseif (x(i)>-15 && x(i)<=-14)
 e=[0 1 0 0 0 1];
 xq(i)=-14.5;
 elseif (x(i)>-14 && x(i)<=-13)
 e=[0 1 0 0 1 0];
 xq(i)=-13.5;
 elseif (x(i)>-13 && x(i)<=-12)
 e=[0 1 0 0 1 1];
 xq(i)=-12.5;
 elseif (x(i)>-12 && x(i)<=-11)
 e=[0 1 0 1 0 0];
 xq(i)=-11.5;
 elseif (x(i)>-11 && x(i)<=-10)
 e=[0 1 0 1 0 1];
 xq(i)=-10.5;
 elseif (x(i)>-10 && x(i)<=-9)
 e=[0 1 0 1 1 0];
 xq(i)=-9.5;
 elseif (x(i)>-9 && x(i)<=-8)
 e=[0 1 0 1 1 1];
 xq(i)=-8.5;
 elseif (x(i)>-8 && x(i)<=-7)
 e=[0 1 1 0 0 0];
 xq(i)=-7.5;
 elseif (x(i)>-7 && x(i)<=-6)
 e=[0 1 1 0 0 1];
 xq(i)=-6.5;
 elseif (x(i)>-6 && x(i)<=-5)
 e=[0 1 1 0 1 0];
 xq(i)=-5.5;
 elseif (x(i)>-5 && x(i)<=-4)
 e=[0 1 1 0 1 1];
 xq(i)=-4.5;
 elseif (x(i)>-4 && x(i)<=-3)
 e=[0 1 1 1 0 0];
 xq(i)=-3.5;
 elseif (x(i)>-3 && x(i)<=-2)
 e=[0 1 1 1 0 1];
 xq(i)=-2.5;
 elseif (x(i)>-2 && x(i)<=-1)
 e=[0 1 1 1 1 0];
 xq(i)=-1.5;
 else (x(i)>-1 && x(i)<=0)
 e=[0 1 1 1 1 1];
 xq(i)=-0.5;
 end
 enc=[enc e];
 end

fs=8*(10^3);%sampling frquency
t = 1/(4*fs):1/(4*fs):1200/(4*fs);
%Converting PCM to 4 PAM
 X_Q=[];
 for i=1:2:length(enc)-1
 if(enc(i)==0 && enc(i+1)==0)
 x_q(i)=-3;
 x_q(i+1)=-3;
 elseif(enc(i)==0 && enc(i+1)==1)
 x_q(i)=-1;
 x_q(i+1)=-1;
 elseif(enc(i)==1 && enc(i+1)==0)
 x_q(i)=1;
 x_q(i+1)=1;
 elseif(enc(i)==1 && enc(i+1)==1)
 x_q(i)=3;
 x_q(i+1)=3;
 end
 X_Q=[X_Q x_q];
 end
 p = repelem(x_q,2);%sampling at 4 times baseband sampling frequency i.e transmitted signal
 subplot(5,1,1);
 plot(t,p,'-b');
 title('4-PAM');
 sigma=1.12;
 mu=0;
 n=sigma*randn(size(p))+mu;%AWGN of the channel.
 z= [0 0 0 0 0 0 0]
 for i=1:4:length(p)-3; 
 z(1,i:i+6) = [z(i:i+2) 0 0 0 0]+conv(p(1,i:i+3),[1 1 1 1]);%convolution of pulses with m(t)
 l(i:i+6) = z(i:i+6);
 end
 w=(1./sqrt(20))*z(1,1:1200);
 y=p+n;%adding noise to signal
 subplot(5,1,2);
 plot(t,y,'b');
 title('Noise added PAM signal')
 subplot(5,1,3);
 plot(t,w,'r');
 title('convoluted signal without noise')
 
 r= [0 0 0 0 0 0 0]
 for i=1:4:length(p)-3;
 r(1,i:i+6) = [r(i:i+2) 0 0 0 0]+conv(n(1,i:i+3),[1 1 1 1]);%convolution of noise with m(t)
 end
 %subplot(5,1,4);
 l= (1./sqrt(20))*r(1,1:1200);
% plot(t,l(1,1:1200));
 %title('convoluted noise');
 o=w+l;%sum of the convoluted signal with convoluted noise. that is output of matched filter 
 subplot(5,1,4);
 plot(t,o,'b');
 title('matched filter output');
 Dec=[];%sampling and decoding the matched filter output

for(i=4:4:length(o))
 if (o(i)>0 && o(i)<=2)
 dec=[1 0];
 o_q(i)=1;
 o_q(i-1)=1;
 o_q(i-2)=1;
 o_q(i-3)=1;
 elseif (o(i)>2)
  dec=[1 1];
 o_q(i)=3;
 o_q(i-1)=3;
 o_q(i-2)=3;
 o_q(i-3)=3;
 elseif (o(i)>-2 && o(i)<=0)
   dec=[0 1];
 o_q(i)=-1;
 o_q(i-1)=-1;
 o_q(i-2)=-1;
 o_q(i-3)=-1;
 else (o(i)<=-2)
  dec=[0 0];
 o_q(i)=-3;
 o_q(i-1)=-3;
 o_q(i-2)=-3;
 o_q(i-3)=-3;

 end
 Dec=[Dec dec];
end
subplot(5,1,5);
 plot(t,o_q,'b');
 title('Decoded PAM output');
 for i=1:1:300
f(i)=o_q(4*i);
 end
%finding error of PAM SYMBOL
 for i=4:4:1200
  if (o_q(i) == p(i))
      d(i)=0;
      d(i-1)=0;
      d(i-2)=0;
      d(i-3)=0;
  else (o_q(i) ~= p(i))
      d(i)=1;
      d(i-1)=1;
      d(i-2)=1;
      d(i-3)=1;
  end  
 end
D = sum(d);
PAMsymerror=D/12;%Perentage of error in PAM symbol
fprintf('PAMsymbol error in percentage = %.4f \n', PAMsymerror)
%Finding error in PCM symbols
 for i=1:6:600-5
  if (Dec(i) == enc(i) && Dec(i+1) == enc(i+1) && Dec(i+2) == enc(i+2) && Dec(i+3) == enc(i+3) && Dec(i+4) == enc(i+4)  && Dec(i+5) == enc(i+5) )
      u(i)=0; 
  else 
      u(i)=1;
  end  
 end
U = sum(u);
PCMsymbolerror=U;
fprintf('PCMsymbol error in percentage = %.4f \n',U)
%Finding error in output Bits
 for i=1:1:600
  if (Dec(i) == enc(i))
      v(i)=0; 
  else 
      v(i)=1;
  end  
 end
 V = sum(v);
 Biterrorrate=V/6;
 fprintf('Bit error rate in percentage = %.4f \n',Biterrorrate)
 L1=length(x);
 L2 = length(xq);
 Psignal=(norm(x)^2)/L1;
 Pnoise =(max(x)^2)/(3*(4^6));
 SQNR=Psignal/Pnoise;%signalto quantization noise ratio.
 SQNRdb=10*log10(SQNR);
 fprintf('SQNR = %.4f \nSQNR in db = %.4f \n',SQNR,SQNRdb)
