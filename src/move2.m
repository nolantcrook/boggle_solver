function [test] = move2(topleft)
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
test=1;
screenSize = get(0, 'screensize');
mouse.mouseMove(round(topleft(1)+(316-165)), round(screenSize(4)+(641-197)-topleft(2)));
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
pause(0.25);
end

