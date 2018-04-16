# frozen_string_literal: true

class MailingListsController < ApplicationController

  responders :flash
  respond_to :html


  def index
    run MailingLists::Index
  end


  def show
    run MailingLists::Show
  end


  def new
    run MailingLists::Create::Present
  end


  def create
    run MailingLists::Create do |result|
      return respond_with result[:model], location: -> { mailing_lists_path }
    end
    render :new
  end


  def edit
    run MailingLists::Update::Present
  end


  def update
    run MailingLists::Update do |result|
      return respond_with result[:model], location: -> { mailing_lists_path }
    end
    render :edit
  end


  def destroy
    run MailingLists::Delete
    respond_with result[:model], location: -> { mailing_lists_path }
  end

end
