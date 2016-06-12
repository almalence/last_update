module LastUpdate
  module Patches
    module QueryPatch
      def last_update
        return "#{last_record_in_histroy_created_on}: #{last_record_in_histroy_note}" if self.journals.any? && self.journals.where("notes != ''").any?

        "No records yet."
      end

      private

      def last_record_in_histroy
        self.journals.where("notes != ''").last
      end

      def last_record_in_histroy_created_on
        last_record_in_histroy.created_on.to_formatted_s(:db)
      end

      def last_record_in_histroy_note
        formated_note = last_record_in_histroy.notes[0, 1000]

        formated_note += "..." if last_record_in_histroy.notes.chars.length > 1000

        formated_note
      end
    end
  end
end
