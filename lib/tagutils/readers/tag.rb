# encoding: UTF-8

### use TagUtils - why? why not??
module TagDb


class TagReader

  include LogUtils::Logging

## make models available by default with namespace
#  e.g. lets you use Tag instead of Model::Tag
  include Models

## value helpers e.g. is_year?, is_taglist? etc.
  include TextUtils::ValueHelper


  attr_reader :include_path

  def strict?()      @strict == true;     end

  def initialize( include_path, opts = {} )
    
    @include_path = include_path
    
    ## option: for now issue warning on update, that is, if key/record (country,region,city) already exists
    @strict    =  opts[:strict].present? ? true : false
  end


  def read( name )
    ## check for grade in name e.g. tag.1, tag.2 etc.

    if name =~ /^tag.*\.(\d)$/
       read_worker( name, :grade => $1.to_i )
    else
       read_worker( name )
    end
  end


  def read_worker( name, more_attribs={} )

      reader = HashReaderV2.new( name, include_path )

      grade = 1
    
      if more_attribs[:grade].present?
        grade = more_attribs[:grade].to_i
      end

      reader.each do |key, value|
       
         ### fix/todo: move to Tag.read method for reuse !!!! 
        
        
        ### split value by comma (e.g. northern america,southern america, etc.)
        logger.debug "adding grade #{grade} tags >>#{key}<< >>#{value}<<..."
        tag_pairs = value.split(',')
        tag_pairs.each do |pair|
        ## split key|name
          values = pair.split('|')
        
          key   = values[0]
          ### remove (optional comment) from key (e.g. carribean (islands))
          key = key.gsub( /\(.+\)/, '' )
          ## remove leading n trailing space
          key = key.strip
          
          name = values[1] || ''  # nb: name might be empty/missing
          name = name.strip

          tag_attribs = {}
        
          ## check if it exists
          ## todo/fix: add country_id for lookup?
          tag = Tag.find_by_key( key )
          if tag.present?
            logger.debug "update tag #{tag.id}-#{tag.key}:"
          else
            logger.debug "create tag:"
            tag = Tag.new
            tag_attribs[ :key ] = key
          end

          tag_attribs[ :name  ] = name
          tag_attribs[ :grade ] = grade

          logger.debug tag_attribs.to_json

          tag.update_attributes!( tag_attribs )
        end
    end # each key,value

  end # method read_worker


end # class TagReader
end # module TagDb
