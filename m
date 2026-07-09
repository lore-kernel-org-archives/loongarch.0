Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BE3E0241
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586957; cv=none; b=V+NInupKzD5hPLtoSFfwP7xUwQ2fSRhj2uuNFsPEZbLSIu6iwJE7KBPgiMZ9gVkouEYLvPqUalJMhCVvisAsrRVzp868BDY3mdG2nKeUItjHGeqcy293IlEosSd0oULESD9jtVrR9jC7ytR6CFN3pW1S23RtlT3OYiOgM+fzVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586957; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcIu4iKsjgWNmrnU35XLo3gKUfRIRYEkTPhZrCGJEZ5eovdrATMky2pgUrL0pkQb3ByGRGREq4G/BD3nl0mRI+bNQCDTQHZDkrSVAnP7leQwyMTLF2m+8bKXtWbwAW+jV1NIu/JeQytLX5tkETN/P5ZUnZSXNIqjRRGOz+yCxTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so1584223a91.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 01:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586956; x=1784191756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=VP/nkLkPJIGCWY56jTnAf8zX60PkAw52ZEO1F+h/I+/cIiuOERo4tZuMfrzzMnsZKZ
         Qh3K5FDnuHdPF/G9FAVzqYUzYAOOm8XLJ3aSV6uhvMo5iYuJtoacxnML1P+C2U3Al2eb
         fSYdS74Zo9+BpqLkfjvkIOv4lhLOlt3DlqrnxJMgvWHEjmVssMX/6X7MLgGRFb2ehOex
         tb5GklyF/NBpFQm4nUu+CJN2df4IRoNHsU5NS/GG2Mzm9q/HKIkbdJRJNl2lQ+H296C1
         mCse0xLBtbgj7St3gcSblmLcFhHfXH56oOKn6utC+PYGwdzdzlfdr+BDDBpnlUEwt5E0
         A0Xw==
X-Forwarded-Encrypted: i=1; AHgh+RpmM3dB9NPIe0kTdchTl76gAKjYkW+XBFBabJNkjRHzjTW7v+0KiUPJ86Q0D7cBV+El/WpZmnAYWKI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGrLerVFGBuoMK2XV6z88fhQl4ePJZDr/r+jWRrWEd/eMirgV0
	TN1Ab2hDNrd54hB9GO/mh2T8klJNzOwrp12RYvFeonKeW5tUODzyuGaKfjjRpi4wOWI=
X-Gm-Gg: AfdE7cnIikrelkH4vardbTEfReVyd+JreivbSFyYKfskGiifNKsYQ6wUh7eqi5/6WcT
	ilAOrjXQ+JULbNl0ebzVGAdG6SNOT2khAR6e1oXpb3OJEdpV4XXJpytfFcjbUH1XfbAKtDmBAfg
	rW790pP6Spwl0UADdjxtZa6tL5e5v5JZKdnbkA31zzn7/Oq+2C61qnvLvtBQlz0D4GCDvBytfON
	6Bg4I7dK1BKArLxIMI00hkAMsUnrNP7R5BXZMrJjwRWMSH4mRlK7O5N4AgxJq/keqdkkqo+4Ct9
	5SnTtVLR9lBXsTItofXPfdKSYKmj0Rs8TVDw0081wR4kx3HLwlGagDifNdO6F54B6NzcZ2c5J0E
	zYgZ2rB9B3QopyAfReKVFDmxiggfbfJOS4QmMtoVfFMZCEakIbto3hS2+VE2IOS5EwhdRNTb3Gl
	5EEdnWKoo9UMNYa9zzW43cDzPKIu0o5hRgJ0Mn9CH503CS9vzjKdWEzwYTWtyJFYvF
X-Received: by 2002:a17:90b:57cc:b0:381:720d:240 with SMTP id 98e67ed59e1d1-3894063c1efmr6122922a91.14.1783586955665;
        Thu, 09 Jul 2026 01:49:15 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a583a16c2sm808016a91.13.2026.07.09.01.49.15
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:49:15 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848643382fcso147504b3a.1
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 01:49:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rowhu1iGSZWA3vL6Nypnw9wS1QOeBoNIWjpJhAJ5p179sf6mvAvPcezJKrBu3kqYbioCki1TMi41dg=@lists.linux.dev
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
