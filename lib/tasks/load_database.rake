namespace :database do
  desc "Import data from json files from '/db/jsons/' folder"
  task :import_data => :environment do
    @logger = Logger.new(Rails.root.join('log/import.log'))

    Dir[Rails.root.join('db/jsons/*.json')].each do |file|
      table_name = file.split('/').last.split('.').first
      class_type = table_name.classify.constantize

      parsed_json = JSON.parse(File.read(file))
      parsed_json.each do |record|
        model_record = class_type.new(record)

        begin
          model_record.save
        rescue => error
          print error.message
          @logger.info("#{ table_name } record_id #{ model_record.id }. Msg: #{ error.message }")
        end
      end
    end
  end

  desc "Destroy all data from questions and question_accesses tables."
  task :clean => :environment do
    [ "question", "question_access" ].each do | table |
      model = table.classify.constantize
      model.destroy_all
    end
  end
end
