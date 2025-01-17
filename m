Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5413D897
	for <loongarch@lists.linux.dev>; Fri, 17 Jan 2025 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737128685; cv=none; b=YD8tF34Cb1bO63NVuqHzFwhyllUUICTcwIQFi67wINdBFPW/kTTW/ZDFd4rmUZNffClBVyrqtRHwBu11Nn8k+ZX11RvW5k/pTiGVwX8WAbIAW7NDUGSZX0yk+/KM5kbN5CvDzmfBxmRaEkyPNaROjyQUM0vaRL7+n/FV4pSQO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737128685; c=relaxed/simple;
	bh=2eYFLaWM2SV5SCMr09KRtCDPcssaE0WkpCl80N1bTio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpCE5tik+Z+ekcjkNRPKoMtSaMUgxOBHlICjVOBidjnVr5lXs4gBhyMXvviMJs0dbPgBvAx5EsViTNOhUiqvBvV15bPzLfODWlPwAtpf7/xQ59N13S0aiRKN/dg2dycQkEA//UBvB2D6YFp5JUCgr5gHnQI+aK3EtnKrJgxFeDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsDndAWY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsDndAWY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efded08c79so3264679a91.0
        for <loongarch@lists.linux.dev>; Fri, 17 Jan 2025 07:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737128683; x=1737733483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=lsDndAWYXefFlRnbyfx4ULASDB5mrOvUNxxaRAtAld96wxBUaCTYDdYdCCDFNeMVzl
         Pwt9gHcyBQ801kMT6iIDZI8xn3Y0I8SijMlbGsnYRLEXA3Cci3nH2IyOraMEUdBZ1EHz
         8Bl9lMftBvQQoW1X5Lx8EQTB21FvYCPv4eMDSHppHQQ6rH1m1C8HvHCt/E+pk+D80xl+
         dA+Xuqlfu+Y7sxn8r037lMS8+Aiksdg0DVW9lwrZ8q0OPWbayhK2rkaUUsa00PXAT/Aj
         L5McBBIdYbNWi41u5sj7tNYfD0XFOBYRH/AxKwlnPCP1EfDSC8i5+BuyfyBrg+EKMdVZ
         uyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737128683; x=1737733483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=JfRcgi90TpfLVogAVTGnOaheSEAJ3l1LKVG8ZSwVftuEDUwC9te7w0f90NVIKvbKv0
         7ovDfA6UKWi//uwSecF8ru9cuza0nwcRpAinuN8aA5MCqEwD/FeFMOgr2exBGAzYWEB+
         BRroauhlxLwVSlrjTrwklekWZO/dWk/iDpZK0RS2L7pOO6QTf3id3xktrj4zkGA84rLt
         IM6WFXMNMDHXtVuUopClmaqiEXXuPNBI8Vbustj9R+x8vp6bJUX69PD0ehGcGfnQYGsz
         +MP6njILCNQopynwnhpBqmUjNwOyOBJltXxtGVaYpTH/fWm+DTSHCoB0656G5zGvGhSD
         N3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVwsrwpKPAaIwiA8z9dBwm01kBPLjl+g1eYTkrJz/cxFHrJnzHdS+CttPcodqfRfrNDrWQKMdjtxlU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhl2YeYKaTXXncq6MZ7ikoZDpx8rHfZ1fdbRQwiMf32MxtyMKg
	FUpgeJfE7NTixGHf8V67PrAsqluQbeE9ll2TkfKhOdT82hTREGSKJpif4i9du3hnAIl2yXNJNjf
	HFdG2220oWzIwdSikSetrwAt2epg=
X-Gm-Gg: ASbGncsKgOBLW9VEEChjtlogPkTXRKU+kfPdttU4AZ+G4vxWkoZ8CKWxqJx17Bb4kBm
	+OpLYuNcJ2XN7RuJi6t1fyTLIaCr1vN0SUKibSA==
X-Google-Smtp-Source: AGHT+IE6c+RDPkVhdYpGhwJjY3swM/Kqbs9TiZQ1EhehCnKjqU+fLUq40RYGPSLu28v4p+m1VfknK3ci2deVkxFc/zo=
X-Received: by 2002:a17:90b:54cb:b0:2ee:df57:b194 with SMTP id
 98e67ed59e1d1-2f782cc011fmr4009658a91.21.1737128683175; Fri, 17 Jan 2025
 07:44:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113170925.GA392@strace.io> <20250113171140.GC589@strace.io>
 <Z4hs0X8RhGTuevnn@ghost> <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
In-Reply-To: <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
From: Eugene Syromyatnikov <evgsyr@gmail.com>
Date: Fri, 17 Jan 2025 16:45:02 +0100
X-Gm-Features: AbW1kvb78AU_0HrrHV0OtjwO2uAvukZ8DnSGASVo_9Ya8_h5NunDjjnSIP4voz8
Message-ID: <CACGkJdtAmtxsPiKYUzLLmfNGf6oJ9YS-25ZY9VvEEWhz37Qx6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] syscall.h: add syscall_set_arguments() and syscall_set_return_value()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>, 
	Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
	Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 2:03=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> I link the concept of this patchset, but *please* make it clear in the
> comments that this does not solve the issue of 64-bit kernel arguments
> on 32-bit systems being ABI specific.

Sorry, but I don't see how this is relevant; each architecture has its
own ABI with its own set of peculiarities, and there's a lot of
(completely unrelated) work needed in order to make an ABI that is
architecture-agnostic.  All this patch set does is provides a
consistent way to manipulate scno and args across architectures;  it
doesn't address the fact that some architectures have mmap2/mmap_pgoff
syscall, or that some have fadvise64_64 in addition to fadvise64, or
the existence of clone2, or socketcall, or ipc; or that some
architectures don't have open or stat;  or that scnos on different
architectures or even different bit-widths within the "same"
architecture are different.

> This isn't unique to this patch in any way; the only way to handle it is
> by keeping track of each ABI.

That's true, but this patch doesn't even try to address that.

--=20
Eugene Syromyatnikov
mailto:evgsyr@gmail.com
xmpp:esyr@jabber.{ru|org}
