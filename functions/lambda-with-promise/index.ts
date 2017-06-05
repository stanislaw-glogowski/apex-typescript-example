import { createLambda } from "apex-utils";
import { Hello } from "../../app/models";

export default createLambda(() => {
  const hello = new Hello("from Model");
  return hello.asyncMessage;
});
