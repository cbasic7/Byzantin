const webpack = require('webpack');
const path = require('path');
const merge = require('webpack-merge');
const baseConfig = require('./webpack.config.base');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');


module.exports = merge(baseConfig, {
    plugins: [
        new UglifyJSPlugin({
            compress: {
                warnings: false
            }
        })
    ]
});
