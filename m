Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506D26FA77
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080036; cv=none; b=OdJPk5LEstSkiNGEE8kFGnf51h2o37din1Ko1adut9+GW2YOcT7wP/ka9hUP+VpEwQGZgQ6nCLEZOg0FjvhPvJqGPnhGJnnsOSHdyb+bJ//EFU34ToP87kpgCMZ2neBJhX0EJtFQWymo2LDE+TyAF7+lbnKHW/kT+FqqRj3dXFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080036; c=relaxed/simple;
	bh=vmAxAdtBdBPAYy3/MG+wU8uP+oKefkt/UnAeEvBcakg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C9x0hsOrGgNC91Xk/TGyFgu8ICrsK48ARDVTyjhJGahR0xXFlH2xV4EzcuEiUQSujWeRBcnQXXOGfJY5SRxk7Sps8+5lSXNbjOJRpLF2yca5+8S5efigD8ZPGFrHDCQn3tFKwjhDrTzjK8Qe1rkmIILPyD/oMEhrP5Va1G8QXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCFs1Enb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCFs1Enb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764080033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
	b=WCFs1EnbW0dICr2gg1LFHJox4vf8fvNZxl+Nzzhd3p2g21y8nyOWvLPzKRwF80u1AXUPxF
	PoYDGEpi/UyqplM0Qj5XipfP/S2nZ96ws7EuKlzJKxpcA+r2FH/5H40eGBC4R0rvVhoJpI
	yn2WcRZt+0AnKdKe+FU3Hu0x1ous42M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-WUyIvrcZNhG4OHAu-Jr64w-1; Tue, 25 Nov 2025 09:13:52 -0500
X-MC-Unique: WUyIvrcZNhG4OHAu-Jr64w-1
X-Mimecast-MFC-AGG-ID: WUyIvrcZNhG4OHAu-Jr64w_1764080031
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47777158a85so73346485e9.3
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 06:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080031; x=1764684831;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
        b=G8/rjitUkiDatM3eDA7E6ubaTXYzqDdR4szdsMX7wI/MgsuZaeGDJz9hrvxm3X/chd
         EGGvBpMau24ZaD8g1l9cwu/M7+Pl2wahbbqUwRgKbQC96hc4jzU6rnHdxdLqdflYFh3o
         amp4QaVZSx5+6Bv5i6NtjzbEXQPN2PBIxQaZkfmSiQUmNVQWTocsDHShsAU5r0bU+t1h
         aS6bIMN5aafOwdgDBaZrQKofHW2TBVLSPsPnfSI+xXq1x8BFIjAGUTIlzImT/YER5qmJ
         RioPPxqbkXxHHCR4ApQDx7No2Bh/gbKA/2RmkXvnjqsdJ76hiyYCF/2AW5nCUzdf3ePj
         SR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIqJsgRMRC91g51yIKt0ytsKJNNQ5fXJvSq6FiuE6zoyqXxiLTVzPoDrlfiVcJ+xxbVIdH8wuannU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSWRzA4ocU2QkVnyL80c3jYBQRkNQv+u+sKcDSqFKlsXK7qfY3
	OjK/bBfm/CE5AY1H/b80n/5kATv4rnZSIimoFUaYzRQ2WJV/aTIoklc/+RePcDtDz+qJ20QYQzP
	z/NSFzXj0bDXAtzuVZMcoJ4qcDJQX8bsnsMXeZxwdc1KS1lXhih72+VznaTZc+g==
X-Gm-Gg: ASbGncuIEb/Ku29x3/Ta4bFsLpaRcOFMooZwla1eOp/dLT+rrVJMurYWumct6jev5kK
	c8eGNgOMe2DeHBp9Jh254nVuECe60fDmR2KDZamzqJjSETT+o6yip0vsi5UsHXCWejDROS12rO0
	SH9+3OImhmDs3s8P2JhHmKU5ndvOneGj9/Y3bmd1eT+HWM1RDWwgSe5BI3kBZ/GdAlqK/25x3ua
	onc7hR6ACZuIW+wmwFVX/ZNEycHctas5YU5NuG4PaBgpa80iPzhlX6wQEsAn42k721gQhOAZypd
	95+w2Wv6T+2llUYoFwM3EdU1vq8J/fVggBaq/AJ0P4/5n7sw/zVL3Q7k9DeT1IiKYyo9UdAzrL1
	SeBz5mzG2QGC740zQqLizyWojn+6m7qx84EkqIQcIzdXBNDzpuol7BcmUVkwFn4NMAaWJF4c=
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169342145e9.12.1764080030965;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtA8JzDWqwpv+zLW5Ygo6VxUlFOBnDYO5W2Qk6szEUT54U+0BafPLKh5CrRqs4rY7IKqQsQw==
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169341405e9.12.1764080030289;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e86b3sm306305045e9.6.2025.11.25.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:13:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush
 IPIs under CONFIG_COALESCE_TLBI=y
In-Reply-To: <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
 <xhsmh5xb3thh6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
Date: Tue, 25 Nov 2025 15:13:47 +0100
Message-ID: <xhsmh3462td2c.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gSwg52Nvffi-OahzjDJleOQmTRWgE4EAe7P5rmTYuac_1764080031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 21/11/25 09:50, Dave Hansen wrote:
> On 11/21/25 09:37, Valentin Schneider wrote:
>> On 19/11/25 10:31, Dave Hansen wrote:
>>> On 11/14/25 07:14, Valentin Schneider wrote:
>>>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>>>> +{
>>>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>>>> +	       per_cpu(kernel_cr3_loaded, cpu);
>>>> +}
>>>
>>> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
>>> of the instruction that actually sets CR3, there's a window between when
>>> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>>>
>>> Is that OK?
>>>
>>> It seems like it could lead to both unnecessary IPIs being sent and for
>>> IPIs to be missed.
>>>
>>
>> So the pattern is
>>
>>   SWITCH_TO_KERNEL_CR3
>>   FLUSH
>>   KERNEL_CR3_LOADED := 1
>>
>>   KERNEL_CR3_LOADED := 0
>>   SWITCH_TO_USER_CR3
>>
>>
>> The 0 -> 1 transition has a window between the unconditional flush and the
>> write to 1 where a remote flush IPI may be omitted. Given that the write is
>> immediately following the unconditional flush, that would really be just
>> two flushes racing with each other,
>
> Let me fix that for you. When you wrote "a remote flush IPI may be
> omitted" you meant to write: "there's a bug." ;)
>

Something like that :-)

> In the end, KERNEL_CR3_LOADED==0 means, "you don't need to send this CPU
> flushing IPIs because it will flush the TLB itself before touching
> memory that needs a flush".
>
>    SWITCH_TO_KERNEL_CR3
>    FLUSH
>    // On kernel CR3, *AND* not getting IPIs
>    KERNEL_CR3_LOADED := 1
>
>> but I could punt the kernel_cr3_loaded
>> write above the unconditional flush.
>
> Yes, that would eliminate the window, as long as the memory ordering is
> right. You not only need to have the KERNEL_CR3_LOADED:=1 CPU set that
> variable, you need to ensure that it has seen the page table update.
>

I assumed the page table update would be a self-synchronizing operation,
but that betrays how little I know about x86; /me goes back to reading

>> The 1 -> 0 transition is less problematic, worst case a remote flush races
>> with the CPU returning to userspace and it'll get interrupted back to
>> kernelspace.
>
> It's also not just "returning to userspace". It could well be *in*
> userspace by the point the IPI shows up. It's not the end of the world,
> and the window isn't infinitely long. But there certainly is still a
> possibility of getting spurious interrupts for the precious NOHZ_FULL
> task while it's in userspace.

IME it's okay if the application is just starting as it needs to do some
initialization anyway (mlockall & friends), i.e. it's not executing actual
useful payload from the get go.

If it's resuming from an interference, well we'd be making things worse.

I'm thinking the worst case is if this becomes a repeating pattern, but
then that means even without those deferral hacks the isolated CPUs would
be bombarded by IPIs in the first place.

