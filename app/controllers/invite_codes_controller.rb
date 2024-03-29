class InviteCodesController < ApplicationController
  # GET /invite_codes
  # GET /invite_codes.json
  def index
    @invite_codes = InviteCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invite_codes }
    end
  end

  # GET /invite_codes/1
  # GET /invite_codes/1.json
  def show
    @invite_code = InviteCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite_code }
    end
  end

  # GET /invite_codes/new
  # GET /invite_codes/new.json
  def new
    @invite_code = InviteCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite_code }
    end
  end

  # GET /invite_codes/1/edit
  def edit
    @invite_code = InviteCode.find(params[:id])
  end

  # POST /invite_codes
  # POST /invite_codes.json
  def create
    @invite_code = InviteCode.new(params[:invite_code])

    respond_to do |format|
      if @invite_code.save
        format.html { redirect_to @invite_code, notice: 'Invite code was successfully created.' }
        format.json { render json: @invite_code, status: :created, location: @invite_code }
      else
        format.html { render action: "new" }
        format.json { render json: @invite_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invite_codes/1
  # PUT /invite_codes/1.json
  def update
    # mark as taken
    @invite_item = InviteItem.find(params[:id])
    @invite_code = InviteCode.where(invite_item_id: @invite_item.id, taken: false).first
    
    if @invite_code
      @invite_code.taken = true
      user_id = nil
      user_id = current_user.id if user_signed_in?
      @invite_code.user_id = user_id
    end
    
    respond_to do |format|
      if @invite_code && @invite_code.save
        format.html { redirect_to @invite_code, notice: 'Invite code was successfully updated.' }
        format.js # update.js.erb
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js # update.js.erb
        format.json { render json: @invite_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_codes/1
  # DELETE /invite_codes/1.json
  def destroy
    @invite_code = InviteCode.find(params[:id])
    @invite_code.destroy

    respond_to do |format|
      format.html { redirect_to invite_codes_url }
      format.json { head :no_content }
    end
  end
end
