class Article < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name "articles-#{Rails.env}"

    def self.search(query)
        __elasticsearch__.search({
            query: {
            multi_match: {
                query: query,
                fields: ['title', 'text']
            }
            },
            highlight: {
            pre_tags: ['<em>'],
            post_tags: ['</em>'],
            fields: {
                title: {},
                text: {}
            }
            }
        })
    end

end


