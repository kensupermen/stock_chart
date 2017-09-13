require 'open-uri'
require 'date'
require 'zip'
require 'net/http'
require 'uri'

current_date = Date.today.prev_day
DOMAIN = 'http://images1.cafef.vn/data/'

if current_date.sunday? == true || current_date.saturday? == true
  puts "Don't have data for saturday and sunday"
  exit
end

file_name = DOMAIN + current_date.strftime('%Y%m%d') + '/CafeF.SolieuGD.Raw.' + current_date.strftime('%d%m%Y') + '.zip'
data_file = open(file_name)

api_url = 'http://localhost:3000/api/v1/transactions/import'

Zip::File.open_buffer(data_file) do |zip|
  zip.each do |entry|
    if entry.name.include? 'HSX'
      content = entry.get_input_stream.read
			uri = URI.parse(api_url)
			http = Net::HTTP.new(uri.host, uri.port)
			request = Net::HTTP::Post.new(uri.request_uri)
			request.set_form_data(file_name: content)
			request.content_type = 'multipart/form-data'
			http.request(request)
    end
  end
end
