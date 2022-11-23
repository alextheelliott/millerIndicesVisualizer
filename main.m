%% Main class
clear;

% Constants
tf = 2; fps = 30;
t = linspace(0,tf,fps*tf);

l = 1;

ang0 = [0 0 0];
ang1 = [0 0 pi];

%Objects
r = renderer;
r.angles = ang0;

path = r.genPath(ang0,ang1,fps*tf);

uc = unitCube;
uc = uc.setup(uc,l);

ax = unitAxes;
ax = ax.setup(ax,l);

%Miller Vectors and Miller Planes
mV = [];

mP(1) = unitPlane;
mP(1) = mP(1).setup(mP(1),l,[1,2,0],'red');

mP(2) = unitPlane;
mP(2) = mP(2).setup(mP(2),l,[-3,2,-1],'green');

mP(3) = unitPlane;
mP(3) = mP(3).setup(mP(3),l,[1,-1,0],'cyan');

mP(4) = unitPlane;
mP(4) = mP(4).setup(mP(4),l,[0,0,4],'magenta');

%Rendering
for i = 1:length(t)
    r = r.update(r,path,i);

    plot3(0,0,0,"k+"); hold on;

    %Render Scene
    r.renderFace(uc); 
    r.renderLine(ax);
    
    %Render Vectors
    for j = 1:length(mV)
        r.renderFace(mV(j))
    end

    %Render Planes
    for j = 1:length(mP)
        r.renderFace(mP(j))
    end

    xlim([-3*l/2, 3*l/2]),ylim([-3*l/2, 3*l/2]),zlim([-3*l/2, 3*l/2]);
    hold off,set(gcf,'Position',[100,100,600,600]);

    %Add frame to movie vector
    M(i) = getframe(gcf);
end

%Play
fig = figure;
set(fig,'Position',[200,200,600,600]);
movie(fig,M,-10,fps);

%writeAnimation(fig,'loop.gif','LoopCount',1);