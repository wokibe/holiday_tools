# encoding: utf-8

module HolidayTools
  class Locator

    # prerequisit: gem install holidays
    # see https://github.com/alexdunae/holidays

    require "holidays"
    require "holidays/at"
    require "holidays/au"
    require "holidays/br"
    require "holidays/ca"
    # require "holidays/ch"
    require "holidays/cz"
    require "holidays/de"
    require "holidays/dk"
    require "holidays/el"
    require "holidays/es"
    require "holidays/fi"
    require "holidays/fr"
    require "holidays/gb"
    # require "holidays/hr"
    # require "holidays/hu"
    require "holidays/ie"
    require "holidays/is"
    require "holidays/it"
    require "holidays/jp"
    require "holidays/li"
    require "holidays/mx"
    require "holidays/nl"
    require "holidays/no"
    require "holidays/nz"
    require "holidays/pl"
    require "holidays/pt"
    require "holidays/se"
    require "holidays/us"
    # require "holidays/vz"
    require "holidays/za"

    def initialize( filter=[] )
      @filter = filter
    
      # names of the regions/subregions used in the holidays gem
      @reg_names = {
        at:     'Austria',
        au:     'Australia',
        au_act:  'Australia/Australian Capital Terretory',
        au_nsw:  'Australia/New South Wales',
        au_nt:  'Australia/Nothern Terretory',
        au_qld: 'Australia/Queensland',
        au_qld_brisbane: 'Australia/Queensland and Brisbane',
        au_sa:  'Australia/South Australia',
        au_tas: 'Australia/Tasmania',
        au_vic: 'Australia/Victoria',
        au_wa:  'Australia/Western Australia',
        br:     'Brasilia',
        ca:     'Canada',
        ca_ab:  'Canada/Alberta',
        ca_bc:  'Canada/British Columbia',
        ca_mb:  'Canada/Manitoba',
        ca_nb:  'Canada/New Brunswick',
        ca_nf:  'Canada/Newfoundland',
        ca_ns:  'Canada/Nova Scotia',
        ca_nt:  'Canada/Northwest Territories',
        ca_nu:  'Canada/Nunavut',
        ca_on:  'Canada/Ontario',
        ca_pe:  'Canada/Prince Edward Island',
        ca_sk:  'Canada/Saskatchewan',
        ca_qc:  'Canada/Quebeck',
        ca_yk:  'Canada/Yukon',
        cz:     'Czech Republic',
        de:     'Germany',
        de_bb:  'Germany/Brandenburg',
      # de_be:  'Germany/Berlin',
        de_bw:  'Germany/Baden-Württemberg',
        de_by:  'Germany/Bayern',
      # de_hb:  'Germany/Freie Hansestadt Bremen',
        de_he:  'Germany/Hessen',
      # de_hh:  'Germany/Hamburg',
        de_mv:  'Germany/Mecklenburg-Vorpommern',
      # de_ni:  'Germany/Niedersachsen',
        de_nw:  'Germany/Nordrhein-Westfalen',
        de_rp:  'Germany/Rheinland-Pfalz',
      # de_sh:  'Germany/Schleswig-Holstein',
        de_sl:  'Germany/Saarland',
        de_sn:  'Germany/Sachsen',
        de_st:  'Germany/Sachsen-Anhalt',
        de_th:  'Germany/Thüringen',
        dk:     'Denmark',
        el:     'Greece',
        es:     'Spain',
        es_an:  'Spain/Andalusia',
        es_ar:  'Spain/Aragon',
        es_ce:  'Spain/Ceuta',
        es_cl:  'Spain/Castile and Leon',
        es_cm:  'Spain/Castile-La Mancha',
        es_cn:  'Spain/Canary Island',
        es_ct:  'Spain/Catalonia',
        es_ex:  'Spain/Extremadura',
        es_ga:  'Spain/Galicia',
        es_ib:  'Spain/Islas Baleares',
        es_lo:  'Spain/La Rioja',
        es_m:   'Spain/Madrid',
        es_mu:  'Spain/Murcia',
        es_na:  'Spain/Navarre',
        es_o:   'Spain/Asturias',
        es_pv:  'Spain/Euskadi (Pais Vasco - Basque Country)',
        es_v:   'Spain/Valencia',
        es_vc:  'Spain/Valencia',
        fi:     'Finland',
        fr:     'France',
        gb:     'Great Britain',
        gb_eng: 'Great Britain/England',
        gb_wls: 'Great Britain/Wales',
        gb_eaw: 'Great Britain/England and Wales',
        gb_nir: 'Great Britain/Norther Ireland',
        gb_sct: 'Great Britain/Scotland',
        gb_jsy: 'Great Britain/Jersey',
        gb_gsy: 'Great Britain/Guernsey',
        gb_con: 'Great Britain/Cornwall',
        gb_iom: 'Great Britain/Isle of Man',
        gg:     'Guernsey',
        ie:     'ireland',
        im:     'Isle of Man',
        it:     'Italy',
        is:     'Iceland',
        je:     'Jersey',
        jp:     'Japan',
        li:     'Liechtenstein',
        mx:     'Mexico',
        mx_pue: 'Mexico/Puebla',
        nz:     'New Zealand',
        nz_ak:  'New Zealand/Auckland',
        nz_ca:  'New Zealand/Canterbury',
        nz_ch:  'New Zealand/Chatham',
        nz_hb:  "New Zealand/Hawke's Bay",
        nz_mb:  'New Zealand/Marlboro',
        nz_nl:  'New Zealand/Northland',
        nz_ot:  'New Zealand/Otago',
        nz_sc:  'New Zealand/South Canterbury',
        nz_sl:  'New Zealand/Southland',
        nz_we:  'New Zealand/Wellington',
        nz_wl:  'New Zealand/Westland',
        nl:     'Netherlands',
        no:     'Norway',
        pl:     'Poland',
        pt:     'Portugal',
        se:     'Sweden',
        us:     'United States of America',
        us_dc:  'United States of America/Washington DC',
        za:     'South Africa'
        }
    end
  
    # loop over region names
    def show_regions
      txt = []
      txt << "Region \tName"
      @reg_names.each do |key, val|
        txt << "%s \t%s" % [key, val]
      end
      txt
    end

    # get the name of a holiday and the regions, where it is observed
    def show_holiday(date)
      ans = Holidays.on(date, :any, :observed)
      # dat = date.to_s
      if ans.size > 0
        if @filter.size == 0
          show_all(date, ans)
        else
          show_filtered(date, ans)      
        end
      end
    end

    # loop over a week
    def show_week(date)
      fw = date - date.wday   # from sunday
      tw = fw + 6             # to saturday
      show_holidays(fw, tw)
    end

    # loop over a month
    def show_month(date)
      fm = date - date.mday + 1  # from 1. in month
      tm = (fm >> 1) - 1      # to last in month ( '>> 1' advances one month )
      show_holidays(fm, tm)
    end


    # loop over a year
    def show_year(date)
      fy = date - date.yday + 1
      ty = Date.civil(fy.year, 12, 31)
      show_holidays(fy, ty)
    end

    private
    # get the name of a weekday
    def wday_nam(wday)
      name = %w( Sunday Monday Tuesday Wednesday Thursday Friday Saturday )
      name[wday]
    end

    # show the date
    def show_dat(dat)
      "%s (%s)" % [dat.to_s, wday_nam(dat.wday)]
    end

    # show the name of the holiday
    def show_nam(nam)
      "\t %s" % [ nam ]
    end

    # show the expanded name of a region
    def show_reg(reg)
      rn = @reg_names[reg]
      if rn
        "\t \t %s" % [ rn ]
      else
        "\t \t :%s (?)" % [ reg ]        
      end
    end

    # show without region filter
    def show_all(dat, ans)
      txt = []
      txt << show_dat(dat)
      ans.each do |entry|
        nam = entry[:name]
        txt << show_nam(nam)
        entry[:regions].each do |reg|
          txt << show_reg(reg)
        end
      end
      txt
    end

    # show with region filter
    def show_filtered(dat, ans)
      txt = []
      date_shown = false
      ans.each do |entry|
        nam = entry[:name]
        name_shown = false
        entry[:regions].each do |reg|
          @filter.each do |pat|
            # construct a pattern
            pattern = Regexp.new(pat)
            if reg.to_s =~ pattern
              # we have a match
              unless date_shown
                txt << show_dat(dat)
                date_shown = true
              end
              unless name_shown
                txt << show_nam(nam)
                name_shown = true
              end
              txt << show_reg(reg)
            end
          end
        end  
      end
      txt
    end

    # loop over a range of dates
    def show_holidays(from_date, to_date)
      txt = []
      from_date.upto(to_date) do |date|
        res = show_holiday(date)
        txt << res if res
      end
      txt
    end 

  end # class
end # module