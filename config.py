class Config:
    SECRET_KEY = 'B!1w8NAt1T^%kvhUI*S^'

class DevelopmentConfig(Config):    
    UPLOAD_FOLDER = './app/static/uploads'
    MAX_CONTENT_PATH = 16 * 1024 * 1024
    
    MYSQL_HOST = 'forlogdb.mysql.database.azure.com'
    MYSQL_USER = 'forlogroot@forlogdb'
    MYSQL_PASSWORD = 'Juan4544642'
    MYSQL_DB = 'forlogdb'
    


config = {
    'configurations': DevelopmentConfig
}
