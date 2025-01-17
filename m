Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FBF16F288
	for <loongarch@lists.linux.dev>; Fri, 17 Jan 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737127554; cv=none; b=TD45kk/gmrGiWMMdzNB/tsHgA3ZX4eWWslRf21NTHecVdRssFWBSNvYal05DGiEGpGAwL0VSob2fiEf7zdtiqiHCIpXxd0RTKGqN7xBXxtbJXE4HXyt/l1AZ4FQ00uGxKA73Fjoc6ckae+y3BrWHsOsgULszZZCXA91SYNggDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737127554; c=relaxed/simple;
	bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bb5MNQh8H4LQaa8xae53oQ68SGCxczK9NYp8IDEFHIVPW3FY0L/14+WadKJOo0odqYJYRSgMi3eJW0galPEK3qhF+LDAFOS4luq1pF78JQY/WreUZjDVh3TmbM+Dn3Pcx0ZqY1GpelJSuYkWvkpUSaX1On6PFm2eurubRnCN250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ym08uVkc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ym08uVkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737127551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
	b=Ym08uVkcxG/LDWcPufyk3EDK78hqCrO3IGQa2hhnh7B93evjAagdhiK6AHe9uD+Z85ouJf
	f1oqESpwIo7p4AixD/Us8mS4LZrSS/chbYqm4cEBa1yAwa9sisdfBMdw+7kNFOYGmwcJZr
	HzNWt6/Wa3uDXkzJvmceFFdVeWwq8Vs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-aKr69i9fOdyPh3r1kghqTQ-1; Fri, 17 Jan 2025 10:25:50 -0500
X-MC-Unique: aKr69i9fOdyPh3r1kghqTQ-1
X-Mimecast-MFC-AGG-ID: aKr69i9fOdyPh3r1kghqTQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436328fcfeeso15963765e9.1
        for <loongarch@lists.linux.dev>; Fri, 17 Jan 2025 07:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127549; x=1737732349;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
        b=XM4WARobPpE8S1vMASWBbEUg2/09343sck27QyezDitib0pt14HobD780TYslfo6+3
         WBUNqn9RBaFDGqCvHA/jqs0/YKvZlDhrnBEVSwYDuMCh9Eney2XjcTzbUfmJ2NP9LlsY
         k1tW7xcuUYdVu7jhpxAAWhMssMwDBvQtN91y8mE1Eyh+DhkK4WbKqxodPsuLp+CUAsDZ
         k65/ZaZed8VSBjv921UNHL0FsZR2PDYAh7JbvtXnd3O5XykvYyqolEYMYDwNtgS9AU8e
         ldZYM0Zu8WKFijr+JyW4gngLC8ejXmFPrw+4BgnEOl3ApQ+8Py9fHZE0eVL1taV/bjz3
         Jc2g==
X-Forwarded-Encrypted: i=1; AJvYcCU0J0g1nXKwHql6z/Or/oMLfbFxg+j9iXrg3KMjNcFJX6NcTpWLdVONEOIvTK0YJvmHhOMHBIGiVOk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgn8WxJAuaipRCoYWK9xxuaYeciT/gjZ7uxlvudQATWCy6+wtz
	kBXs4kU5enDzEFm6VoDsFs6S7wzHvb9iKo7E/scNNjiBDpCrUg+yl+QTkH65GknhtslP0OO8wON
	0niV67396KA79jSubhDDzg3MU0yGnluaC7Inzf6WmEDLxDzP0voXJZCRl5Q==
X-Gm-Gg: ASbGncsQsvkubRMR/Gx7oOwCoAKOlG6qfmERlyZdposYmD6Et34r1+1xtfY4YZdR/ic
	mbU1XKRtO4g7+pTfaasVxbWa94qnksZvb9lOT9scFuePKoXqG/iKv/aedr/CpSvJLjUjjxJt7xv
	hkLBdrmYuDx4kh7chtMV0HLNgFp05XXlzJkzQEGupLndTICynnhUmlc3PBWc9Mt381t2KtgyyqB
	GcarJB/ditdVn9sWA8pnyGoHiBc9U67K5CKY3cjHYtVvtBwr0Ti+cefqH4BjXYFq37zulQFacvR
	HhIB39H5rCufrBav9+FvSQf/ewtLSABuL2QfcsA9pA==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31772255e9.2.1737127549289;
        Fri, 17 Jan 2025 07:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0gMZqDwGTwzxqPbq5mivOriCCRRTxthl4OtSHet5NBdrE0Nd7orMMIHX4tKohkjx8g0xD5Q==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31771625e9.2.1737127548862;
        Fri, 17 Jan 2025 07:25:48 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904621cdsm36969035e9.27.2025.01.17.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:25:48 -0800 (PST)
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
In-Reply-To: <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
Date: Fri, 17 Jan 2025 16:25:45 +0100
Message-ID: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: raAPP1dYGTAb3CQ5vTxu47pbkgHx9d543oT8QqxKFcU_1737127549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14/01/25 19:16, Jann Horn wrote:
> On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> vunmap()'s issued from housekeeping CPUs are a relatively common source =
of
>> interference for isolated NOHZ_FULL CPUs, as they are hit by the
>> flush_tlb_kernel_range() IPIs.
>>
>> Given that CPUs executing in userspace do not access data in the vmalloc
>> range, these IPIs could be deferred until their next kernel entry.
>>
>> Deferral vs early entry danger zone
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> This requires a guarantee that nothing in the vmalloc range can be vunma=
p'd
>> and then accessed in early entry code.
>
> In other words, it needs a guarantee that no vmalloc allocations that
> have been created in the vmalloc region while the CPU was idle can
> then be accessed during early entry, right?

I'm not sure if that would be a problem (not an mm expert, please do
correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
deferred anyway.

So after vmapping something, I wouldn't expect isolated CPUs to have
invalid TLB entries for the newly vmapped page.

However, upon vunmap'ing something, the TLB flush is deferred, and thus
stale TLB entries can and will remain on isolated CPUs, up until they
execute the deferred flush themselves (IOW for the entire duration of the
"danger zone").

Does that make sense?

