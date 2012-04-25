select q.id, q.query_text, count(query_id), sum(query_time),
     sum(less_than_001)/count(query_id) * 100 as less_than_001,
     sum(less_than_005)/count(query_id) * 100 as less_than_005,
     sum(less_than_010)/count(query_id) * 100 as less_than_010,
     sum(less_than_030)/count(query_id) * 100 as less_than_030,
     sum(less_than_050)/count(query_id) * 100 as less_than_050,
     sum(less_than_075)/count(query_id) * 100 as less_than_075,
     sum(less_than_100)/count(query_id) * 100 as less_than_100,
     sum(less_than_300)/count(query_id) * 100 as less_than_300,
     sum(less_than_500)/count(query_id) * 100 as less_than_500,
     sum(less_than_750)/count(query_id) * 100 as less_than_750,
     sum(less_than_1000)/count(query_id) * 100 as less_than_1000,
     sum(less_than_1250)/count(query_id) * 100 as less_than_1250,
     sum(less_than_1500)/count(query_id) * 100 as less_than_1500,
     sum(less_than_1750)/count(query_id) * 100 as less_than_1750,
     sum(less_than_2000)/count(query_id) * 100 as less_than_2000,
     sum(more_than_2000)/count(query_id) * 100 as more_than_2000
     into outfile '/tmp/queries.txt'
from
(  select query_id, query_time, if(query_time<=0.001,1,0) as less_than_001,
    if(query_time>0.001 and query_time<0.005,1,0) as less_than_005,
    if(query_time>0.005 and query_time<0.01,1,0) as less_than_010,
    if(query_time>0.01 and query_time<0.03,1,0) as less_than_030,
    if(query_time>0.03 and query_time<0.05,1,0) as less_than_050,
    if(query_time>0.05 and query_time<0.075,1,0) as less_than_075,
    if(query_time>0.075 and query_time<0.1,1,0) as less_than_100,
    if(query_time>0.1 and query_time<0.3,1,0) as less_than_300,
    if(query_time>0.3 and query_time<0.5,1,0) as less_than_500,
    if(query_time>0.5 and query_time<0.75,1,0) as less_than_750,
    if(query_time>0.75 and query_time<1,1,0) as less_than_1000,
    if(query_time>1 and query_time<1.25,1,0) as less_than_1250,
    if(query_time>1.25 and query_time<1.5,1,0) as less_than_1500,
    if(query_time>1.5 and query_time<1.75,1,0) as less_than_1750,
    if(query_time>1.75 and query_time<2,1,0) as less_than_2000,
    if(query_time>2,1,0) as more_than_2000
  from query_statistics ) s  , queries q
where q.id=s.query_id;

