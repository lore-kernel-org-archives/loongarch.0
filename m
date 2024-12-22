Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F513C9DE
	for <loongarch@lists.linux.dev>; Sun, 22 Dec 2024 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847641; cv=none; b=sLL/N9lBNGYWDrYsfD3BoVwAAEYPHNO/l1H526d6ryT7HD3eMyZPj5Ee1/SlW8xVN1Xz6rzBiFzGZKOaVKdbLOoyONrzK2kv0NmBZLUYKCfhOqXguODXuhvnUM5RGz/nDcO6q3gmZansxc/ee9tIseHP7VAi3cOKxfzNslpp6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847641; c=relaxed/simple;
	bh=ZI7mtoNdl+3R+xCvx6C6G12E13skabgOFMAvirAjF+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blWHpgKaDL3HwuGj+qXmB48ePz/9NL6gMqWyW8FxyfujIZmY3EGyGAcjpXp7unGXjvoIL4Lp/BpnLwF33d2GjVHhJQFBtc0fhNQvzBFjlhvNuYPByDl3wXwmM97NPraH2lKxubjsZWsF+FjyWGgXKnhiDXTWrXBG6X9wI6JO7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bskFXfFN; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bskFXfFN"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so3434403276.1
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 22:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734847639; x=1735452439; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=bskFXfFNUnPxWxPEB/UU9lDKwjFC6fGdPk/37vRA0HPzYmFAgh5ZSRKhel6BmSgLdp
         BP4F3MCrJReqACHnpgfp4WlDH9BsV7n7JA4Wg0TU+VdFYbubA5RReSr3IUAEfQwURqfo
         cgIt8hviLNoJD1b7Khjzr8dg4cRxMCVn6CD8eTlCMx321ck59X7Gd1CWvx9d0Xl687Kf
         shK+6S80Bi9LvgicXIP4giyIlYBsPZGM0iBe0ixTGKyIFeCx8jYw595jox9EQtz6N7QY
         33UfGrPUc1SHvyKvml264Iw2645CXJy8qoJLD6S7OOiAkZFIGMnhTMmW23utjRt0MkT+
         NVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734847639; x=1735452439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=Nzu8Gk/Hbl0OoJet1Z9HbENT+C5cJohm8cZpuSXbEeEaCYJZ9oOjmbXqWmwUs8JZ14
         4Zwo3FdksDn+Fli57RZykMdj44UI8PfLeltG4Dq7bA1wkuOmiJc8n/OADMT3A6wwXJkS
         PopeF/t5MK+RHiTtTBKKtK9MyIK4D6EUTro849h+dWoDm5cnsJrHJp0Fhuu8/3eQq3VO
         eEL6owWu2vuCP4o0Mq0gb4AcDMuqVBMXf2VIdeadcK4bSY+BiE41vOB/I71yvwzInRbr
         LFFyyitLWWcTP4QACIFhIhqqN0IGqNPwstjdd4loLyMb1aXlMirDBTZ5PkBOjdNiVLgx
         yCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIpnEWfUhns3Ufs3IYtet0GIZ1whB9XWVz2/V71wICVBAaTXzpEmddMqLMH21DvVENNAxNdmsLPgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwI/ofwBeCQtVVfZVb40U3PMDe3ziDkiCbKbRpRPkcII/arEiGV
	rKRhugzZX6DDsE5pQPTQ7SjyyqnI/sW2wEG4LCuOqVeqsZZiVGkCQ3h7D+lvu/uBDjzhkE3d/1+
	PdPI29In1CgPg1wBZ02yPAsLko74=
X-Gm-Gg: ASbGnct7FBdrUvNPs5sGmSmERNPpewgs6Gy9mhR6d6njdujy1TmN+ubgP0uOU11t6e+
	CMBVWcgF/p4pfHxqklEggP7ptvWjDmGVGyB2CDTM=
X-Google-Smtp-Source: AGHT+IHTObibTWvFBx2RCqB+bk/1ZpT+xydtv33cOquvAas7ggMPQiaYSrqKqDsv5/UZU90VEPoAsSH6qDx1lw2KYn4=
X-Received: by 2002:a05:690c:6908:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f3e2a65668mr105552167b3.1.1734847638651; Sat, 21 Dec 2024
 22:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com> <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
In-Reply-To: <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 14:07:09 +0800
Message-ID: <CAOm6qnk0KYJXuCLU=7Y10wjMjWnUQ+n_RDsJZv5rAqBmq9bkug@mail.gmail.com>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xi Ruoyao <xry111@xry111.site> wrote on Sunday, 22 December 2024 13:51:
>
> On Sun, 2024-12-22 at 13:43 +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > ---
>
>
> Please try to avoid bumping the patch revision number so quickly.
>
you are right,  I'll pay more attention to this in the future.
> And if you must do it, you should embed a ChangeLog of your patch (below
> this "---" line) so people can know what has been changed.
>
The update was indeed due to my problem. CI prompted me that there
were some compilation warnings that needed to be dealt with, so this
update was to fix the CI warnings. Refer to this:
- https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/

> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
