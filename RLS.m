%RLS算法程序
clear
N=2000;Fs=500;
n=0:N-1;t=n/Fs;
xs=( sin(2*pi*t))';
subplot(4,1,1);
plot(t,xs);grid;
ylabel('幅度');
title('\it{输入周期性信号}');
xn=( 0.6*randn(1,length(t)))';
subplot(4,1,2);
plot(t,xn);grid;
ylabel('幅度');
xlabel('时间');
title('\it{随机噪声信号}');
d=xs;
x=xs+xn;
M=32;
w=(zeros(1,M))';
p=0.001*eye(M,M);
a=0.98;
for n=M:N;
x1=x(n:-1:n-M+1);
pi_ = x1' * p ;%互相关函数 
k = a + pi_ * x1 ; 
K = pi_'/k;%增益矢量
e(n)=d(n)-w'*x1;
w=w+K*conj(e(n));
y(n)=w'*x1;
end
subplot(4,1,3);
plot(t,x);grid;
axis([0 4 -2 2]);
ylabel('幅度');
xlabel('时间');
title('\it{加入噪声信号}');
subplot(4,1,4);
plot(t,y);grid;
ylabel('幅度');
xlabel('时间');
axis([0 4 -1 1]);
title('\it{自适应滤波器输出信号}');
