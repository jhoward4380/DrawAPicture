function [] = DrawAPicture ()
    close all;
    global gui;
    gui.fig = figure();
    gui.p = plot(0,0)
    gui.p.Parent.Position = [0.2 0.25 0.7 0.7];
 
    gui.buttonGroup = uibuttongroup('visible','on','unit','normalized','position',[0 0.4 .15 .25],'selectionchangedfcn',{@radioSelect});
    gui.r1 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .8 1 .2], 'handlevisibility','off','string','Stars');
    gui.r2 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .5 1 .2], 'handlevisibility','off','string','Circles');
    gui.r3 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .2 1 .2], 'handlevisibility','off','string','Dots');
 
    gui.scrollBar = uicontrol('style','slider','units','normalized','position',[0.2 0.1 0.6 0.05],'value',1,'min',1,'max',12,'sliderstep',[1/4 1/4],'callback',{@scrollBbar});
 
    gui.animateButton = uicontrol('style','pushbutton','unit','normalized','position',[0.05 0.05 0.1 0.1],'string','Animate','callback',{animate});
 
 
 
x = randi([1 3],1,1)
    if x == 1
    base_x = [6 8 8 6 6 8 6 8]  
    base_y = [1 1 3 3 1 3 3 1]
    roof_x = [6 7 8 6]  
    roof_y = [3 4 3 3]
    disp('House!')
    
    elseif x == 2
    base_x = [6 7 8 6 8 6]
    base_y = [1 4 1 3 3 1]
    disp('Star!')
    
    elseif x == 3
    base_x = [6.5 6 7 7 8 7.5 7 6.5 6 7 8 7 6] 
    base_y = [1   2 2 4 2  1  1  1  2 2 2 4 2]
    disp('Boat!')
    end
    
figure
hold on
plot(base_x, base_y,'-')
plot(roof_x, roof_y,'-')
axis([5 9 0 5])
end
 
function [] = animate(~,~)
    global gui;
    for i = 1:4
        gui.scrollBar.Value = i
        scrollbar();
        pause(1);
    end
end
 
function [] = scrollbar(~,~)
    global gui;
    gui.scollBar.Value = round(gui.scrollBar.Value);
    type = gui.buttonGroup.SelectObject.String;
    plotSelectedPicture(type);
    
end
 
function [] = radioSelect(~,~)
    global gui;
    type = gui.buttonGroup.SelectedObject.String;
end
 
function [] = plotSelectedPicture(type) 
    global gui;
    data = readmatrix('pictures.csv');
end

    