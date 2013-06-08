require 'spec_helper'

describe FavoriteCategory do
  it{should belong_to(:user)}
  it{should belong_to(:category)}

  
end
