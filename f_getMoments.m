function X = f_getMoments(filedirname)
% X refers to moments of rainfall amount
% mean, variance, 10:90 percentile
%filedirname='D:\GHCN-Daily\USC00188380.csv';
L=365*15; % 15-yr windows
pThres=1; % 0.1 mm rain (zip file unit)

TB = readtable(filedirname,Delimiter=",");
varNm = TB.Properties.VariableNames;
% if no Data or no PRCP records, return
if ~any(ismember('DATE',varNm)) || ~any(ismember('PRCP',varNm))
    X=nan(1,11);
    return
end

tm=datenum(TB.DATE);

% if (mt(end)-mt(1))<20*365
%     continue
% end

pr=TB.PRCP;
pra=TB.PRCP_ATTRIBUTES;
% lat=TB.LATITUDE;
% lon=TB.LONGITUDE;

inx=false(size(tm));
% inx false is bad/nan
if iscell(pra)
    for ii=1:length(pra)
        if contains(pra{ii},',,') % pass quality control
            inx(ii)=true;
        end
    end
else
    inx=false(size(inx)); % no quality control information
end
pr(~inx)=nan;

% mt, pr, ta window------------------------------------
t1=tm(1);
t2=tm(end);
N=ceil( (t2-t1)/L );
X=nan(N,11); % mean, variance, 10:90 percentiles of amount

for ii=1:N
    % rainfall
    idx= tm>=t1+(ii-1)*L & tm<t1+ii*L;
    prx=pr(idx);
    if sum(~isnan(prx))/L < 0.9 % not many valid rainfall records
        continue
    end
    % enough records for this site
    r=prx(prx>pThres);
    X(ii,1)=nanmean(r);
    X(ii,2)=nanstd(r);
    X(ii,3:11)=prctile(r,10:10:90);
    
end


end