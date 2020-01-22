defmodule App.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        factory_changeset(App.User, %{
          email: sequence(:email, &"user#{&1}@email.com"),
          password: "12345678",
          password_confirmation: "12345678"
        })
      end
    end
  end
end
