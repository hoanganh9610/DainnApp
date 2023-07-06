cd Dainn.WebAPI
dotnet publish -c Release
cp Dockerfile $PWD\bin\Release\net6.0\publish
heroku container:login
docker build -t dainn-app $PWD\\bin\\Release\\net6.0\\publish
docker tag dainn-app registry.heroku.com/dainn-app/web
docker push registry.heroku.com/dainn-app/web
heroku container:release web --app dainn-app