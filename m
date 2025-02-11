Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE021CA11
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280843; cv=none; b=YNzo5lIPE+cui9o3aBJE8WWkl4D+UoP0t9x2YlYWOeegM2v4DylRGSpGk2DNI6YFhtrVlzW722Ft98bOmzSAesdOmrK+JLHYqax3By3dmS3H+WFieKmm33DRxxEt60tj7NUgJObg1cvsewxsERnWoWrelEre1H/tDBiPhxQ4W8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280843; c=relaxed/simple;
	bh=kiPSr3n7+xyd4jM/lLYprUxePjslA+jL9wOlKC/+QfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZSrukhgDYL5UQXLY+9KqVTvcvJ4bKAQvTNNMx9Fwvt/qlVuTKl2hf5oXPJ0IeLhs6b85dexRmQqy2yU/bcb8tsYj9Fr67gp9G+VobfrCzxk9ojV3NTgGodqO4mv+mC04w3czJekUtViz0GRTU6fcaLxFAHhgi7j6pl8QLba4oRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHkMQsaX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHkMQsaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739280840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPSr3n7+xyd4jM/lLYprUxePjslA+jL9wOlKC/+QfI=;
	b=bHkMQsaXbAqETwX5H7rwppepRkw6wWVmG2XSR5vKzJ4fvyejDc1i+9qNeiHPMCcCEehJbq
	tZWZJQEtmbXOQw24MAEA3K4cnix71Pnof+swR4f66lt1wGcX7e1vQFOWE6MD0KLwNg/LXj
	rjBgU5/XJzFHhcIKuU3qUIw6ysaScfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-deWFq2mTON-2TpRxSPsTsg-1; Tue, 11 Feb 2025 08:33:57 -0500
X-MC-Unique: deWFq2mTON-2TpRxSPsTsg-1
X-Mimecast-MFC-AGG-ID: deWFq2mTON-2TpRxSPsTsg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso14665245e9.0
        for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 05:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280836; x=1739885636;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6rYC3Ttea935cxDKXU7eGhmr1cWrMQ3SYanZpPc/20=;
        b=tAbUKAB0jqcJ72A+11l44SIBIIUP02/tgn8veKKVdFujGZ6eSaGxvvT9taFGaMVNZU
         BSGQktzU/FFaA/U4AEtNTSQ6jBPzbJijrVB/QRGd2PHqRtM4V22ZtXmMbkvoIE2qBXgC
         XMpIePfijZDEDPXvAv9WyzTdu+yY2bHk+2ENDwxsZhnSztUP3wNOGW3oJFxlVFuMUVtt
         HuQSZ6EySkeMzsNSmOYuUpZA3cmphtf0SHpll5mgMg1t/TAZ2DhEpWqHWLAQGdxdHY7u
         7QoCr+OmM18Bb8NbavKpqVjZtVJRR8DQHp4A5QPKE3hQ8ZQQxg4GvhjWuDZb90Ce3/VZ
         3+dw==
X-Forwarded-Encrypted: i=1; AJvYcCUaR2G08RKu8QYkKAJwmY5AyDru1c7P7qMXGecYonOv3np9biW5QzsbEh4Cbf8vcrAPcTrb+2n00dg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSh5UW8aWUB6a28+0jmmZX1bjSoiF/LhcaaswiI7NpB7tiJ8Ch
	kPXtMKMYILMLVzKRvcwVaG1KwKAKsQHpOND/EaV6Q7Qn4ZUzWL0gkfUN5enZiHy/+l5clRdQoam
	PU/kvDCA6iv7pxSsMtQjKJqEp/ie0T13o9Kmub04nsTHH6fBu33fcTO5YAQ==
X-Gm-Gg: ASbGncvk+jxUzuwXCneruMsC4mCqiDmZyYeadWFXNfLYdN/BIKnfAXd82Cw+br1tjcg
	tmgaFgHfHNPWABN0E4fJgr0OSCZ9uKr2k4wGeC/e/cxYsGhQjFmwDaSuRLhVBHFaQCXQVhqwenV
	GgaxllQZlrpI599Hlhc3C9W32qYslv+02aYlrkzYOwu4CCuu9TljJ9bm5mWOzXh3/2JXFeGrS5M
	gjDVD9evnbbNgPs4n0wAOT+h0wIayb9VmGsX0TgYkpE97ffJxGfzXPsrXonN2SL9mfhcm60TMd4
	hCWvdUp/3VJVwd62YyGE8cBKX5ae7ced0Vik3Zn/ufnnB/xrLd64JSMGFZAosy14Yg==
X-Received: by 2002:a05:600c:384c:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-439554ffb3bmr21891585e9.0.1739280836471;
        Tue, 11 Feb 2025 05:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLaJ199QatUt+F367q7Ky9NspQydjwYuxDlEpx56Dm3c1ApLy01ntC7qxuc1s/8cawIiMmnw==
X-Received: by 2002:a05:600c:384c:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-439554ffb3bmr21890805e9.0.1739280836017;
        Tue, 11 Feb 2025 05:33:56 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb88d5e6sm11688621f8f.1.2025.02.11.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:33:55 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
Date: Tue, 11 Feb 2025 14:33:51 +0100
Message-ID: <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hlsUkz2i1uZzgTCAZgpgI2UZ-uZ3a9mob61Z23m6dqE_1739280836
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/02/25 23:08, Jann Horn wrote:
> On Mon, Feb 10, 2025 at 7:36=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> What if isolated CPUs unconditionally did a TLBi as late as possible in
>> the stack right before returning to userspace? This would mean that upon
>> re-entering the kernel, an isolated CPU's TLB wouldn't contain any kerne=
l
>> range translation - with the exception of whatever lies between the
>> last-minute flush and the actual userspace entry, which should be feasib=
le
>> to vet? Then AFAICT there wouldn't be any work/flush to defer, the IPI
>> could be entirely silenced if it targets an isolated CPU.
>
> Two issues with that:
>

Firstly, thank you for entertaining the idea :-)

> 1. I think the "Common not Private" feature Will Deacon referred to is
> incompatible with this idea:
> <https://developer.arm.com/documentation/101811/0104/Address-spaces/Commo=
n-not-Private>
> says "When the CnP bit is set, the software promises to use the ASIDs
> and VMIDs in the same way on all processors, which allows the TLB
> entries that are created by one processor to be used by another"
>


Sorry for being obtuse - I can understand inconsistent TLB states (old vs
new translations being present in separate TLBs) due to not sending the
flush IPI causing an issue with that, but not "flushing early". Even if TLB
entries can be shared/accessed between CPUs, a CPU should be allowed not to
have a shared entry in its TLB - what am I missing?

> 2. It's wrong to assume that TLB entries are only populated for
> addresses you access - thanks to speculative execution, you have to
> assume that the CPU might be populating random TLB entries all over
> the place.

Gotta love speculation. Now it is supposed to be limited to genuinely
accessible data & code, right? Say theoretically we have a full TLBi as
literally the last thing before doing the return-to-userspace, speculation
should be limited to executing maybe bits of the return-from-userspace
code?

Furthermore, I would hope that once a CPU is executing in userspace, it's
not going to populate the TLB with kernel address translations - AIUI the
whole vulnerability mitigation debacle was about preventing this sort of
thing.

