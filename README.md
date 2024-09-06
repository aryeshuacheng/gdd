# About #

The GDD AI project essentially is a layer which interacts with OpenAI via API calls. 

# Nuts and Bolts (Requirements)

The project relies on having an OpenAI account. OpenAI charges money per request depending on its complexity. In the near future, we would need to have API key from OpenAI. 

Visit: https://platform.openai.com/api-keys

# VALUE #

By streamlining the process of getting responses from OpenAI, we can help end users make more efficient use of their time. In theory, our application will be much convenient and powerful than using OpenAI through a ChatGPT prompt. For example, by implementing templates, an end user could generate a proposal or policy in the context of a business email.

In our current alpha build of the project, the Ruby on Rails web application asks for an input (i.e. some kind of question to be answered like "Is it ethical to raise the drinking age restriction?") and it will then take that input and make an API call to OpenAI.

