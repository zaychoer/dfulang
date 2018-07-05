class Siswa < ApplicationRecord

	validates :no_un, presence: true, length: {maximum: 14}


	def self.to_csv(fields = column_names, options = {})
		CSV.generate(options) do |csv|
			csv << fields
			all.each do |siswa|
				csv << siswa.attributes.values_at(*fields)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			siswa_hash = row.to_hash
			siswa = find_or_create_by!(nama: siswa_hash['nama'], nisn: siswa_hash['nisn'], no_un: siswa_hash['no_un'])
			# siswa.update_attributes(siswa_hash)
		end
	end

	def self.total_laki
		where(jenis_kelamin: 'L').count
	end

	def self.total_perempuan
		where(jenis_kelamin: 'P').count
	end

	def self.total_jenisKelamin
		total_laki + total_perempuan
	end
end
