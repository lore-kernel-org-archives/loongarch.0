Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709319AD73
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728545315; cv=none; b=ulvhR/8ROO+0GIA/8UQLQmPkZAPjk1RgYvhXRL2oFl79MQfpj7ffr5osClPd8T1vUCK01fqef25jdr/hGzVHZt7U5mxegQPusWSbmPHG0kFBF487aMsD+/4wZZ49awnAF4WA41YxdpehSyeTVRxKoc6qZqG4Nirezen/x4cPeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728545315; c=relaxed/simple;
	bh=l3tvN995WrTW85WorpTc0P1WzFKQ+3NtgLmALeDmXf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuEyChFf6OMkhKEkU900A4dTgdzQAMgNENQAMyx8oMFV3J4J/l/NcJqFW+Phzo/x/Tmpr+/LrUoF4wK35Wb9caLaR8+eQ8VCsB33ZdIhTWCEOjwy05SuKJRWpUqrcTE8Fugks7GGv9uSF63RI/xARVPXCqs/kxYNcIszzaYPtCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c693b68f5so5747645ad.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 00:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728545313; x=1729150113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cEkDPRbXErPkgoWEGdbZCw32b468GFBk0qa08gpGWY=;
        b=ViA3SybXbV25qHOEXPllmeeAyvOJAOcVuVTt2f14qBfs5HJ6/s+Oxbk286EnQ+Kvrs
         Cn1ERzTGgCJk/2U5lUOmkhvFny77F+Kp9sByOMAi/XupX1aK0G9EboGXp3BTGFDzGE+c
         gdgTYM0SI3rNWaQw+Wz3vCzQKYVoMgdQk28EXwpoF2HIZ9ZF/Cd97pPQxJqzIpezd5/6
         5NlN+K35Rq2VagTmX3xuGzYTweMMW1S1t1yMhNrGBMuGoE2XX6rVFGHBJPj0dgvXx7Ua
         fyJlI2Yke7j7r0MbJiUp/dqlxWnD/wbBZXt5BujeC1J4+/MEOtaeID3S4ImiEXChrpw6
         EjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrZSOxbd8TLKa5ihJP40217eBbydn7FFHBFlzfZKnOQanvvTfPeDKdZDBkrPSPQOlWTfDqYnoVLAk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/YMplxupdFTYSZ+y7thslrTh+mDCqOi1SeX1eBGE1ewnJZ8c8
	eiRG9aCN/LjzJDZfVZcMV5SdzFXqkichamoyyAt8pVRnsGlVXS4m9FyOogFO
X-Google-Smtp-Source: AGHT+IGuWtqHnNJvHiHpLVzSTqBfuOfL7NOOMFsD4B39E38+6p6fq5+1aceoEwa8kAi1xiG0RnehJg==
X-Received: by 2002:a17:903:2450:b0:20b:433c:5833 with SMTP id d9443c01a7336-20c63734942mr66149025ad.26.1728545313006;
        Thu, 10 Oct 2024 00:28:33 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0f1cbasm4543445ad.169.2024.10.10.00.28.32
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 00:28:32 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b7259be6fso6396835ad.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 00:28:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfvQV3UtX26B1FptvPz04bBdHpnexEvtIsJav2P8dFpUF1bkQerqw1Jyx5byGlX+mJvh2kfU19jkc=@lists.linux.dev
X-Received: by 2002:a05:690c:60c2:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e3221867cemr55553697b3.3.1728544955686; Thu, 10 Oct 2024
 00:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-4-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 09:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
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

On Wed, Oct 9, 2024 at 8:09=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
>
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching=
.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/include/asm/Kbuild                      |  1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

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
