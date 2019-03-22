% Record your voice for 5 seconds.

i=1; %iterator variable

while i<=100 % Recording 100 samples for a single word 

recObj = audiorecorder; % Initializing recoder object

in = input('Press Enter when ready ...','s');

disp(i);

disp('Start')

recordblocking(recObj, 1.2); % Recording speech

disp('Stop');

y = getaudiodata(recObj); % Converting the recorded speech into array

d=fdesign.highpass('Fst,Fp,Ast,Ap',8700/16000,10000/16000,40,1);% Highpass filter to remove ambient noise 

hp=design(d); % Creating filter object

x=filter(hp,y); % Applying the filter

plot(x);

%x1=wavread('noise.wav');

%y=y-x1;

%subplot(1,2,2),plot(x1),title('Noise');

%x1=external_filter(y);

%plot(x1);

fn=strcat('stop',int2str(i),'.wav'); % Creating file name to save data

cd('/Voice Templates') % Changing directory

audiowrite(char(fn),x,8000); % Saving recorded data to .wav file

i=i+1; % incrementing iterator

end