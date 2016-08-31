class UsersController < ApplicationController
	def index
	end
	def register
		#inserts user into DB if validations pass, and redirects to users logged in page
		@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
			if @user.errors.count >0
	        	flash[:errors]=@user.errors.full_messages
	        	redirect_to "/main"
      		else
	        	session['user_id']=@user.id
	        	redirect_to "/dashboard/#{@user.id}"
      		end
	end
  	def login
		@user=User.find_by_email(params[:email])
			if @user
				if @user.authenticate(params[:password])
					session['user_id']=@user.id
					redirect_to "/dashboard/#{@user.id}"
				else 
					flash[:errors]=["Email address and password do not match. Please try again or register instead."]
					redirect_to "/main"
				end
			else 
				flash[:errors]=["Email address was not found in our database. Please register instead."]
				redirect_to "/main"
			end
	end
  	def dashboard
	  	if session['user_id']
	  		@user=User.find(params[:id])
	  		if @user.id != session['user_id']
	  			redirect_to "/dashboard/#{session['user_id']}"
	  		else
	  			@ownproducts_not_yet_sold=Productselling.where(seller_id_id: params[:id])
	  			@sales=Productsold.where(seller_id_id: params[:id])
	  			@purchases=Productbought.where(buyer_id_id: params[:id])
	  		end
	  	else 
	  		redirect_to "/main"
	  	end
  	end
	def logout
	  	session.clear
	  	redirect_to "/main"
	end
 	def sell
		@user=User.find(session['user_id'])
		@product =Productselling.create(name: params[:name], price: params[:price], seller_id_id: session['user_id'])
	  	if @product.errors.count >0
	        flash[:errors]=@product.errors.full_messages
	        redirect_to "/dashboard/#{@user.id}"
	    else
	        redirect_to "/dashboard/#{@user.id}"
	    end
 	end
  	def showshoes
	  	if session['user_id']
		  	@user=User.find(session['user_id'])
		  	@shoes =Productselling.all
	  	else
  		redirect_to "/main"
  		end
  	end
  	def buy
	  	@user=User.find(session['user_id'])
	  	@product=Productselling.find(params[:id])
	  	buyerid=@user.id
	  	name=@product.name
	  	price=@product.price
	  	seller_id=@product.seller_id_id
	  	@productbought=Productbought.create(name: name, price: price, buyer_id_id: buyerid , seller_id: seller_id)
	  	@productsold=Productsold.create(name: name, price: price, buyer_id: buyerid, seller_id_id: seller_id)
	  	Productselling.destroy(params[:id])
	  	redirect_to "/dashboard/#{@user.id}"
  	end
  	def remove
  		@user=User.find(session['user_id'])
  		Productselling.destroy(params[:id])
  		redirect_to "/dashboard/#{@user.id}"
  	end
end
