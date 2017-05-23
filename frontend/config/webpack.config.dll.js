const webpack = require('webpack');
const path = require('path');

const publicPath = path.resolve(__dirname, '../../../public');

const lib = ['react', 'react-dom', 'antd'];

module.exports = {
    entry: {
        lib: lib
    },
    output: {
        path: path.resolve(publicPath, 'js'),
        filename: '[name].js',
        library: '[name]'
    },
    plugins: [
        new webpack.DllPlugin({
            path: 'manifest.json',
            name: '[name]',
            context: __dirname
        })
    ]
};
