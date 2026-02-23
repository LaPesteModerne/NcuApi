class SidePanelController < ApplicationController
    def side
        filePath = "./side_panels/" + params[:id] + ".md"

        if File.exists?(filePath) then
            dataStream = File.open(filePath)
            @pageContent = dataStream.read()
            render json: { markdown: @pageContent }
        else
            return head 204
        end
    end
end
