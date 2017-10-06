dotnet restore
dotnet build -c Release
nuget push src\DevTree.Mvvm\bin\Debug\DevTree.Mvvm.$MAJOR.$MINOR.$PATCH.nupkg -ApiKey $NUGET_API_KEY
