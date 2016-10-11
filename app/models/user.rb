class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	before_destroy :check_all_events_finished

	has_many :created_events, class_name: 'Event', foreign_key: :owner_id, dependent: :nullify



	private

	def check_all_events_finished
		now = Time.zone.now
		if created_events.where(':now < end_time', now: now).exists?
			errors[:base] << '公開中の未終了イベントが存在します。'
		end

		if participating_events.where(':now < end_time', now: :now).exists?
			errrors[:base] << '未終了の参加イベントが存在します。'
		end
		errors.blank?
	end
end