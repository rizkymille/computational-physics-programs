function b = fzerosimp(xl,xu)
% fungsi fzerosimp, untuk mencari akar dengan Metode Brent
% input:
% xl = akar x interval minimum
% xu = akar x interval maksimum
% output:
% b = nilai akar

% inisialisasi variabel-variabel
a = xl; b = xu; fa = f(a); fb = f(b);
c = a; fc = fa; d = b - c; e = d;

while (1) % ulang ketika benar (terus menerus)
    if fb == 0 % jika hasil fungsi b sama dengan nol
        break % hentikan loop karena akar sudah ditemukan
    end
    
    if sign(fa) == sign(fb) % jika fungsi a dan b sama sama positif, negatif, atau nol, maka susun ulang titik titik
        a = c; fa = fc; % pindahkan nilai c menjadi nilai a, dan nilai fc menjadi nilai fa
        d = b - c; e = d; % pindahkan nilai d menjadi nilai e, kurangkan nilai b dengan nilai c
    end
    
    if abs(fa) < abs(fb) % jika positif fa kurang dari positif fb
        c = b; b = a; a = c; % pindahkan nilai b menjadi nilai c, nilai a menjadi nilai b, dan nilai c menjadi nilai a
        fc = fb; fb = fa; fa = fc; % pindahkan nilai fb menjadi nilai fc, nilai fa menjadi nilai fb, dan nilai fc menjadi nilai fa
    end
    
    m = 0.5*(a - b); % tes untuk terminasi loop, merupakan setengah dari selisih a dengan b
    tol = 2 * eps * max(abs(b), 1); % hitung nilai toleransi
    
    if abs(m) <= tol || fb == 0 % jika nilai absolut m kurang dari sama dengan nilai toleransi atau fb sama dengan nol
        break % hentikan pengulangan
    end
    
    % pilih metode open atau bisection
    if abs(e) >= tol && abs(fc) > abs(fb) % jika nilai absolut e lebih dari sama dengan nilai toleransi, dan nilai absolut fc lebih dari fb
        s = fb/fc; % definisikan s sebagai rasio fungsi b dengan fungsi c
        if a == c % jika a sama dengan c, maka jalankan Metode Secant
            p = 2*m*s; % definisikan nilai p merupakan 2 kali rasio fungsi b dengan fungsi c kali test terminasi loop
            q = 1 - s; % definisikan nilai q merupakan satu dikurang yaitu rasio fungsi b dengan fungsi c
        else % jika tidak, jalankan interpolasi kuadrat terbalik
            q = fc/fa; r = fb/fa; % definisikan nilai q merupakan rasio fungsi c dengan fungsi a, r merupakan rasio fungsi b dengan fungsi a
            p = s * (2*m*q * (q - r) - (b - c)*(r - 1)); % definisikan nilai p
            q = (q - 1)*(r - 1)*(s - 1); % perbarui nilai q dengan variabel q,r,s dikurang satu
        end
        
        if p > 0 % jika nilai p lebih dari nol
            q = -q; % perbarui nilai q dengan nilai minus q
        else % jika tidak
            p = -p; % perbarui nilai p dengan nilai minus p
        end
        
        if 2*p < 3*m*q - abs(tol*q) && p < abs(0.5*e*q) % jika nilai 2p kurang dari 3mq dikurang nilai absolut toleransi kali q dan p kurang dari nilai absolut setengah e kali q
            e = d; d = p/q; % simpan nilai d menjadi nilai e terbaru dan nilai d menjadi rasio p dengan q
        else % jika tidak
            d = m; e = m; % simpan nilai m menjadi nilai d dan e terbaru
        end
        
    else % Jika tidak, gunakan metode bisection
        d = m; % simpan nilai m menjadi nilai d terbaru
        e = m; % simpan nilai m menjadi nilai e terbaru
    end
    
    c = b; % simpan nilai b menjadi nilai c terbaru
    fc = fb; % simpan nilai fb menjadi nilai fc terbaru
 
    if abs(d) > tol % jika nilai absolut d lebih dari nilai toleransi
        b=b+d; % naikkan nilai b dengan penambahan d
    else % jika niai absolut d kurang dari sama dengan nilai toleransi
        b=b-sign(b-a)*tol; % turunkan nilai b dengan nilai positif/negatif/nol dari b dikurang a dikalikan nilai toleransi
    end
    
    fb = f(b); % kalkulasi fb dengan nilai b terbaru
end