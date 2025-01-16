Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B122A7E5
	for <loongarch@lists.linux.dev>; Thu, 16 Jan 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033777; cv=none; b=gOL/Jb9DtLmkVsR42zaiJyM+qfTTm0Ep90zSTCiWPU5bO8Z8MhZ34+qpd0KIXvml3tQUd5q3C0I6VpyKJNKLtg8gcNJmoQoWDKX/ydTahmxHEVySklxP0Tf/VjgmqZ2sXRwn0hRha5l7xuofRfjDM/J57uivO98iMo4wdjBL0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033777; c=relaxed/simple;
	bh=SixtGEHyx0Ll20sNHrYW42AzL6XqkNRKNahYOvra4Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abX5ILykjcjlE9eNG6DzbH5O5MoTFZFZIMmKYuDPYK3Z032dYPZ2Y4t0+F6+zNW4z6XQkuyksYaSQzqMEfeeZw1vlrBb2ib6wQP5GxBXcnM3DxAyjN6dLGwBDoOKvGni/R+uYpZJGND1DtmokFTQTN8aqDu00GbSnHU5z7QoWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKMFq+Ar; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKMFq+Ar"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679b5c66d0so194631cf.1
        for <loongarch@lists.linux.dev>; Thu, 16 Jan 2025 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737033774; x=1737638574; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SixtGEHyx0Ll20sNHrYW42AzL6XqkNRKNahYOvra4Ow=;
        b=PKMFq+AraTsiZumBCdvywY5KcMH7tJOIpt3HhS/zi6p9IqPq+Ma4YW7hrvp7mt8P0K
         ew1Sc00T+1nk7BqEmdkfOcU9xA1C4bwx/7E6MZWN9QWd3EJXHnxp+t4GTBGuZaL+Wln9
         AbVHJd2mXADjN+nNL/C+wjWsfV7eS5qGaYoE7A8LyYotzhxhba7fViBiWpx+ROzw8fQq
         S05Bp9JZuLeSrn6+gmqriuxQjLFUlCMnlnvZenMkYLODd5lOZeXqEF4Mh9yWU/UROP/6
         JKWo0E7hpJ6T/H1cs05aKA2vPGcOVVHQrFxJgUnK9Z+vTDv46djgTmLgk/llYETfjCSF
         49EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737033774; x=1737638574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SixtGEHyx0Ll20sNHrYW42AzL6XqkNRKNahYOvra4Ow=;
        b=a5BBZnsnGVwzXLeAyCIYnb7Uzd+IsDYZjtbhW7DaBs1j3BFOw+CxS8Rlf1QWs0LDMr
         vHZJ0dWThgan7U+9gtyJ02SOCu1uMS2FRLp0sdE0fif0IRUscnz7IxAkE/tQ1i/OBxng
         1U64MLGfFbGQCJ8Ht7k9bQum3V6GW8ozFYRJnsF+2eWcbLOiquq0IhUwxjFgxy0LEiL1
         z98GEBUGhJ8ftRQIoUsFbuPTlcWEKtVg9KubJV+naPlOBZw0C3WSEN+MGTkyjs0rKWl+
         NB3lWRr3pjGHEpkabip/bhs2llJXEM4riods55mDdyjj6Z2xIOiFFvquhDER7Uxuuq4Q
         5rrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0f8SV+7m/92bC7fihHZHVx+c0PUVtW5OumCsJ1dfizkT7js5IzYAp91/EOGpVuD6Yugdd+z6wH3w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yywt8AC+iF89RoslcfAkU4uTOom5DyHM+5SNa3ta1Z5szjjsD0O
	+pm9zo0GNaJErba1/HYTZZT1zRvBpnG538SxrBMU7US/GmpYG9vYSQqAXGJMu6ML+9qqVhJMoaw
	I95k6RxI7YK784Rl186urPSosRZXSVzY5SZlv
X-Gm-Gg: ASbGncvt0M6zpBypRmJw4dghyMCuU/FlkzHZM3Fp/yCfSD0tvedzRjN18MY3wVU84Ar
	sMOg+bO/qKYWXl8UPC53eJ7rL/IiBaCRwrOM9bFW/u2/+UppNhkzjgKmoca3nOwo4dqg=
X-Google-Smtp-Source: AGHT+IGgdmm3+dKyYphBOJrkDF9RqCEL6Tsx6LZHIZIcfENKNOrXYM9LEzERENIX0F6hf0/LX3P/eN8RFihp6QDk6j4=
X-Received: by 2002:ac8:5f11:0:b0:466:7a06:2d03 with SMTP id
 d75a77b69052e-46e0545796amr2768561cf.1.1737033773706; Thu, 16 Jan 2025
 05:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-1-8419288bc805@google.com> <20250116001858.GDZ4hQctZe_PFvJ0AJ@fat_crate.local>
 <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
In-Reply-To: <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 16 Jan 2025 14:22:42 +0100
X-Gm-Features: AbW1kvbCtSg9vNMeYe9Cs6fkL4An-kckhSPmCiLhYkfVvSqDDbiTwg4NAXTmVUM
Message-ID: <CA+i-1C1sXC1tbo9ytuex0eBD3gUbQwnNP8rvOhCv=JV+oSHo1g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 01/29] mm: asi: Make some utility functions noinstr compatible
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 01:21, Borislav Petkov <bp@alien8.de> wrote:
> > Unfortunately Thomas pointed out this will prevent the function from
> > being inlined at call sites in .text.
> >
> > So far I haven't been able[1] to find a formulation that lets us :
> > 1. avoid calls from .noinstr.text -> .text,
> > 2. while also letting the compiler freely decide what to inline.
> >
> > 1 is a functional requirement so here I'm just giving up on 2. Existing
> > callsites of this code are just forced inline. For the incoming code
> > that needs to call it from noinstr, they will be out-of-line calls.
>
> I'm not sure some of that belongs in the commit message - if you want to have
> it in the submission, you should put it under the --- line below, right above
> the diffstat.

Sure. I'm actually not even sure that for a [PATCH]-quality thing this
cross-cutting commit even makes sense - once we've decided on the
general way to solve this problem, perhaps the changes should just be
part of the commit that needs them?

It feels messy to have a patch that "does multiple things", but on the
other hand it might be annoying to review a patch that says "make a
load of random changes across the kernel, which are needed at various
points in various upcoming patches, trust me".

Do you have any opinion on that?

(BTW, since a comment you made on another series (can't find it on
Lore...), I've changed my writing style to avoid stuff like this in
comments & commit messages in general, but this text all predates
that. I'll do my best to sort all that stuff out before I send
anything as a [PATCH].)

On Thu, 16 Jan 2025 at 11:29, Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Jan 16, 2025 at 01:18:58AM +0100, Borislav Petkov wrote:
> > Long story short, lemme try to poke around tomorrow to try to figure out what
> > actually happens. It could be caused by the part of Rik's patches and this one
> > inlining things. We'll see...
>
> Looks transient... The very similar guest boots fine on another machine. Let's
> watch this...

Oh, I didn't notice your update until now. But yeah I also couldn't
reproduce it on a Sapphire Rapids machine and on QEMU with this patch
applied on top of tip/master (37bc915c6ad0f).
