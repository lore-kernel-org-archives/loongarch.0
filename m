Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED7633CE81
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735168; cv=none; b=I3Z/4Ef9MKmgrr44U6fo1z/LvmYHqC3HTXf6I5CSR8IUfK+rLNsiZy+70F54Fmocqr9Cu86hl5nhMwihKsSa5HSKSed3XuXSw0ep+Q/4HvzAiVZH9uEJWNJmVZPh3xNddquhxWPgwO0oi4SJ0CphJ418yr5PxeswVLJM6GRM/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735168; c=relaxed/simple;
	bh=oUIhwrLYwstlzlY55FK1ZW41MS2asLYsST3xVM4ctTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/NYW3kPtPsZKHydZriPSjZGreeUY0zC9fYexHtaW5mg5iLGh59XVV7281wypNFoN10cMysCEA6RqsqDNn9nZG7HASbFK+HmE62JsSy5itVDHsUPZbqNHZPNOiLtkBnTL3kok3bjwJwZjXjwhb22uJDMl/EMbvejVnrK3AVBAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3196b9ed1a3so1020663fac.3
        for <loongarch@lists.linux.dev>; Mon, 01 Sep 2025 06:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756735165; x=1757339965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmDip3pK7R1bCI3jhASK9yPIU2OeMFz+fVnQvMU5RZM=;
        b=i9qqM1m5EPXgsT2ENzz/WWZcoREH07PaeRRUHeCCiB/+b0aqq1LLGCx7W3ZRH++aiw
         /fvNArQ6FaCcnpzhfqSit0S8oxgvAItgeX9g7KshgImSItZpEUhkt6io3iae9th5GB5O
         wKYwFPloksKc4ZYo9FrtM01lQppsuxB6D1MTXcmYRggRJPciysNKtc8Y6gf2wDQegVd2
         jH/E4SlP1mx/7Q3GjTyLbNhsf5mnXLWPwY9M1gi9GItOnPmclGAgu4u+e8jyBfSV9Qvd
         n6L6sjwxDYDegnJQE/V7YYq4m2mhADghmpj2ZBHpi94jt4u46dYG1hVNSyIfJua5o8Y/
         jrcw==
X-Forwarded-Encrypted: i=1; AJvYcCX779GE63fHjwMrvSpyBVUV64ll5rYjr5zVw5FDxtiDKfPJ0jmpZCiVlVQasZLP8+g6bX1HOM2SOMA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf9lMM+MGudJSaK0jhnS3YRh32Zsmtc2C63LgwAgMVt0eU20Ft
	3FC/c3wANyii8kwnWhqPLJjub4dKEM6ClyvvBRexRQukCce4X1n2GpMmFSrRWZrWp7c=
X-Gm-Gg: ASbGnct6uFjyBsHSIjJWPSII9ErxoQcUZnjIXg8UXC5Yv95KuohjZCmv2F3e+vSOe3b
	fwsbVBrOzgFEOZ1ulPtef6LZgXJUtL9tbRkwh33hfR6EdoM5noN6o3ii8yQ008Xrnyi9I9cL9Tl
	ZSIwkq8E25obP6UCpE34AC3vCFjNvXh7Ik2z0m4BHiaqsEkaLleO9bSbiqcTpDmb1z8aqvnNtCj
	NbHC5zVvdzT9F/9lvPW9ePesfgJJuMKzSkWjY41QtX3datXzRLIHiAE4YIcAN+AeAigtSD+lgvs
	AKiqvUe+/+A8zbMW4kmNjT8yFn7SJSMA8N1jvk6jXfrTC1Uwb6OdkA0UVhwIJXxgcjaoUAcNTTj
	8BBArtM5MAveZnO9CHacjEpDquH6A1gMEAfafvU7VnCAhcaMg+mTqMi2p9eBk9jRZLU25Ha6MIp
	QgSCxSfg==
X-Google-Smtp-Source: AGHT+IEJpV0mttEurXbbIRdWRcuuIBBzabJFMzbhMRuYjxySryeYN32UzW3PgkQYAaOmKXkVoP5lfg==
X-Received: by 2002:a05:6870:798f:b0:314:c031:926a with SMTP id 586e51a60fabf-319631b55b6mr3079272fac.19.1756735164736;
        Mon, 01 Sep 2025 06:59:24 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745742a6716sm1029202a34.14.2025.09.01.06.59.24
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 06:59:24 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-315a0b68314so3799162fac.0
        for <loongarch@lists.linux.dev>; Mon, 01 Sep 2025 06:59:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVzTOw7vahCxxCnAe+DmmOPzA2gC68jj+xvBmyJ+nGaFXhGiwI0Dx8ees5pJXdyOEX/to3rGOiWrs=@lists.linux.dev
X-Received: by 2002:a05:6102:3053:b0:52a:c340:11db with SMTP id
 ada2fe7eead31-52b1bb24afcmr2206016137.27.1756734711158; Mon, 01 Sep 2025
 06:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 15:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
X-Gm-Features: Ac12FXxyJUafI_d6iF6chcUi31LuXt_e8cojxsF4wFcxCNHCg2s17r6RQqbjdms
Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
To: schuster.simon@siemens-energy.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Kees Cook <kees@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	John Johansen <john.johansen@canonical.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com, 
	selinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Sept 2025 at 15:10, Simon Schuster via B4 Relay
<devnull+schuster.simon.siemens-energy.com@kernel.org> wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
>
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
>
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
>
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>

Fixes: c5febea0956fd387 ("fork: Pass struct kernel_clone_args into copy_thread")

>  arch/m68k/kernel/process.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
