Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85BE46AF39
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036098; cv=none; b=BP726ZtOm+mAENh57WddFZkzmloNIBRU6rpxUtn6z7S9mv0xQaLWaaxqdn3Na3CrGGcXzSxMzm/qc9Ez4uiu8KG+TMQSa9TeOYBFA00a9MTXfvDIuFCnQ1ru0DOCqG0y0n3OZ7RqyO00wVDr5b3TV4sBiPJ6vEJtdO1pU7r3VRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036098; c=relaxed/simple;
	bh=I2e1sTfNi+4/tdcSVWJfJEFTRfdPpzayG8ntKpiI6tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6j1OGyYtEI5VowDT60cgB7ZHQ8VGwOfn/kQRuIDgvEOXTaXerpZu30vxI7gvuXZ621brvWptcmA84YpjGF/EHclrDw/bCgKQAOqF/0C7xPCWjCsZ5zAQmlX4f55vZQIpI3iPBeV0e29kAxu/MyQbnDr1SarI6STGZjI7njJlY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmGdHqGi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmGdHqGi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2403478f8f.1
        for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036094; x=1784640894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=qmGdHqGiQ30wZkrFIeUdbMlnGt9NFeDPmhEcJIwAufRDEw0Oy9mOfTZebqyQ+Ws3RA
         HHFDofaojy1+MuSMAj2cu99OwN0yVIcC/gt4CUY6Fdy+mEPRGliMDYKdaUHlkFxtGuU/
         te+jEJ75pIZFqk95ig8nWZcD4vEftrvxxkC83vPGY7GA7QKskGmE79AVrIkrbbsYEpPA
         b7k51w8MvwxXw3az9kP0JtFboefEBWhf4wMMotk4MVcGglOHmwNAl0DZm881JA1TnpLE
         qeJfl7uSoLKRx3Q9YliWuNULE36/WzlRfjcRcWTsZtv9nt16lA1tCP0C0XeIEO4lqr3I
         URIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036094; x=1784640894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=jR0a18E4A157uXyYi20h+Ohb/5G+tfvbfwSEpc6flOsA8pS5OTLjBMlq9bWP8GdkvD
         IwcxG5YJvbroaJ2Nl2lT4HG38azcjVWh93v23yVBi3ht6hFz6sn0Iz0lOU6tbHIsOIn6
         +GlJWwcqiarCU+AtFepdQWwxst76giKXoVghkLbWT+EDk9qPupXtF/1Ut9euWv1d4U8y
         a36wYQ3nIqRcRioo26MItBJHga7FwplySYPoOWaE8/kVnye9uSpIKbPoRnhz9o92h6M1
         9HICk7CeuE1HBPNn1fFABMf8zZNxUnFrunrEX8oL339ie0PrsajWrQtyZ9i3+ylgHZ5C
         SR5w==
X-Forwarded-Encrypted: i=1; AHgh+Rot7C992WkJOc/5o6KPU9FbUSfZ9Cc4x9shFPBZG9MNhvn4DTHedJpMPUvTfGlV9QpK//lBjl7FAJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs0GjsAfEp4ma/Oegu0IqQsS19Q+PV0miKvDuaSjzhPPVYtzSQ
	fKog600EhB/riGIvdsv/Bf3trK+zpFaqLgz4GACqQ5qKTFov49AhPv5d
X-Gm-Gg: AfdE7clKK2FpAVJ4X/esyKuBcGqp2wa66MPNUEY6IRORVAKMa/cwLdqAuxtx2DIqLoj
	0Vz7hUoSjsvhf+wBlDGdvOhedfeZ5OOYSOq0D99kIFslwaI/WbOPLIXADAQcpMeChzNnL06T3Jj
	FGWA/RB/OlDZpyETQ0AP8JB07aTbg1W0NfadYulTZiVAU4//jJKDKhv119qAeFX+Wvcszt/KisG
	8FwRiqtQlGReT7NMnRlXWf7jRGkeE8IosYPtd8xEiLRIMXGiX8BeSHlD73eJeHfqR7vJ2b0YAy1
	u8mlSa1pN0RVdzP98i4W2n7C0k+H1YM2giz08x44UcGaezGyg4xp43f3l2K4SLua3N/HiatibMJ
	qnLuqd6O/CuqEwOFHR/Z7g+Q3W/Fjkn9vYbZNnPoLrdIacjiX53nPV8kah7vNB5vfsdhycuNXGT
	rwwrVmL6637CZTcSAEwF7SdI/Nk1klaR4wPySlpfy44v4pfAKAUSRTGjnj62PE
X-Received: by 2002:a05:6000:26c7:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47f2dcc02eemr15207624f8f.25.1784036093714;
        Tue, 14 Jul 2026 06:34:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm8687695f8f.9.2026.07.14.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:34:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:34:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Linux-Arch
 <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "David
 Hildenbrand (Red Hat)" <david@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Klara Modin" <klarasmodin@gmail.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Kirill
 A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn, wangyuli@aosc.io,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Tejun Heo" <tj@kernel.org>, "Kevin
 Brodsky" <kevin.brodsky@arm.com>, "Anup Patel" <anup@brainfault.org>,
 atish.patra@linux.dev, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Dave Hansen" <dave.hansen@linux.intel.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>,
 qi.zheng@linux.dev, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui Song"
 <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>, "Axel Rasmussen"
 <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu"
 <weixugc@google.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Anshuman Khandual"
 <anshuman.khandual@arm.com>, "Yang Shi" <yang@os.amperecomputing.com>,
 chaitanyas.prakash@arm.com, "Ard Biesheuvel" <ardb@kernel.org>, guoren
 <guoren@kernel.org>, yang.li85200@gmail.com, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech, "Muchun
 Song" <muchun.song@linux.dev>, "Vishal Moola (Oracle)"
 <vishal.moola@gmail.com>, "Nam Cao" <namcao@linutronix.de>, "Pavel Machek"
 <pavel@kernel.org>, djbw@kernel.org, yu-cheng.yu@intel.com, "Baolu Lu"
 <baolu.lu@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Coiby Xu" <coxu@redhat.com>, "Andreas
 Larsson" <andreas@gaisler.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn"
 <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714143450.61a94085@pumpkin>
In-Reply-To: <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 13:55:18 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 12:26, Pedro Falcato wrote:
> > On Mon, Jul 13, 2026 at 02:55:41PM +0100, Yeoreum Yun wrote:  
> >> From: "David Hildenbrand (Arm)" <david@kernel.org>
> >> 
> >> We don't want pgd_t to be an array, as it prohibits returning it from a
> >> function, like pgdp_get().
> >> 
> >> So let's just use an u64, and extract the right 32bit value in
> >> pgd_val().
> >> 
> >> Leave the STRICT_MM_TYPECHECKS case alone for now.  
> >
> > I have to ask: is there a good reason for the STRICT_MM_TYPECHECKS ifdef?
> >
> > I see the compiler has an awkward time returning a u64 struct (see
> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> > purposefully toggling it on for testing from time to time.  
> 
> As far as I can tell, the #ifdef was originally in i386 and
> got copied to all other architectures at the time, but was
> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> was introduced.

For x86-32 the makefiles request 64bit structures be returned in registers
(at the same place regparm=3 is set - probably added at the same time
between 2.4 and 2.6).

Note that arm32 can will return a 32bit struct in a register and
arm64 will return a 128bit struct in two registers.

The only problem is returning a 64bit struct in 32bit mode.

I'm sure this code is arm64 only.

	David


> 
> For some reason, only sparc32 and arm32 still use the non-strict
> version, with arm having changed from the struct version in 2002:
> 
> https://github.com/tbodt/linux-history/commit/5a8202f0259a
> https://archive.armlinux.org.uk/lurker/message/20020306.213958.cd486eeb.en.html
> 
> > If STRICT_MM_TYPEDEFS's worse codegen doesn't matter then maybe we should
> > permanently toggle it on.  
> 
> This would definitely need good testing. It's possible that it's
> not that bad on modern EABI builds (i.e. everyone these days) as
> well as modern compilers, as OABI definitely had bigger problems
> with 64-bit arguments.
> 
> >> +static inline pmdval_t pgd_val(pgd_t pgd)
> >> +{
> >> +	return (*(pmdval_t (*)[2])&pgd)[0];  
> >
> > Ugh. This isn't correct C code. It only works because the kernel passes
> > -fno-strict-aliasing.  
> 
> I think the bigger problem is the code dereferencing the pgd
> pointer in the first place: Since the pgd pair is written in
> 32-bit units in __pmd_populate(), anything reading it would
> technically have to operate on both entries.
> 
> As the kernel relies on -fno-strict-aliasing, the type mismatch
> is less of a problem than actually doing the potentially wrong
> thing.
> 
> As far as I can tell, we are however saved by pgd_val()
> only ever being used for debug prints, where printing
> the first entry is likely all that is needed to analyse
> the real bug.
> 
> > I would recommend either forcing a struct here, or
> > using a u64 with bitmasks/shifts.  
> 
> That would require extra complexity for the big-endian
> case though.
> 
>     Arnd
> 

