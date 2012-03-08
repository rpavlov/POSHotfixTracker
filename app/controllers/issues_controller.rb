class IssuesController < ApplicationController
  def index
    db = JIRA::JIRAService.new 'http://ordersets.jira.com'
    db.login 'bobby.wang', 'pay-shunt-05'

    @selected_project = params[:selected_project] || 'ENTRYPOINT'

    versions = db.versions_for_project(@selected_project).select do |version|
        /^\d+\.\d+\.\d+$/.match version.name
    end

    if (versions.size > 0 || params[:selected_version]) && @selected_project
      @selected_version = params[:selected_version] || versions.first.name
      @issues = db.issues_from_jql_search "fixVersion = '#{@selected_version}' AND project = '#{@selected_project}'"
    else
      @issues = []
    end

    @versions_for_select = versions.map {|v| v.name}

    @projects_for_select = [['EntryPoint', 'ENTRYPOINT'], ['DataBridge', 'OLS']]
  end
end
