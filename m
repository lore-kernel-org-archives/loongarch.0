Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BA2ED145;
	Tue, 12 Aug 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996869; cv=none; b=O7mI/dMe7vZiiqWRmYDabkkscnBdGoDkziEE0wMwcSlIQwc5LT8qpLjPsFdeGP3UBHH7KSX5Kyw0J83lXoSd8RE75LC2v9Ir3Ntt5HacqBgCTnWCndxmqRk+0aoOF53vK6NJorNMbaQeejGZ79Otiyde2mzHDsGaX9r+tUiF6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996869; c=relaxed/simple;
	bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXt6qnyaqM9oTWgDY7v3lowa9uqIxKYzDTiOooTT/gBfW65Y2gC0DAjruZppDAHuZNtfZ/fMzxwqiridGaawPw2HZRDQPHP9wVYVHUyK/B6qsqNGM8Rm6LmjzGczHh1OB2r6zGNvRDYbJcbfBSZn5kEFQosLNkDrMSJaxd7kp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHNg7rhT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHNg7rhT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-242fdfec998so1097695ad.1;
        Tue, 12 Aug 2025 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754996867; x=1755601667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=YHNg7rhTvWwmwBQxbBrlSmpapElbHqaODmGdhJ0HL0Sq7Bhun/zu5G6spfNu/N3v03
         mx9eGYTFSZhEO0Y3IQMbkpy9xQSR+/yYBXZox7HOlQcldkEZEak2VTQ7g4exgS20jZfC
         4IQjusyjgyuKCbN52wEZxUZGYush4IZ7Hbw6YBKq/VwSHJhGcWgd63DW2QhTtWeGk7uq
         wc5QpAFnDCFCQon/GJ00h8p7rBhjcP/BCFpEZ5Lcu0TxMrGobCwnp3uE6HEpTf9e3Rb/
         hZIIruiDZDyxQXPgcl3BFXAAnqQbiIHwU/ToB/e1ebdC8mg6/ENO4v0tWbGnGPtGhq3J
         FlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996867; x=1755601667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=a+l7bl5i9mtuUsPO8YGWzrSH1b1TwFgwebEkU5LXyYKNJitCjqMuBkw+Exvoes1A4S
         Y2in6yGds+dFsh46lJG3g2Wlceq5t9iYz7Er18iwBPbZoWXoHCLbd23izBaSaIEw9kvd
         76wFCeBktCmCs4uCgO4+0YbsRGlRv9ICyUxiSyt4/jsCwQu8to6olWUEYC5JG5oH0zU+
         HKit2aafB+bB70DD4Ea/K9CvaLCqrdSBIci0tMwNK0c3QIBfxY5geCk5vvf2Bq5EOn9H
         5vNNj8GuaiqDrjuaNh2FNlgnDR+FregvQbBBJdWvL9d9duxZpHg6R+qTcoMVmQQZve9U
         7wJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/iO67iRFBcHD+sg99xkRGuBx0nRgBpeIK6J+4pHENJCWAm/Vxj9Hkxm8Dd63y6LKReCwX@lists.linux.dev, AJvYcCVzg124B/3jIYmiVmBU1xoXEr/p50nsUunbe7E270bTEQNbV7G82iMVtrsG1Y3tS5JxsyCG+bJlwYr4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4+TUbmjaBxdDt0O1Z2ou79UVfcKdL911bDAPUN1B98rM757LH
	5VV0a3812bgWcajEAMrpyyppSNzNHWjVrZtZVbFg3utR3GL0Hpu0oYpH7hxOxerFNMCUt3xMVfI
	/lbO2nse41Uwby8IRK7m5xqt0xmfgOHY=
X-Gm-Gg: ASbGncsyGZ8n+S/qL+eSzENu5JP1Ug2yEP+eTDBFEO+sgCwp2zRPr3QUr2s7Vw/t/Q/
	3o7o9mHXNO5Iw2a5mz4PzozSz+a7iSg8p9Mfw74Bw0tRW44/QlEYx9vLvH87aULz6I/aA2pR8mk
	rNfcg3X5FHZYI1Z5QXpDSviYISwnJ4/IN9ExyCFsgOz0RPrX1qIRbpXjI1SbH4AQO3Ko9vzsIWG
	cehSj6LnXtpAK30NOM=
X-Google-Smtp-Source: AGHT+IGLTgav5Ly0pJQ7DxONlyuqSGpB75/R07ZLvB4KvAdVZt2KEevtP/u+Z9PPdrxzblYTwfgzUXYmCR2PQbfj+a0=
X-Received: by 2002:a17:903:1a70:b0:240:5c13:979a with SMTP id
 d9443c01a7336-24306da5537mr4831165ad.9.1754996867136; Tue, 12 Aug 2025
 04:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 13:07:34 +0200
X-Gm-Features: Ac12FXz75fv-5GwEH7lTNJ0yhooMj6nwQ9IaaKPBS7pSI2ZcZDdB8Ex-5Z7LxRg
Message-ID: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 7:44=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Kbuild and Rust folks: This contains custom definitions of hostprog
> bindgen and rust library commands.
> These are currently only defined inside the subsystem directory.
> Let me know if they should go into scripts/Makefile.host.

Glad to see more Rust host progs :)

Keeping them local may be a bit easier initially to land, I guess
(e.g. no docs), and then we can generalize when needed later.

By the way, for consistency with elsewhere, probably we want
`HOSTRUSTLIB` -> `HOSTRUSTC L`. Though I am thinking to remove the `L`
anyway since eventually a lot of code will be "lib".

Cheers,
Miguel
