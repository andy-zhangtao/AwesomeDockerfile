var path = require('path'),
    config;

config = {
    production: {
        url: process.env.URL,
        mail: {},
        database: {
            client: 'mysql',
            connection: {
		        host     : process.env.DB_HOST,
                user     : process.env.DB_USER,
                password : process.env.DB_PASS,
                database : process.env.DB_NAME,
                charset  : 'utf8'
            },
            debug: false
        },

        server: {
            host: '0.0.0.0',
            port: '2368'
        },

	paths: {
            contentPath: path.join(process.env.GHOST_CONTENT, '/')
        }
    }
};

module.exports = config;