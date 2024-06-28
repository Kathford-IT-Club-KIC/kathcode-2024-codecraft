class ApiError extends error {
  constructor(
    statuscode,
    message = "something went wrong",
    error = [],
    stack = ""
  ) {
    super(message); // Call the parent constructor with the message
    this.statusCode = statusCode;
    this.error = error;
    this.message = message;
    this.success = false;
    this.data = null;
    if (stack) {
      this.stack = stack;
    } else {
      Error.captureStackTrace(this, this.constructor);
    }
  }
}
export { ApiError };
