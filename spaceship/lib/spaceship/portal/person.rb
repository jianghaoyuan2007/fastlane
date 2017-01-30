module Spaceship
  module Portal
    class Person < PortalBase
      # @return (String) Person Id
      attr_accessor :person_id

      # @return (String) First name
      attr_accessor :firstname

      # @return (String) Last name
      attr_accessor :lastname

      # @return (String) Email Address
      attr_accessor :email_address

      # @return (String) Developer status (active, inactive)
      attr_accessor :developer_status

      # @return (String) Joined Date
      attr_accessor :joined

      # @return (String) Id in Team scope
      attr_accessor :team_member_id

      # @return (String) Role (member, admin or agent)
      attr_accessor :type

      attr_mapping(
        'personId' => :person_id,
        'firstName' => :firstname,
        'lastName' => :lastname,
        'email' => :email_address,
        'developerStatus' => :developer_status,
        'dateJoined' => :joined,
        'teamMemberId' => :team_member_id
      )

      class << self
        def factory(attrs)
          self.new(attrs)
        end
      end

      def remove!
        client.team_remove_member!(team_member_id)
      end

      def change_role(role)
        client.team_set_role(team_member_id, role)
      end
    end
  end
end
