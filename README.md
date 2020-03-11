# ETL-Patterns

# Implementing Change Capture 
We have several data marts that need to get updated with the daily changes from our main business application database. We have been following the truncate and load pattern where we essentially retrieve every row from the source system database every day. We have built our own custom business logic to figure out what changed, and perform the approprite updates in our data marts. We would like to transform our process into one that works likes the built-in Change Tracking in SQL Server. We want to query the main business application database and just get the rows that have changed. The problem is that all we have to work with is a daily database snapshot. Can you provide a solution?
