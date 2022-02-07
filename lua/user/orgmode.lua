local orgmode_status_ok, orgmode = pcall(require, "orgmode")

if not orgmode_status_ok then
  return
end

orgmode.setup({
  org_agenda_files = { '~/workspace/orgs/**/*'},
  org_default_notes_file = '~/workspace/orgs/refile.org',
})
