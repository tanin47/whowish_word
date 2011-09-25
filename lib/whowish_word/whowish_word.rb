require File.expand_path("../constant", __FILE__)
require File.expand_path("../initializer", __FILE__)

module WhowishWord
  include WhowishWord::Constant
  include WhowishWord::Initializer
  
  attr_accessor :words
  
  def init(database_engine = :mysql)
    
    @database_engine = database_engine
    
    run_database_migration
    install_hook
    load_rails
    
    words = WhowishWordHtml.all()
      
    @words = {}
    words.each { |word|
      @words[word.word_id] = word.content
    }
    
  end
  
  def add_or_set_word(word_id, content)
    @words[word_id] = content
  end

  def word_for(namespace, id, *variables)
    return word_for_normal_mode(namespace, id, *variables)
  end
  
  def word_for_attr(namespace, id, *variables)
    return word_for_normal_mode(namespace, id, *variables)
  end
  
  def word_for_in_edit_mode(namespace, id, *variables)
    return "<dfn>#{word_for_edit_mode(namespace, id, *variables)}</dfn>".html_safe
  end
  
  def word_for_attr_in_edit_mode(namespace, id, *variables)
    return word_for_edit_mode(namespace, id, *variables)
  end
  
  
  def word_for_edit_mode(namespace, id, *variables)
    
    variables = sanitize_variables_arg(variables)
    
    locale = "en"
    
    variable_suffix = ""
    if variables.length > 0
      
      var_keys = []
      variables.map { |key,val| var_keys.push("#{key}") }
      
      variable_suffix = "|#{var_keys.join(",")}"
      
    end
    
    return PREFIX + \
           SEPARATOR + \
           get_whowish_word_id(namespace, id, locale) + \
           variable_suffix + \
           SEPARATOR + \
           word_for_normal_mode(namespace, id, variables)
    
  end
  
  def sanitize_variables_arg(variables)
    
    if variables.length > 0
      variables = variables[0]
    else
      variables = {}
    end
    
    return variables
    
  end

  def word_for_normal_mode(namespace, id, *variables)
    
    variables = sanitize_variables_arg(variables)
    
    locale = "en"
    word_id = get_whowish_word_id(namespace, id, locale)
 
    if @words[word_id]
      
      content = "#{@words[word_id]}"
      variables.each_pair { |key,val| content.gsub!("{#{key}}","#{val}") }
      
    else
      
      content = word_id
      
      if variables.length > 0
        content_params = []
        variables.each_pair { |key,val| content_params.push("#{key}") }
        content += "{#{content_params.join(',')}}"
      end
      
    end

    return content.html_safe
      
  end
  
  private
  def get_whowish_word_id(namespace, id, locale)
    "#{namespace}:#{id}(#{locale})".downcase
  end

  extend self
end

