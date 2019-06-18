/**
 * 根文件
 * node index.js - 启动HTTP服务
 */

var server = require('./Server/server.js');
var router = require('./Router/router.js');
var requestHandlers = require('./Handlers/requestHandlers');

//路由处理
var handlers = {};
handlers['/'] = requestHandlers.hello;
handlers['get'] = requestHandlers.get;

// 开启HTTP服务
server.start(router.route,handlers);
