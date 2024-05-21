# README

Steps are necessary to get the application up and running.

Make sure you have the following:

* Ruby version ~> ruby 3.3.0

* Ruby version ~> Rails 7.1.3.3

## System dependencies:
- PostgreSQL
- Bootstrap 5
- Operating System: Parrot Security 6
- Code editor: Visual Studio Code
- Development tools: Bundler, Git

## Backend routes

Here's a list of the routes described in the `routes.rb` file:

### Root Route
1. **GET** `/` - Directs to `blog_posts#index`

### Blog Posts Routes
2. **GET** `/blog_posts` - Directs to `blog_posts#index`
3. **GET** `/blog_posts/new` - Directs to `blog_posts#new`
4. **POST** `/blog_posts` - Directs to `blog_posts#create`
5. **GET** `/blog_posts/:id` - Directs to `blog_posts#show`
6. **GET** `/blog_posts/:id/edit` - Directs to `blog_posts#edit`
7. **PATCH/PUT** `/blog_posts/:id` - Directs to `blog_posts#update`
8. **DELETE** `/blog_posts/:id` - Directs to `blog_posts#destroy`

#### Nested Comments Routes within Blog Posts
9. **POST** `/blog_posts/:blog_post_id/comments` - Directs to `comments#create`

#### Nested Likes Routes within Blog Posts
10. **POST** `/blog_posts/:blog_post_id/likes` - Directs to `likes#create`

### Topics Routes
11. **GET** `/topics` - Directs to `topics#index`
12. **GET** `/topics/new` - Directs to `topics#new`
13. **POST** `/topics` - Directs to `topics#create`
14. **GET** `/topics/:id` - Directs to `topics#show`
15. **GET** `/topics/:id/edit` - Directs to `topics#edit`
16. **PATCH/PUT** `/topics/:id` - Directs to `topics#update`
17. **DELETE** `/topics/:id` - Directs to `topics#destroy`

#### Nested Votes Routes within Topics
18. **POST** `/topics/:topic_id/votes` - Directs to `votes#create`

### Users Routes
19. **GET** `/users/new` - Directs to `users#new`
20. **POST** `/users` - Directs to `users#create`

### Company Heads Registrations Routes
21. **GET** `/company_heads_registrations/new` - Directs to `company_heads_registrations#new`
22. **POST** `/company_heads_registrations` - Directs to `company_heads_registrations#create`

### Companies Routes
23. **GET** `/companies` - Directs to `companies#index`
24. **GET** `/companies/new` - Directs to `companies#new`
25. **POST** `/companies` - Directs to `companies#create`
26. **GET** `/companies/:id` - Directs to `companies#show`
27. **GET** `/companies/:id/edit` - Directs to `companies#edit`
28. **PATCH/PUT** `/companies/:id` - Directs to `companies#update`
29. **DELETE** `/companies/:id` - Directs to `companies#destroy`

#### Nested Company Heads Routes within Companies
30. **GET** `/companies/:company_id/company_heads` - Directs to `company_heads#index`
31. **PATCH** `/companies/:company_id/company_heads/:id/approve` - Directs to `company_heads#approve`
32. **DELETE** `/companies/:company_id/company_heads/:id` - Directs to `company_heads#destroy`