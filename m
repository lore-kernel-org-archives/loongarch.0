Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6111DA0E0
	for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739918441; cv=none; b=SGjY6HJuatt/89sZijwGY7y9NtHjpd/4wL2YgtesDa+V8ISH+mcO2mMISAWLLRmXr4jEDwY6lpfaGVgUZ9+VD5wQxfA3TbhrEIQUNcjL4PfZ9v4Ad5+EQtlsmTQhTuYDJVmAlMtfII10d6KcFbuHiz3mFRQvt7WdTpQ1rcHxfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739918441; c=relaxed/simple;
	bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mp1X0B/R+MIjrU4mJkDHvT3CoJbFZa0PklT0dS1a1hfHfG6pBkRIx9YOemt0xN8MMuVlMryf6IksqjOXnRrfYQbIAwuNEJhpJttuUXdtGC9xtt/JdD+Nr0wZvQRd5y+edeiKkrtSabHxZeseY/f15EYvW6ICheGPM1y7n/8Ga0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKbRBbO3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKbRBbO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739918439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
	b=NKbRBbO35j7OWCwXVPcLg0nMRd5fCPMlsQLT0NE9D8mfzI/FI7kS5hLCRpR8EyCLgdENMr
	0ds5oFXCuB7PVl1/pxdLh8MBsO8o+o3Cb+4xgvQYlVVOWczMBD9Y2IeNBl9TdNIPhcd73a
	Kwe37HZS2Up02AeONwEZVN9enm+3W5w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-DxNSoWfnOvKW92pphxq3IA-1; Tue, 18 Feb 2025 17:40:36 -0500
X-MC-Unique: DxNSoWfnOvKW92pphxq3IA-1
X-Mimecast-MFC-AGG-ID: DxNSoWfnOvKW92pphxq3IA_1739918435
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4388eee7073so962135e9.0
        for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 14:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739918435; x=1740523235;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
        b=R+UA7NUXe00oTFRL856HmZD/08/aTx0jYFE8QZ9YT9eBg7qYudAakL2qtcyK9FcZB2
         URK+ohyjrpbZBPup3vP+0j/fOgPLVo5kxLgkYBnNBeRsazRLWWy716jt6L6dg/+3JR9T
         DkjZ8yu5ZeePltjDF3zPNMUMuHYziNJNZAtqqUW1UtjFp/H7bVQRTmwCljZldy4u28XP
         q/qIcj+6M18H6SM1AHzWbx0NBI/HTjVxI6hfF18GhBv2LQNzdt1u4CCiUGDqb47bDt73
         DIX2uGCE0NxQBrrUBoWOfmeNmkzgPPX3PlcyL84xuqMszrnig0i+0LTikmHLsYew/L65
         t93A==
X-Forwarded-Encrypted: i=1; AJvYcCUYEjlopU7vvl0P/NKe3TYqZH8SCZXqIEzKmcG6ueeor+uVTRf9Oowd5gqJGJDjywz0aut0fOtgjWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnXDWgoDaV2LEuJPkpL9FUqjKpMK9X5SskCExFAzCKQ+40+OO2
	YoG/x9fQmkSSwLsbbCn9bnCkmLeeuGO1PYSVoTHAHnyfrFcCcTeIvQAeeTt5GsIrgysUJAIWk/z
	cmxNGhDi0ONfSfKtLjR31GGyHd3lXLiYgLZS02g9A2i8fHX2joxwAZizBMg==
X-Gm-Gg: ASbGncuvQap20yJydM5iLKTyHKUJdChGroN1cUz/8lLdyQrRBx9iMG7OQsRUE/yQFt+
	i3G90bXBN5+0mMtPhVfjpdxwBFCVfftK4WSaMC/0Bu1M2nOOrkWaChIPK1frpHqwP9vdJii1COJ
	fL2Lv6jFYOtTWnNd4OlWsjj3ZRninaU951utzlfMEzPJRjZWG0Mgoj+mG2edXmyKMQfbLedgrg5
	xxmp1c7PAoSrFuDZQAYBayZmO/laOJxLdjP+cQkgSm9B5jGyZ2lyHVk8+/UZLHeKyrK7A5OotxP
	uOfXQM8PR4+cOWJ6T1MsyyGeHkOM233SnSuiYeNX6JOVFswbcHfcezq7f9xrQuMYwg==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11797675e9.5.1739918435421;
        Tue, 18 Feb 2025 14:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI17xveq4qpUoXVn3jaf3vZekMu127UgmikmUhaFlSZ5tyuyrG+gdqtYt1+dNUau7VWeDZUA==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11797275e9.5.1739918434928;
        Tue, 18 Feb 2025 14:40:34 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43993847f39sm32922065e9.14.2025.02.18.14.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 14:40:34 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, Jann Horn <jannh@google.com>
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
In-Reply-To: <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
Date: Tue, 18 Feb 2025 23:40:31 +0100
Message-ID: <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYhqx7W2yGaMLqMAlXkTBFb338iOtQNO1D3g4GaEHH8_1739918435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 11/02/25 06:22, Dave Hansen wrote:
> On 2/11/25 05:33, Valentin Schneider wrote:
>>> 2. It's wrong to assume that TLB entries are only populated for
>>> addresses you access - thanks to speculative execution, you have to
>>> assume that the CPU might be populating random TLB entries all over
>>> the place.
>> Gotta love speculation. Now it is supposed to be limited to genuinely
>> accessible data & code, right? Say theoretically we have a full TLBi as
>> literally the last thing before doing the return-to-userspace, speculation
>> should be limited to executing maybe bits of the return-from-userspace
>> code?
>
> In practice, it's mostly limited like that.
>
> Architecturally, there are no promises from the CPU. It is within its
> rights to cache anything from the page tables at any time. If it's in
> the CR3 tree, it's fair game.
>

So what if the VMEMMAP range *isn't* in the CR3 tree when a CPU is
executing in userspace?

AIUI that's the case with kPTI - the remaining kernel pages should mostly
be .entry.text and cpu_entry_area, at least for x86.

It sounds like it wouldn't do much for arm64 though, if with CnP a CPU executing in
userspace and with the user/trampoline page table installed can still use
TLB entries of another CPU executing in kernelspace with the kernel page
table installed.

