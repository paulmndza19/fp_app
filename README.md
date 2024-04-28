# FP App
## Getting Started

### Requirements
- Ruby 3.2.3
- Rails 7
- Postgresql

### Install

```
git clone https://github.com/paulmndza19/fp_app.git
cd fp_app

bundle install
rails db:create
rails db:migrate
rails db:seed

rails tailwindcss:watch

rails s
```

## Gems Used

- [Adminstrate](https://github.com/thoughtbot/administrate)
- [Devise](https://github.com/heartcombo/devise)
- [PaperTrail](https://github.com/paper-trail-gem/paper_trail)
- [Paranoia](https://github.com/rubysherpas/paranoia)
