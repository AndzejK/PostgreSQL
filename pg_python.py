import psycopg2 as pg2
# establishing connection to DB
est_conn=pg2.connect(database='dvdrental',user='postgres',password='hehe')
curr=est_conn.cursor()

curr.execute('SELECT * FROM payment')
first_row=curr.fetchone()
print(len(first_row))

# closing the connection
curr.close()
est_conn.close()