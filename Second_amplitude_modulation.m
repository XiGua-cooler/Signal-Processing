f1 = 1e3; A1 = 1; B1 = 1.5; %基带信号
f2 = 1e6; A2 = 1; B2 = 0; %一次载波
f3 = 10e6; A3 = 0.5; B3 = 0; %二次载波
fft_fs = 100e6;
Sample_Cnt = 100e5;
fft_ppi = fft_fs/Sample_Cnt; %频率分辨率
dt = 1/fft_fs;
t = 0 : dt : dt*(Sample_Cnt-1);


sin_f1 = A1*sin(2*pi*f1*t)+B1;
sin_f2 = A2*sin(2*pi*f2*t)+B2;
sin_f3 = A3*sin(2*pi*f3*t)+B3;
am1 = sin_f1 .* sin_f2 .* sin_f3;

fft_am1 = fft(am1, Sample_Cnt);
am1_P2 = abs(fft_am1/Sample_Cnt);
am1_P1 = am1_P2(1:Sample_Cnt/2+1);
am1_P1(2:end-1) = 2*am1_P1(2:end-1);

fs_P1 = fft_fs*(0:(Sample_Cnt/2))/Sample_Cnt;

subplot(3,1,1); plot(fs_P1 , am1_P1); axis([0.9e7-2e3 0.9e7+2e3 -0.1 1.6]); xlabel('频率 / Hz'); ylabel('Vpp / V');
subplot(3,1,2); plot(fs_P1 , am1_P1); axis([f3-2e6 f3+2e6 -0.1 1.6]); xlabel('频率 / Hz'); ylabel('Vpp / V');
subplot(3,1,3); plot(fs_P1 , am1_P1); axis([1.1e7-2e3 1.1e7+2e3 -0.1 1.6]); xlabel('频率 / Hz'); ylabel('Vpp / V');













