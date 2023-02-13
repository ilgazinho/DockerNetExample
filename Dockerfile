FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine as build
WORKDIR /app
COPY *.csproj .

RUN dotnet restore
COPY . ./
RUN dotnet publish -no-restore -c Realese -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine as runtime
WORKDIR /app
COPY --from=build /app/out /app
ENTRYPOINT [ "dotnet", "/app/DockerNetExample.dll" ]
