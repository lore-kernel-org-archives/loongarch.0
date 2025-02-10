Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6325B668
	for <loongarch@lists.linux.dev>; Mon, 10 Feb 2025 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212596; cv=none; b=u5cSxZHqDQQdKMr/1gxO+sJpkGJa7OM4/Izsar7IL2RXYEfyB5cVO7+VnE1jVxeFSuJBlFyYJcKqRtbyx+KoCew+6UbWFqk2UgAxkenn4nRuRScDmVo2i/KUD6ZOcs3jOaf9hb8IDbo0dmgSuKHyqv2+VFfExEAv2CDonyM6Yco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212596; c=relaxed/simple;
	bh=pqE0jHaMjhCJShfdzgjb9zITCwMN+BQSAsP6fR/sVdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i9TnLc/iYilkMx/8Gpo4lBrVwCwpPqhXD0cGHKOkKyHSSKw+bfI5ApkrlpjGtQedaDw2bAGw6AMgc7rOtRff01bj36epaJhV3RjfNrFDQrH6IawozQV7GVA+cuOolwSLW9IgYDXibzpwx0l4l2+eGdULShkndnA9oNpPE+txd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACj5C/lk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACj5C/lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqE0jHaMjhCJShfdzgjb9zITCwMN+BQSAsP6fR/sVdA=;
	b=ACj5C/lkCx/g7pSA4O9OjkNRuDFvagchCtrMLr9qouzfhbfKJven+eaArGBS060vUUId+s
	algEGo83zpIlBlq54x17x5XMuY0P6zIDgB6UdAbEhn/LP+lzahh28439uvczz1EkX9Z1EO
	KztvIC8qWMyTTQ75XXVNtxXM+52eESY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-JP4uU4AVMGallCBS9q-GkA-1; Mon, 10 Feb 2025 13:36:31 -0500
X-MC-Unique: JP4uU4AVMGallCBS9q-GkA-1
X-Mimecast-MFC-AGG-ID: JP4uU4AVMGallCBS9q-GkA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dc32f753dso1694920f8f.3
        for <loongarch@lists.linux.dev>; Mon, 10 Feb 2025 10:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212590; x=1739817390;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiJBK34xYsYFUmPZtAh8Dtmq/EliyHBgVCGizBc5us0=;
        b=uPO+mdZM+KR6JZqjtjR8YSWTKxONuEeXOLGhfSxNVrWlLBvZsoSJfDSlqbl+iFdXmN
         TnnnLpXK2JbmsWx5/K37wfJTjrN8mHLKX9MuGaN3U7eHC90e7ywkPRVB4a5UjSOPeavF
         RQgnAVsYBtUd0mbdokR8MqNuo5MwOdju+Yq4Z273FDKfiaa5h+WzuFGycyu9XrE7H1mk
         who1dT2X5YeCmrlJzs3Nfu6wplfAkZXJPElXwEMP+9S1CtxG7M/ElNuTd0mAe7yxAotV
         iEGsBvu6mx7CbrSs+AHtskSPtbYU4o80fJufgmSumh/50Asvj2MgbgCaVGmITVwEppJ0
         cmWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGVoVueAIIKyAeoG8vYZlxmrhjd1kkvj+GS5hxxbnY9ax+J09Yp4ie7je23yrBr2UYPQ0rISG9GkY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcwqf9UtLhiJbYSBtYG4yZKWXHfpDt6K4oiMSdbT+Hjm2jSAc3
	dKVXf10Bpo71V7MAGbnJ1HtfUSC32eJj6WL4zs42EXR125ZHuQg81amWUW8T7VI6yaxrk/gYU3N
	0gpscunvbWIHrJEvX2oystNC5pcUJ+vJkSfaYzFTVauMcMhW1hIeNJnWmoQ==
X-Gm-Gg: ASbGncvrCyIy9HiLB9AMssvdwMRy44bYLLF1Z6tJLNbSLsLLIH07MDnTTiqJsgwArZK
	g+Ul0qfkPIgCqv0yhgcs1chPSsKNSZckIrp2y5/l7Flo8FGBxoGRA5Wo+v34GJRbfme73Q/l0rB
	6YR12oZOiLL6e+nTf8ZEvwMckgF52WYLzBQTq0TIcBPXB3AW8vcI/eEIBVM1KmPsiDCTIiQJS3e
	MpFV2e6FdbCP55gc7VmSptprbMQ0C1ziylRhZMdUbyo7wvo6h+AsgnPpCkm4fXD35HOWUwgZrsp
	ImSG/Zp0CRt1teEorY/tbsV9TMrJb5m5JnPrHYmMrOjoQIhWlBdc9ceOr5mkiiCi4w==
X-Received: by 2002:a5d:47ac:0:b0:38d:db7b:5d7d with SMTP id ffacd0b85a97d-38de419476bmr505875f8f.32.1739212590295;
        Mon, 10 Feb 2025 10:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWifeCshW6jETL9TuYLjadqG7dtdSXfyo+9LdDhlWGx2V5vqBUb9lSHZiG4U0YoCHaPoMeeg==
X-Received: by 2002:a5d:47ac:0:b0:38d:db7b:5d7d with SMTP id ffacd0b85a97d-38de419476bmr505766f8f.32.1739212589672;
        Mon, 10 Feb 2025 10:36:29 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394328fcb8sm43783895e9.32.2025.02.10.10.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:36:29 -0800 (PST)
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
In-Reply-To: <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
Date: Mon, 10 Feb 2025 19:36:25 +0100
Message-ID: <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kod88ZNCScuwsRhXVmUJzrb9v3aXEw0vMZT0ZfnBlek_1739212591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/01/25 16:52, Jann Horn wrote:
> On Fri, Jan 17, 2025 at 4:25=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> On 14/01/25 19:16, Jann Horn wrote:
>> > On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschneid@r=
edhat.com> wrote:
>> >> vunmap()'s issued from housekeeping CPUs are a relatively common sour=
ce of
>> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
>> >> flush_tlb_kernel_range() IPIs.
>> >>
>> >> Given that CPUs executing in userspace do not access data in the vmal=
loc
>> >> range, these IPIs could be deferred until their next kernel entry.
>> >>
>> >> Deferral vs early entry danger zone
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >>
>> >> This requires a guarantee that nothing in the vmalloc range can be vu=
nmap'd
>> >> and then accessed in early entry code.
>> >
>> > In other words, it needs a guarantee that no vmalloc allocations that
>> > have been created in the vmalloc region while the CPU was idle can
>> > then be accessed during early entry, right?
>>
>> I'm not sure if that would be a problem (not an mm expert, please do
>> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
>> deferred anyway.
>
> flush_cache_vmap() is about stuff like flushing data caches on
> architectures with virtually indexed caches; that doesn't do TLB
> maintenance. When you look for its definition on x86 or arm64, you'll
> see that they use the generic implementation which is simply an empty
> inline function.
>
>> So after vmapping something, I wouldn't expect isolated CPUs to have
>> invalid TLB entries for the newly vmapped page.
>>
>> However, upon vunmap'ing something, the TLB flush is deferred, and thus
>> stale TLB entries can and will remain on isolated CPUs, up until they
>> execute the deferred flush themselves (IOW for the entire duration of th=
e
>> "danger zone").
>>
>> Does that make sense?
>
> The design idea wrt TLB flushes in the vmap code is that you don't do
> TLB flushes when you unmap stuff or when you map stuff, because doing
> TLB flushes across the entire system on every vmap/vunmap would be a
> bit costly; instead you just do batched TLB flushes in between, in
> __purge_vmap_area_lazy().
>
> In other words, the basic idea is that you can keep calling vmap() and
> vunmap() a bunch of times without ever doing TLB flushes until you run
> out of virtual memory in the vmap region; then you do one big TLB
> flush, and afterwards you can reuse the free virtual address space for
> new allocations again.
>
> So if you "defer" that batched TLB flush for CPUs that are not
> currently running in the kernel, I think the consequence is that those
> CPUs may end up with incoherent TLB state after a reallocation of the
> virtual address space.
>
> Actually, I think this would mean that your optimization is disallowed
> at least on arm64 - I'm not sure about the exact wording, but arm64
> has a "break before make" rule that forbids conflicting writable
> address translations or something like that.
>
> (I said "until you run out of virtual memory in the vmap region", but
> that's not actually true - see the comment above lazy_max_pages() for
> an explanation of the actual heuristic. You might be able to tune that
> a bit if you'd be significantly happier with less frequent
> interruptions, or something along those lines.)

I've been thinking some more (this is your cue to grab a brown paper bag)..=
.

Experimentation (unmap the whole VMALLOC range upon return to userspace,
see what explodes upon entry into the kernel) suggests that the early entry
"danger zone" should only access the vmaped stack, which itself isn't an
issue.

That is obviously just a test on one system configuration, and the problem
I'm facing is trying put in place /some/ form of instrumentation that would
at the very least cause a warning for any future patch that would introduce
a vmap'd access in early entry code. That, or a complete mitigation that
prevents those accesses altogether.

What if isolated CPUs unconditionally did a TLBi as late as possible in
the stack right before returning to userspace? This would mean that upon
re-entering the kernel, an isolated CPU's TLB wouldn't contain any kernel
range translation - with the exception of whatever lies between the
last-minute flush and the actual userspace entry, which should be feasible
to vet? Then AFAICT there wouldn't be any work/flush to defer, the IPI
could be entirely silenced if it targets an isolated CPU.

