class Tree
  include PdfRenderable

  def initialize(options)
    @root = options[:root]
    @next_func = options[:next_func]
    @value_func = options[:value_func]
    @depth = 0
  end

  def render(document)
    @root.each do |node|
      render_node(document, node, @depth)
    end
  end

  private
    attr_reader :root, :next_func, :value_func

    def render_node(document, node, depth)
      document.start_new_page if document.cursor < 50

      document.pad_bottom(6) do
        document.indent(indent * depth) do
          document.text "\u2022 #{node.send(value_func)}"
        end
      end

      children = node.send(next_func)
      if children.any?
        children.each {|child| render_node(document, child, depth + 1)}
      end
    end

    def indent
      30
    end
end