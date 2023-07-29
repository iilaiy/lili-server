const mysql = require('mysql')  //引入mysql

const pool = mysql.createPool(require('../config/db'))

function query(sql,values){
    
    return new Promise((resolve,reject) => {
    
        pool.getConnection((err,connection) => {
    
            if(err) reject(err)
        
            connection.query(sql,values,(err,rows) => {
            
                if(err) reject(err)
                
                resolve(rows)
                
                connection.release() //释放连接，否则会卡顿
            
            })
    
        })
    
    })
    
}
    
module.exports = query  //抛出