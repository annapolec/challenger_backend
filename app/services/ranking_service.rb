class RankingService
  def call
    ranking = Ranking.new
    User.all.each do |user|
      ranking.results[user.id] = points(user.id)
    end      
    ranking
  end 

  def points(user_id)
    sum = 0
    ChallengeMember.where(member_id: user_id).each do |challenge_member|
        sum += challenge_member.challenge.points
    end
    sum
  end
end