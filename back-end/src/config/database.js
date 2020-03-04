module.exports = {
    dialect: 'postgres',
    host: 'localhost',
    port: 5433,
    username: 'postgres',
    password: 'postgres',
    database: 'main',
    define: {
        timestamps: true,
        underscored: true,
        underscoredAll: true,
    },
};