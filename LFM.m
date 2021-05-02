fc = 5e6; %��ƵƵ�ʼ��ز�Ƶ��
bw = 8e5; %��Ƶ�źŴ���
tc = 5e-6; %��Ƶ�ź�ʱ��
K = bw/tc; %��Ƶ�ź�б��
Phf = 0; %��Ƶ�źų���λ
Afm = 1; %��Ƶ�ź����
Afb = tc; %�����ź����
f0 = 1e3; %�����ź�Ƶ��
fs = 35e6; %����Ƶ��
Sample_Cnt = 10e6;%��������
fft_ppi = fs/Sample_Cnt; %Ƶ�ʷֱ���

t1 = linspace(0, 1/f0, Sample_Cnt);

lfm1 = Afm*cos((2*pi*fc*Afb*sin(2*pi*f0*t1))+pi*(K)*(Afb*sin(2*pi*f0*t1)).^2+Phf); %��Ƶ�ź�


plot(t1.*1e3, lfm1); axis([0 1e3/f0 -1.3 1.3]);
xlabel('ʱ�� / us'); ylabel('Vpp / V');