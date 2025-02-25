NoteC=noteX(0.7, 40, 2);
NoteE=noteX(0.5, 44, 2);
NoteG=noteX(0.5, 47, 2);
 
Ctriad_org = NoteC+NoteE+NoteG;
Ctriad = Ctriad_org./max(abs(Ctriad_org));
%sound(Ctriad,11025); 
audiowrite('Ctriad.wav', Ctriad,11025); %is audio clipping why?