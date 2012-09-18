require 'rubygems'
require 'sinatra'
require 'bundler/setup'
require 'cgi'

Fields = {
    "os_ref"           => "Oddsense Reference",
    "oddsense_account" => "Oddsense Account",
    "oddsense_js"      => "oddsense.js Url"
}

Defaults = {
    "oddsense_js" => "http://oddsense.dev/assets/oddsense.js"
}

helpers do

  def value_or_default name
    name = name.to_sym
    if params[name] && !params[name].empty?
      params[name]
    elsif Defaults.has_key?(name.to_s)
      Defaults[name.to_s]
    end
  end

end

get '/' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  erb :index
end
