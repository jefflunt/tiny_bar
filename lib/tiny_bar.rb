require 'tiny_color'

# the TinyBar class is used to create a text-based progress bar with various
# properties like width, background color, foreground color, label, and
# percent filled.
#
# usage:
#   tiny_bar = TinyBar.new           # creates a new TinyBar instance
#   tiny_bar.label = 'Progress'      # sets the label to 'Progress'
#   tiny_bar.percent_filled = 0.5    # sets the percent filled to 50%
#   tiny_bar.width = 100             # sets the width of the bar to 100
#   tiny_bar.bg_color = :blue        # sets the background color to blue
#   tiny_bar.fg_color = :white       # sets the foreground color to white
#   puts tiny_bar                    # prints the TinyBar instance
#
# This will print a progress bar of width 100 with a blue background, white
# foreground, and 'Progress' label filled to 50%.
class TinyBar
  attr_reader :percent_filled,
              :label

  attr_accessor :width,
                :bg_color,
                :fg_color

  def initialize
    @width = 80
    @bg_color = :default
    @fg_color = :default
    @label = ''
    @value = 0
    @percent_filled = 0.0
  end

  def percent_filled=(value)
    @percent_filled = value.clamp(0.0, 1.0).round(2)
  end

  def label=(value)
    @label = value.to_s
  end

  def to_s
    full_width_s = label
      .to_s
      .rjust((width / 2) + (label.length / 2))
      .ljust(width)

    filled_width = (full_width_s.length * percent_filled).round
    unfilled_width = (full_width_s.length - filled_width) - 1

    left = full_width_s[..filled_width]
    right = unfilled_width > 0 ? full_width_s[-unfilled_width..] : ''

    "#{left.send(fg_color).send("on_#{bg_color}")}#{right}"
  end
end
