FROM ghcr.io/lambda-feedback/evaluation-function-base/wolfram:latest as base

# Copy the evaluation function to the app directory
COPY ./evaluation_function.wl /app/evaluation_function.wl

CMD [ "shimmy", "-c", "wolframscript", "-a", "/evaluation_function.wl" ]

# Final layer for public images, which does not contain the wolfram licence key.
FROM base as final-public

# Final layer for private images, which contains the wolfram licence key.
FROM base as final-private

# Copy the mathpass secret to the Wolfram Engine licensing directory
RUN --mount=type=secret,id=mathpass \
    cp /run/secrets/mathpass /root/.WolframEngine/Licensing/mathpass