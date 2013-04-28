class InviteItemsController < ApplicationController
  # GET /invite_items
  # GET /invite_items.json
  def index
    @invite_items = InviteItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invite_items }
    end
  end

  # GET /invite_items/1
  # GET /invite_items/1.json
  def show
    @invite_item = InviteItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite_item }
    end
  end

  # GET /invite_items/new
  # GET /invite_items/new.json
  def new
    @invite_item = InviteItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite_item }
    end
  end

  # GET /invite_items/1/edit
  def edit
    @invite_item = InviteItem.find(params[:id])
  end

  # POST /invite_items
  # POST /invite_items.json
  def create
    @invite_item = InviteItem.new(params[:invite_item])

    # Split invite code string to invite_codes
    for invite_code_content in @invite_item.codes_str.split
      invite_code = InviteCode.new(content: invite_code_content, taken: false)
      invite_code.save
      @invite_item.invite_codes << invite_code
    end
    
    # Generate rand_key
    rand_key = Digest::MD5.hexdigest(@invite_item.title + Time.now.to_s)
    # TODO: Check rand_key unique 
    @invite_item.rand_key = rand_key

    respond_to do |format|
      if @invite_item.save
        format.html { redirect_to @invite_item, notice: 'Invite item was successfully created.' }
        format.json { render json: @invite_item, status: :created, location: @invite_item }
      else
        format.html { render action: "new" }
        format.json { render json: @invite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invite_items/1
  # PUT /invite_items/1.json
  def update
    @invite_item = InviteItem.find(params[:id])

    respond_to do |format|
      if @invite_item.update_attributes(params[:invite_item])
        format.html { redirect_to @invite_item, notice: 'Invite item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_items/1
  # DELETE /invite_items/1.json
  def destroy
    @invite_item = InviteItem.find(params[:id])
    @invite_item.destroy

    respond_to do |format|
      format.html { redirect_to invite_items_url }
      format.json { head :no_content }
    end
  end
end
