function [x] = move(input,topleft,path,A)
import java.awt.Robot;
import java.awt.event.*;
flag=0;
global words_found
mouse = Robot;
[m,~]=size(words_found);
if m>1
for i=1:m-1
    test=cellstr(words_found(i,:));
    word=cellstr((diag(A([path(:,1)],[path(:,2)])))');
    flag=strcmp(test,word);
    if flag==1
        break
    end
end
end
if length(input)<6&&flag==0&&length(input)>1
screenSize = get(0, 'screensize');
for i=1:length(input)
    y=input{1,i}(1,1);
    x=input{1,i}(1,2);
    current_location=get(0, 'PointerLocation');
    xmin=0.04;
    xmax=0.08;
    %xmin=0.2;
    %xmax=0.3;
    n=20;
    wait=xmin+rand(1,n)*(xmax-xmin);
    
    mouse.mouseMove(round(topleft(1)+x), round(screenSize(4)+y-topleft(2)));
    if i==1
        pause(wait);
            mouse.mousePress(InputEvent.BUTTON1_MASK);
            %mouse.mouseRelease(InputEvent.BUTTON1_MASK);
    end
    pause(wait);
end
%mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);


end
end

