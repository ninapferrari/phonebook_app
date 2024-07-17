require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  login_user

  let(:valid_attributes) do
    { first_name: 'John', last_name: 'Doe', phone: '+55119826589962', notes: 'Test note',
      user_id: subject.current_user.id }
  end

  let(:invalid_attributes) do
    { first_name: '', last_name: '', phone: '', notes: '' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      contact = Contact.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it 'assigns @contacts' do
      contact = Contact.create! valid_attributes
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end

    it 'filters contacts by search term' do
      contact = Contact.create! valid_attributes
      get :index, params: { search: 'John' }
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      contact = Contact.create! valid_attributes
      get :show, params: { id: contact.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      contact = Contact.create! valid_attributes
      get :edit, params: { id: contact.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Contact' do
        expect do
          post :create, params: { contact: valid_attributes }
        end.to change(Contact, :count).by(1)
      end

      it 'redirects to the created contact' do
        post :create, params: { contact: valid_attributes }
        expect(response).to redirect_to(Contact.last)
      end
    end

    context 'with invalid params' do
      it 'returns an unprocessable entity status and renders the new template' do
        post :create, params: { contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { first_name: 'Jane' }
      end

      it 'updates the requested contact' do
        contact = Contact.create! valid_attributes
        put :update, params: { id: contact.to_param, contact: new_attributes }
        contact.reload
        expect(contact.first_name).to eq('Jane')
      end

      it 'redirects to the contact' do
        contact = Contact.create! valid_attributes
        put :update, params: { id: contact.to_param, contact: valid_attributes }
        expect(response).to redirect_to(contact)
      end
    end

    context 'with invalid params' do
      it 'returns an unprocessable entity status and renders the edit template' do
        contact = Contact.create! valid_attributes
        put :update, params: { id: contact.to_param, contact: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested contact' do
      contact = Contact.create! valid_attributes
      expect do
        delete :destroy, params: { id: contact.to_param }
      end.to change(Contact, :count).by(-1)
    end

    it 'redirects to the contacts list' do
      contact = Contact.create! valid_attributes
      delete :destroy, params: { id: contact.to_param }
      expect(response).to redirect_to(contacts_url)
    end
  end
end
