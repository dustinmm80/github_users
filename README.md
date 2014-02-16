# github_users

Create users from a Github organization or list of users.

This will allow members of your organization to SSH into servers using their own keys.

## Attributes

* `node[github_users][organization]` - Github organization to search for public members
* `node[github_users][users]` - List of Github users, if you don't want to use the `organization` attribute
* `node[github_users][group_name]` - Group name users will belong to (default `'github'`)
* `node[github_users][group_id]` - Group id users will belong to (default `2157`)
* `node[github_users][allow_sudo]` - Allow passwordless sudo for the users (default `true`)

## Usage

Include this cookbook in your role or wrapper cookbook.

```
recipe[github_users]
```

Set one of these attributes as you need:

* `[github_users][organization]`
* `[github_users][users]`

## Development

1. Clone this repository
    
    ```
    git clone git@github.com:dustinmm80/github_users_cookbook.git
    ```

2. Install dependencies

    ```
    gem install bundler; bundle install
    ```
    
3. **Write tests for your changes.** We're using test-kitchen and serverspec.

4. Run the tests

    ```
    kitchen converge; kitchen verify
    ```