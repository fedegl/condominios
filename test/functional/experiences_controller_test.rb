require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Experience.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Experience.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Experience.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to experience_url(assigns(:experience))
  end
  
  def test_edit
    get :edit, :id => Experience.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Experience.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Experience.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Experience.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Experience.first
    assert_redirected_to experience_url(assigns(:experience))
  end
  
  def test_destroy
    experience = Experience.first
    delete :destroy, :id => experience
    assert_redirected_to experiences_url
    assert !Experience.exists?(experience.id)
  end
end
