## LILISHIGUANG

### 服务启动

```
# 启动 mysql
# 新建 lilishiguang 数据库
# 导入 /database/lilishiguang.sql 文件

# 数据库配置文件 /config/db.js
{
    host: '127.0.0.1',			// 本机ip
    user: 'root',   			// mysql账号名
    password: 'root0315',  		// 密码
    database: 'lilishiguang', 	// 数据库名
    port: '3306' 				// 端口号
}

# 后端服务启动
npm start
```



### 前后端接口文档

前置URL: http://192.168.1.3:3000



#### 注册页

##### 1. 用户注册

地址：/signup/add

请求方式：POST

参数：

|   字段   |  类型  |  说明  | 必须 |
| :------: | :----: | :----: | :--: |
|   name   | string | 用户名 |  是  |
|   mail   | string |  邮箱  |  是  |
| password | string |  密码  |  是  |

返回值：

|  字段  |  类型  |     说明     | 必须 |
| :----: | :----: | :----------: | :--: |
| status |  int   | 返回的状态码 |  是  |
|  msg   | string |  返回的信息  |  是  |

示例：

```
{
    "status": 200,
    "msg": "注册成功！"
}
```



#### 登录页

##### 1. 用户登录

地址：/signin/match

请求方式：POST

参数：

|   字段   |  类型  | 说明 | 必须 |
| :------: | :----: | :--: | :--: |
|   mail   | string | 邮箱 |  是  |
| password | string | 密码 |  是  |

返回值：

|  字段  |  类型  |        说明        | 必须 |
| :----: | :----: | :----------------: | :--: |
| status |  int   |    返回的状态码    |  是  |
|  data  | object | 登陆账户的基本信息 |  否  |
| token  | string |   token身份认证    |  否  |
|  msg   | string |     返回的信息     |  否  |

示例：

```
{
    "status": 200,
    "data": {
        "id": 7090285809957339000,
        "name": "佳佳",
        "imgurl": "avatar_default.png"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NzA5MDI4NTgwOTk1NzMzOTAwMCwidGltZSI6IjIwMjMtMDctMjdUMjM6NTU6NDguODEzWiIsImlhdCI6MTY5MDUwMjE0OCwiZXhwIjoxNzAwODcwMTQ4fQ.9l6LVort0tKk_4-8ax21nVcyL5QTePgttGMZqnA5mC0"
}
```



#### 搜索页

##### 1. 搜索用户

地址：/search/user

请求方式：POST

参数：

| 字段 |  类型  |    说明     | 必须 |
| :--: | :----: | :---------: | :--: |
| data | string | 邮箱/用户名 |  是  |

返回值：

|  字段  |  类型  |         说明         | 必须 |
| :----: | :----: | :------------------: | :--: |
| status |  int   |     返回的状态码     |  是  |
|  data  | object | 查询到的用户基本信息 |  是  |

示例：

```
{
    "status": 200,
    "data": [
        {
            "user_id": 7090285809957339000,
            "name": "佳佳",
            "email": "226894038@qq.com",
            "gender": "asexual",
            "birth": null,
            "phone": null,
            "explain": null,
            "imgurl": "avatar_default.png",
            "register_time": "2023-07-26T16:00:00.000Z",
            "status": 0
        }
    ]
}
```

##### 2. 验证是否为好友

地址：/friend/verify

请求方式：POST

参数：

|   字段   |  类型  |      说明      | 必须 |
| :------: | :----: | :------------: | :--: |
| user_id  | string |     账户id     |  是  |
| fidArray | array  | 搜索的用户id组 |  是  |

返回值：

|  字段  |  类型  |        说明        | 必须 |
| :----: | :----: | :----------------: | :--: |
| status |  int   |    返回的状态码    |  是  |
|  data  | object | 为好友的用户信息组 |  是  |

示例：

```
{
    "status": 200,
    "data": [
        {
            "id": 1,
            "markname": "小黎",
            "user_id": 7090285809957339000,
            "friend_id": 7090803498295493000,
            "create_time": "2023-07-28T16:00:00.000Z",
            "status": 0
        }
    ]
}
```

##### 3. 搜索群

地址：/search/group

请求方式：POST

参数：

| 字段 |  类型  |    说明     | 必须 |
| :--: | :----: | :---------: | :--: |
| data | string | 群id/群名称 |  是  |

返回值：

|  字段  |  类型  |        说明        | 必须 |
| :----: | :----: | :----------------: | :--: |
| status |  int   |    返回的状态码    |  是  |
|  data  | object | 查询到的群基本信息 |  是  |

示例：

```
{
    "status": 200,
    "data": [
        {
            "group_id": 7090285809957339000,
            "user_id": 7090285809957339000,
            "name": "不知道",
            "imgurl": "group_default.png",
            "notice": "123",
            "create_time": "2023-07-28T16:00:00.000Z"
        }
    ]
}
```



#### 漏洞

1. 服务端没有对客户端传入的信息做合法验证
2. 前端 post 的用户密码没有加密（裸奔状态）
