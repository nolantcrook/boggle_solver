clc
clear all
close all
prompt="enter letters";
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
global data_cell
global words_found
words_found=[];
[data]= dict();
data_cell{1}=data;
path_cell=[];
wait_input=120;
rotate=0;
letters = upper(input(prompt,'s'));
time=100;
tic;
%letters=upper("iatrxrenehoncsge");
characters=convertStringsToChars(letters);
path=zeros(1,2);
%load the characters into an array and create an array to mark which are
%used
[A,Alog] = fill_matrices(characters,rotate);
"enter top left"
pause();
topleft=get(0,'PointerLocation');
"got top left"
"enter top right"
pause();
topright=get(0,'PointerLocation');
"got top right"
"enter bottom left"
pause();
bottomleft=get(0,'PointerLocation');
"got bottom left"
"enter bottom right"
pause();
bottomright=get(0,'PointerLocation');
"got bottom right"
%y,x
box=[mean(topright(1)-topleft(1),bottomright(1)-bottomleft(1)),mean(topright(2)-bottomright(2),topleft(2)-bottomleft(2))];
path2=[topleft;topright;bottomleft;bottomright];
direction=1;
index=1;
bool=false;

while toc<time
for aa=1:4
    for bb=1:4
        wait=wait_input;
        counter=1;
        loop=true;
        moved=tic;
        %%this is for beginning each new letter, this should only run 16 times
        current_start_point=A(aa,bb);%find the letter that's the current start point
        Alog(aa,bb)=0;%disqualify the letter from searching
        if index==1
            next_letter=current_start_point;
            path=[aa,bb];
        end
        while(loop==true)
            %%%%%%%%%%%%%%%create a loop here for continuining on
            timeelap=toc;
            sincelastmove=toc(moved);
            
            if timeelap>time
                loop=false;
            end
            if direction ==1
                [~] = reduce_dict(next_letter,index);%reduce the possible words in the dictionary that start with next letter
            end
            [bool] = find_complete_word(index,path,A);%find if the current list contains a word
            if bool==true&&index>1%if there is a "0" in the next index, then trace out the word
                [locations] = find_locations(box,path);
                move(locations,topleft,path,A);
                moved=tic;
            end
            
            [f] = common_letters(index);%find the most common next letters from remaining words in dictionary
            [letters,reference,Alog] = surrounding_letters(A,path(index,1),path(index,2),Alog,A,path_cell,path);%find the surrounding letters that haven't been used and their indices
            [next_letter,Alog,newrow,newcol,found]=find_next_letter(letters,f,Alog,reference,path_cell,path,A);%find the first most common letter in the surrounding letters
            if counter>wait
                path=[];
            end
            if found==1
                direction=1;
                path=[path;[newrow,newcol]];
                %append path to path variable
                index=index+1;
                path_cell{2,counter}=direction;
                path_cell{1,counter}=path;
            else
                direction=0;
                path_cell{2,counter}=direction;
                path_cell{1,counter}=path;
                path=path(1:end-1,:);
                index=index-1;
            end
            
            if sincelastmove>0.1
                direction=0;
                path_cell{2,counter}=direction;
                path_cell{1,counter}=path;
                path=path(1:end-1,:);
                index=index-1;
            elseif sincelastmove>0.15
                loop=false;
                break;
            end
            
            if ~isempty(path)&&counter<wait
                Alog=Alog_rewrite(path_cell,counter);
                counter=counter+1;
            elseif isempty(path)||counter>wait
                loop=false;
                path_cell=[];
                path=[];
                direction=1;
                [A,Alog] = fill_matrices(characters,rotate);
                index=1;
                break
            end
        end
        if timeelap>time
            a=4;
            b=4;
            break
            
        end
    end
end
[~]=move2(topleft);
rotate=rotate+1;
A=rot90(A,3);
wait=wait+25;
end




