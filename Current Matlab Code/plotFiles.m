function [maxTime ] = plotFiles( names, i )
    figure(i)
    maxR = 0;
    maxD = 0;
    maxT = 0;
    maxTime = 0;
    i=1;
%     for i = 1:6
        [ resource, temporal, decision, tasks, time ] = plotWorkloads( names(i,:) );
        resource = resource(:,1) + resource(:,2) + resource(:,3) + resource(:,4);
        temporal = temporal(:,1) + temporal(:,2) + temporal(:,3) + temporal(:,4);
        decision = decision(:,1) + decision(:,2) + decision(:,3) + decision(:,4);
        maxR = max(maxR, max(resource(:)));
        maxD = max(maxD, max(decision(:)));
        maxT = max(maxT, max(temporal(:)));
        maxTime = max(maxTime,time(end));

%     end
    maxTotal = max(maxR,max(maxD,maxT));
i=1;
%     for i = 1:6
        [ resource, temporal, decision, tasks, time, timeT, timeR, timeD ] = plotWorkloads( names(i,:) );
%         subplot(3,2,i)
decision;
        hold all
        resource = resource(:,1) + resource(:,2) + resource(:,3)+ resource(:,4);
        temporal = temporal(:,1) + temporal(:,2) + temporal(:,3) + temporal(:,4);
        decision = decision(:,1) + decision(:,2) + decision(:,3) + decision(:,4);

%         maxsize = size(decision);
%         new_decision = [];
%         new_timeD = [];
%         for j = 1:maxsize
%             if decision(j) ~= 0
%                 new_decision(end+1) = decision(j);
%                 new_timeD(end+1) = timeD(j);
%             end
%         end
%         decision = new_decision;
%         timeD = new_timeD;
        maxsize = size(resource);
        new_resource = [];
        new_timeR = [];
        for j = 1:maxsize
            if resource(j) ~= 0
                new_resource(end+1) = resource(j);
                new_timeR(end+1) = timeR(j);
            end
        end
        timeR = new_timeR;
        resource = new_resource;
        maxsize = size(temporal)-1;
        new_temporal = [];

        grid on
        resource = resource./maxR;
        temporal = temporal./maxT;
        decision = decision./maxD;
        plot(timeT,temporal,'g-');
        plot(timeR,resource,'b-');
        plot(timeD,decision,'r-');
        axis([0 maxTime 0 max(temporal)]);
%          legend('Temporal','Resource','Decision');
        name = names(i,:);
        name = strrep(name,'H','Highest ');
        name = strrep(name,'L','Lowest ');
        name = strrep(name,'C','Cumulative ');
        
        name = strrep(name,'R','Resource ');
        name = strrep(name,'T','Temporal ');
        name = strrep(name,'D','Decision ');
        name = strrep(name,'W','Workload');
%         title(name);
        hold off
%     end
end

