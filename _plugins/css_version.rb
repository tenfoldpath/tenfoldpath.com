class CssVersion < Liquid::Tag
  # Prints the commit hash of the latest commit to the site CSS
  #
  # Use:
  # {% css_version %}

  def initialize(tag_name, input, tokens)
    super
  end

  def render(context)
    latest_commit(css_bundle)
  end

  private

  def css_bundle
    File.expand_path(File.join(__dir__, '../css/site.css'))
  end

  def find_latest_commit(file_path)
    `git log -n 1 --pretty=format:%H -- #{file_path}`
  end

  def latest_commit(file_path)
    @@latest_commit ||= find_latest_commit(file_path)
  end
end

Liquid::Template.register_tag('css_version', CssVersion)
