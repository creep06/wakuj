require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module RougeHelper

	class HTML < Redcarpet::Render::HTML
		include Rouge::Plugins::Redcarpet
	end

	def highlight_code(text, lang)
		text = "```#{lang}\n" + text + "\n```"
		render_options = {
				filter_html: true,
				hard_wrap: true,
				link_attributes: { rel: 'nofollow' }
		}
		renderer = HTML.new(render_options)

		extensions = {
				autolink: true,
				fenced_code_blocks: true,
				lax_spacing: true,
				no_intra_emphasis: true,
				strikethrough: true,
				superscript: true
		}
		markdown = Redcarpet::Markdown.new(renderer, extensions)
		markdown.render(text).html_safe
	end
end
