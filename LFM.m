fc = 5e6; %中频频率既载波频率
bw = 8e5; %调频信号带宽
tc = 5e-6; %调频信号时宽
K = bw/tc; %调频信号斜率
Phf = 0; %调频信号初相位
Afm = 1; %调频信号振幅
Afb = tc; %基带信号振幅
f0 = 1e3; %基带信号频率
fs = 35e6; %采样频率
Sample_Cnt = 10e6;%采样点数
fft_ppi = fs/Sample_Cnt; %频率分辨率

t1 = linspace(0, 1/f0, Sample_Cnt);

lfm1 = Afm*cos((2*pi*fc*Afb*sin(2*pi*f0*t1))+pi*(K)*(Afb*sin(2*pi*f0*t1)).^2+Phf); %调频信号


plot(t1.*1e3, lfm1); axis([0 1e3/f0 -1.3 1.3]);
xlabel('时间 / us'); ylabel('Vpp / V');