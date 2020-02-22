clear;

% LTC7800 parameters
vref = 0.8;% V
RDR = 2;% Ohm
ton_min = 45e-9;
V_SENSE = 36e-3;

% EPC2030 parameters
RDSon = 2.4e-3;% mOhm 
s = 0.005*RDSon;% Ohm/deg
Cgd = 62e-12;% pF
Vplateu = 2.5;% V
Vintvcc = 5.1;% V

% Inductor parameters
L = 0.47e-6;% uH
DCR = 0.900e-3;% mOhm

% Design parameters
vout = 6;% V
Io = 25;% A
vin_min = 2*3;% V
vin_max = 2*4.2;% V
dvout = vout*0.05;% 5 percent
t_SS = 10e-3;% ms

ESR = 1e-3;

RB_run = 51000;
RA = 10e3;% KOhm


f = 1.44e6;% MHz


%% Calculated component values

% Current ripple
dI = 1/(f*L)*vout*(1-vout/vin_max);

% CIN rms current
I_CIN_rms = Io/vin_max*sqrt(vout*(vin_max-vout))

% Output capacitance
C_OUT = 1/(dvout/dI - ESR)/(8*f)

% Voltage divider
RB = (vout/vref - 1)*RA

% UVLO
V_UVL_falling = 1.16*(1 + RB_run/RA) - 7e-6*RB_run
V_UVL_rising = 1.21*(1 + RB_run/RA) - 7e-6*RB_run

% Soft-start capacitor
C_SS = t_SS*10e-6/0.8

% Short-circuit current
I_LIM = V_SENSE/DCR; 

dI_L_sc = ton_min*vin_max/L
I_sc = 0.45*I_LIM - 0.5*dI_L_sc

%% Current DCR sense
Vsense = 30e-3;
Rsense = Vsense/(Io+dI/2)
RD = Rsense/(DCR*(1 + (0.4e-2)*100))
C1 = 470e-9;
R1_R2 = L/(DCR*C1);
R1 = R1_R2/RD
R2 = R1*RD/(1-RD)
PR1 = (vin_max - vout)*vout/R1

%% Power loss

D = vout/vin_max;
SD = (vin_max-vout)/vin_max;

P_MAIN = (vout/vin_max)*(Io^2)*(1+s)*RDSon + (vin_max^2)*(Io/2)*RDR*Cgd*(1/(Vintvcc-Vplateu)+1/Vplateu)*f
P_SYNC = (vin_max-vout)/vin_max*(Io^2)*(1+s)*RDSon

    