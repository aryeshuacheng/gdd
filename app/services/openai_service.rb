require 'pry'

class OpenaiService
  CREATE_THREAD_ENDPOINT = 'https://api.openai.com/v1/threads'
  include HTTParty
  attr_reader :options, :query, :type

  def initialize(query, type)
    @template = ""
    # @template = ""
    @title = query
    @query = query
    @type = type
    @options = {
      headers: {
        'Content-Type' => 'application/json', 'Authorization' => "Bearer #{Rails.application.credentials.openai_api_key}", 'OpenAI-Beta' => 'assistants=v2'
      }
    }
  end

  def call

    # 1. Create a thread
    create_thread_body = { messages: [{ role: 'user', content: 'Well Being' }]}
    response = HTTParty.post(CREATE_THREAD_ENDPOINT, body: create_thread_body.to_json, headers: options[:headers], timeout: 500)

    puts "API KEY"
    puts Rails.application.credentials.openai_api_key
    puts "DEBUGGING STEP 1: "
    puts response
    thread_id = response['id']

    #2. Create 7 messages with each value of worthwhile development
    @create_message_endpoint = "https://api.openai.com/v1/threads/#{thread_id}/messages"

    process_value("well-being")
    process_value("empowerment and agency")
    process_value("environmental sustainability")
    process_value("human rights")
    process_value("social and global justice")
    process_value("cultural freedom")
    process_value("responsibility")

    #3. Create Run
    create_run_body = { assistant_id: "asst_Wbj25ShpVkROQkGZVbW6DgeU" }

    create_run_endpoint = "https://api.openai.com/v1/threads/#{thread_id}/runs"

    run_id = HTTParty.post(create_run_endpoint, body: create_run_body.to_json, headers: options[:headers], timeout: 500)['id']

    get_run_endpoint = "https://api.openai.com/v1/threads/#{thread_id}/runs/#{run_id}"

    puts "Thread ID: #{thread_id}"
    puts "Run ID: #{run_id}"

    while HTTParty.get(get_run_endpoint, headers: options[:headers], timeout: 500)['status'] == "in_progress"
      puts "Create Run API Call Status: #{HTTParty.get(get_run_endpoint, headers: options[:headers], timeout: 500)['status']}"
      sleep(5)
    end

    #4. Get Messages
    get_messages_endpoint = "https://api.openai.com/v1/threads/#{thread_id}/messages"

    get_messages_response = HTTParty.get(get_messages_endpoint, headers: options[:headers], timeout: 500)
    responses = []

    get_messages_response['data'].map do |response|
      if response['content'].present?
        responses << response['content'][0]['text']['value'].squish
      end
    end

    puts "Responses"
    puts responses
    parsed_response = responses.slice!(0, 1).join().gsub("```html","").gsub("```","")


    Proposal.create(title: @title, html: parsed_response)
    parsed_response
  end
  def process_value(value)
    create_message_body = { role: 'user', content: @query + " " + "is this ethical as a #{@type} according to the value of #{value} with respect to the seven values of worthwhile development?" + " and return response in HTML"}
    HTTParty.post(@create_message_endpoint, body: create_message_body.to_json, headers: options[:headers], timeout: 500)
  end
end
