class IdeaSurvey < ActiveRecord::Base
    belongs_to :idea
    belongs_to :survey, class_name: "Survey::Survey"
    
end

#Reopen Survey class to add associations
Survey::Survey.class_eval do
    has_one :idea_survey
    has_one :idea, through: :idea_survey
    has_many :answers, through: :attempts
    
    def primary_question
        self.questions.first
    end
    
    def answer_count_array
        #0 count for all options
        options_array = self.primary_question.options.map{|k,v| [k.text, 0]}
        options_hash = Hash[options_array.map {|i| [i[0], i[1]]}]
        #answer counts
        h = self.answers.group(:option).count
        answers_array = h.map{|k,v| [k.text, v]}
        answers_hash = Hash[answers_array.map {|i| [i[0], i[1]]}]
        merged_hash = options_hash.merge(answers_hash)
        array = merged_hash.map{|k,v| ["#{k} : #{v}", v.to_s]}
        hash = Hash[array.map {|i| [i[0], i[1]]}]
        logger.debug hash.inspect.light_yellow
        return hash
    end
end
