Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E3190676
	for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972641; cv=none; b=hROVMY4OoU9G3ENhcSjyAlwwQ5YWh/AmcV/HUxArnQXlKDyxjTqatFQ519QGBwWueE4/dLelLHjGTOHEfKnJ/ZPKU6goAIb72htCAexpVsXZY4LF+BGkI03b0OdSv36zb5ZYy2u7c8DulvDY0wMdSscAbzJFyfaZFDINyYq68wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972641; c=relaxed/simple;
	bh=682Lk6RmpRTw8VZ2wPqGG287wKzSgc/4y6RyyUphVWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzUKiWo1axCFbybLS3F5qXl6DO8a/GIb3IpnjInaUudKnLzFlItTT9ow2A8hOVtI/5syYZZkqBwBw4kvCFLyDL/E/8HOHSQhwoivXjw7RasFrivMYa/AHzN8MQxGEGwBt03DTMBsALo2hI7bBiaXoPQGYwnC6W1IoirWG12kWvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1d22ecf2a6so5873185276.1
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 05:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972638; x=1726577438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY/G3MXaavbXgZQIcVqEM6/ihxl9V6XepDsCDLrUSCE=;
        b=UfAegazNLlSlTjEvm30cipwp+ijL++/9uEhY7Bt4DP62jw2IeyaIE/3mPIsHowu83a
         3BBPzIf6hFlctcOL7OEUfnk3djaE0BRqie49VIfrN2jcu+dj8rXbLV6SvjqX7d1k38f6
         ZWXbafP/4JJtUsFFqjzUwHDPS5sayqeU5Uy03AjM2GrWny1UjyPGQ05Tm+zH3MseLYvO
         oIH8tJZCkkLt1N8BVbaQRTaC+XMUpVkvMEgFYuImJAkJEy03sgtcpxrw7LyG2mSY9j7/
         N5D36o0/Z0nVC0kJdi7C3yWlGTGe8JpqquLl9AZIVcun87JqKfmKTMmjR51OrY6n4xNU
         EdQA==
X-Forwarded-Encrypted: i=1; AJvYcCXscWrh4VCjiJZ1tHnNfaybJwEIPwbV0HbVV6BC2IaPf+vmVQFbcRoQmiPAZ6ST2PLZ9kplU5VC/dU=@lists.linux.dev
X-Gm-Message-State: AOJu0YweSXWOeJVme8nQEPhCkb26fx4JyBFmSkAWyL9WOwdfCP8RF7Cl
	80DYecvQke757I4lAgOJQvsAYiwwLv6wAjZHnPAqY5RWkrno4FuXVTY9EudL
X-Google-Smtp-Source: AGHT+IHQyKmxENVFMLeHF6HNiDpFZLw0dKHqchRtdUPdYt1AlTRA+ipXOJvcC2+ruybGryVwdzTd8g==
X-Received: by 2002:a05:6902:2589:b0:e1a:419c:976d with SMTP id 3f1490d57ef6-e1d34896cb4mr13616687276.27.1725972638253;
        Tue, 10 Sep 2024 05:50:38 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7bbc2ef0sm299305276.54.2024.09.10.05.50.38
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 05:50:38 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6d5893cd721so48068297b3.0
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 05:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCmXBxOdlVJcDyo9JRaWjU7TrEqu61b9OYZPVobISlSXmJevA6yFJAw72bcSFrwOmOGd76gUpeHEs=@lists.linux.dev
X-Received: by 2002:a05:690c:39d:b0:6c8:1e30:513f with SMTP id
 00721157ae682-6db44f37140mr169442817b3.23.1725972199364; Tue, 10 Sep 2024
 05:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost> <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
In-Reply-To: <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 14:43:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Tue, Sep 10, 2024 at 11:21=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/pe=
rsonality.h
> >>> index 49796b7756af..cd3b8c154d9b 100644
> >>> --- a/include/uapi/linux/personality.h
> >>> +++ b/include/uapi/linux/personality.h
> >>> @@ -22,6 +22,7 @@ enum {
> >>>     WHOLE_SECONDS =3D         0x2000000,
> >>>     STICKY_TIMEOUTS =3D       0x4000000,
> >>>     ADDR_LIMIT_3GB =3D        0x8000000,
> >>> +   ADDR_LIMIT_47BIT =3D      0x10000000,
> >>>   };
> >>
> >> I wonder if ADDR_LIMIT_128T would be clearer?
> >>
> >
> > I don't follow, what does 128T represent?
>
> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
> address, that naming would be more consistant with the ADDR_LIMIT_3GB
> just above that means a 3 Gigabytes limit.

Hence ADDR_LIMIT_128TB?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
