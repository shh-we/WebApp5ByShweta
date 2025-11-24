FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet build "WebApp5ByShweta.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebApp5ByShweta.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
# ADD THIS LINE - Copy your database file:
COPY LabDb.db ./LabDb.db
ENTRYPOINT ["dotnet", "WebApp5ByShweta.dll"]
