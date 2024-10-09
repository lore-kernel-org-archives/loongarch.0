Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D519923C
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512633; cv=none; b=ZFo8BFFJTy6kc/8ZL25UxCnTBthkV7yoiGVu6a9s6EBCleeckbd4w9UGshJWOPY9C1oXc1rSEFNiclMpNrXhBbV2irQH+mYaiQIPvrOKDPQVuL0RNPMV1c7xe86nwfpPgXHDcu7/uliYIZKF3arUQln6RyucfWHpiMlghB+yP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512633; c=relaxed/simple;
	bh=w4l9dzDzlilO4E+6HL//zAT4zhaj8ld4amfc5zECEfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgZFNti6Cp5Zfvo74gnk4Y8sLJAE2yWeVysachcCehMVU98fZPCD6GG8MhgZ7YuMkXblZpnp/uSOOh6Fmb/P8mNrKQwAZMewbybzD/XACx8v86FzAZG7HvMag8xUwjXsZowwlyicC2jB2InIeWDF+mHEezf9NUBZfSYXQMXOLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wiwa3rlr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wiwa3rlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69701C4CED5
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728512632;
	bh=w4l9dzDzlilO4E+6HL//zAT4zhaj8ld4amfc5zECEfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wiwa3rlrYH9BC46EoCHkt+QLbJoTT1X2QA01HAqIYKjAte3oUq44GaeL+zZ4AkJ2c
	 2fmhTarWCgJZzvugjgiXFaapdrUxRw+aMHjQkxk7R7tMQ4X8TAISQfJF8mwZjkVS1k
	 P8ckfmO9JeSeyS8x4lu0kJaTjkOtHpLIIPYKJmo4HQ1/9VWZa6uO3ff20ntiwcvv+8
	 WNsOi1fvz3WyQp8/mTsIKp1bTZX1Q46ddgghD/obeQF4nyOrExSGPC7njchLh/Wo1L
	 w8uAfe7NKlqBlMlX1oAMsBsi5zUdQStu0GaxZpBZ0z6hB0R3qZA3l0SEImsa2B3CEC
	 jNcMMmsZn1/Ag==
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-835464abfa7so11192739f.0
        for <loongarch@lists.linux.dev>; Wed, 09 Oct 2024 15:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuGl1wJdHWl2E+/TveHtbvR3AFQJCRRAetf3Q5cSsMPW9fpDWmFymWPSWV6wI+7EO/WRE6zwX57XA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ6MtxnpDPcPyBaHHa+4qVJMT/h3x6Y07sL/z1mfYhzmFrllFq
	RW7jUKU0iuRA7c5yAcBQgxboNXABRVHAvHYoG6WqJJkcrm5efUPf0oPmdYSK14HI8qvODZQkzgt
	Qvkct2u6wLr9WiT7dG0RPMu75udM=
X-Google-Smtp-Source: AGHT+IE+0c/kMVosLTSGHy+n6QvIYJcOAn6W5BXDQkMmjF/nhxZwOJHSZ6SOjh26Vu9mUcUiW0DFRwoy/+Y0vdg6KQk=
X-Received: by 2002:a05:6e02:1fe6:b0:3a0:aac2:a0a4 with SMTP id
 e9e14a558f8ab-3a397cffa21mr40549325ab.9.1728512631542; Wed, 09 Oct 2024
 15:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-5-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 9 Oct 2024 15:23:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 88ecc5e9f523..7039f609c6ef 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -367,6 +367,8 @@ enum mod_mem_type {
>
>  struct module_memory {
>         void *base;
> +       void *rw_copy;
> +       bool is_rox;
>         unsigned int size;

Do we really need to hold the rw_copy all the time? I was
thinking we only need a temporary buffer when we want to
update anything. The buffer might be much smaller than "size".

Thanks,
Song

[...]
