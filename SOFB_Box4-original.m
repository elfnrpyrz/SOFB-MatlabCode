%This script was written by Elif on 9/7/2019.

% It is for visualizing a second order low demand false belief task. 
% This is for condition Box, counterbalancing 4: MA - MS- BS - BA
%%
clc;
clear all;
close all;

%% Saving file names

% pictures numbered as the storyline
% pictures numbered as the storyline
sofb_ims={'1.png', '2.png', '3.png', '4B.png', '5B.png', '6B.png', '7B.png', '8B.png', '9B.png', '10B.png',...
    '11B.png', '12B.png', '13B.png', '14B.png', '15B.png', '16B.png', '17B.png', '18B.png', '19B.png', ...
    '20B.png', '21B.png', '22B.png','23.png', '24.png'};

% main story audios
sofb_aud={'1.m4a', '2.m4a', '3.m4a', '5.m4a', '8.m4a', '9.m4a',...
    '10B.m4a','11.m4a', '12.m4a', '13.m4a', '14B.m4a', '15.m4a', '16.m4a', '17.m4a', ...
    '18.m4a', '19B.m4a','21-22.m4a', '23.m4a', '24.m4a', '25B.m4a', '26.m4a', '27.m4a',...
    '28.m4a', '29.m4a','30.m4a', '31.m4a', '33.m4a', '34.m4a', '36.m4a'};

% question audios (warm-up, see, control, belief)
q_aud = {'4A.m4a', '4B.m4a', '6.m4a', '7.m4a', '20.m4a', '20B.m4a', '32A.m4a', '32B.m4a', '33.m4a', ...
    '33B.m4a', '35A.m4a', '35B.m4a', '37.m4a', '20BB.m4a', '37A.m4a', '37B.m4a'};

% feedback audios
f_aud ={'F1.m4a', 'F2.m4a', 'F3.m4a', 'F4.m4a', 'F5.m4a', 'F6.m4a', 'FF1.m4a', 'FF2.m4a', 'FF3.m4a', 'FF4.m4a', 'FF5.m4a', 'FF6.m4a'};

% some transition gap fillers between questions
gap_aud = {'G1.m4a', 'G2.m4a', 'G3.m4a','G4.m4a'};


%% Visualizing

keepgoing = 1;
while keepgoing ==1
    
    fighandle =figure('WindowState', 'fullscreen', ...
        'MenuBar', 'none', ...
        'ToolBar', 'none');
    
    fighandle;
    
    % Step 1- Sammy & Anne
    pic=imread(sofb_ims{1});
    imshow(pic,'InitialMagnification','fit');
    axis off
    pause;
    clf;
    
    % Step 2- Introducing kids
    vismystory(sofb_ims{1}, sofb_aud{1})
    
    %pause;
    clf;
    
    % Step 3- introduce Sammy
    vismystory(sofb_ims{2}, sofb_aud{2})
    
    %pause;
    clf;
    
    % Step 4- Introduce Anne
    vismystory(sofb_ims{3}, sofb_aud{3})
    
    %pause;
    clf;
    
    % Step 5- Ask Sammy
    vismystory(sofb_ims{1}, q_aud{1})
    
    %pause;
    
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct
        feeds(f_aud{1})
        
    elseif key == 'i' %if child answers incorrect
        feeds(f_aud{7})
        %pause;
        
        %Introduce Sammy again
        vismystory(sofb_ims{2}, sofb_aud{2})
        
        %pause;
        clf;
        
        %introduce Anne again
        vismystory(sofb_ims{3}, sofb_aud{3})
        
        %pause;
        clf;
        
        %Ask Sammy again
        vismystory(sofb_ims{1}, q_aud{1})
        
        %pause;
        clf;
        
        key = get(fighandle, 'CurrentKey');
        
        if key == 'c' %if child answers correct
            feeds(f_aud{1})
        end
    end
    
    axis off
    %pause;
    clf;
    
    % Step 6- Ask Anne
    vismystory(sofb_ims{1}, q_aud{2})
    
    %pause;
    
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct
        feeds(f_aud{1})
        
    elseif key == 'i' %if child answers incorrect
        feeds(f_aud{7})
        
        %pause;
        
        %Introduce Sammy again
        vismystory(sofb_ims{2}, sofb_aud{2})
        
        %pause;
        clf;
        
        %introduce Anne again
        vismystory(sofb_ims{3}, sofb_aud{3})
        
        %pause;
        clf;
        
        %Ask Anne again
        vismystory(sofb_ims{1}, q_aud{2})
        
        %pause;
        key = get(fighandle, 'CurrentKey');
        
        if key == 'c' %if child answers correct
            feeds(f_aud{1})
        end
        
        %axis off
        %pause;
        clf;
    end
    
    % Step 7- Room
    vismystory(sofb_ims{4}, sofb_aud{4})
    
    clf;
    
    %Do you know what that is?
    vismystory(sofb_ims{4},q_aud{3})
    
    %give feedback
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct
        feeds(f_aud{6})
    end
    
    clf;
    
    %Do you know what bunnies eat?
    vismystory(sofb_ims{4},q_aud{4})
    
    %give feedback
    
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct
        feeds(f_aud{1})
    end
    
    clf;
    
    % Step 8 Sammy needs to go
    vismystory(sofb_ims{4}, sofb_aud{5})
    
    clf;
    
    % Step 9 Sammy puts the bunny
    vismystory(sofb_ims{5}, sofb_aud{6})
    
    clf;
    
    % Step 10 ...into the basket
    vismystory(sofb_ims{6}, sofb_aud{7})
    
    clf;
    
    % Step 11 Sammy goes away to the kitchen
    
    vismystory(sofb_ims{7}, sofb_aud{8})
    
    clf;
    
    % Step 12 Bye Sammy!
    vismystory(sofb_ims{8}, sofb_aud{9})
    
    clf;
    
    % Step 13 Anne wants to play with the bunny
    vismystory(sofb_ims{9}, sofb_aud{10})
    
    clf;
    
    % Step 14 Anne goes over to the basket...
    vismystory(sofb_ims{10}, sofb_aud{11})
    
    clf;
    
    % Step 15 .. and takes the bunny out
    vismystory(sofb_ims{11}, sofb_aud{12})
    
    clf;
    
    % Step 16 but now Anne needs to do her homework
    vismystory(sofb_ims{12}, sofb_aud{13})
    
    clf;
    
    % Step 17 so look what Anne does
    vismystory(sofb_ims{13}, sofb_aud{14})
    
    clf;
    
    % Step 18 she puts the bunny...
    vismystory(sofb_ims{14}, sofb_aud{15})
    
    clf;
    
    % Step 19 ..into the box!
    vismystory(sofb_ims{15}, sofb_aud{16})
    
    clf;
    
    % Step 20 See Q Sammy
    vismystory(sofb_ims{15}, q_aud{5})
    
    
    %Give feedback
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct
        feeds(f_aud{2}) % no, that's right!
        feeds(f_aud{8}) % Sammy wasn't in the room, he can't see that.
        
    elseif key == 'i' % if incorrect
        feeds(f_aud{12}) % nooo
        feeds(f_aud{8}) % Sammy wasn't in the room right, he can't see that.
        
        %ask again
        feeds(q_aud{5}) %Did Sammy see that?
        
        %give feedback
        
        key = get(fighandle, 'CurrentKey');
        
        if key == 'c'
            feeds(f_aud{2})
            feeds(f_aud{8})
            
        elseif key == 'i'
            feeds(f_aud{12}) % nooo
            feeds(f_aud{8})
            
            %ask again
            feeds(q_aud{5})
            
            key = get(fighandle, 'CurrentKey');
            
            if key == 'c'
                feeds(f_aud{2})
                feeds(f_aud{8})
                
            elseif key == 'i'
                feeds(f_aud{12}) % nooo
                feeds(f_aud{8}) %FINAL feedback
                
            end
        end
    end
    
    clf;
    
    % Step 21 Anne goes away to her room
    vismystory(sofb_ims{16}, sofb_aud{17})
    
    clf;
    
    % Step 22 Bye Anne!
    vismystory(sofb_ims{17}, sofb_aud{18})
    
    clf;
    
    % Step 23 look what happens while the two kids are gone
    vismystory(sofb_ims{17}, sofb_aud{19})
    
    clf;
    
    % Step 24 bunny comes out of the box....
    vismystory(sofb_ims{18}, sofb_aud{20})
    
    clf;
    
    % Step 25 ....then she jumps away..
    vismystory(sofb_ims{19}, sofb_aud{21})
    
    clf;
    
    % Step 26 ... and goes outside...
    vismystory(sofb_ims{20}, sofb_aud{22})
    
    clf;
    
    %Step 27 ...through the flap
    vismystory(sofb_ims{21}, sofb_aud{23})
    
    clf;
    
    %Step 28 the bunny goes far far away, no one knows where she went.
    
    vismystory(sofb_ims{22}, sofb_aud{24})
    
    clf;
    
    % Step 29 Sammy- Anne See Q
    vismystory(sofb_ims{22}, q_aud{5})
    
    
    %Give feedback
    key = get(fighandle, 'CurrentKey');
    
    if key == 'c' %if child answers correct Sammy See
        
        feeds(f_aud{2})
        feeds(f_aud{8})
        
        % NOW; ask Anne
        %feeds(gap_aud{1}) % How about Anne...
        
        feeds(q_aud{6}) % How about Anne,Did Anne see that?
        
        key = get(fighandle, 'CurrentKey');
        
        if key == 'c' %if child answers correct Anne See
            feeds(f_aud{2}) % no, that's right
            feeds(f_aud{9}) % anne wasn't in the room, she can't see that
            
        elseif key =='i' %if incorrect Anne See
            
            feeds(f_aud{12}) % noo
            feeds(f_aud{9}) % anne wasn't in the room, she can't see that
            
            feeds(q_aud{14}) %ask again Anne
            
            key = get(fighandle, 'CurrentKey');
            
            if key == 'c' %if child answers correct Anne See
                feeds(f_aud{2})
                
            elseif key =='i' %if incorrect Anne See
                
                feeds(f_aud{12}) % nooo
                feeds(f_aud{9}) % Anne wasn't in the room, she can't see that
                
                %feeds(q_aud{6}) %ask again Anne
            end
        end
        
        
    elseif key == 'i' % if incorrect Sammy see
        feeds(f_aud{12}) % noo
        feeds(f_aud{8}) % Sammy wasn't in the room right, he can't see it.
        
        %ask again
        feeds(q_aud{5}) %Did Sammy see that?
        
        %give feedback
        
        key = get(fighandle, 'CurrentKey');
        
        if key == 'c'   % if correct Sammy
            feeds(f_aud{2})
            feeds(f_aud{8})
            
            feeds(q_aud{6}) % How about Anne,Did Anne see that?
            
            key = get(fighandle, 'CurrentKey');
            
            if key == 'c' %if child answers correct Anne See
                feeds(f_aud{2}) % no, that's right
                feeds(f_aud{9}) % anne wasn't in the room, she can't see that
                
            elseif key =='i' %if incorrect Anne See
                
                feeds(f_aud{12}) % noo
                feeds(f_aud{9}) % anne wasn't in the room, she can't see that
                
                feeds(q_aud{14}) %ask again Anne
                
                key = get(fighandle, 'CurrentKey');
                
                if key == 'c' %if child answers correct Anne See
                    feeds(f_aud{2})
                    
                elseif key =='i' %if incorrect Anne See
                    
                    feeds(f_aud{12}) % nooo
                    feeds(f_aud{9}) % Anne wasn't in the room, she can't see that
                    
                    %feeds(q_aud{6}) %ask again Anne
                end
            end
        end
    end
    
    clf;
    
    
    % Step 30 - I have a couple of Questions for you..
    
    vismystory(sofb_ims{22}, sofb_aud{25})
    
    % Step 32 - Anne Memory C
    
    feeds(sofb_aud{26}) % Do you remember...

    
    vismystory(sofb_ims{3}, q_aud{8}) % where did Anne put the bunny?
      
    pic=imread(sofb_ims{22});
    imshow(pic,'InitialMagnification','fit');
    axis off
    pause;
    
    % give feedback
    
    key = get(fighandle, 'CurrentKey');
    
    if key == 'r'
        vismystory(sofb_ims{3}, q_aud{8}) % Where did Anne put the bunny?
        clf;
        
        pic=imread(sofb_ims{22});
        imshow(pic,'InitialMagnification','fit');
        axis off
        pause;
        
        keyy = get(fighandle, 'CurrentKey');
        
        if keyy == 'c'
            
            feeds(f_aud{3}) % in the basket that's right
            
        elseif keyy == 'i'
            
            feeds(f_aud{11}) % let's listen to the story again
            continue
        end
        % continue
    elseif key == 'c'
        feeds(f_aud{3}) % in the basket, that's right
        
    elseif key == 'i'
        feeds(f_aud{11}) % let's listen to the story again
        continue;
    end
    
    clf;
    
    
    % Step 31 - Sammy Memory C
    vismystory(sofb_ims{2}, gap_aud{2}) %how about Sammy..
    
    vismystory(sofb_ims{22}, q_aud{7}) % Where did Sammy put the bunny?
    
    % give feedback
    
    key = get(fighandle, 'CurrentKey');
    
    if key == 'r'
        vismystory(sofb_ims{2}, q_aud{7}) % Where did Sammy put the bunny?
        clf;
        
        pic=imread(sofb_ims{22});
        imshow(pic,'InitialMagnification','fit');
        axis off
        pause;
        
        keyy = get(fighandle, 'CurrentKey');
        
        if keyy == 'c'
            
            feeds(f_aud{4}) % in the box that's right
            
        elseif keyy == 'i'
            
            feeds(f_aud{11}) % let's listen to the story again
            continue
        end
    % continue    
    elseif key == 'c'
        feeds(f_aud{4}) % in the box, that's right
        
    elseif key == 'i'
        feeds(f_aud{11}) % let's listen to the story again
        continue;
    end
   
    clf;
    
    % Step 33 - Reality Q
    
    vismystory(sofb_ims{22}, q_aud{9}) % Where is the bunny right now
    
    
    % Extra prompt, if needed
    key = get(fighandle, 'CurrentKey');
    
    if key == 'e'
        feeds(q_aud{10}) % What happened to the bunny?
    end
    
    key = get(fighandle, 'CurrentKey');
    
    if key =='i'
        feeds(f_aud{10}) % remember what happened to the bunny? she jumped away, right? and we don't know where she is
    elseif key =='c'
        feeds(f_aud{5}) % she went far away and we don't know where she is, that's right!
    end
    
    clf;
    
    % Step 34 I have just a few more questions for you
    vismystory(sofb_ims{22}, sofb_aud{28})
    
    % Step 35 Sammy 1st Order Belief
    
    vismystory(sofb_ims{2},gap_aud{4}) % When Sammy comes back....
    vismystory(sofb_ims{22}, q_aud{11}) % Where will Sammy look for the bunny?
    
    % repeat Step 35 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{2},gap_aud{4}) % When Sammy comes back....
        vismystory(sofb_ims{22}, q_aud{11}) % Where will Sammy look for the bunny? 
    end
    
    % repeat Step 35 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{2},gap_aud{4}) % When Sammy comes back....
        vismystory(sofb_ims{22}, q_aud{11}) % Where will Sammy look for the bunny? 
    end
    
    
    % Step 36 Anne 1st Order Belief
    
    vismystory(sofb_ims{3},gap_aud{1}) % how about Anne
    vismystory(sofb_ims{22}, q_aud{12}) % Where will Anne look for the bunny?
    
    clf;
    
    % repeat Step 36 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{3},gap_aud{1}) % how about Anne
        vismystory(sofb_ims{22}, q_aud{12}) % Where will Anne look for the bunny?
    end
    
    % repeat Step 36 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{3},gap_aud{1}) % how about Anne
        vismystory(sofb_ims{22}, q_aud{12}) % Where will Anne look for the bunny?
    end
    
   % Step 37 2nd Order
    
    vismystory(sofb_ims{22}, sofb_aud{29}) % i have one last Question for you
    
    vismystory(sofb_ims{23}, q_aud{15}) % where does Anne think that...
    vismystory(sofb_ims{24}, q_aud{16}) % .. Sammy will look for the bunny?
   
    pic=imread(sofb_ims{22});
    imshow(pic,'InitialMagnification','fit');
    axis off
    pause;
    
    clf;
    
    % repeat Step 37 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{22}, sofb_aud{29}) % i have one last Question for you
        
        vismystory(sofb_ims{23}, q_aud{15}) % where does Anne think that...
        vismystory(sofb_ims{24}, q_aud{16}) % .. Sammy will look for the bunny?
        
        pic=imread(sofb_ims{22});
        imshow(pic,'InitialMagnification','fit');
        axis off
        pause;
        
        clf;
    end
    
    % repeat Step 37 if needed
    key = get(fighandle, 'CurrentKey');
    if key== 'r'
        vismystory(sofb_ims{22}, sofb_aud{29}) % i have one last Question for you
        
        vismystory(sofb_ims{23}, q_aud{15}) % where does Anne think that...
        vismystory(sofb_ims{24}, q_aud{16}) % .. Sammy will look for the bunny?
        
        pic=imread(sofb_ims{22});
        imshow(pic,'InitialMagnification','fit');
        axis off
        pause;
        
        clf;
    end
    keepgoing = 0;
end
%%

% End of the script.


    




