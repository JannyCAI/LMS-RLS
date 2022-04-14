%LMS算法程序
   
 clear
    N=2000;Fs=500
    n=0:N-1;t=n/Fs;
    s=5*sin(2*pi*t);%标准正弦信号
    xn=randn(1,length(t));%与时间t等长随机信号
    x=s+xn;%加噪信号
    w=[0,0];%初始2阶加权系数
    u=0.00026;%最佳参数
    for i=1:N-1;%自适应算法
    y(i+1)=xn(i:i+1)*w';
    e(i+1)=x(i+1)-y(i+1);
    w=w+2*u*e(i+1)*xn(i:i+1);
    end;
    %画图程序
    subplot(4,1,1)
    plot(t,s);
    title('输入周期信号');
    xlabel('t');
    ylabel('s(t)');
    subplot(4,1,2)
    plot(t,xn);
    title('噪声信号');
    xlabel('t');
    ylabel('xn(t)');
    subplot(4,1,3)
    plot(t,x);
    title('加噪信号');
    xlabel('t');
    ylabel('x(t)');
    subplot(4,1,4)
    plot(t,e);
    title('自适应滤波器输出结果');
    xlabel('t');
    ylabel('e(t)');

