res = dlmread('demo_data/PETS09-S2L1_gt.txt');
gt  = dlmread('demo_data/PETS09-S2L1_res.txt');

% Convert data format to:
% ID, frame, left, top, width, height, worldX, worldY
resMat = res(:,[2 1 3 4 5 6 7 8]);
gtMat  = gt(:,[2 1 3 4 5 6 7 8]);
world  = false;
iou_threshold    = 0.5;

[IDP, IDR, IDF1] = IDmeasures(resMat, gtMat, iou_threshold, world);

fprintf('Identification Precision: %f\n', IDP);
fprintf('Identification Recall   : %f\n', IDR);
fprintf('Identification F1       : %f\n', IDF1);


