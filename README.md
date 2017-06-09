# Apex TypeScript Example

## Setup

To run the example first setup your [AWS credentials](http://apex.run/#aws-credentials).
You also need to install [apex](http://apex.run/#installation) and [Terraform](https://www.terraform.io/intro/getting-started/install.html) cli.

## Installation

```bash
$ git clone https://github.com/stanislaw-glogowski/apex-typescript-example.git && cd ./apex-typescript-example
$ npm install
$ apex infra apply # creating lambda role
$ apex deploy
$ apex infra apply # creating api gateway
```

## Invoke functions
You can test your lambda function using [apex cli](http://apex.run/#invoking-functions)

```bash
$ apex invoke lambda_with_api_gateway_event < ./events/api-gateway.json
```

output:
```json
{
  "statusCode": 200,
  "headers": {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": true,
    "Content-Type": "application/json"
  },
  "body": "{\"method\":\"GET\"}"
}
```

In addition, `lambda_with_api_gateway_event` is integrated with [API Gateway](https://aws.amazon.com/api-gateway/) in infrastructure configuration.
After successful installation there should be `apex-typescript-example_api_gateway` api, available from [AWS console](https://console.aws.amazon.com).

## Destroying
```bash
$ apex infra destroy # destroying infrastructure
$ apex infra apply   # creating lambda role (needed for deleting lambdas)
$ apex delete        # deleting lambdas
$ apex infra destroy # final infrastructure destroying
```

## License

The MIT License