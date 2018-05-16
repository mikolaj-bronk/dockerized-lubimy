module Songs
  class SongsAPI < Grape::API

    format :json

    desc "Song List", {
        :notes => <<-NOTE
        Get All Songs
         __________________
        NOTE
    }

    get do
      Song.all
    end


    desc "Song By Id", {
        :notes => <<-NOTE
        Get Song By Id
         __________________
        NOTE
    }

    params do
      requires :id, type: Integer, desc: "Song id"
    end

    get ':id' do
      begin
        song = Song.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        error!({ status: :not_found }, 404)
      end
    end

    desc "Delete Song By Id", {
        :notes => <<-NOTE
        Delete Song By Id
         __________________
        NOTE
    }

    params do
      requires :id, type: Integer, desc: "Song id"
    end

    delete ':id' do
      begin
        song = Song.find(params[:id])
        { status: :success } if song.delete
        rescue ActiveRecord::RecordNotFound
        error!({ status: :error, message: :not_found }, 404)
      end
    end

    desc "Update Song By Id", {
        :notes => <<-NOTE
        Update Song By Id
                        __________________
        NOTE
    }

    params do
      requires :id, type: Integer, desc: "Song id"
      requires :author, type: String, desc: "Song author"
      requires :album, type: String, desc: "Song album"
      requires :name, type: String, desc: "Song name"
      requires :length, type: String, desc: "Song length"
    end

    put ':id' do
      begin
        song = Song.find(params[:id])
        if song.update({
                              author: params[:author],
                              album: params[:album],
                              name: params[:name],
                              length: params[:length]
                          })
          { status: :success }
        else
          error!({ status: :error, message: song.errors.full_messages.first }) if song.errors.any?
        end
      end
    end


    desc "Create Song", {
        :notes => <<-NOTE
        Create Song
         __________________
        NOTE
    }

    params do
      requires :author, type: String, desc: "Song author"
      requires :album, type: String, desc: "Song album"
      requires :name, type: String, desc: "Song name"
      requires :length, type: String, desc: "Song length"
    end

    post do
      begin
        song =  Song.create({
                                      author: params[:author],
                                      album: params[:album],
                                      name: params[:name],
                                      length: params[:length]
                                  })
        if song.save
          { status: :success }
        else
          error!({ status: :error, message: song.errors.full_messages.first }) if song.errors.any?
        end
      end
    end
  end
end
