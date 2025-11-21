Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BA292918
	for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746637; cv=none; b=Uu7O8pLCaX2AzqMgkBRAOSTaXGFBYUpVEAzSP5GykwNV9XUR+FUHEr52TzbMIPxqzIDlqlbJ610X+pd6LbRxIYsUs2qvWCHAikBEgPlDXIUUHYB6tdzp+yQmrsQU3qrkLA8GRT2nD9k9E2MjYPE2ZZsFHv6umcalZA0M2o/ofaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746637; c=relaxed/simple;
	bh=R6+it4z+8J3tQq6khArTa00xBA3LI+Aiux4czwnNIBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cYqOwf6E8fZ5ikoZCcb8zES4ikdhmx9nQAZtaOvjy3suOr7Fkoap0V66yiBT1o8yXl7vIxFgc0HhaEkPKmC/2WICjA3FL2nXItBtS6KdLwuJ9T6OZOzPzF42GhtVvTiUFMlJ2WmxI6Y+3P2A4fepvGBdimzIK9fn/6Ds0sX31lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJRkF1yN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJRkF1yN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763746634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V3OE0zpMaGFe7FLO1SjE8KbYNBSyHZmUa+LcldBnwuQ=;
	b=OJRkF1yNZxr96JULB17P9/EUvhx1Ox0XH45RgxSDoXu12qcbb2Fsx2+fxxBe6klYybU212
	b+CpIW1WpaAYjcedmq2yVuzD9sRdjiy+lOZskX/WCBt0hAdREv4ja0gbYzdaO7ZAFZMslh
	wmXNjDsfgRVSWVwv2Koi4mQtjF9zlTE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-25Z5WzzWM1OlqzgeLxTRZQ-1; Fri, 21 Nov 2025 12:37:13 -0500
X-MC-Unique: 25Z5WzzWM1OlqzgeLxTRZQ-1
X-Mimecast-MFC-AGG-ID: 25Z5WzzWM1OlqzgeLxTRZQ_1763746632
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b3086a055so1993213f8f.3
        for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 09:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763746632; x=1764351432;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3OE0zpMaGFe7FLO1SjE8KbYNBSyHZmUa+LcldBnwuQ=;
        b=f4DsyIKS6rdbkLOjnKv6RGIV7d3Nn5Jk6i41hVK1n1UtUzktYunapk3QVrbsQz6Trm
         0hvBCWFmGVtxhMflIzjXWS8/bKap+N1mI1rRvXRVbtlOlvgkhnVtvMQe/wuGKV5FQ0n7
         IBALiAH3ZOS7FYO/ECdILDoi444vd5wCS096Hb2765qtTkv2lysR1BlGjwzELNyfgAWT
         RAe22ZMoA80dRC5TN++7nsQYU+YZbL5+Ah14N9mVG/VteyKJTyfnl6cHWrAnF/AnIsSd
         a8b2xYA4920qCOu28cRQMaR7xrYuTyRkCpM3NvuVMZJvvjGAiNkdm30jpt5Fh8mLF4Pq
         78Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVzj05sBKI+Y+XeMVDNqwmK4QnFhsqsHkNeRACacqFhFw+GPE1UIgBmIgZPVBgNkpUg7vcmSW+Gj7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJE/61sZ9OZewPfA/4U3gFRh8nPwfqlH+KlcdbwHIMp6KMEnbM
	MJVNRvIk+142L6L6r2Xt84hHJYCAzYVv0whr3LsYSKLxqHEBGsS1qAHi55+RDJZHrkoNrVTMO8/
	o69+QxVVqJWJJRnCzq9n8L2xHDWkuDef8epXa4e85luHKkG9xINzC3HFqUi7lzg==
X-Gm-Gg: ASbGncskS7wg0FeD8AecoYZh5bp1xkc2PbDgsVe8iwoSqXyCm49G7AeoBi0joFb6oZB
	vSM8r88YSMcvs6oUUD8VWtwaa10ULw5eA7yejCgfM7F2DqxhZXGjZJiBlGjbBvBOkFbxCaiHDdo
	6dtmgh0FrJXQlTaG+FdYFXNAzZG8MXMVYCUtfPCfu95/NNivLMz5hkdLAbA6kwWYt3olive2lUZ
	fdPJwA8j8NgSG929wOC4rzF8mZEF57CdIPIuSS1eYnunZm+sY+A9bcXB5OBJMHYAuqylFKU6Nfx
	JiAKuE1aortV2mtOrlnX4o/ff7Ph5OOTDELp8TZuLjfA1XHcjtvr4MY7Qxye2dMkfKyQ0GFx1xj
	4ucFLYypFkGuzly2uFataav8TN1HedbVi1w5Gm0nWl3KUgDZaB/glBIDYf5bq4wMmdLcGhXs=
X-Received: by 2002:a05:6000:2282:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42cc1cbd0dcmr3334281f8f.20.1763746631990;
        Fri, 21 Nov 2025 09:37:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwrptJrvQrMlATO+zOU3GD53XUKYoEIwVBRtwZMVM9uxcxDwDk+rU+CpbkpyNs1Ksl4qe7Bg==
X-Received: by 2002:a05:6000:2282:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42cc1cbd0dcmr3334227f8f.20.1763746631366;
        Fri, 21 Nov 2025 09:37:11 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm4094867f8f.7.2025.11.21.09.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:37:10 -0800 (PST)
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
In-Reply-To: <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
Date: Fri, 21 Nov 2025 18:37:09 +0100
Message-ID: <xhsmh5xb3thh6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9m7Vd6mPvExSK8heHmTkOG8X2RHAYeVydIvdku3vqWU_1763746632
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 19/11/25 10:31, Dave Hansen wrote:
> On 11/14/25 07:14, Valentin Schneider wrote:
>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>> +{
>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>> +	       per_cpu(kernel_cr3_loaded, cpu);
>> +}
>
> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
> of the instruction that actually sets CR3, there's a window between when
> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>
> Is that OK?
>
> It seems like it could lead to both unnecessary IPIs being sent and for
> IPIs to be missed.
>

So the pattern is

  SWITCH_TO_KERNEL_CR3
  FLUSH
  KERNEL_CR3_LOADED := 1

  KERNEL_CR3_LOADED := 0
  SWITCH_TO_USER_CR3


The 0 -> 1 transition has a window between the unconditional flush and the
write to 1 where a remote flush IPI may be omitted. Given that the write is
immediately following the unconditional flush, that would really be just
two flushes racing with each other, but I could punt the kernel_cr3_loaded
write above the unconditional flush.

The 1 -> 0 transition is less problematic, worst case a remote flush races
with the CPU returning to userspace and it'll get interrupted back to
kernelspace.

