# app/views/api/projects/_project.json.jbuilder

json.extract! project,
              :id, :slug, :meta_title, :meta_description, :title, :summary,
              :site_link, :repo_link, :highlights, :tech_stack

# json.url project_url(project, format: :json)

json.url "/projects/#{project.slug}"

json.cover project.cover.url

json.images project.images.map(&:url)
