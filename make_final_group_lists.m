
% load lists from Michelle
load('hc_EC_DVS.txt');
load('ob_EC_DVS.txt');

% load sublist from Poldrack 2017 (these have been analyzed/downloaded)
poldrack = load('sublist');

% load other subs who have been analyzed/downloaded)
othersubs = load('Michelle_AllSubs_n146.txt');

% put them together and remove duplicates
oldsubs = unique([poldrack; othersubs]);

% get unique subjects
ob_diff = setdiff(ob_EC_DVS,oldsubs);

% reuse HC subjects and add more to get max n
hc_diff = setdiff(hc_EC_DVS,oldsubs);
hc_int = intersect(hc_EC_DVS,oldsubs);
max_group = length(ob_EC_DVS);
n_needed = max_group - length(hc_int);
extra_hc = randsample(hc_diff,n_needed);
hc_new = [hc_int; extra_hc];
dlmwrite('hc_selected.txt',sort(hc_new),'precision','%d')

% make list with all new/needed subs
dlmwrite('new_subs.txt',[ob_diff; extra_hc],'precision','%d')
