function vismystory(pictoread, soundtoplay)
% this function gets pictures and sounds to narrate a TOM story.

pic=imread(pictoread);
imshow(pic,'InitialMagnification','fit');
[YY, FFss] = audioread(soundtoplay);
sound = audioplayer(YY, FFss);
play(sound);
pause;

end