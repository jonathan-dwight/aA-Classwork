
class User

    def self.find_by_name(fname, lname)
        user_name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT 
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL

        return nil unless user_name.length > 0
        Question.new(user_name.first)
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions(author_id)
        questions = Question.find_by_author_id(author_id)
    end

    def authored_replies(user_id)
        replies = Reply.find_by_user_id(user_id)
    end



end


