require 'sqlite3'
require 'singleton'
require 'reply.rb'
require 'user.rb'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question 

    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT 
                *
            FROM
                questions
            WHERE
                id = ?
        SQL

        return nil unless id.length > 0
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        author = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT 
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL

        return nil unless author.length > 0
        Question.new(author.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
    
    def author     
        self.author_id == (User.fname && User.lname)
    end


    # ? author id is the variable that represents the associated author_id for the question


    
    
end