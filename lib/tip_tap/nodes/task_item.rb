# frozen_string_literal: true

require "tip_tap/node"

module TipTap
  module Nodes
    class TaskItem < Node
      self.type_name = "taskItem"
      self.html_tag = :li
      # self.html_class_name = proc { class_names("task-item", {checked: checked?}) }
      self.html_class_name = "task-item"

      def to_html
        paragraph_node = Paragraph.new(content: content)
        content_tag(html_tag,
          [content_tag('input', nil, type: 'checkbox', checked: checked?), paragraph_node.to_html], 
          class: html_class_name)
      end

      def checked?
        attrs["checked"]
      end
    end
  end
end
