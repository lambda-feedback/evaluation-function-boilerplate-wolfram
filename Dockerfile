FROM ghcr.io/lambda-feedback/evaluation-function-base/wolfram:latest

COPY ./evaluation_function.wl /app/evaluation_function.wl

COPY ./mathpass /root/.WolframEngine/Licensing/mathpass

CMD [ "shimmy", "-c", "wolframscript", "-a", "/evaluation_function.wl" ]