require 'spec_helper'

describe PoemsController do

  def mock_poem(stubs={})
    @mock_poem ||= mock_model(Poem, stubs)
  end

  describe "GET index" do
    it "assigns all poems as @poems" do
      Poem.stub!(:find).with(:all).and_return([mock_poem])
      get :index
      assigns[:poems].should == [mock_poem]
    end
  end

  describe "GET show" do
    it "assigns the requested poem as @poem" do
      Poem.stub!(:find).with("37").and_return(mock_poem)
      get :show, :id => "37"
      assigns[:poem].should equal(mock_poem)
    end
  end

  describe "GET new" do
    it "assigns a new poem as @poem" do
      Poem.stub!(:new).and_return(mock_poem)
      get :new
      assigns[:poem].should equal(mock_poem)
    end
  end

  describe "GET edit" do
    it "assigns the requested poem as @poem" do
      Poem.stub!(:find).with("37").and_return(mock_poem)
      get :edit, :id => "37"
      assigns[:poem].should equal(mock_poem)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created poem as @poem" do
        Poem.stub!(:new).with({'these' => 'params'}).and_return(mock_poem(:save => true))
        post :create, :poem => {:these => 'params'}
        assigns[:poem].should equal(mock_poem)
      end

      it "redirects to the created poem" do
        Poem.stub!(:new).and_return(mock_poem(:save => true))
        post :create, :poem => {}
        response.should redirect_to(poem_url(mock_poem))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved poem as @poem" do
        Poem.stub!(:new).with({'these' => 'params'}).and_return(mock_poem(:save => false))
        post :create, :poem => {:these => 'params'}
        assigns[:poem].should equal(mock_poem)
      end

      it "re-renders the 'new' template" do
        Poem.stub!(:new).and_return(mock_poem(:save => false))
        post :create, :poem => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested poem" do
        Poem.should_receive(:find).with("37").and_return(mock_poem)
        mock_poem.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :poem => {:these => 'params'}
      end

      it "assigns the requested poem as @poem" do
        Poem.stub!(:find).and_return(mock_poem(:update_attributes => true))
        put :update, :id => "1"
        assigns[:poem].should equal(mock_poem)
      end

      it "redirects to the poem" do
        Poem.stub!(:find).and_return(mock_poem(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(poem_url(mock_poem))
      end
    end

    describe "with invalid params" do
      it "updates the requested poem" do
        Poem.should_receive(:find).with("37").and_return(mock_poem)
        mock_poem.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :poem => {:these => 'params'}
      end

      it "assigns the poem as @poem" do
        Poem.stub!(:find).and_return(mock_poem(:update_attributes => false))
        put :update, :id => "1"
        assigns[:poem].should equal(mock_poem)
      end

      it "re-renders the 'edit' template" do
        Poem.stub!(:find).and_return(mock_poem(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested poem" do
      Poem.should_receive(:find).with("37").and_return(mock_poem)
      mock_poem.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the poems list" do
      Poem.stub!(:find).and_return(mock_poem(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(poems_url)
    end
  end

end
