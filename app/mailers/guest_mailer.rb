class GuestMailer < ApplicationMailer
  def invite(guest)
    @guest = guest
    @url = invitation_url(guest.access_hash)
    mail(to: @guest.email, subject: 'Wedding Invitation')
  end
end
