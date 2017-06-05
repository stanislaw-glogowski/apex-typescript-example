import { createLambda, http } from "apex-utils";

const createHttpHandler = http.buildHandlerCreator({
  formatters: [

    // adds CORS headers
    http.createCorsFormatter({
      credentials: true,
      origin: "*",
    }),

    // formats JSON
    http.jsonFormatter,
  ],
});

/**
 * creates http lambda
 * @param handler
 */
export const createHttpLambda = (handler) => createLambda(createHttpHandler(handler));
