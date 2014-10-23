json = JSON.parse(File.read('/Users/bumishness/Documents/Zooniverse/project-data/planet-four/manifest.json')); nil

project = PlanetFourSubject.project
workflow = project.workflows.first

total = json.length
json.each.with_index do |hash, index|
  puts "#{ index + 1 } / #{ total }"
  id = BSON::ObjectId(hash['id'])
  PlanetFourSubject.create({
    _id: id,
    project_id: project.id,
    workflow_ids: [workflow.id],
    coords: hash['coords'],
    location: hash['location'],
    metadata: hash['metadata']
  }).activate! unless PlanetFourSubject.where(_id: id).exists?
end; nil
