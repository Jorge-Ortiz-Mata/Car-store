class ProfilePosition < ApplicationRecord

    belongs_to :profile
    belongs_to :position

    private

        def self.change_to_admin(profile_id, position_id)
            relation = where(profile_id: profile_id, position_id: position_id).first
            relation.update(position_id: 1)
        end

        def self.change_to_member(profile_id, position_id)
            relation = where(profile_id: profile_id, position_id: position_id).first
            relation.update(position_id: 2)
        end

        def self.change_to_other(profile_id, position_id)
            relation = where(profile_id: profile_id, position_id: position_id).first
            relation.update(position_id: 4)
        end

end
