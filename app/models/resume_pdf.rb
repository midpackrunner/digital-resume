require 'prawn'
require 'prawn/measurement_extensions'

class ResumePdf < Prawn::Document
  attr_reader :resume

  FOOTER_HEIGHT = 27
  PADDING_CONTENT_X = 15
  PADDING_CONTENT_Y = 10
  PADDING_PARAGRAPH = 12

  private_constant :FOOTER_HEIGHT,
                   :PADDING_CONTENT_X,
                   :PADDING_CONTENT_Y,
                   :PADDING_PARAGRAPH

  def initialize(resume, &block)
    @resume = resume
    super(page_size: 'A4', margin: (0.33).in, &letterhead(&block))
  end

  def paragraph(string='', &block)
    pad_bottom(PADDING_PARAGRAPH) do
      text string, size: 11.25 unless string.blank?
      if block_given?
        yield
      end
    end
  end

  def section(header='', &block)
    paragraph do
      render_section_heading(header)
      yield self if block_given?
    end
  end

  def header(content, options)
    font('OpenSans', styles[options[:depth] || 0]) do
      text content
    end
  end

  private
    def styles
      {
        0 => { style: :normal, size: 11.25 },
        1 => { style: :bold, size: 11.5 },
        2 => { style: :italic, size: 11.25 }
       }
    end

    def letterhead(&block)
      lambda do |document|
        document.send('embed_fonts')
        document.font 'OpenSans'

        document.repeat(:all, dynamic: true) do
          document.send('render_footer')
        end

        document.bounding_box([PADDING_CONTENT_X, document.bounds.height - PADDING_CONTENT_Y],
                              width: document.bounds.width - (2 * PADDING_CONTENT_X),
                              height: document.bounds.height - (FOOTER_HEIGHT + (2 * PADDING_CONTENT_Y))) do
          yield document
        end

        document.send('render_page_numbers')
      end
    end

    def embed_fonts
      font_root = "#{Rails.root}/app/assets/fonts"
      font_families.update('OpenSans' => { normal: "#{font_root}/OpenSans-Regular.ttf",
                                           italic: "#{font_root}/OpenSans-Italic.ttf",
                                           bold: "#{font_root}/OpenSans-Bold.ttf"
                           })
    end

    def render_footer
      bounding_box([0, FOOTER_HEIGHT], width: bounds.width, height: FOOTER_HEIGHT) do
        # The page numbers are the 'paragraph' above the top border, but can't be placed until the end of rendering
        pad_top (PADDING_PARAGRAPH) do
          render_footer_top_border
          move_down 4
          text [resume.user.email, "Phone #{resume.user.phone}", "Github #{resume.user.github}"].join('  •  '),
               align: :center,
               color: 'b0b0b0',
               size: 9
        end
      end
    end

    def render_footer_top_border
      stroke do
        stroke_color '7c7c7c'
        horizontal_rule
      end
    end

    def render_page_numbers
      font('OpenSans', style: :italic) do
        number_pages("Page <page>/<total>",
                     at: [0, FOOTER_HEIGHT],
                     width: bounds.width - PADDING_CONTENT_X,
                     align: :right,
                     size: 9)
      end
    end

    def render_section_heading(heading)
      font('OpenSans', style: :bold) do
        text heading, size: 14
      end
    end
end