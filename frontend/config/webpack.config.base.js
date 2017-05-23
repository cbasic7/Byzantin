const webpack = require('webpack');
const path = require('path');

let srcPath = path.resolve(__dirname, '../src');
let publicPath = path.resolve(__dirname, '../dist');

let baseConfig = {
	entry: {
		index: [path.resolve(srcPath, 'index.js')],
		vendor: ['react', 'react-dom']
	},
	output: {
		publicPath: publicPath,
		path: path.resolve(publicPath, 'js'),
		filename: '[name].bundle.js'
	},
	module: {
		rules: [
			{
				exclude: /node_modules/,
				test: /\.(js|jsx)$/,
				loader: 'babel-loader'
			},
			{
				exclude: /node_modules/,
				test: /\.sass$/,
				loader: 'style-loader!css-loader!sass-loader'
			},
			{
				exclude: /node_modules/,
				test: /\.less$/,
				loader: 'style-loader!css-loader!less-loader'
			},
			{
				exclude: /node_modules/,
				test: /\.css$/,
				loader: "style-loader!css-loader"
			},
			{
				exclude: /node_modules/,
				test: /\.(png|jpg|jpeg|gif)(\?\S*)?$/,
				loader: 'file-loader?name=[name].[ext]&publicPath=./img/&outputPath=../img/'
			},
			{
				exclude: /node_modules/,
				test: /\.(svg|woff|woff2|ttf|eot)(\?\S*)?$/,
				loader: 'file-loader?name=[name].[ext]&publicPath=./fonts/&outputPath=../fonts/'
			}
		]
	},
	resolve: {
		extensions: [".js", ".json", ".jsx", ".css"]
	},
	plugins: [
		new webpack.optimize.CommonsChunkPlugin({name: 'vendor', filename: 'vendor.bundle.js'}),
		new webpack.DefinePlugin({
			'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV)
		}),
		new webpack.ProvidePlugin({$: 'jquery', jQuery: 'jquery'})
	]
};

module.exports = baseConfig;
