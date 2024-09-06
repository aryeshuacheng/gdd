# About #

The GDD AI project essentially is a layer which interacts with OpenAI via API calls. 

# Nuts and Bolts (Requirements)

The project relies on having an OpenAI account. OpenAI charges money per API call depending on its complexity. In the near future, we would need to generate a API key from OpenAI's platform and then embed that API key in our project.

Visit: https://platform.openai.com/api-keys

# Value #

By streamlining the process of getting responses from OpenAI, we can help end users make more efficient use of their time. In theory, our application will be much convenient and powerful than using OpenAI merely through a ChatGPT prompt. For example, by implementing templates, an end user could generate a proposal or policy in the context of a business email.

In our current alpha build of the project, the Ruby on Rails web application asks for an input (i.e. some kind of question to be answered like "Is it ethical to raise the drinking age restriction?") and it will then take that input and make an API call to OpenAI. It then saves the response in the Proposals table in the database. 

# The Future #

My present vision for our web application is to effectively establish a unified portal that can be utilized by different organizations. Each organization will only be able to see proposals from within their organization. Furthermore, I would propose a WSYIWYG editor to that proposals can be "tuned" under human discretion. Templates is another valuable feature that allows end users to specify how they want OpenAI responses formatted visually.

