res = dlmread('demo_data/PETS09-S2L1_gt.txt');
gt  = dlmread('demo_data/PETS09-S2L1_res.txt');

% Convert data format to:
% ID, frame, left, top, width, height, worldX, worldY
resMat = res(:,[2 1 3 4 5 6 7 8]);
gtMat  = gt(:,[2 1 3 4 5 6 7 8]);
world  = false;

% Compute ID measures over different thresholds
ious = [0.1:0.05:1];

for k = 1:length(ious)
    [IDP(k), IDR(k), IDF1(k)] = IDmeasures(resMat, gtMat, ious(k), world);
end

% Plot results
figure;
plot(ious,IDP); hold on;
plot(ious,IDR); hold on;
plot(ious,IDF1); hold off;
xlabel('IOU Threshold');
ylim([0 1]);
ylabel('Score');
legend('ID Precision','ID Recall', 'ID F1');