# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # def initialize(user)
  # # Define default abilities for all users
  # can :read, :all  # All users can read all resources

  # if user.present?
  #   case user
  #   when User
  #     # Define abilities for users
  #     can :manage, User, id: user.id  # Users can manage their own profile
  #     can :index, User
  #     # Define other abilities for users

  #   when Admin
  #     # Define abilities for admins
  #     can :manage, :all  # Admins can manage all resources
  #     # Define other abilities for admins
  #   end
  # end

  def initialize(user)
    # Define default abilities for all users
    # can :read, :all  # All users can read all resources

    return unless user.present?

    # Define abilities for logged-in users
    can :manage, User, id: user.id # Users can manage their own profile

    if user.is_a?(Admin)
      # Define abilities for admins
      can :read, :all
      can :manage, Book # Admins can manage all books
      can :manage, Author # Admins can manage all author
      can :manage, User # Admins can manage all user
      can :manage, Order # Admins can manage all order

    elsif user.is_a?(User)
      can :read, Book
      can :read, Author
      can :manage, Order
      can :manage, Cart

      cannot :read, User
      cannot :read, Order

    end
  end

  # def initialize(user)
  #   # Define abilities for the user here. For example:
  #   #
  #   #   return unless user.present?
  #   #   can :read, :all
  #   #   return unless user.admin?
  #   #   can :manage, :all
  #   #
  #   # The first argument to `can` is the action you are giving the user
  #   # permission to do.
  #   # If you pass :manage it will apply to every action. Other common actions
  #   # here are :read, :create, :update and :destroy.
  #   #
  #   # The second argument is the resource the user can perform the action on.
  #   # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  #   # class of the resource.
  #   #
  #   # The third argument is an optional hash of conditions to further filter the
  #   # objects.
  #   # For example, here the user can only update published articles.
  #   #
  #   #   can :update, Article, published: true
  #   #
  #   # See the wiki for details:
  #   # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  # end
end
