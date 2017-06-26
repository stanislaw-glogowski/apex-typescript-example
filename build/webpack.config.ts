import { resolve } from "path";
import * as Webpack from "webpack";
import { CheckerPlugin } from "awesome-typescript-loader";

export = {
  entry: "./index.ts",
  target: "node",
  output: {
    path: resolve(process.cwd(), "dist"),
    filename: "index.js",
    libraryTarget: "commonjs2",
  },
  resolve: {
    extensions: [".ts", ".js"],
  },
  externals: ["aws-sdk"],
  module: {
    rules: [
      {
        test: /\.ts$/,
        loader: "awesome-typescript-loader",
        exclude: [/node_modules/],
        options: {
          configFileName: resolve(__dirname, "../tsconfig.json"),
        },
      },
    ],
  },
  plugins: [
    new CheckerPlugin(),
    new Webpack.NoEmitOnErrorsPlugin(),
    new Webpack.LoaderOptionsPlugin({
      minimize: true,
      debug: false,
    }),
  ],
};
