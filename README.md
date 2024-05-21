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


## Associations described in each model:

1. **BlogPost:**
   - Belongs to a user.
   - Has many comments, dependent on the destruction of the blog post.
   - Has many likes, dependent on the destruction of the blog post.
   - Has one attached photo.
   - Validates presence of title, content, and category.
   - Defines categories through a constant `CATEGORIES`.

2. **Category:**
   - Has many subcategories (which are instances of the same model), dependent on the destruction of the parent category.
   - Belongs to a parent category (another instance of the same model), optional.
   - Has many blog posts.
   - Validates presence of name.

3. **Comment:**
   - Belongs to a user.
   - Belongs to a blog post.
   - Validates presence of content.
   - Defines a method `metadata` that provides user name and company name.

4. **Company:**
   - Has many users, dependent on the destruction of the company.
   - Validates presence and uniqueness of name.
   - Generates a company ID before creation.

5. **Like:**
   - Belongs to a user.
   - Belongs to a blog post.
   - Validates uniqueness of user ID within the scope of a blog post ID.

6. **Topic:**
   - Belongs to a user.
   - Has many votes, dependent on the destruction of the topic.
   - Validates presence of title, description, and target meeting date.
   - Executes a callback `add_initial_vote` after creation to create an initial vote for the topic.

7. **User:**
   - Belongs to a company, optional.
   - Has secure password functionality.
   - Has many topics, dependent on the destruction of the user.
   - Has many votes, dependent on the destruction of the user.
   - Validates presence and uniqueness of full name, email, and role.
   - Validates email format and length.
   - Validates password length.
   - Validates inclusion of role in ['CTO', 'CEO', 'Team Lead', 'Member'].

8. **Vote:**
   - Belongs to a user.
   - Belongs to a topic.
   - Validates uniqueness of user ID within the scope of a topic ID.

These associations define the relationships between different models in the application and enforce constraints on data integrity and validity.