import { createLambda } from "apex-utils";

export interface IEvent {
  message?: string;
}

export default createLambda(({event}) => {
  return (event as IEvent).message;
});
