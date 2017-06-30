function [ fmatrix ] = makeSmallf( fdir, EPIDsf )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Gets the central axis mean and arranges it in a useful way for the next
% step.
fnames = dir([fdir '\l*']);
fnames2 = {fnames.name};
fnames2 = cell2mat(fnames2');
assignin('base','fnames',fnames)
assignin('base','fnames2',fnames2)
l_s = unique(str2num(fnames2(:,2:3))); %#ok<*ST2NM>
d_s = unique(str2num(fnames2(:,5:7)));

CAXepids = mean(mean(EPIDsf(189:196,253:260,:)));
CAXepids = squeeze(permute(CAXepids, [3 1 2]));
assignin('base','CAXepids2',CAXepids);
fmatrix = zeros(length(d_s),length(l_s));


% Builds the f matrix, which is the signal for a certain field size at a
% depth of zero divided by the signal at that same field size but with
% varying depth.



for i=1:length(d_s)
    for j=1:length(l_s)
        fmatrix(i,j)=CAXepids((length(d_s)-1)/2*length(l_s)+j)/CAXepids((i-1)*length(l_s)+j);
    end
end
end

