%% Add BioFormats 
addpath('../Utilities/src/MATLAB')
%folder = '/Users/baylieslab/Documents/Amelia/some czi/'
%folder = '/Volumes/baylieslab/Current Lab Members/Whitney/Rhabdomyosarcoma plate movies/17-06-28 final pi3k inhibitors/'
folder = '/Users/baylieslab/Documents/Amelia/edgarPseudoLever/16-06-23_plate-1_partial';
% folder = pwd();
%folder = uigetdir();
%disp(class(folder))
dlist = dir(fullfile(folder,'*.czi'));
%disp(dlist(1));
%for i = 1:size(dlist)
for i = 2:2

    
%% Get Images
%Name = fullfile(folder,dlist(i).name);
Name = fullfile(folder,dlist(i).name);
try

    [im,imd] =  MicroscopeData.Original.ReadData(folder,dlist(i).name);

    [cells] = segIms(im);

    [cells2,Edges] = getTracks(cells,size(im));

    DrawTracks(squeeze(im),cells2,Name);

    ExportTrackStats(cells2,size(im),Name)
    
catch
    disp("sdfadsf")
    continue
    
end


end 

dlist2 = dir(fullfile(folder,'Xls','*.txt'));

for i = 1:size(dlist2)
    Name = fullfile(dlist2(i).folder,dlist2(i).name)
    M = readtable(Name)
    
    xCoords = M.Mat1(5:end)
    yCoords = M.Mat2(5:end)
    
    temp = str2double(xCoords)
   
    
   
end


