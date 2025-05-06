FROM node:23-slim AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm --filter @demo-docker-deploy/backend run build
RUN pnpm --filter @demo-docker-deploy/frontend run build

FROM base AS backend
WORKDIR /usr/app
COPY --from=build /usr/src/app/apps/backend/build .
RUN pnpm i --prod
EXPOSE 3333
CMD ["pnpm", "start"]

FROM base AS frontend
WORKDIR /usr/app
COPY --from=build /usr/src/app/apps/frontend/.output .
EXPOSE 3000
CMD ["node", "server/index.mjs"]