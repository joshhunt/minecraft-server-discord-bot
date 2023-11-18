FROM node:20.9.0-alpine AS build

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app
COPY ./pnpm-lock.yaml  ./
RUN pnpm fetch

COPY ./package.json ./tsconfig.json  ./
ADD src ./src
RUN pnpm install --offline


RUN pnpm build

FROM node:20.9.0-alpine as app
COPY --from=build /app/out /app
WORKDIR /app
ENV PORT=80
CMD ["app.js"]



# WORKDIR /app/out
# CMD ["app.js"]