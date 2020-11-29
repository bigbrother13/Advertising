namespace :pins do
  desc 'Approved pins to Published status'
  task publish: :environment do
    pins = Pin.all
    pins.each do |pin|
      if pin.approved?
        pin.status = "published"
        pin.save
        puts "Successfully assigned status Published"
      end
    end
  end

  desc 'Archival pins'
  task archival: :environment do
    pins = Pin.all
    pins.each do |pin|
      if pin.status == "published"
        now = pin.updated_at + 3.day
        time = Time.now
        if time > now
          pin.status = "archival"
          pin.save
          puts "Successfully assigned status Archival"
        end
      end
    end
  end
end

