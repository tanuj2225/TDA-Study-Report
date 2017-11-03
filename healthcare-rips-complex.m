%% This script demonstrates the use of plex on a simple "house" example - 
%% Section 5.1

clc; clear; close all;
import edu.stanford.math.plex4.*;

max_dimension = 3;
max_filtration_value = 2;
num_divisions = 1000;

% create the set of points
load hospital_data.mat
point_cloud = hospital_data;
size(point_cloud)


% create a Vietoris-Rips stream 
stream = api.Plex4.createVietorisRipsStream(point_cloud, max_dimension, max_filtration_value, num_divisions);

% get persistence algorithm over Z/2Z
persistence = api.Plex4.getModularSimplicialAlgorithm(max_dimension, 2);

% compute the intervals
intervals = persistence.computeIntervals(stream);

% create the barcode plots
options.filename = 'Recovery Time vs Detecting Time';
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension - 1;
plot_barcodes(intervals, options);

figure
scatter3(point_cloud(:,2), point_cloud(:,3), point_cloud(:,1),'.')
axis square
view(60,40)