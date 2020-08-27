
class Reply

    def self.find_by_user_id(user_id)
        user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT 
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL

        return nil unless user.length > 0
        Question.new(user.first)
    end


    def self.find_by_question_id(question_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT 
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL

        return nil unless question.length > 0
        Question.new(question.first)
    end

    def initialize(options)
        @id = options['id']
        @qref_id = options['qref_id']
        @uref_id = options['uref_id']
        @pref_id = options['pref_id']
        @body = options['body']
    end


end





