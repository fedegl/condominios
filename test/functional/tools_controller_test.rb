require 'test_helper'

class ToolsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Tools.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Tools.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Tools.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tools_url(assigns(:tools))
  end
  
  def test_edit
    get :edit, :id => Tools.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Tools.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tools.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Tools.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tools.first
    assert_redirected_to tools_url(assigns(:tools))
  end
  
  def test_destroy
    tools = Tools.first
    delete :destroy, :id => tools
    assert_redirected_to tools_url
    assert !Tools.exists?(tools.id)
  end
end
