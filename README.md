modified_query_profiler
=======================

Modified perl slow query log parser from http://www.retards.org/projects/mysql/ to log the statistics to a database

Improvements (at least for me they are improvements):
* Identify queries whose only difference is the number of inputs/parameters for "IN (x, y, z)" / "NOT IN (a, b, c)" clauses as the same query.
* Log statistics to the database for further profiling

How I normally use this:
* Create the database to log the statistics to.  (NOTE: the tables should be empty prior to running the perl script below)
* Set the long_query_time to zero to temporary log all queries
* Run perl query_profiler.pl <slow_query_log_file>
* Run the SQL in profile_queries.sql

Then load the created file to a spreadsheet.  This gives me a good profile of my queries and how many times they were run for less than a millisecond, between 1 and 5 milliseconds, etc.

NOTES AND DISCLAIMERS:
* Obviously there's a lot of improvements that can be done.
* Requires a lot of RAM if the slow query log is huge
* Use at your own risk, I won't be responsible for any untoward events related to using this script and described methods
