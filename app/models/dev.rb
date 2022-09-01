class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one(item_name)
        self.freebies.any? { |freebie| freebie.item_name == item_name }
    end

    def give_away(dev, freebie)
        # changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
        dev.freebies << freebie if freebie.dev_id == self.id
    end
end
