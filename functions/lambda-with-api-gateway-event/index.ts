import { createHttpLambda } from "../../app/helpers";

export default createHttpLambda(({req, res}) => {
  const path = [
    req.param("key1"),
    req.param("key2"),
    req.param("key3"),
  ];

  const query = [
    req.query("key1"),
    req.query("key2"),
    req.query("key3"),
  ];

  res.send({
    method: req.method,
    params: {
      path,
      query,
    },
  });
});
