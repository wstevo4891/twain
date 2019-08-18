# app/views/api/projects/_project.json.jbuilder

json.extract! project,
              :title, :slug, :meta_title, :meta_description, :summary,
              :site_link, :repo_link, :description, :features,
              :apis, :tech_stack

json.type 'project'

json.url "/projects/#{project.slug}"

json.cover project.cover.url

json.images project.images.map(&:url)

json.desktop project.desktop.url

json.mobile project.mobile.map(&:url)
