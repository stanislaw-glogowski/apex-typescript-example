import { createHttpLambda } from "../../app/helpers";

export default createHttpLambda(({req, res}) => {
  if (req.query("query") === "hello") {
    res.error(400, "Hello error!");
    return;
  }

  res.send({
    method: req.method,
    query: req.query("query"),
  });
});
