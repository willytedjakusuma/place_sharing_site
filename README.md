Place Sharing Site
====

Step to Installation

---

Requirement
```
  1. Postgres Database ( Docker / Local Server )
  2. Ruby 2.7.2
  3. Gem Bundler 2.1.4
```

---
1. Clone from github
```
git clone https://github.com/willytedjakusuma/place_sharing_site.git
```

2. Go to place_sharing_site folder
```
cd place_sharing_site
```

3. Bundle & NPM Install ( Make sure everything is installed succesfully )
```
bundle install
npm install
```


4. Go to config/database.yml and change your host according to your preferences ( Docker => Docker Container IP, Local Server => Localhost)
```
  Docker
  database: placesharing_db
  host: YOUR_DOCKER_POSTGRES_CONTAINER_IP

  Local Server
  database: placesharing_db
  host: localhost
```

5. Run rails db:create, db:migrate 
```
rails db:create db:migrate
```
6. Run rails db:seed for seeding data
```
rails db:seed
```
7. Run the server
```
rails s
```

8. After seeding data, you can login with user that created and stored in file called user_password_list.txt, you can choose one of them