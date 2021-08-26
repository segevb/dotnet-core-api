FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app
# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
# Copy everything else and build
COPY ../engine/examples ./
RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/aspnet:3.1
MAINTAINER Segev B
WORKDIR /app
COPY --from=build-env /app/out .
CMD ["dotnet", "aspnetapp.dll"]
