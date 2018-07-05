class SiswaPdf < Prawn::Document
	def initialize(siswa, user)
		super(margin: 15, top_margin: 2, page_size: [612, 936])
		@user = user
		@siswa = siswa
		header
		data_siswa
		footer
		header_copy
		data_siswa_copy
		footer_copy
	end

	def header
		image "#{Rails.root}/app/assets/images/LOGO_PROVINSI_BANTEN.png", :width => 70, :height => 70, :position => 10, :vposition => 28
		move_up(45)
		font "Times-Roman"
		text "PEMERINTAH PROVINSI BANTEN", :size => 15, :align => :center
		text "DINAS PENDIDIKAN DAN KEBUDAYAAN", :size => 15, :style => :bold, :align => :center
		text "UPT SMA NEGERI 3 TANGERANG", :size => 15, :style => :bold, :align => :center
		text "Jl. KH. Hasyim Ashari, No.6 Karang Tengah, Kota Tangerang, Kode Pos : 15157", :size => 10, :align => :center
		text "Telp : (021) 7305758, Fax : (021) 73458277, Website: www.sman3tgr.sch.id, Email : sman3tgr@yahoo.com", :size => 10, :align => :center
		text "NSS/NPSN : 301026401005/20606847 ***", :size => 10, :align => :center
		stroke_horizontal_line(0, bounds.width)
		move_down(10)
		font("Times-Roman", :size => 11, :style => :bold) do
			text "Bukti Daftar Ulang PPDB SMA Negeri 3 Kota Tangerang", :align => :center
			text "Tahun Pelajaran 2018/2019", :align => :center
		end
		move_down(5)
	end


	def data_siswa
		bounding_box([400, 750], :width => 80, :height => 90) do
			text "Foto 3 x 4", :valign => :center, :align => :center, :size => 8
			stroke_bounds
		end
		move_up(100)
		font("Times-Roman", :size => 10)
		data = [
					["No.Pendaftaran", ":", "#{@siswa.no_un}"],
					["NISN", ":", "#{@siswa.nisn}"],
					["Nama Siswa", ":", "#{@siswa.nama}"],
					["Jenis Kelamin", ":", "#{@siswa.jenis_kelamin}"],
					["Tempat, Tanggal Lahir", ":","#{@siswa.tempat_lahir}, #{I18n.l(@siswa.tanggal_lahir)}"],
					["Sekolah Asal", ":", "#{@siswa.sekolah_asal}"],
					["Nama Orangtua/Wali", ":" ,"#{@siswa.nama_ortu}"],
					["Nomor HP", ":", "#{@siswa.no_hp}"]
				]
		table(data, :cell_style => {:border_width => 0}, :position => 25)
		move_down(1)
	end

	def footer
		data = [ ["", "","" ,"Tangerang, #{Time.now.strftime("%d %B %Y")}"],
				 ["Panitia 1", "Panitia 2", "Siswa", "Orangtua/Wali"],
				 ["", "","" ,""],
				 ["", "","", ""],
				 ["", "","", ""],
				 ["#{@user.name}".truncate(23, separator: /\s/), "", "#{@siswa.nama}".truncate(23, separator: /\s/), "#{@siswa.nama_ortu}".truncate(23, separator: /\s/)]
				]

		table(data, :column_widths => [135, 135, 135, 135], :position => 25, :cell_style => {:border_width => 0})
		move_down 5
		text "* Bukti Daftar Ulang harap disimpan dengan baik <b>JANGAN SAMPAI HILANG</b>", :inline_format => true
		text "* Digunakan sebagai <b>kartu MPLS (Masa Pengenalan Lingkungan Sekolah) pada tanggal 16, 17 dan 18 Juli 2018</b>", :inline_format => true
		text "* Kegiatan MPLS menggunakan <b>seragam putih abu-abu, membawa alat tulis serta datang tepat waktu pukul 06.15 WIB</b>", :inline_format => true
		move_down(2)
		font("Courier", :size => 8)
		text "#{I18n.l(Time.now)}", :align => :right
		move_down 10
		stroke_horizontal_line(0, bounds.width)
		move_down 10
	end


# ===============================================================================================================================================



	def header_copy
		move_up 30
		image "#{Rails.root}/app/assets/images/LOGO_PROVINSI_BANTEN.png", :width => 70, :height => 70, :position => 10, :vposition => 500
		move_up(30)
		font "Times-Roman"
		text "PEMERINTAH PROVINSI BANTEN", :size => 15, :align => :center
		text "DINAS PENDIDIKAN DAN KEBUDAYAAN", :size => 15, :style => :bold, :align => :center
		text "UPT SMA NEGERI 3 TANGERANG", :size => 15, :style => :bold, :align => :center
		text "Jl. KH. Hasyim Ashari, No.6 Karang Tengah, Kota Tangerang, Kode Pos : 15157", :size => 10, :align => :center
		text "Telp : (021) 7305758, Fax : (021) 73458277, Website: www.sman3tgr.sch.id, Email : sman3tgr@yahoo.com", :size => 10, :align => :center
		text "NSS/NPSN : 301026401005/20606847 ***", :size => 10, :align => :center
		stroke_horizontal_line(2, bounds.width)
		move_down(10)
		font("Times-Roman", :size => 11, :style => :bold) do
			text "Bukti Daftar Ulang PPDB SMA Negeri 3 Kota Tangerang", :align => :center
			text "Tahun Pelajaran 2018/2019", :align => :center
		end
		move_down(5)
	end

	def data_siswa_copy
		bounding_box([400, 295], :width => 80, :height => 90) do
			text "Foto 3 x 4", :valign => :center, :align => :center, :size => 8
			stroke_bounds
		end
		move_up 95
		font("Times-Roman", :size => 10)
		data = [
					["No.Pendaftaran", ":", "#{@siswa.no_un}"],
					["NISN", ":", "#{@siswa.nisn}"],
					["Nama Siswa", ":", "#{@siswa.nama}"],
					["Jenis Kelamin", ":", "#{@siswa.jenis_kelamin}"],
					["Tempat, Tanggal Lahir", ":","#{@siswa.tempat_lahir}, #{@siswa.tanggal_lahir.strftime("%d %B %Y")}"],
					["Sekolah Asal", ":", "#{@siswa.sekolah_asal}"],
					["Nama Orangtua/Wali", ":" ,"#{@siswa.nama_ortu}"],
					["Nomor HP", ":", "#{@siswa.no_hp}"]
				]
		table(data, :cell_style => {:border_width => 0}, :position => 25)
		move_down(1)
	end

	def footer_copy
		data = [ ["", "","" ,"Tangerang, #{Time.now.strftime("%d %B %Y")}"],
				 ["Panitia 1", "Panitia 2", "Siswa", "Orangtua/Wali"],
				 ["", "","" ,""],
				 ["", "","", ""],
				 ["", "","", ""],
				 ["", "", "#{@siswa.nama}".truncate(23, separator: /\s/), "#{@siswa.nama_ortu}".truncate(23, separator: /\s/)]
				]

		table(data, :column_widths => [135, 135, 135, 135], :position => 25, :cell_style => {:border_width => 0})
		move_down 5
		text "* Bukti Daftar Ulang harap disimpan dengan baik <b>JANGAN SAMPAI HILANG</b>", :inline_format => true
		text "* Digunakan sebagai kartu MPLS (Masa Pengenalan Lingkungan Sekolah) pada tanggal 16, 17 dan 18 Juli 2018"
		font("Courier", :size => 8)
		text "#{I18n.l(Time.now)}", :align => :right
	end
end