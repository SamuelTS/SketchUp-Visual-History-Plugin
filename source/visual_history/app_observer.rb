# Visual History (VHY) extension for SketchUp 2017 or newer version.
# Copyright: © 2020 Samuel Tallet <samuel.tallet arobase gmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3.0 of the License, or
# (at your option) any later version.
# 
# If you release a modified version of this program TO THE PUBLIC,
# the GPL requires you to MAKE THE MODIFIED SOURCE CODE AVAILABLE
# to the program's users, UNDER THE GPL.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# Get a copy of the GPL here: https://www.gnu.org/licenses/gpl.html

raise 'The VHY plugin requires at least Ruby 2.2.0 or SketchUp 2017.'\
  unless RUBY_VERSION.to_f >= 2.2 # SketchUp 2017 includes Ruby 2.2.4.

require 'sketchup'
require 'visual_history/model_observer'
require 'visual_history/viewer'

# Visual History plugin namespace.
module VisualHistory

  # Observes SketchUp events and reacts.
  class AppObserver < Sketchup::AppObserver

    # When SketchUp user creates a new, empty model:
    def onNewModel(model)

      model.add_observer(ModelObserver.new)

      Viewer.cleanup_and_reset

    end

    # When SketchUp user opens an existing model:
    def onOpenModel(model)

      model.add_observer(ModelObserver.new)

      Viewer.cleanup_and_reset

    end

    # When SketchUp closes:
    def onQuit

      Viewer.cleanup_and_reset

    end

  end

end
