namespace :pins do
  desc 'Approved pins to Published status'
  task publish: :environment do
    @pins.each do |pin|
      if pin.approved?
        pin.status = "published"
        pin.save
      end
    end

  end

  desc 'Archival pins'
  task archival: :environment do
    pins.each do |pin|
      if Time.now.to_date - 3.days.ago.to_date
      pin.status = "archival"
      pin.save
    end
  end

    end
  end
end
