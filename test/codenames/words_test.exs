defmodule Codenames.WordsTest do
  use Codenames.DataCase

  alias Codenames.Words

  describe "words" do
    alias Codenames.Words.Word

    import Codenames.WordsFixtures

    @invalid_attrs %{term: nil}

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Words.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Words.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      valid_attrs = %{term: "some term"}

      assert {:ok, %Word{} = word} = Words.create_word(valid_attrs)
      assert word.term == "some term"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      update_attrs = %{term: "some updated term"}

      assert {:ok, %Word{} = word} = Words.update_word(word, update_attrs)
      assert word.term == "some updated term"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_word(word, @invalid_attrs)
      assert word == Words.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Words.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Words.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Words.change_word(word)
    end
  end
end
