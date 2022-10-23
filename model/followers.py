from flask import session
from model.funcs import cipherAbb


class Followers():
    def __init__(self) -> None:
        pass    
    
    def follow(self, id_following, conn):
        try:
            cursor = conn.connection.cursor()
            cursor.execute("INSERT INTO followers(followed, follower)VALUES(%s,%s)",(id_following, session['id_user']))
            conn.connection.commit()
            return True
        except:
            return False
        
    def unfollow(self, followed, conn):
        try:
            cursor = conn.connection.cursor()
            cursor.execute("DELETE FROM followers WHERE followed = %s and follower = %s ",(followed, session['id_user']))
            conn.connection.commit()
            return True
        except:
            return False
            
    def followers(self,id_user, conn):
        try:
            cursor = conn.connection.cursor()
            cursor.execute("SELECT COUNT(*)AS followers FROM followers WHERE followed = %s",(id_user,))  
            followers = cursor.fetchone()        
            return cipherAbb(followers[0])
        except:
            return 0
        
    def following(self,id_user, conn):
        try:
            cursor = conn.connection.cursor()
            cursor.execute("SELECT COUNT(*)AS following FROM followers WHERE follower = %s",(id_user,))  
            following = cursor.fetchone()        
            return cipherAbb(following[0])
        except:
            return 0
        
    def isFollowing(self,followed, follower, conn):
        try:
            cursor = conn.connection.cursor()
            cursor.execute("SELECT COUNT(*)AS follow FROM followers WHERE followed = %s AND follower = %s",(followed, follower))  
            count = cursor.fetchone() 
            return True if count[0] > 0 else False    
        except:
            return False
        
        
            